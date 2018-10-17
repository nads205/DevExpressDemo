using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DevExpress.Data.Data
{
    [Table("Queue")]
    public partial class Queue
    {
        public int Id { get; set; }

        public int ShelfmarkId { get; set; }

        [Required]
        [StringLength(50)]
        public string ProcessingStatus { get; set; }

        [Required]
        [StringLength(104)]
        public string UserId { get; set; }

        [StringLength(63)]
        public string Agent { get; set; }

        [StringLength(63)]
        public string AddedVia { get; set; }

        public bool UploadToPortal { get; set; }

        public DateTime DateAdded { get; set; }

        public DateTime? DateStarted { get; set; }

        public DateTime? DateFinished { get; set; }

        public virtual Shelfmarks Shelfmarks { get; set; }
    }
}
