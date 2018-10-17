using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("LogicalLabel")]
    public class LogicalLabel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LogicalLabel()
        {
            Scopings = new HashSet<Scoping>();
        }

        public int LogicalLabelId { get; set; }

        [Column("LogicalLabel")]
        [Required]
        [StringLength(50)]
        public string LogicalLabel1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Scoping> Scopings { get; set; }
    }
}
