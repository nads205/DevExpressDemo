using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("AuthoritiesTypeOfAuthority")]
    public class AuthoritiesTypeOfAuthority
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AuthoritiesTypeOfAuthority()
        {
            Authorities = new HashSet<Authorities>();
        }

        [Key]
        public int TypeOfAuthorityId { get; set; }

        [Required]
        [StringLength(50)]
        public string TypeOfAuthority { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Authorities> Authorities { get; set; }
    }
}
