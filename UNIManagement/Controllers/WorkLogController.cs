using Microsoft.AspNetCore.Mvc;
using UNIManagement.Entities.DataModels;
using UNIManagement.Entities.ViewModel;
using UNIManagement.Repositories.Repository;
using UNIManagement.Repositories.Repository.InterFace;

namespace UNIManagement.Controllers
{
    public class WorkLogController : BaseController
    {
        #region Constructor
        private readonly IWorkLogRepository _worklogRepository;
        public WorkLogController(IWorkLogRepository worklogRepository)
        {
            _worklogRepository = worklogRepository;
        }
        #endregion


        public IActionResult Index()
        {
            //WorkLogViewModal wl = new WorkLogViewModal();
            List<WorkLogViewModal> list = _worklogRepository.WorkLogList(131);
            return View(list);
        }
        [HttpGet, Route("worklog/edit/{worklogid}", Name = "UserAddEditModal")]
        [HttpGet, Route("worklog/add/", Name = "worklogAdd")]
        public IActionResult AddWorkLog(int WorkLogId)
        {
            WorkLogViewModal workLogViewModal = new WorkLogViewModal();
            if (WorkLogId != null && WorkLogId != 0)
            {
                workLogViewModal = _worklogRepository.GetWorkLogDetails(WorkLogId);
            }
            return View(workLogViewModal);
        }
        public async Task<IActionResult> AddEdit(WorkLogViewModal model)
        {
            var (isSuccess, Message) = await _worklogRepository.WorkLogAdd(model);
            return RedirectToAction("Index");
        }

    }
}
