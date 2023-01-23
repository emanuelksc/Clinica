using DataAccess.Infraestructure;
using DataAccess.Models;
using DataAccess.UnitOfWork;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);



// Add services to the container.
builder.Services.AddScoped<IConnectionFactory, ConnectionFactory>(cn => new ConnectionFactory(builder.Configuration.GetConnectionString("clinicaDB")));
builder.Services.AddDbContext<ClinicaContext>(opt => opt.UseSqlServer(builder.Configuration.GetConnectionString("clinicaDB")));
builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();



builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
