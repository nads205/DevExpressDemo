using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    public class Authorities
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Authorities()
        {
            CopyrightZones = new HashSet<CopyrightZones>();
            CopyrightZones1 = new HashSet<CopyrightZones>();
        }

        [Key]
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

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public int? NoOfCrz { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
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

        public virtual RightsHolders RightsHolders { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CopyrightZones> CopyrightZones { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CopyrightZones> CopyrightZones1 { get; set; }
        public virtual AuthoritiesAllocatedTranslator AuthoritiesAllocatedTranslator { get; set; }
        public virtual AuthoritiesAllocatedTranslator AuthoritiesAllocatedCataloguer { get; set; }
        public virtual AuthoritiesNewEnhanced AuthoritiesNewEnhanced { get; set; }
        public virtual AuthoritiesRegion AuthoritiesRegion { get; set; }
        public virtual AuthoritiesNationality AuthoritiesNationality { get; set; }
        public virtual AuthoritiesTypeOfAuthority AuthoritiesTypeOfAuthority { get; set; }
        public virtual AuthoritiesStatusInIams AuthoritiesStatusInIams { get; set; }        
    }
}
