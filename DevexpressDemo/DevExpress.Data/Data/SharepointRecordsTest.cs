using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("SharepointRecordsTest")]
    public class SharepointRecordsTest
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Shelfmark { get; set; }

        public int PhaseID { get; set; }

        public int ImageCaptures { get; set; }

        public int Folios { get; set; }

        public int FoliosScoping { get; set; }

        public bool OCRCalc { get; set; }

        public bool WorkflowPhysCalc { get; set; }

        public bool CuratorReviewCalc { get; set; }

        public bool ImageProcessingCalc { get; set; }

        public bool QCZeroCalc { get; set; }

        public bool ScanningCalc { get; set; }

        public int PredictedImageCaptures { get; set; }

        public bool TranslationCalc { get; set; }

        public bool CombinedCataloguingCalc { get; set; }

        public bool BaseIORCataloguingCalc { get; set; }

        public bool BaseMSSCataloguingCalc { get; set; }

        public bool IORCataloguingCalc { get; set; }

        public bool MSSCataloguingCalc { get; set; }

        public bool RightsClearanceCalc { get; set; }

        public bool RetrievalCalc { get; set; }

        public bool ConservationCalc { get; set; }

        public bool PackagingCalc { get; set; }

        public int DateID { get; set; }

        public int BatchID { get; set; }

        [Required]
        [StringLength(50)]
        public string SubSubSeries { get; set; }

        public int CuratorshipID { get; set; }

        public bool SIPGenerationCalc { get; set; }

        public bool PostAssessmentCalc { get; set; }

        public bool ReturnedCalc { get; set; }

        public bool FoliationCalc { get; set; }

        public virtual Batch Batch { get; set; }

        public virtual Curatorship Curatorship { get; set; }

        public virtual Phase Phase { get; set; }

        public virtual ReportDate ReportDate { get; set; }
    }
}
