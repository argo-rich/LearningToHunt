using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Options;
using PostmarkDotNet;

namespace LearningToHunt.Services.Email;

public class LthEmailSender : IEmailSender
{
    private readonly ILogger<LthEmailSender> _logger;
    private const string FromAddress = "Rich Argo <rich@argohaus.com>";
    private const string MessageStream = "learningtohunt-transactional";
    private const string ServerToken = "";

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
            MessageStream = MessageStream,
            //Tag = "New Year's Email Campaign",
            //Headers = new HeaderCollection(new MailHeader("X-CUSTOM-HEADER", "Header content"))
        };

        var client = new PostmarkClient(ServerToken);
        var sendResult = await client.SendMessageAsync(message);

        if (sendResult.Status != PostmarkStatus.Success)
        {
            _logger.LogError("Mail send failed.");
        }
    }
}