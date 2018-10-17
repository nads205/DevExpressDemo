using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("AuthoritiesNewEnhanced")]
    public class AuthoritiesNewEnhanced
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AuthoritiesNewEnhanced()
        {
            Authorities = new HashSet<Authorities>();
        }

        [Key]
        public int NewEnhancedId { get; set; }

        [StringLength(50)]
        public string NewEnhanced { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Authorities> Authorities { get; set; }
    }
}
