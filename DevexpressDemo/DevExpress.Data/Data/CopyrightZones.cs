using System;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public class CopyrightZones
    {
        public int? Id { get; set; }

        public int? Priority { get; set; }

        public int ShelfmarkId { get; set; }

        public int SharePointId { get; set; }

        [StringLength(255)]
        public string Childshelfmark { get; set; }

        [StringLength(1)]
        public string AutogenCz { get; set; }

        public string CopyrightZoneEnglish { get; set; }

        public string CopyrightZoneArabic { get; set; }

        public int? RightsHolderId { get; set; }

        public int? AuthorityId { get; set; }

        public int? OnBehalfOfId { get; set; }

        [StringLength(4000)]
        public string InPermissionLetter { get; set; }

        public bool Suppression { get; set; }

        public int RightsExpressionId { get; set; }

        public int CopyrightZoneStatusId { get; set; }

        public int? DlsBlurTermId { get; set; }

        public int? DlsRightsInId { get; set; }

        [StringLength(255)]
        public string RcCategory { get; set; }

        [StringLength(4000)]
        public string Comments { get; set; }

        [StringLength(4000)]
        public string TitleOrDescription { get; set; }

        [StringLength(255)]
        public string DateOfCreation { get; set; }

        [StringLength(255)]
        public string ParentShelfmarkP2Calculator { get; set; }

        public DateTime? Created { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? Modified { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }
        public virtual Authorities Authorities { get; set; }
        public virtual Authorities Authorities1 { get; set; }
        public virtual CopyrightZoneStatus CopyrightZoneStatus { get; set; }
        public virtual DlsBlurTerm DlsBlurTerm { get; set; }
        public virtual DlsRightsIn DlsRightsIn { get; set; }
        public virtual RightsExpressions RightsExpressions { get; set; }
        public virtual RightsHolders RightsHolders { get; set; }
        public virtual Shelfmarks Shelfmarks { get; set; }
    }
}
