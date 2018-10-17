using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("FoldOutDimension")]
    public class FoldOutDimension
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FoldOutDimension()
        {
            Scopings = new HashSet<Scoping>();
        }

        public int FoldOutDimensionId { get; set; }

        [Required]
        [StringLength(50)]
        public string MaxFoldOutDimension { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Scoping> Scopings { get; set; }
    }
}
