using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("AuthoritiesAllocatedTranslator")]
    public class AuthoritiesAllocatedTranslator
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AuthoritiesAllocatedTranslator()
        {
            Authorities = new HashSet<Authorities>();
            Authorities1 = new HashSet<Authorities>();
        }

        [Key]
        public int AllocatedTranslatorId { get; set; }

        [StringLength(255)]
        public string AllocatedTranslator { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Authorities> Authorities { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Authorities> Authorities1 { get; set; }
    }
}
