using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("LoggingDigifloImport")]
    public partial class LoggingDigifloImport
    {
        public int Id { get; set; }

        public int ShelfmarkId { get; set; }

        public int DigifloBatchId { get; set; }

        [Required]
        public string DigifloBatchName { get; set; }

        public DateTime DateTime { get; set; }

        [Required]
        [StringLength(104)]
        public string UserId { get; set; }

        public string LogEntry { get; set; }

        public bool Success { get; set; }

        public virtual Shelfmarks Shelfmarks { get; set; }
    }
}
