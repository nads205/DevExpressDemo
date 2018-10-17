using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("Phase")]
    public class Phase
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Phase()
        {
            SharepointRecords = new HashSet<SharepointRecord>();
            SharepointRecordsTests = new HashSet<SharepointRecordsTest>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PhaseId { get; set; }

        [Column("Phase")]
        [Required]
        [StringLength(50)]
        public string Phase1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SharepointRecord> SharepointRecords { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SharepointRecordsTest> SharepointRecordsTests { get; set; }
    }
}
