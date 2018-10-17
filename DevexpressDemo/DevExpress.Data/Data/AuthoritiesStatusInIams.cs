using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public class AuthoritiesStatusInIams
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AuthoritiesStatusInIams()
        {
            Authorities = new HashSet<Authorities>();
        }

        [Key]
        public int StatusInIamsId { get; set; }

        [StringLength(50)]
        public string StatusInIams { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Authorities> Authorities { get; set; }
    }
}
