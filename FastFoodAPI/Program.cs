using AutoMapper;
using BusinessObject.Models;
using FastFoodAPI.Mapper;
using Microsoft.EntityFrameworkCore;
using Repositories.IRepo;
using Repositories.Repo;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddCors();
builder.Services.AddDbContext<SWP_ProjectContext>(opt =>
{
    opt.UseSqlServer(builder.Configuration.GetConnectionString("DB"));
});

var mapperConfig = new MapperConfiguration(mc =>
{
    mc.AddProfile(new CategoryMapper());
    mc.AddProfile(new FoodMapper());
});
IMapper mapper = mapperConfig.CreateMapper();
builder.Services.AddSingleton(mapper);

builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IFoodRepository, FoodRepository>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors(builder =>
{
    builder.AllowAnyOrigin()
    .AllowAnyHeader()
    .AllowAnyMethod();
});
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
