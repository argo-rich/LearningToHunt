using LearningToHunt.DataContext.MySQL; // To use AddLearningToHuntContext method

const string corsPolicyName = "allowWasmClient";

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
string mysqlServer = Environment.GetEnvironmentVariable("L2H_MYSQL_SVR")!;
string mysqlUser = Environment.GetEnvironmentVariable("L2H_MYSQL_U")!;
string mysqlPwd = Environment.GetEnvironmentVariable("L2H_MYSQL_W")!;
string mysqlDb = Environment.GetEnvironmentVariable("L2H_MYSQL_D")!;
builder.Services.AddLearningToHuntContext($"server={mysqlServer};uid={mysqlUser};pwd={mysqlPwd};database={mysqlDb}");
builder.Services.AddControllersWithViews();

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: corsPolicyName,
      policy =>
      {
          // Allow HTTP calls from the Blazor Web App project.
          policy.AllowAnyHeader();
          policy.WithOrigins([Environment.GetEnvironmentVariable("L2H_CLIENT_URL")!]);
      });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseCors(corsPolicyName);

app.UseStaticFiles();
app.UseRouting();


app.MapControllerRoute(
    name: "default",
    pattern: "{controller}/{action=Index}/{id?}");

app.MapFallbackToFile("index.html");

app.Run();
