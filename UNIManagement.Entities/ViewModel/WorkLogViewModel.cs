using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UNIManagement.Entities.ViewModel
{
    public class WorkLogViewModal
    {
        public int WorkLogId { get; set; }

        public int? EmployeeId { get; set; }

        public string? Message { get; set; }
        public string? Subject { get; set; }

        public DateTime? SignOutTime { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}
