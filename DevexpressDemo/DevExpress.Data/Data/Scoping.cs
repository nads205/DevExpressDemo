using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("Scoping")]
    public class Scoping
    {
        [Key]
        [StringLength(50)]
        public string Shelfmark { get; set; }

        [Required]
        [StringLength(50)]
        public string SubSubSeries { get; set; }

        public int? Folios { get; set; }

        public int? BindingId { get; set; }

        public int? FoldOutDimensionId { get; set; }

        public bool? RetrievalCalc { get; set; }

        public bool? SipGenerationCalc { get; set; }

        public bool? ConservationCalc { get; set; }

        public bool? RightsClearanceCalc { get; set; }

        public bool? IorBaseCataloguingCalc { get; set; }

        public bool? IorCataloguingCalc { get; set; }

        public bool? TranslationCalc { get; set; }

        public bool? ScanningCalc { get; set; }

        public bool? QcZeroCalcCalc { get; set; }

        public bool? ImageProcessingCalc { get; set; }

        public bool? CuratorReviewCalc { get; set; }

        public bool? OcrCalc { get; set; }

        public bool? PackagingCalc { get; set; }

        public bool? FoliationCalc { get; set; }

        public DateTime? OrderReleaseDate { get; set; }

        public int? ProcessId { get; set; }

        public int? WorksOrderNumber { get; set; }

        public int? ApproxDimensionId { get; set; }

        public int? LogicalLabelId { get; set; }

        public int? NoOfFoldOuts { get; set; }

        public string GeneralNotes { get; set; }

        public DateTime? LastUpdatedDateTime { get; set; }

        [StringLength(50)]
        public string LastUpdatedUserName { get; set; }

        public virtual ApproxDimension ApproxDimension { get; set; }

        public virtual Binding Binding { get; set; }

        public virtual FoldOutDimension FoldOutDimension { get; set; }

        public virtual LogicalLabel LogicalLabel { get; set; }

        public virtual Process Process { get; set; }
    }
}
