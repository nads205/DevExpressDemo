using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("LoggingDpSuppression")]
    public partial class LoggingDpSuppression
    {
        public int LoggingDpSuppressionId { get; set; }

        public int LoggingId { get; set; }

        [Required]
        [StringLength(50)]
        public string Folio { get; set; }

        public bool PageMatched { get; set; }

        public virtual Logging1 Logging1 { get; set; }
    }
}
