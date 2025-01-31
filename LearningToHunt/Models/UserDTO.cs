using System.Text.Json.Serialization;
using LearningToHunt.EntityModels.MySQL;

namespace LearningToHunt.Identity;

public class UserDTO
{
    public UserDTO() {}

    public UserDTO(LthUser user, List<string> roles)
    {
        this.Email = user.Email;
        this.FirstName = user.FirstName;
        this.LastName = user.LastName;
        this.Roles = roles;
    }

    public string? Email { get; set;}
    
    [JsonIgnore]
    public string? Password { get; set;}

    public string? FirstName { get; set;}
    
    public string? LastName { get; set;}

    public List<string> Roles { get; set;} = new List<string>();
}