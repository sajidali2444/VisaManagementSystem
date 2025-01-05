namespace VisaManagementSystem.Models;


public class VisaDetail
{
        public string Title { get; set; }
        public string Description { get; set; }
        public string? ImageUrl { get; set; } 
        public DateOnly IssueDate { get; set; }
        public DateOnly ExpiryDate { get; set; }
        public string VisaNumber { get; set; }
        public string VisaType { get; set; }
        public string Notes { get; set; }
        
        /*
         public VisaDetail()
           {
           }
        public VisaDetail(string title, string description, string imageUrl, DateOnly issueDate, DateOnly expiryDate, string visaNumber, string visaType, string notes)
        {
                this.Title = title;
                this.Description = description;
                this.ImageUrl = imageUrl;
                this.IssueDate = issueDate;
                this.ExpiryDate = expiryDate;
                this.VisaNumber = visaNumber;
                this.VisaType = visaType;
                this.Notes = notes;
        }
        */
}