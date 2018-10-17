using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("CopyrightZonesView")]
    public class CopyrightZonesView
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [StringLength(50)]
        public string Shelfmark { get; set; }

        [StringLength(255)]
        public string Childshelfmark { get; set; }

        [StringLength(1)]
        public string AutogenCz { get; set; }

        public string CopyrightZoneEnglish { get; set; }

        public string CopyrightZoneArabic { get; set; }

        [Key]
        [Column(Order = 1)]
        public bool Suppression { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(255)]
        public string RightsExpression { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(255)]
        public string CopyrightZoneStatus { get; set; }

        [StringLength(255)]
        public string DlsBlurTerm { get; set; }

        [StringLength(255)]
        public string DlsRightsIn { get; set; }

        [StringLength(255)]
        public string RcCategory { get; set; }

        [StringLength(4000)]
        public string Comments { get; set; }

        [StringLength(4000)]
        public string TitleOrDescription { get; set; }

        [StringLength(255)]
        public string DateOfCreation { get; set; }

        [StringLength(4000)]
        public string InPermissionLetter { get; set; }

        public DateTime? Created { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? Modified { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [StringLength(255)]
        public string OnBehalfOf { get; set; }

        [Key]
        [Column(Order = 4)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ShelfmarkId { get; set; }

        public int? AuthorityId { get; set; }

        public int? OnBehalfOfId { get; set; }

        [Key]
        [Column(Order = 5)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int RightsExpressionId { get; set; }

        public int? DlsBlurTermId { get; set; }

        public int? DlsRightsInId { get; set; }

        [Key]
        [Column(Order = 6)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CopyrightZoneStatusId { get; set; }

        [Key]
        [Column(Order = 7)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int SharePointId { get; set; }

        [StringLength(255)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Nationality { get; set; }

        [StringLength(255)]
        public string Creatorcategory { get; set; }

        [StringLength(255)]
        public string RightsHolder { get; set; }

        [StringLength(255)]
        public string RightsholderName { get; set; }

        [StringLength(255)]
        public string ParentShelfmarkP2Calculator { get; set; }

        public int? Priority { get; set; }

        public int? RightsHolderId { get; set; }

        [StringLength(255)]
        public string OnBehalfOfNationality { get; set; }

        [StringLength(255)]
        public string OnBehalfofCategory { get; set; }
    }
}
