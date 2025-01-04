using LearningToHunt.DataContext.MySQL; // To use AddLearningToHuntContext method

const string corsPolicyName = "allowWasmClient";

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddLearningToHuntContext("server=127.0.0.1;uid=root;pwd=MmtU9YtwKzj4jAh156ON;database=learning_to_hunt");
builder.Services.AddControllersWithViews();

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: corsPolicyName,
      policy =>
      {
          // Allow HTTP calls from the Blazor Web App project.
          policy.AllowAnyHeader();
          policy.WithOrigins("http://localhost:4200");
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
