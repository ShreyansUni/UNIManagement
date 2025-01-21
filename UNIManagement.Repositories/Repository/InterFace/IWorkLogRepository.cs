using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UNIManagement.Entities.ViewModel;

namespace UNIManagement.Repositories.Repository.InterFace
{
    public interface IWorkLogRepository
    {
        List<WorkLogViewModal> WorkLogList(int? EmployeeId);
        Task<(bool IsSuccess, string Message)> WorkLogAdd(WorkLogViewModal model);
        WorkLogViewModal GetWorkLogDetails(int? WorkLogId);
    }
}
