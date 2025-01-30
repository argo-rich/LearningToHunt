using System.Text.Json.Serialization;
using LearningToHunt.EntityModels.MySQL;

namespace LearningToHunt.Identity;

public class UserDTO
{
    public UserDTO() {}

    public UserDTO(LthUser user)
    {
        this.Email = user.Email;
        this.FirstName = user.FirstName;
        this.LastName = user.LastName;
    }

    public string? Email { get; set;}
    
    [JsonIgnore]
    public string? Password { get; set;}

    public string? FirstName { get; set;}
    
    public string? LastName { get; set;}
}