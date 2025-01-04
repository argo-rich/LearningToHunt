using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LearningToHunt.EntityModels.MySQL;

public class Article
{
    [Key]
    [Column("article_id", TypeName="int")]
    public int ArticleId { get; set; }

    [Column(TypeName = "varchar (25)")]
    [StringLength(35)]
    [Required]
    public string Title { get; set; } = null!;

    [Column(TypeName = "varchar (35)")]
    [StringLength(35)]
    public string? Subtitle { get; set; }

    [Column(TypeName = "text")]
    [Required]
    public string Content { get; set; } = null!;

    [Column("author_id", TypeName = "int")]
    [Required]
    public int? AuthorId { get; set; }

    [Column("create_date", TypeName = "datetime")]
    public DateTime? CreateDate { get; set; }

    [Column("modify_date", TypeName = "datetime")]
    public DateTime? ModifyDate { get; set; }
}
