using System;
using System.ComponentModel.DataAnnotations;

namespace DevExpress.Data.Data
{
    public class Agent
    {
        public int Id { get; set; }

        [Required]
        [StringLength(63)]
        public string AgentName { get; set; }

        public bool Connected { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime LastHeartbeat { get; set; }

        [Required]
        [StringLength(104)]
        public string UserAccount { get; set; }

        public bool IsAdmin { get; set; }

        [Required]
        [StringLength(50)]
        public string Version { get; set; }
    }
}
