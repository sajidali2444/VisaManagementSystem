using System.Text.Json.Serialization;
using VisaManagementSystem.Models;

var builder = WebApplication.CreateSlimBuilder(args);

builder.Services.ConfigureHttpJsonOptions(options =>
{
    options.SerializerOptions.TypeInfoResolverChain.Insert(0, AppJsonSerializerContext.Default);
});

var app = builder.Build();



var visas = new List<VisaDetail>();

var v1 = new VisaDetail();
v1.Title = "Visa 1";
v1.Description = "Visa 1 description";
v1.Notes = "notes";
var nowDateTime = DateTime.Now;


// var dateYear = nowDateTime.Year;
// var dateMonth = nowDateTime.Month;
// var dateDay = nowDateTime.Day;
//
// v1.IssueDate = new DateOnly(dateYear, dateMonth, dateDay);


v1.IssueDate = DateOnly.FromDateTime(nowDateTime);
v1.VisaNumber = "Visa 1";
visas.Add(v1);

var v2 = new VisaDetail()
{
    Title = "Visa 2",
    Description = "Visa 2 description",
    Notes = "notes",
    IssueDate = new DateOnly(),
    VisaNumber = "Visa 2",
    ImageUrl = "imageUrl will be provided later"
};
visas.Add(v2);

//datetime => date
//2025/01/05:12:00:00z:00






/*
var visas2 = new VisaDetail[]
{
    visa1,
    visa2,
    visa3,
    new VisaDetail("Visa Visa", "3 months visit visa issue",null,
        new DateOnly(),
        new DateOnly(2030, 1, 30),
        "12345678", "Visit",
        "You can stay in dubai upto 3 months or 90 days")
};
*/

var visaApi = app.MapGroup("/visas");


visaApi.MapGet("/", () => visas);
visaApi.MapGet("/{id}", () =>
{
    var visa = visas.Find(item => item.VisaNumber == "Visa 1");
    return visa;
});
//visaApi.MapGet("/all", () => visas2);


app.Run();

public record Todo(int Id, string? Title, DateOnly? DueBy = null, bool IsComplete = false);


[JsonSerializable(typeof(List<VisaDetail>))]
internal partial class AppJsonSerializerContext : JsonSerializerContext
{
}