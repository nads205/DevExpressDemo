using System;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public class Checks1
    {
        [Key]
        public int CheckId { get; set; }

        public int Code { get; set; }

        public bool Result { get; set; }

        public DateTime DateTime { get; set; }

        public int ShelfmarkId { get; set; }

        public string Notes { get; set; }

        public virtual ChecksInfo ChecksInfo { get; set; }
    }
}
