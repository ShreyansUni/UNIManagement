using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UNIManagement.Repositories.CommanHelper
{
    public class Enums
    {      
        public enum Gender
        {
            Female,
            Male
        }
        public enum UserType
        {
            Admin = 1,
            Employee = 2,  
        }
        public enum LeaveType
        {
            FullLeave =1,
            FirstHalf=2,
            SecondHalf=3
        }
    }
}
