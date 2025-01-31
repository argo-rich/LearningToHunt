namespace LearningToHunt.Identity;

public class UserUpdateDTO
{
    public string Email { get; set;} = null!;

    public string FirstName { get; set;} = null!;

    public string LastName { get; set;} = null!;

    public string? CurrentPassword { get; set; }

    public string? Password { get; set; }
    
    public string? ConfirmPassword { get; set; }
}