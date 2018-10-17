using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("AuthoritiesView")]
    public class AuthoritiesView
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AuthorityId { get; set; }

        public int? SharePointId { get; set; }

        [StringLength(255)]
        public string Name { get; set; }

        public int? TypeOfAuthorityId { get; set; }

        public int? NationalityId { get; set; }

        [StringLength(255)]
        public string Epithet { get; set; }

        [StringLength(255)]
        public string Daterange { get; set; }

        [StringLength(255)]
        public string Creatorcategory { get; set; }

        public string CommentsSupportingIdentification { get; set; }

        [StringLength(255)]
        public string DiligentSearch1 { get; set; }

        [StringLength(255)]
        public string DiligentSearch2 { get; set; }

        [StringLength(255)]
        public string DiligentSearch3 { get; set; }

        public bool? DeclareOrphan { get; set; }

        public int? NoOfCrz { get; set; }

        public int? NoOfCrzOnBehalfOf { get; set; }

        public int? StatusInIamsId { get; set; }

        public string IorReference { get; set; }

        public int? LinkedAuthorityId { get; set; }

        [StringLength(4000)]
        public string LinkedAuthorities { get; set; }

        public int? AllocatedCataloguerId { get; set; }

        public int? NewEnhancedId { get; set; }

        public int? AllocatedTranslatorId { get; set; }

        [StringLength(4000)]
        public string TranslationResearchNotes { get; set; }

        [StringLength(4000)]
        public string NotesForArabicVariants { get; set; }

        public int? NoOfDuplicates { get; set; }

        public int? NoOfRelationshipsTransferred { get; set; }

        [StringLength(255)]
        public string ArkId { get; set; }

        [StringLength(255)]
        public string ArabicAuthorisedName { get; set; }

        public int? RegionId { get; set; }

        public int? RightsHolderId { get; set; }

        public DateTime? Modified { get; set; }

        [StringLength(255)]
        public string ModifiedBy { get; set; }

        public DateTime? Created { get; set; }

        [StringLength(255)]
        public string CreatedBy { get; set; }

        [StringLength(255)]
        public string Nationality { get; set; }

        [StringLength(50)]
        public string TypeOfAuthority { get; set; }

        [StringLength(255)]
        public string RightsHolder { get; set; }

        [StringLength(255)]
        public string RightsholderName { get; set; }

        [StringLength(255)]
        public string AllocatedTranslator { get; set; }

        [StringLength(255)]
        public string AllocatedCataloguer { get; set; }

        [StringLength(50)]
        public string StatusInIams { get; set; }

        [StringLength(50)]
        public string NewEnhanced { get; set; }
    }
}
