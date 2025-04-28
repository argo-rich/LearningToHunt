using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LearningToHunt.EntityModels.MySQL;

[Table("articles")]
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

}
