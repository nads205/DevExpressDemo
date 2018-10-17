using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("Configuration")]
    public class Configuration
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public bool AutoGenerate { get; set; }

        public bool EmailLogFileToQA { get; set; }

        public bool UploadToPortal { get; set; }

        public bool MarkAsComplete { get; set; }

        public bool GenerateCopyrightSpreadsheet { get; set; }

        public bool SendReportIfEmpty { get; set; }

        public int OrchestratePlanId { get; set; }
    }
}
