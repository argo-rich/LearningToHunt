using LearningToHunt.EntityModels.MySQL;
using Microsoft.EntityFrameworkCore;

namespace LearningToHunt.DataContext.MySQL;

public partial class LearningToHuntContext : DbContext
{
    public LearningToHuntContext() {}

    public LearningToHuntContext(DbContextOptions<LearningToHuntContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Author> Authors { get; set; } = null!;

    public virtual DbSet<Article> Articles { get; set; } = null!;

    public virtual DbSet<Blog> Blogs { get; set; } = null!;

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseMySQL("server=127.0.0.1;uid=root;pwd=MmtU9YtwKzj4jAh156ON;database=learning_to_hunt");

        optionsBuilder.LogTo(LearningToHuntContextLogger.WriteLine, new[] { 
            Microsoft.EntityFrameworkCore.Diagnostics.RelationalEventId.CommandExecuting
        });
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
