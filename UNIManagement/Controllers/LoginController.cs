using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using UNIManagement.Entities.DataModels;
using UNIManagement.Entities.ViewModel;
using UNIManagement.Repositories.Repository;
using UNIManagement.Repositories.Repository.InterFace;

namespace UNIManagement.Controllers
{
    public class LoginController : Controller
    {
        #region Constructor
        private readonly ILoginRepository _loginRepository;
        private readonly IEmployeeRepository _employeeRepository;
        private readonly IJwtTokenRepository _jwtTokenRepository;
        private readonly INotyfService _notyf;
        public LoginController(ILoginRepository loginRepository, IEmployeeRepository employeeRepository,IJwtTokenRepository jwtTokenRepository, INotyfService notyf)
        {
            _loginRepository = loginRepository;
            _employeeRepository = employeeRepository;
            _jwtTokenRepository = jwtTokenRepository;
            _notyf = notyf;
        }
        #endregion
        
        #region Login Page View
        public IActionResult Index()
        {
            return View();
        }
        #endregion

        [HttpPost]
        public IActionResult UserLogin(User userModel)
        {
            if (ModelState.IsValid)
            {
                Employee? employee = _loginRepository.GetUser(userModel.Email,userModel.Password);
                if (employee!= null)
                {
                    var JWTToken=_jwtTokenRepository.GenerateJwtToken(employee.Email,employee.EmployeeId);
                    HttpContext.Session.SetString("JwtToken",JWTToken);
                    HttpContext.Session.SetInt32("UserId",employee.EmployeeId);
                    HttpContext.Session.SetString ("Email",employee.Email);
                    HttpContext.Session.SetString ("Name",employee.FirstName+" "+employee.LastName);                    
                    _notyf.Success("Welcome to Unique IT Solution Employee Portal!");
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    _notyf.Error("Enter correct credentials!");
                    return RedirectToAction("Index");
                }
            }
            else
            {
                _notyf.Error("Enter correct credentials!");
                return View("Index",User);
            }
        }

        #region Logout
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("JwtToken");
            HttpContext.Session.Remove("UserId");
            HttpContext.Session.Remove("Email");
            return RedirectToAction("Index");
        }
        #endregion

    }
}