using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public partial class RightsExpressions
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RightsExpressions()
        {
            CopyrightZones = new HashSet<CopyrightZones>();
        }

        [Key]
        public int RightsExpressionId { get; set; }

        [Required]
        [StringLength(255)]
        public string RightsExpression { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CopyrightZones> CopyrightZones { get; set; }
    }
}
