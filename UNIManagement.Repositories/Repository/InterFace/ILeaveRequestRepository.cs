using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UNIManagement.Entities.DataModels;
using UNIManagement.Entities.ViewModel;

namespace UNIManagement.Repositories.Repository.InterFace
{
    public interface ILeaveRequestRepository
    {
        public void SubmitLeave(LeaveRequestViewModel model);
        public List<Employee> GetEmployeeListForDropDown();
        public List<LeaveRequestViewModel> GetLeaveRequestList(int userId);
        public void DeleteLeaveRecord(int leaveRequestId);
        public LeaveRequestViewModel GetLeaveRecord(int leaveRequestId);
    }
}
