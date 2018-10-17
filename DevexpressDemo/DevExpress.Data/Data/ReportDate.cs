using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    public class ReportDate
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ReportDate()
        {
            SharepointRecords = new HashSet<SharepointRecord>();
            SharepointRecordsTests = new HashSet<SharepointRecordsTest>();
        }

        [Key]
        public int DateId { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime Date { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SharepointRecord> SharepointRecords { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SharepointRecordsTest> SharepointRecordsTests { get; set; }
    }
}
