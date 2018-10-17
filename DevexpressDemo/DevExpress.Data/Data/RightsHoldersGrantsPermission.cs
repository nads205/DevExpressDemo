using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("RightsHoldersGrantsPermission")]
    public class RightsHoldersGrantsPermission
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RightsHoldersGrantsPermission()
        {
            RightsHolders = new HashSet<RightsHolders>();
        }

        [Key]
        public int GrantsPermissionId { get; set; }

        [Required]
        [StringLength(50)]
        public string GrantsPermission { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RightsHolders> RightsHolders { get; set; }
    }
}
