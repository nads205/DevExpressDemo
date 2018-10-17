using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("DlsRightsIn")]
    public partial class DlsRightsIn
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DlsRightsIn()
        {
            CopyrightZones = new HashSet<CopyrightZones>();
        }

        public int DlsRightsInId { get; set; }

        [Column("DlsRightsIn")]
        [StringLength(255)]
        public string DlsRightsIn1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CopyrightZones> CopyrightZones { get; set; }
    }
}
