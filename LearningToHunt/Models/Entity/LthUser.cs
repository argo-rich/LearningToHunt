using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace LearningToHunt.EntityModels.MySQL;

public class LthUser : IdentityUser
{
    [Required]
    public string FirstName { get; set; } = null!;

    [Required]
    public string LastName { get; set;} = null!;
}