using Microsoft.AspNetCore.Mvc; // to use ViewResult, etc.
using Microsoft.EntityFrameworkCore;
using Moq;
using LearningToHunt.Controllers;
using LearningToHunt.EntityModels.MySQL;
using Microsoft.Extensions.Logging;
using LearningToHunt.DataContext.MySQL;

namespace LearningToHunt.Tests;

public class LearningToHuntTests
{
    private ILogger<ArticleController> mockArticleLogger;
    private LearningToHuntContext context;

    public LearningToHuntTests()
    {
        mockArticleLogger = new Mock<ILogger<ArticleController>>().Object;
        context = new LearningToHuntContext(
            new DbContextOptionsBuilder<LearningToHuntContext>()
                .UseInMemoryDatabase(databaseName: "TestDatabase")
                .Options
        );
        PreArrange();
    }

    ~LearningToHuntTests()
    {
        context.Dispose();
    }

    private async void PreArrange()
    {
        context.Articles.Add(new Article { 
            ArticleId = 1,
            AuthorId = 1,
            Title = "This is the Title",
            Subtitle = "This is the Subtitle",
            Content = "This is the content.",
            CreateDate = DateTime.Now,
            ModifyDate = DateTime.Now
        });        

        context.Blogs.Add(new Blog {
            BlogId = 1,
            AuthorId = 1,
            Title = "Blog Title",
            Subtitle = "Blog Subtitle",
            Content = "This is the blog content.",
            CreateDate = DateTime.Now,
            ModifyDate = DateTime.Now
        });

        await context.SaveChangesAsync();
    }

    [Fact]
    public async Task Article_1_Exists()
    {
        // Arrange
        ArticleController controller = new ArticleController(mockArticleLogger, context);

        // Act
        var result = await controller.GetArticle("1");

        // Assert
        Assert.NotNull(result);
        var okObjectResult = Assert.IsType<OkObjectResult>(result); 
        Assert.Equal(200, okObjectResult.StatusCode);
        Assert.Equal("This is the Title", ((Article)okObjectResult.Value!).Title);
    }

    [Fact]
    public async Task Article_2_Does_Not_Exist()
    {
        // Arrange
        ArticleController controller = new ArticleController(mockArticleLogger, context);

        // Act
        var result = await controller.GetArticle("2");

        // Assert
        Assert.NotNull(result);
        var notFoundResult = Assert.IsType<NotFoundResult>(result); 
        Assert.Equal(404, notFoundResult.StatusCode);
    }
    
    [Fact]
    public async void Blog_1_Exists()
    {
        // Arrange
        BlogController controller = new BlogController(mockArticleLogger, context);

        // Act
        var result = await controller.GetBlog("1");

        // Assert
        Assert.NotNull(result);
        var okObjectResult = Assert.IsType<OkObjectResult>(result); 
        Assert.Equal(200, okObjectResult.StatusCode);
        Assert.Equal("Blog Title", ((Blog)okObjectResult.Value!).Title);
    }

    [Fact]
    public async void Blog_2_Does_Not_Exist()
    {
        // Arrange
        BlogController controller = new BlogController(mockArticleLogger, context);

        // Act
        var result = await controller.GetBlog("2");

        // Assert
        Assert.NotNull(result);
        var notFoundResult = Assert.IsType<NotFoundResult>(result); 
        Assert.Equal(404, notFoundResult.StatusCode);
    }

}