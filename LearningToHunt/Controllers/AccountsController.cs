using System.Security.Claims;
using LearningToHunt.EntityModels.MySQL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace LearningToHunt.Identity;

[ApiController]
[Route("api/[controller]")]
public class AccountsController : ControllerBase
{
    private readonly SignInManager<LthUser> _signInManager;
    private readonly UserManager<LthUser> _userManager;

    private readonly ILogger<AccountsController> _logger;

    public AccountsController(SignInManager<LthUser> signInManager, UserManager<LthUser> userManager, ILogger<AccountsController> logger)
    {
        _signInManager = signInManager;
        _userManager = userManager;
        _logger = logger;
    }

    [HttpPost("/logout")]
    [Authorize]
    public async Task<IActionResult> Logout([FromBody] object empty)
    {
        if (empty != null)
        {
            await _signInManager.SignOutAsync();            
            return Ok();
        }
        return Unauthorized();
    }

    [HttpPut("/update/names")]
    [Authorize]
    public async Task<IActionResult> UpdateNames([FromBody] LthUser user)
    {
        var userFromIdentity = await _userManager.GetUserAsync(User);

        if (userFromIdentity == null)
        {
            return NotFound();
        }

        userFromIdentity.FirstName = user.FirstName;
        userFromIdentity.LastName = user.LastName;

        var result = await _userManager.UpdateAsync(userFromIdentity);

        if (result.Succeeded)
        {
            return NoContent(); // 204 No content.
        }
        
        _logger.LogError("User first and last name update failed.", result.Errors.ToArray());

        return Problem("User first and last name update failed.", null, 500);
    }
}