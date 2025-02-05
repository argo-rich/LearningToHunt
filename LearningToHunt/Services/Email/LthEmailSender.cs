using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Options;
using PostmarkDotNet;

namespace LearningToHunt.Services.Email;

public class LthEmailSender : IEmailSender
{
    private readonly ILogger<LthEmailSender> _logger;
    private IConfiguration _configuration;
    private string fromAddress;
    private string messageStream = Environment.GetEnvironmentVariable("PSTMRK_STREAM")!;
    private string serverToken = Environment.GetEnvironmentVariable("PSTMRK_TOKEN")!;

    public AuthMessageSenderOptions Options { get; } //Set with Secret Manager.

    public LthEmailSender(IOptions<AuthMessageSenderOptions> optionsAccessor,
                   ILogger<LthEmailSender> logger,
                   IConfiguration configuration)
    {
        Options = optionsAccessor.Value;
        _logger = logger;
        _configuration = configuration;
        fromAddress = _configuration.GetValue<string>("FromEmail")!;
    }

    public async Task SendEmailAsync(string email, string subject, string htmlMessage)
    {
        var message = new PostmarkMessage()
        {
            To = email,
            From = fromAddress,
            TrackOpens = false,
            Subject = subject,
            HtmlBody = htmlMessage,
            MessageStream = messageStream
        };

        var client = new PostmarkClient(serverToken);
        var sendResult = await client.SendMessageAsync(message);

        if (sendResult.Status != PostmarkStatus.Success)
        {
            _logger.LogError("Mail send failed.");
        }
    }
}