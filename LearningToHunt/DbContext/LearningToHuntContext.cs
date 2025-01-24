using LearningToHunt.EntityModels.MySQL;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LearningToHunt.DataContext.MySQL;

public partial class LearningToHuntContext : IdentityDbContext<LthUser>
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
        if (!optionsBuilder.IsConfigured)
        {
            string mysqlServer = Environment.GetEnvironmentVariable("L2H_MYSQL_SVR")!;
            string mysqlUser = Environment.GetEnvironmentVariable("L2H_MYSQL_U")!;
            string mysqlPwd = Environment.GetEnvironmentVariable("L2H_MYSQL_W")!;
            string mysqlDb = Environment.GetEnvironmentVariable("L2H_MYSQL_D")!;
            optionsBuilder.UseMySQL($"server={mysqlServer};uid={mysqlUser};pwd={mysqlPwd};database={mysqlDb}");

            optionsBuilder.LogTo(LearningToHuntContextLogger.WriteLine, new[] { 
                Microsoft.EntityFrameworkCore.Diagnostics.RelationalEventId.CommandExecuting
            });
        }        
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        // Customize the ASP.NET Identity model and override the defaults if needed.
        // For example, you can rename the ASP.NET Identity table names and more.
        // Add your customizations after calling base.OnModelCreating(builder);
        modelBuilder.ApplyConfiguration(new ApplicationUserEntityConfiguration());

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

public class ApplicationUserEntityConfiguration : IEntityTypeConfiguration<LthUser>
{
    public void Configure(EntityTypeBuilder<LthUser> builder)
    {
        builder.Property(e => e.FirstName).IsRequired().HasMaxLength(100);
        builder.Property(e => e.LastName).IsRequired().HasMaxLength(100);
    }
}