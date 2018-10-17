using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("DlsBlurTerm")]
    public partial class DlsBlurTerm
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DlsBlurTerm()
        {
            CopyrightZones = new HashSet<CopyrightZones>();
        }

        public int DlsBlurTermId { get; set; }

        [Column("DlsBlurTerm")]
        [StringLength(255)]
        public string DlsBlurTerm1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CopyrightZones> CopyrightZones { get; set; }
    }
}
