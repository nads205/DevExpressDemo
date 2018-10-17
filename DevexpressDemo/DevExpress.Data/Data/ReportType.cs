using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public class ReportType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ReportType()
        {
            Reports = new HashSet<Report>();
        }

        public int ReportTypeID { get; set; }

        [Required]
        [StringLength(50)]
        public string ReportName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Report> Reports { get; set; }
    }
}
