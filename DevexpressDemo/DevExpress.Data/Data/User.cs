using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public partial class User
    {
        [StringLength(255)]
        public string UserID { get; set; }

        public bool MinimisedSidebar { get; set; }
    }
}
