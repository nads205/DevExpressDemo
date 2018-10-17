using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public class RightsHolders
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RightsHolders()
        {
            Authorities = new HashSet<Authorities>();
            CopyrightZones = new HashSet<CopyrightZones>();
        }

        [Key]
        public int RightsHolderId { get; set; }

        public int? SharePointId { get; set; }

        [StringLength(255)]
        public string RightsHolder { get; set; }

        [StringLength(255)]
        public string RightsholderName { get; set; }

        [StringLength(255)]
        public string RightsHolderArabic { get; set; }

        [StringLength(255)]
        public string AssignedTo { get; set; }

        [StringLength(255)]
        public string AddressLine1 { get; set; }

        [StringLength(255)]
        public string EmailAddress { get; set; }

        [StringLength(255)]
        public string Category { get; set; }

        [StringLength(4000)]
        public string Comments { get; set; }

        public DateTime? DateOfMostRecentContact { get; set; }

        [StringLength(255)]
        public string FirstContact { get; set; }

        [StringLength(255)]
        public string SecondContact { get; set; }

        [StringLength(255)]
        public string DiligentSearchStatus { get; set; }

        [StringLength(255)]
        public string ReplySummary { get; set; }

        [StringLength(255)]
        public string AddressLine2 { get; set; }

        [StringLength(255)]
        public string City { get; set; }

        [StringLength(255)]
        public string CountryState { get; set; }

        [StringLength(255)]
        public string PostcodesZIP { get; set; }

        [StringLength(255)]
        public string TelephoneNumber { get; set; }

        [StringLength(255)]
        public string ThirdContact { get; set; }

        public int? GrantsPermissionId { get; set; }

        [StringLength(255)]
        public string Conditions { get; set; }

        [StringLength(255)]
        public string Restrictions { get; set; }

        public int? CreatorId { get; set; }

        public int? NoContactAttempts { get; set; }

        [StringLength(255)]
        public string FAO { get; set; }

        [StringLength(255)]
        public string TypeOfMostRecentContact { get; set; }

        [StringLength(255)]
        public string Licence { get; set; }

        [StringLength(255)]
        public string Permission { get; set; }

        [StringLength(4000)]
        public string Notes { get; set; }

        [StringLength(255)]
        public string ImageApprovalNeeded { get; set; }

        [StringLength(255)]
        public string Website { get; set; }

        [StringLength(255)]
        public string StatementSent { get; set; }

        public DateTime? DatePermissionGranted { get; set; }

        public DateTime? Modified { get; set; }

        public DateTime? Created { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CopyrightZones> CopyrightZones { get; set; }
        public virtual ICollection<Authorities> Authorities { get; set; }

        public virtual RightsHoldersGrantsPermission RightsHoldersGrantsPermission { get; set; }
    }
}
