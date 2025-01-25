using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using UNIManagement.Entities.DataContext;
using UNIManagement.Entities.DataModels;
using UNIManagement.Entities.ViewModel;
using UNIManagement.Repositories.CommanHelper;
using UNIManagement.Repositories.Repository.InterFace;

namespace UNIManagement.Repositories.Repository
{
    public class LeaveRequestRepository : ILeaveRequestRepository
    {
        private readonly ApplicationDbContext _context;
        public LeaveRequestRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public void SubmitLeave(LeaveRequestViewModel model)
        {
            Employee employee = _context.Employees.FirstOrDefault(emp => emp.EmployeeId == model.LeaveRequestorID);
            if (employee != null)
            {
                if (model.LeaveID != default)
                {
                    LeaveRequest leaveRequest = _context.LeaveRequests.FirstOrDefault(leaves => leaves.LeaveRequestId == model.LeaveID);
                    leaveRequest.ReportingEmployeeId = 140;
                    leaveRequest.ReasonForLeave = model.ReasonForLeave;
                    leaveRequest.LeaveStartDate = model.LeaveStartDate;
                    leaveRequest.LeaveStartDateDuration = model.LeaveStartType;
                    leaveRequest.LeaveEndDate = model.LeaveEndDate;
                    leaveRequest.LeaveEndDuration = model.LeaveEndType;
                    leaveRequest.ActualLeaveDuration = model.ActualLeaveDuration;
                    leaveRequest.TotalLeaveDuration = model.TotalLeaveDuration;
                    leaveRequest.ReturnDate = model.ReturnDate;
                    leaveRequest.RequestedDate = model.RequestedDate;
                    leaveRequest.PhoneNumber = model.PhoneNumber;
                    leaveRequest.AlternatePhoneNumber = model.AlternatePhoneNumber;
                    leaveRequest.IsAvailableOnPhone = model.IsAvailableOnPhone;
                    leaveRequest.IsAdhocLeave = model.IsAdhocLeave;
                    leaveRequest.EmployeeId = model.LeaveRequestorID;
                    leaveRequest.IsLeaveApproved = false;
                    leaveRequest.CreatedAt = DateTime.Now;
                    leaveRequest.CreatedBy = model.LeaveRequestorID;
                    leaveRequest.ModifiedAt = DateTime.Now;
                    leaveRequest.ModifiedBy = model.LeaveRequestorID;
                    _context.LeaveRequests.Update(leaveRequest);
                    _context.SaveChanges();

                    string EmailBody ="";
                    string EmailSubject = employee.FirstName + " " + employee.LastName + " - Leave Request (EDITED)";
                    if (model.LeaveStartDate != model.LeaveEndDate)
                    {
                        EmailBody = "EDITED: " + employee.FirstName + " " + employee.LastName + " is requesting " + model.ActualLeaveDuration + " days leave from " + model.LeaveStartDate + " (" + ((Enums.LeaveType)model.LeaveStartType).ToString() + ") to " + model.LeaveEndDate + " (" + ((Enums.LeaveType)model.LeaveEndType).ToString() + ").<br>" + "Reason of Leave: <br>" + model.ReasonForLeave+ "<br>";
                    }
                    else
                    {
                        EmailBody = "EDITED: " + employee.FirstName + " " + employee.LastName + " is requesting " + model.ActualLeaveDuration + " day leave on " + model.LeaveStartDate + " (" + ((Enums.LeaveType)model.LeaveStartType).ToString() + "). <br> Reason Of Leave: <br>" + model.ReasonForLeave+ "<br>";
                    }
                    Helper.SendMail("rahul0810shah@gmail.com", EmailSubject, EmailBody);
                }
                else
                {
                    LeaveRequest leaveRequest = new();
                    leaveRequest.ReportingEmployeeId = 140;
                    leaveRequest.ReasonForLeave = model.ReasonForLeave;
                    leaveRequest.LeaveStartDate = model.LeaveStartDate;
                    leaveRequest.LeaveStartDateDuration = model.LeaveStartType;
                    leaveRequest.LeaveEndDate = model.LeaveEndDate;
                    leaveRequest.LeaveEndDuration = model.LeaveEndType;
                    leaveRequest.ActualLeaveDuration = model.ActualLeaveDuration;
                    leaveRequest.TotalLeaveDuration = model.TotalLeaveDuration;
                    leaveRequest.ReturnDate = model.ReturnDate;
                    leaveRequest.RequestedDate = model.RequestedDate;
                    leaveRequest.PhoneNumber = model.PhoneNumber;
                    leaveRequest.AlternatePhoneNumber = model.AlternatePhoneNumber;
                    leaveRequest.IsAvailableOnPhone = model.IsAvailableOnPhone;
                    leaveRequest.IsAdhocLeave = model.IsAdhocLeave;
                    leaveRequest.EmployeeId = model.LeaveRequestorID;
                    leaveRequest.IsLeaveApproved = false;
                    leaveRequest.CreatedAt = DateTime.Now;
                    leaveRequest.CreatedBy = model.LeaveRequestorID;
                    leaveRequest.ModifiedAt = DateTime.Now;
                    leaveRequest.ModifiedBy = model.LeaveRequestorID;
                    _context.LeaveRequests.Add(leaveRequest);
                    _context.SaveChanges();

                    string EmailBody = "";
                    string EmailSubject = employee.FirstName + " " + employee.LastName + " - Leave Request";
                    if (model.LeaveStartDate != model.LeaveEndDate)
                    {
                        EmailBody = employee.FirstName + " " + employee.LastName + " is requesting " + model.ActualLeaveDuration + " days leave from " + model.LeaveStartDate + " (" + ((Enums.LeaveType)model.LeaveStartType).ToString() + ") to " + model.LeaveEndDate + " (" + ((Enums.LeaveType)model.LeaveEndType).ToString() + ").<br>" + "Reason of Leave:<br>" + model.ReasonForLeave + "<br>";

                    }
                    else
                    {
                        EmailBody = employee.FirstName + " " + employee.LastName + " is requesting " + model.ActualLeaveDuration + " day leave on " + model.LeaveStartDate + " (" + ((Enums.LeaveType)model.LeaveStartType).ToString() + "). <br> Reason Of Leave: <br>" + model.ReasonForLeave + "<br>";
                    }
                    Helper.SendMail("rahul0810shah@gmail.com", EmailSubject, EmailBody);
                }
            }
        }
        public List<Employee> GetEmployeeListForDropDown()
        {
            List<Employee> EmployeeList = _context.Employees.Where(emp => emp.IsDeleted == false).ToList();
            return EmployeeList;
        }
        public List<LeaveRequestViewModel> GetLeaveRequestList(int userId)
        {
            List<LeaveRequestViewModel> model = new();
            if (userId == -1)
            {
                return model;
            }
            model = (from leaveRequests in _context.LeaveRequests
                     where leaveRequests.EmployeeId == userId && leaveRequests.DeletedAt == null
                     orderby leaveRequests.LeaveStartDate descending
                     select new LeaveRequestViewModel
                     {
                         ReasonForLeave = leaveRequests.ReasonForLeave ?? "N/A",
                         LeaveStartDate = leaveRequests.LeaveStartDate,
                         LeaveEndDate = leaveRequests.LeaveEndDate,
                         LeaveID = leaveRequests.LeaveRequestId
                     }).ToList();
            return model;
        }
        public void DeleteLeaveRecord(int leaveRequestId)
        {
            LeaveRequest request = _context.LeaveRequests.FirstOrDefault(leave => leave.LeaveRequestId == leaveRequestId);
            if (request != null)
            {
                request.DeletedAt = DateTime.Now;
                _context.LeaveRequests.Update(request);
            }
            _context.SaveChanges();
        }
        public LeaveRequestViewModel GetLeaveRecord(int leaveRequestId)
        {
            LeaveRequest leaveRecord = _context.LeaveRequests.FirstOrDefault(record => record.LeaveRequestId == leaveRequestId);
            LeaveRequestViewModel model = new()
            {
                ReasonForLeave = leaveRecord.ReasonForLeave ?? "N/A",
                LeaveStartDate = leaveRecord.LeaveStartDate,
                LeaveEndDate = leaveRecord.LeaveEndDate,
                LeaveEndType = leaveRecord.LeaveEndDuration ?? default,
                LeaveStartType = leaveRecord.LeaveStartDateDuration ?? default,
                LeaveID = leaveRecord.LeaveRequestId,
                ActualLeaveDuration = leaveRecord.ActualLeaveDuration ?? default,
                TotalLeaveDuration = leaveRecord.TotalLeaveDuration ?? default,
                ReturnDate = leaveRecord.ReturnDate ?? default,
                RequestedDate = leaveRecord.RequestedDate ?? default,
                LeaveRequestorID = leaveRecord.EmployeeId,
                LeaveResponsorID = leaveRecord.ReportingEmployeeId,
                IsAdhocLeave = leaveRecord.IsAdhocLeave ?? default,
                IsAvailableOnPhone = leaveRecord.IsAvailableOnPhone ?? default,
                AlternatePhoneNumber = leaveRecord.AlternatePhoneNumber,
                PhoneNumber = leaveRecord.PhoneNumber,
            };
            Employee RequestingEmployeeName = _context.Employees.FirstOrDefault(emp => emp.EmployeeId == model.LeaveRequestorID);
            Employee ReportingEmployeeName = _context.Employees.FirstOrDefault(emp => emp.EmployeeId == model.LeaveResponsorID);
            model.LeaveRequestorName = RequestingEmployeeName.FirstName + " " + RequestingEmployeeName.LastName;
            model.LeaveRequestorName = ReportingEmployeeName.FirstName + " " + ReportingEmployeeName.LastName;
            model.EmployeeDropdownList = GetEmployeeListForDropDown();
            return model;
        }
    }
}
