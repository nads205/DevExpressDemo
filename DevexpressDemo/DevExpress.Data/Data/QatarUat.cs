using System;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.DirectoryServices.AccountManagement;
using System.Linq;

namespace DevExpress.Data.Data
{

    public class BaseEntity
    {
        public DateTime? Created { get; set; }        
        [StringLength(50)]
        public string CreatedBy { get; set; }
        public DateTime? Modified { get; set; }        
        [StringLength(50)]
        public string ModifiedBy { get; set; }
    }
    public class QatarUat : DbContext
    {
        public QatarUat(string name = "QatarUat")
            : base("name=" + name)
        {
        }

        private void AddTimestamps()
    {
        var entities = ChangeTracker.Entries().Where(x => x.Entity is BaseEntity && (x.State == EntityState.Added || x.State == EntityState.Modified));

        //var currentUsername = !string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name) ? HttpContext.Current.User.Identity.Name
        //    : "Anonymous";

        var currentUsername = string.Format("{0}, {1}", UserPrincipal.Current.Surname, UserPrincipal.Current.GivenName);
        ;
        foreach (var entity in entities)
        {
            if (entity.State == EntityState.Added)
            {
                ((BaseEntity)entity.Entity).Created = DateTime.Now;
                ((BaseEntity)entity.Entity).CreatedBy = currentUsername;
            }

            ((BaseEntity)entity.Entity).Modified = DateTime.Now;
            ((BaseEntity)entity.Entity).ModifiedBy = currentUsername;
        }
    }

        //Views
        public virtual DbSet<AuthoritiesView> AuthoritiesView { get; set; }
        public virtual DbSet<CopyrightZonesView> CopyrightZonesView { get; set; }
        //Tables
        public virtual DbSet<Agent> Agents { get; set; }
        public virtual DbSet<ApproxDimension> ApproxDimensions { get; set; }
        public virtual DbSet<Authorities> Authorities { get; set; }        
        public virtual DbSet<AuthoritiesAllocatedTranslator> AuthoritiesAllocatedTranslator { get; set; }
        public virtual DbSet<AuthoritiesNewEnhanced> AuthoritiesNewEnhanced { get; set; }
        public virtual DbSet<AuthoritiesRegion> AuthoritiesRegion { get; set; }
        public virtual DbSet<AuthoritiesStatusInIams> AuthoritiesStatusInIams { get; set; }
        public virtual DbSet<AuthorityLinkedAuthorities> AuthorityLinkedAuthorities { get; set; }
        public virtual DbSet<AuthoritiesTypeOfAuthority> AuthoritiesTypeOfAuthority { get; set; }
        public virtual DbSet<AuthoritiesNationality> AuthoritiesNationality { get; set; }
        public virtual DbSet<Batch> Batches { get; set; }
        public virtual DbSet<Binding> Bindings { get; set; }
        public virtual DbSet<Change> Changes { get; set; }
        public virtual DbSet<Checks1> Checks1 { get; set; }
        public virtual DbSet<ChecksInfo> ChecksInfoes { get; set; }
        public virtual DbSet<CopyrightZones> CopyrightZones { get; set; }
        public virtual DbSet<CopyrightZoneStatus> CopyrightZoneStatus { get; set; }
        public virtual DbSet<Configuration> Configurations { get; set; }
        public virtual DbSet<Curatorship> Curatorships { get; set; }
        public virtual DbSet<DlsBlurTerm> DlsBlurTerm { get; set; }
        public virtual DbSet<DlsRightsIn> DlsRightsIn { get; set; }
        public virtual DbSet<Errors> Errors { get; set; }
        public virtual DbSet<FoldOutDimension> FoldOutDimensions { get; set; }
        public virtual DbSet<LogicalLabel> LogicalLabels { get; set; }
        public virtual DbSet<Logging1> Logging1 { get; set; }
        public virtual DbSet<LoggingDigifloImport> LoggingDigifloImport { get; set; }
        public virtual DbSet<LoggingDpSuppression> LoggingDpSuppression { get; set; }
        public virtual DbSet<Phase> Phases { get; set; }
        public virtual DbSet<Process> Processes { get; set; }
        public virtual DbSet<Queue> Queue { get; set; }
        public virtual DbSet<ReportDate> ReportDates { get; set; }
        public virtual DbSet<Report> Reports { get; set; }
        public virtual DbSet<ReportType> ReportTypes { get; set; }
        public virtual DbSet<ReportUser> ReportUsers { get; set; }
        public virtual DbSet<RightsExpressions> RightsExpressions { get; set; }        
        public virtual DbSet<RightsHolders> RightsHolders { get; set; }
        public virtual DbSet<RightsHoldersGrantsPermission> RightsHoldersGrantsPermission { get; set; }
        public virtual DbSet<SharepointRecordsTest> SharepointRecordsTests { get; set; }
        public virtual DbSet<Scoping> Scopings { get; set; }
        public virtual DbSet<Shelfmarks> Shelfmarks { get; set; }
        public virtual DbSet<SharepointRecord> SharepointRecords { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Authorities>()
                .HasMany(e => e.CopyrightZones)
                .WithOptional(e => e.Authorities)
                .HasForeignKey(e => e.AuthorityId);

            modelBuilder.Entity<Authorities>()
                .HasMany(e => e.CopyrightZones1)
                .WithOptional(e => e.Authorities1)
                .HasForeignKey(e => e.OnBehalfOfId);

            modelBuilder.Entity<AuthoritiesNewEnhanced>()
               .Property(e => e.NewEnhanced)
               .IsFixedLength();

            modelBuilder.Entity<AuthoritiesAllocatedTranslator>()
             .HasMany(e => e.Authorities)
             .WithOptional(e => e.AuthoritiesAllocatedTranslator)
             .HasForeignKey(e => e.AllocatedCataloguerId);

            modelBuilder.Entity<AuthoritiesAllocatedTranslator>()
                .HasMany(e => e.Authorities1)
                .WithOptional(e => e.AuthoritiesAllocatedCataloguer)
                .HasForeignKey(e => e.AllocatedTranslatorId);

            modelBuilder.Entity<Batch>()
                .HasMany(e => e.SharepointRecordsTests)
                .WithRequired(e => e.Batch)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ChecksInfo>()
                .HasMany(e => e.Checks1)
                .WithRequired(e => e.ChecksInfo)
                .HasForeignKey(e => e.Code)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CopyrightZoneStatus>()
                .HasMany(e => e.CopyrightZones)
                .WithRequired(e => e.CopyrightZoneStatus)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CopyrightZones>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<CopyrightZones>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);           

