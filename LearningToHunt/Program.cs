using LearningToHunt.DataContext.MySQL; // To use AddLearningToHuntContext method
using Swashbuckle.AspNetCore.SwaggerUI; // to use SubmitMethod
using LearningToHunt.EntityModels.MySQL;
using LearningToHunt.Identity;
using Microsoft.AspNetCore.Identity;

const string corsPolicyName = "allowWasmClient";

// MySQL items
string mysqlServer = Environment.GetEnvironmentVariable("L2H_MYSQL_SVR")!;
string mysqlUser = Environment.GetEnvironmentVariable("L2H_MYSQL_U")!;
string mysqlPwd = Environment.GetEnvironmentVariable("L2H_MYSQL_W")!;
string mysqlDb = Environment.GetEnvironmentVariable("L2H_MYSQL_D")!;
string mysqlConnStr = $"server={mysqlServer};uid={mysqlUser};pwd={mysqlPwd};database={mysqlDb}";

var builder = WebApplication.CreateBuilder(args);

// set up the use of Identity for registration, login, logout, forgot passwd, etc
builder.Services.AddIdentityApiEndpoints<LthUser>()
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<LearningToHuntContext>();
builder.Services.AddLearningToHuntContext(mysqlConnStr);
builder.Services.AddAuthorization();

// Add other services to the container.
builder.Services.AddControllersWithViews();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// set up logins to expire after 20 minutes
builder.Services.ConfigureApplicationCookie(options => 
{
    options.ExpireTimeSpan = TimeSpan.FromMinutes(20);
    options.Cookie.HttpOnly = false; // to allow cookies to be sent by client side code
    options.Cookie.SameSite = builder.Environment.IsDevelopment() ? SameSiteMode.None : SameSiteMode.Strict;
});

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: corsPolicyName,
      policy =>
      {
          // Allow HTTP calls from the client
          policy.AllowAnyHeader();
          policy.WithOrigins([Environment.GetEnvironmentVariable("L2H_CLIENT_URL")!]);
          policy.WithMethods(["GET", "POST", "PUT", "DELETE", "OPTIONS"]);
          policy.AllowCredentials();
      });
});

var app = builder.Build();

// Map Identity routes
app.MapCustomIdentityApi<LthUser>();

// if development
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Learning to Hunt Service API Version 1");

        c.SupportedSubmitMethods(new[] {
            SubmitMethod.Get, SubmitMethod.Post,
            SubmitMethod.Put, SubmitMethod.Delete 
        });
    });
}
// Configure the HTTP request pipeline.
else
{
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();    
}

//app.UseHttpsRedirection();

app.UseStaticFiles();

// routing
app.UseRouting();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller}/{action=Index}/{id?}");
app.MapFallbackToFile("index.html");

app.UseCookiePolicy(
    new CookiePolicyOptions
    {
        Secure = app.Environment.IsDevelopment() || app.Environment.IsProduction() ? CookieSecurePolicy.SameAsRequest : CookieSecurePolicy.Always
    }
);

app.UseCors(corsPolicyName);

app.UseAuthorization();

app.Run();
