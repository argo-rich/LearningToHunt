using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace LearningToHunt.DataContext.MySQL;

public static class LearningToHuntContextExtensions
{
    /// <summary>
    /// Adds LearningToHuntContext to the specified IServiceCollection. Uses the MySQL database provider.
    /// </summary>
    /// <param name="services">The service collection.</param>
    /// <param name="connectionString">The MySQL database connection string.</param>
    /// <returns>The IServiceCollection that can be used to add more services.</returns>
    public static IServiceCollection AddLearningToHuntContext(
    this IServiceCollection services, // The type to extend.
    string connectionString)
    {
        services.AddDbContext<LearningToHuntContext>(options =>
        {
            // Data Source
            options.UseMySQL(connectionString);

            options.LogTo(LearningToHuntContextLogger.WriteLine, new[] { 
                Microsoft.EntityFrameworkCore.Diagnostics.RelationalEventId.CommandExecuting
            });
        },
        // Register with a transient lifetime to avoid concurrency 
        // issues in Blazor server-side projects.
        contextLifetime: ServiceLifetime.Transient,
        optionsLifetime: ServiceLifetime.Transient);

        return services;
    }
}