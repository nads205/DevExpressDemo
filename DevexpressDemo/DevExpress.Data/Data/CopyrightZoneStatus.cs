using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    public partial class CopyrightZoneStatus
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CopyrightZoneStatus()
        {
            CopyrightZones = new HashSet<CopyrightZones>();
        }

        public int CopyrightZoneStatusId { get; set; }

        [Column("CopyrightZoneStatus")]
        [Required]
        [StringLength(255)]
        public string CopyrightZoneStatus1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CopyrightZones> CopyrightZones { get; set; }
    }
}
