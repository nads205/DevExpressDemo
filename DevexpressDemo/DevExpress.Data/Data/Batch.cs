using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("Batch")]
    public class Batch
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Batch()
        {
            SharepointRecordsTests = new HashSet<SharepointRecordsTest>();
        }

        public int BatchID { get; set; }

        [Column("Batch")]
        public int Batch1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SharepointRecordsTest> SharepointRecordsTests { get; set; }
    }
}