            modelBuilder.Entity<Curatorship>()
                .HasMany(e => e.SharepointRecordsTests)
                .WithRequired(e => e.Curatorship)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DlsBlurTerm>()
                .HasMany(e => e.CopyrightZones)
                .WithRequired(e => e.DlsBlurTerm)
                .WillCascadeOnDelete(false);         

            modelBuilder.Entity<DlsRightsIn>()
                .HasMany(e => e.CopyrightZones)
                .WithRequired(e => e.DlsRightsIn)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Logging1>()
                .HasMany(e => e.Errors)
                .WithRequired(e => e.Logging1)
                .HasForeignKey(e => e.LoggingId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Logging1>()
                .HasMany(e => e.LoggingDpSuppression)
                .WithRequired(e => e.Logging1)
                .HasForeignKey(e => e.LoggingId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Phase>()
                .Property(e => e.Phase1)
                .IsUnicode(false);

            modelBuilder.Entity<Phase>()
                .HasMany(e => e.SharepointRecords)
                .WithRequired(e => e.Phase)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Phase>()
                .HasMany(e => e.SharepointRecordsTests)
                .WithRequired(e => e.Phase)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ReportDate>()
                .HasMany(e => e.SharepointRecords)
                .WithRequired(e => e.ReportDate)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ReportDate>()
                .HasMany(e => e.SharepointRecordsTests)
                .WithRequired(e => e.ReportDate)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ReportType>()
                .Property(e => e.ReportName)
                .IsUnicode(false);

            modelBuilder.Entity<ReportType>()
                .HasMany(e => e.Reports)
                .WithRequired(e => e.ReportType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ReportUser>()
                .Property(e => e.EmailAddress)
                .IsUnicode(false);

            modelBuilder.Entity<ReportUser>()
                .Property(e => e.Firstname)
                .IsUnicode(false);

            modelBuilder.Entity<ReportUser>()
                .Property(e => e.Lastname)
                .IsUnicode(false);

            modelBuilder.Entity<ReportUser>()
                .HasMany(e => e.Reports)
                .WithRequired(e => e.ReportUser)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<RightsExpressions>()
                .HasMany(e => e.CopyrightZones)
                .WithRequired(e => e.RightsExpressions)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Shelfmarks>()
                .HasMany(e => e.CopyrightZones)
                .WithRequired(e => e.Shelfmarks)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Shelfmarks>()
                .HasMany(e => e.Logging1)
                .WithRequired(e => e.Shelfmarks)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Shelfmarks>()
                .HasMany(e => e.LoggingDigifloImport)
                .WithRequired(e => e.Shelfmarks)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Shelfmarks>()
                .HasMany(e => e.Queue)
                .WithRequired(e => e.Shelfmarks)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SharepointRecordsTest>()
                .Property(e => e.Shelfmark)
                .IsUnicode(false);      

            modelBuilder.Entity<SharepointRecord>()
                .Property(e => e.Shelfmark)
                .IsUnicode(false);       


            //views

            modelBuilder.Entity<CopyrightZonesView>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<CopyrightZonesView>()
                .Property(e => e.ModifiedBy)
                .IsUnicode(false);

        }
    }
}
