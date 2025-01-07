using LearningToHunt.DataContext.MySQL;
using LearningToHunt.EntityModels.MySQL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LearningToHunt.Controllers;

[ApiController]
[Route("[controller]")]
public class BlogController : ControllerBase
{
    private readonly ILogger<ArticleController> _logger;
    private readonly LearningToHuntContext _db;

    public BlogController(ILogger<ArticleController> logger, LearningToHuntContext db)
    {
        _logger = logger;
        _db = db;
    }

    [HttpGet("{id}", Name = nameof(GetBlog))]
    [ProducesResponseType(200, Type = typeof(Blog))]
    [ProducesResponseType(404)]
    public async Task<IActionResult> GetBlog(string id)
    {
        int.TryParse(id, out int blogId);
        // if not in the cache, then try to get it from the db
        Blog? blog = await _db.Blogs.FirstOrDefaultAsync(b => b.BlogId == blogId);

        if (blog == null)
        {
            return NotFound(); // 404 resource not found
        }
        return Ok(blog);
    }
}