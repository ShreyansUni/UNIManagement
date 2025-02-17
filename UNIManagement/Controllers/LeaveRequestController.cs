﻿using Microsoft.AspNetCore.Mvc;
using UNIManagement.Entities.ViewModel;
using UNIManagement.Repositories.Repository.InterFace;
using UNIManagement.Repositories.Repository;

namespace UNIManagement.Controllers
{
    public class LeaveRequestController : Controller
    {
        private readonly ILeaveRequestRepository _leaveRequestRepository;
        public LeaveRequestController(ILeaveRequestRepository leaveRequestRepository)
        {
            _leaveRequestRepository = leaveRequestRepository;
        }
        public IActionResult LeaveRequestFormPage()
        {
            LeaveRequestViewModel model = new();
            model.LeaveRequestorID = (int)HttpContext.Session.GetInt32("UserId");
            model.LeaveRequestorName = HttpContext.Session.GetString("Name");

            return View(model);
        }
        public IActionResult SubmitLeaveRequest(LeaveRequestViewModel model)
        {
            try
            {
                _leaveRequestRepository.SubmitLeave(model);
                return RedirectToAction("LeaveRequestListing");
            }
            catch (Exception ex)
            {
                return RedirectToAction("LeaveRequestListing");
            }
        }
        public IActionResult LeaveRequestListing()
        {
            int UserId = HttpContext.Session.GetInt32("UserId") ?? -1;
            string UserName = HttpContext.Session.GetString("Name");
            List<LeaveRequestViewModel> model = new();
            if (UserId != null)
            {
               model= _leaveRequestRepository.GetLeaveRequestList(UserId);
            }
            return View(model);
        }
        
        public IActionResult DeleteLeaveRequest(int leaveRecordID)
        {
            _leaveRequestRepository.DeleteLeaveRecord(leaveRecordID);
            int UserId=HttpContext.Session.GetInt32("UserId")??-1;
            List<LeaveRequestViewModel> model = _leaveRequestRepository.GetLeaveRequestList(UserId);
            return RedirectToAction("LeaveRequestListing",model);
        }
        public IActionResult EditLeaveRequest(int leaveRequestId)
        {
            LeaveRequestViewModel model= _leaveRequestRepository.GetLeaveRecord(leaveRequestId);
            return View("LeaveRequestFormPage",model);
        }
    }
}
