using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public partial class Logging1
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Logging1()
        {
            Errors = new HashSet<Errors>();
            LoggingDpSuppression = new HashSet<LoggingDpSuppression>();
        }

        public int Id { get; set; }

        public int ShelfmarkId { get; set; }

        public DateTime DateTime { get; set; }

        [Required]
        [StringLength(104)]
        public string UserId { get; set; }

        [StringLength(50)]
        public string Version { get; set; }

        public bool Copyright { get; set; }

        public int? MetsTime { get; set; }

        public int? BagTime { get; set; }

        public bool DataProtectionSuppression { get; set; }

        public int? UploadTime { get; set; }

        public string LogEntry { get; set; }

        public bool Success { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Errors> Errors { get; set; }

        public virtual Shelfmarks Shelfmarks { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LoggingDpSuppression> LoggingDpSuppression { get; set; }
    }
}
