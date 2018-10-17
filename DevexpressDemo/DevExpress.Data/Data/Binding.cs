using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("Binding")]
    public partial class Binding
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Binding()
        {
            Scopings = new HashSet<Scoping>();
        }

        public int BindingId { get; set; }

        [Column("Binding")]
        [Required]
        [StringLength(50)]
        public string Binding1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Scoping> Scopings { get; set; }
    }
}
