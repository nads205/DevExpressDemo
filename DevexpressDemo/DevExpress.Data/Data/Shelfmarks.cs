using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public class Shelfmarks
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Shelfmarks()
        {
            CopyrightZones = new HashSet<CopyrightZones>();
            Logging1 = new HashSet<Logging1>();
            LoggingDigifloImport = new HashSet<LoggingDigifloImport>();
            Queue = new HashSet<Queue>();
        }

        [Key]
        public int ShelfmarkId { get; set; }

        [Required]
        [StringLength(50)]
        public string Shelfmark { get; set; }

        [StringLength(50)]
        public string SharepointStatus { get; set; }

        public DateTime? qSipGenerationDate { get; set; }

        public int SharepointId { get; set; }

        public int Phase { get; set; }

        public bool TranslationCalc { get; set; }

        public bool RightsClearanceCalc { get; set; }

        public bool PackagingCalc { get; set; }

        public string GeneralNotes { get; set; }

        public int? ImageCaptures { get; set; }

        public int? ImagesQSip { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CopyrightZones> CopyrightZones { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Logging1> Logging1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LoggingDigifloImport> LoggingDigifloImport { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Queue> Queue { get; set; }
    }
}
