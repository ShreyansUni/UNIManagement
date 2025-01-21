using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UNIManagement.Entities.DataContext;
using UNIManagement.Entities.DataModels;
using UNIManagement.Entities.ViewModel;
using UNIManagement.Repositories.CommanHelper;
using UNIManagement.Repositories.Repository.InterFace;


namespace UNIManagement.Repositories.Repository
{
    public class WorkLogRepository : IWorkLogRepository
    {
        private readonly ApplicationDbContext _context;
        public WorkLogRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<WorkLogViewModal> WorkLogList(int? EmployeeId)
        {
            var data = _context.WorkLogs.Where(a => a.EmployeeId == EmployeeId).Select(cont => new WorkLogViewModal()
            {
                Message = cont.Message,
                Subject = cont.Subject,
                SignOutTime = cont.SignOutTime,
                EmployeeId = cont.EmployeeId,
                WorkLogId = cont.WorkLogId
            }).ToList();
            return data;
        }

        public async Task<(bool IsSuccess, string Message)> WorkLogAdd(WorkLogViewModal model)
        {
            try
            {
                string messege;
                var worklog = new WorkLogViewModal();
                if (model.WorkLogId == null || model.WorkLogId == 0)
                {
                    var data = new WorkLog
                    {
                        Subject = model.Subject,
                        Message = model.Message,
                        SignOutTime = DateTime.Now,
                        CreatedDate = DateTime.Now,
                        EmployeeId = 131 // Use model.EmployeeId for dynamic input
                    };
                    _context.Add(data);
                    messege = "WorkLog Added.";
                    _context.SaveChanges();
                }
                else
                {
                    WorkLog? workLog = _context.WorkLogs.Where(a => a.WorkLogId == model.WorkLogId).FirstOrDefault();
                    if (workLog == null)
                    {
                        throw new Exception("Lead Not Found");
                    }
                    workLog.Subject = model.Subject;
                    worklog.Message = model.Message;
                    _context.WorkLogs.Update(workLog);
                    messege = "WorkLog Updated.";
                }

                await _context.SaveChangesAsync();
                return (true, messege);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
                throw;
            }
        }

        public WorkLogViewModal GetWorkLogDetails(int? WorkLogId)
        {
            var data = _context.WorkLogs.FirstOrDefault(a => a.WorkLogId == WorkLogId);
            return new WorkLogViewModal
            {
                Subject = data.Subject,
                Message = data.Message
            };
        }

    }
}
