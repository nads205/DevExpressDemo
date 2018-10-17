namespace DevExpress.Data.Data
{

    public class Report
    {
        public int ReportId { get; set; }

        public int UserId { get; set; }

        public int ReportTypeId { get; set; }

        public bool Enabled { get; set; }

        public virtual ReportType ReportType { get; set; }

        public virtual ReportUser ReportUser { get; set; }
    }
}
