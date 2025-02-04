using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Options;
using PostmarkDotNet;

namespace LearningToHunt.Services.Email;

public class LthEmailSender : IEmailSender
{
    private readonly ILogger<LthEmailSender> _logger;
    private const string FromAddress = "no-reply@learningtohunt.com";
    private string MessageStream = Environment.GetEnvironmentVariable("PSTMRK_STREAM")!;
    private string ServerToken = Environment.GetEnvironmentVariable("PSTMRK_TOKEN")!;

    public AuthMessageSenderOptions Options { get; } //Set with Secret Manager.

    public LthEmailSender(IOptions<AuthMessageSenderOptions> optionsAccessor,
                   ILogger<LthEmailSender> logger)
    {
        Options = optionsAccessor.Value;
        _logger = logger;
    }

    public async Task SendEmailAsync(string email, string subject, string htmlMessage)
    {
        var message = new PostmarkMessage()
        {
            To = email,
            From = FromAddress,
            TrackOpens = false,
            Subject = subject,
            HtmlBody = htmlMessage,
            MessageStream = MessageStream
        };

        var client = new PostmarkClient(ServerToken);
        var sendResult = await client.SendMessageAsync(message);

        if (sendResult.Status != PostmarkStatus.Success)
        {
            _logger.LogError("Mail send failed.");
        }
    }
}