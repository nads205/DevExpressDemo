using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("ApproxDimension")]
    public class ApproxDimension
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ApproxDimension()
        {
            Scopings = new HashSet<Scoping>();
        }

        public int ApproxDimensionId { get; set; }

        [Column("ApproxDimension")]
        [Required]
        [StringLength(50)]
        public string ApproxDimension1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Scoping> Scopings { get; set; }
    }
}
