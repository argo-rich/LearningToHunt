using LearningToHunt.DataContext.MySQL;
using LearningToHunt.EntityModels.MySQL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LearningToHunt.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ArticleController : ControllerBase
{
    private readonly ILogger<ArticleController> _logger;
    private readonly LearningToHuntContext _db;

    public ArticleController(ILogger<ArticleController> logger, LearningToHuntContext db)
    {
        _logger = logger;
        _db = db;
    }

    [HttpGet("{id}", Name = nameof(GetArticle))]
    [ProducesResponseType(200, Type = typeof(Article))]
    [ProducesResponseType(404)]
    public async Task<IActionResult> GetArticle(string id)
    {
        int.TryParse(id, out int articleId);
        // if not in the cache, then try to get it from the db
        Article? article = await _db.Articles.FirstOrDefaultAsync(a => a.ArticleId == articleId);

        if (article == null)
        {
            return NotFound(); // 404 resource not found
        }
        return Ok(article);
    }

}