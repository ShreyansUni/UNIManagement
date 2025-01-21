using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
namespace UNIManagement.Repositories.Repository.InterFace
{
    public interface IJwtTokenRepository
    {
        public string GenerateJwtToken(string email, int id);
        //public bool ValidateAuthToken(string? jwtToken, int? userId = -1);
        public bool ValidateToken(string token, out JwtSecurityToken jwtSecurityToken);
    }
}
