using System.Runtime.CompilerServices;
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
        
        Article? article = await _db.Articles.FirstOrDefaultAsync(a => a.ArticleId == articleId);

        if (article == null)
        {
            return NotFound(); // 404 resource not found
        }
        return Ok(article);
    }

    // PUT: api/article/[id]
    // BODY: Article (JSON, XML)
    [HttpPut("{id}")]
    [ProducesResponseType(204)]
    [ProducesResponseType(400)]
    [ProducesResponseType(404)]
    [ProducesResponseType(500)]
    public async Task<IActionResult> Update(int id, [FromBody] Article a)
    {
        if (a == null || a.ArticleId != id)
        {
            return BadRequest(); // 400 Bad request.
        }

        Article? existing = await _db.Articles.FirstOrDefaultAsync(a => a.ArticleId == id);

        if (existing == null)
        {
            return NotFound(); // 404 Resource not found.
        }

        // preventing an Identity Conflict between 'existing' and 'a' objects/entities
        _db.ChangeTracker.Clear();

        _db.Articles.Update(a);
        int affected = await _db.SaveChangesAsync();
        if (affected == 1)
        {
            return new NoContentResult(); // 204 No content.
        }

        return Problem("Database update failed.", null, 500);
    }

}