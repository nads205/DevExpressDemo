using System;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public class Change
    {
        public int ChangeId { get; set; }

        public int ChangeSetId { get; set; }

        [Required]
        [StringLength(50)]
        public string TableName { get; set; }

        [Required]
        [StringLength(50)]
        public string ColumnName { get; set; }

        [Required]
        [StringLength(4000)]
        public string OldValue { get; set; }

        [Required]
        [StringLength(4000)]
        public string NewValue { get; set; }

        public DateTime DateTime { get; set; }

        [Required]
        [StringLength(50)]
        public string UserName { get; set; }
    }
}
