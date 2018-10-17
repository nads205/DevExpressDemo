using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("AuthoritiesNationality")]
    public class AuthoritiesNationality
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AuthoritiesNationality()
        {
            Authorities = new HashSet<Authorities>();
        }

        [Key]
        public int NationalityId { get; set; }

        [Required]
        [StringLength(255)]
        public string Nationality { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Authorities> Authorities { get; set; }
    }
}
