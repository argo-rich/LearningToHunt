using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LearningToHunt.EntityModels.MySQL;

public partial class Author
{
    [Key]
    [Column("author_id", TypeName="int")]
    public int AuthorId { get; set; }

    [Column(TypeName = "varchar (35)")]
    [StringLength(35)]
    [Required]
    public string Name { get; set; } = null!;

    [Column("company_name", TypeName = "varchar (45)")]
    [StringLength(45)]
    public string? CompanyName { get; set; }

    [Column("create_date", TypeName = "datetime")]
    public DateTime? CreateDate { get; set; }

    [Column("modify_date", TypeName = "datetime")]
    public DateTime? ModifyDate { get; set; }
}
