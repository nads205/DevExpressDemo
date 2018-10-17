using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    public class SharepointRecord
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string Shelfmark { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PhaseID { get; set; }

        public int? ImageCount { get; set; }

        public int? ImageCountPh2Reporting { get; set; }

        public int? Conservation { get; set; }

        public int? Retrieval { get; set; }

        public int? RightsClearance { get; set; }

        public int? BaseCataloguing { get; set; }

        public int? FullCataloguing { get; set; }

        public int? Translation { get; set; }

        public int? Scanning { get; set; }

        public int? QCZero { get; set; }

        public int? ImageProcessing { get; set; }

        public int? CuratorReview { get; set; }

        public int? OCR { get; set; }

        public int? Packaging { get; set; }

        public int? Requested { get; set; }

        public int? SIPGenerated { get; set; }

        public int? CopyrightZones { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int DateID { get; set; }

        public virtual Phase Phase { get; set; }

        public virtual ReportDate ReportDate { get; set; }
    }
}
