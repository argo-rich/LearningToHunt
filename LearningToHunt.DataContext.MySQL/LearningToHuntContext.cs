﻿using LearningToHunt.EntityModels.MySQL;
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
        string mysqlServer = Environment.GetEnvironmentVariable("L2H_MYSQL_SVR")!;
        string mysqlUser = Environment.GetEnvironmentVariable("L2H_MYSQL_U")!;
        string mysqlPwd = Environment.GetEnvironmentVariable("L2H_MYSQL_W")!;
        string mysqlDb = Environment.GetEnvironmentVariable("L2H_MYSQL_D")!;
        optionsBuilder.UseMySQL($"server={mysqlServer};uid={mysqlUser};pwd={mysqlPwd};database={mysqlDb}");

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
