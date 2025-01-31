using System.Security.Claims;
using LearningToHunt.EntityModels.MySQL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace LearningToHunt.Identity;

/// <summary>
/// Controller to help manage ASP.NET Core Identity user accounts.  This controller only adds 
/// services that are not created by default after running the migration and following the steps
/// to use Identity in a Web API:
/// <para>
/// (https://learn.microsoft.com/en-us/aspnet/core/security/authentication/identity-api-authorization?view=aspnetcore-8.0).
/// </para>
///
/// <para>
/// Migration steps used:
/// <code>
/// dotnet ef migrations add CreateIdentitySchema
/// dotnet ef database update
/// </code>
/// </para>
/// </summary>
[ApiController]
[Route("api/[controller]")]
public class AccountController : ControllerBase
{
    private readonly SignInManager<LthUser> _signInManager;
    private readonly UserManager<LthUser> _userManager;

    private readonly ILogger<AccountController> _logger;

    public AccountController(SignInManager<LthUser> signInManager, UserManager<LthUser> userManager, ILogger<AccountController> logger)
    {
        _signInManager = signInManager;
        _userManager = userManager;
        _logger = logger;
    }

    /// <summary>
    /// Handles logout functionality on the server side.
    /// </summary>
    /// <param name="email">The email address (username) requesting to be logged out.</param>
    /// <returns>Ok() when an authorized user is logged out else returns Unauthorized().</returns>
    [HttpPost("logout")]
    [Authorize]
    public async Task<IActionResult> Logout()
    {
        await _signInManager.SignOutAsync();            
        return Ok();
    }

    /// <summary>
    /// Handles user logins.  This differs from the stock Identity provided /login service by returning
    /// a UserDTO object to the client.
    /// </summary>
    /// <param name="loginDTO">A LoginDTO object containing the username and password</param>
    /// <returns>A UserDTO object if the credentials authenticate, otherwise returns Unauthorized()</returns>
    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginDTO loginDTO)
    {
        if (loginDTO != null)
        {
            LthUser? user = await _userManager.FindByEmailAsync(loginDTO.Email!);
            bool canSignIn = await _signInManager.CanSignInAsync(user!);
            
            if (canSignIn)
            {
                bool authCorrect = await _userManager.CheckPasswordAsync(user!, loginDTO.Password!);
                if (authCorrect)
                {
                    await _signInManager.SignInAsync(user!, isPersistent: false, "Cookie");

                    return Ok(new UserDTO(user!));
                }
            }         
        }
        return Unauthorized();
    }

    /// <summary>
    /// Updates the currently logged in user to the values passed in.
    /// </summary>
    /// <param name="usrUpdDto">A UserUpdateDTO object deserialized from the JSON sent by the client.</param>
    /// <returns>204 NoContent() upon success or Problem() with a 500 status code if the update fails.</returns>
    [HttpPut("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] UserUpdateDTO usrUpdDto)
    {
        var identityUser = await _userManager.GetUserAsync(User); // this will not be null since the user will be authorized before this point

        identityUser!.Email = usrUpdDto.Email;
        identityUser.UserName = usrUpdDto.Email;
        identityUser.FirstName = usrUpdDto.FirstName;
        identityUser.LastName = usrUpdDto.LastName;

        var result = await _userManager.UpdateAsync(identityUser);

        if (result.Succeeded)
        {
            bool resultStillSucceeded = true;      
            if (!string.IsNullOrEmpty(usrUpdDto.Password))
            {            
                // verify current password
                bool authCorrect = await _userManager.CheckPasswordAsync(identityUser, usrUpdDto.CurrentPassword!);
                if (!authCorrect)
                {
                    return BadRequest("Current Password is invalid.");
                }

                // verify psswd & confirm match
                if (!usrUpdDto.Password.Equals(usrUpdDto.ConfirmPassword))
                {
                    return BadRequest("Password and Confirm Password do not match.");
                }

                resultStillSucceeded = (await _userManager.ChangePasswordAsync(identityUser, usrUpdDto.CurrentPassword!, usrUpdDto.Password)).Succeeded;
            }   
            if (resultStillSucceeded)
            {
                return NoContent(); // 204 No content.
            }         
        }
        
        string errorMessage = "User account update failed.";
        _logger.LogError(errorMessage, result.Errors.ToArray());
        return Problem(errorMessage, null, 500);
    }
}