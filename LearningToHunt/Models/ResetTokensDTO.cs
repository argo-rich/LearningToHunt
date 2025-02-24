public class ResetTokensDTO
{
    public int? ResetCode { get; set; }
    public string? Token { get; set; }

    public ResetTokensDTO() { }

    public ResetTokensDTO(int resetCode, string token)
    {
        ResetCode = resetCode;
        Token = token;
    }
}