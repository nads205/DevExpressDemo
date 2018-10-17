using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("Curatorship")]
    public class Curatorship
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Curatorship()
        {
            SharepointRecordsTests = new HashSet<SharepointRecordsTest>();
        }

        public int CuratorshipID { get; set; }

        [Column("Curatorship")]
        [Required]
        [StringLength(50)]
        public string Curatorship1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SharepointRecordsTest> SharepointRecordsTests { get; set; }
    }
}
