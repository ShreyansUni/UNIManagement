using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using UNIManagement.Entities.DataContext;
using UNIManagement.Entities.DataModels;
using UNIManagement.Repositories.Repository.InterFace;

namespace UNIManagement.Repositories.Repository
{
    public class JwtTokenRepository:IJwtTokenRepository
    {
        private readonly IConfiguration _config;
        private readonly ApplicationDbContext _context;
        public JwtTokenRepository(IConfiguration config,ApplicationDbContext context)
        {
            _config = config;
            _context = context;
        }

        public string GenerateJwtToken(string email, int id)
        {
            // Token Generation 

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes(_config["Jwt:Key"]);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[] { new Claim("email", email), new Claim("id", id.ToString()) }),
                Expires = DateTime.UtcNow.AddDays(30),
                Issuer = _config["Jwt:Issuer"],
                //Audience = _audience,
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key)

                , SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            var jwtToken = tokenHandler.WriteToken(token);

            return jwtToken;
        }

        //public bool ValidateAuthToken(string? jwtToken, int? userId = -1)
        //{
        //    try
        //    {
        //        var tokenHandler = new JwtSecurityTokenHandler();
        //        var token = tokenHandler.ReadJwtToken(jwtToken);
        //        var claims = token.Claims;
        //        var userIdClaim = token.Claims.FirstOrDefault(c => c.Type == "UserId");
        //        if (userIdClaim != null)
        //        {
        //            var value = int.Parse(userIdClaim.Value);
        //            Employee user = _context.Employees.FirstOrDefault(users => users.EmployeeId == value);
        //            if (user != null)
        //            {

        //                if (userId != -1)
        //                {
        //                    if (value == userId)
        //                    {
        //                        return (user.authtoken == jwtToken) ? true : false;
        //                    }
        //                    else
        //                    {
        //                        return false;
        //                    }
        //                }
        //                else
        //                {
        //                    return (user.AuthToken == jwtToken) ? true : false;
        //                }
        //            }
        //            else
        //            {
        //                return false;
        //            }
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    catch
        //    {
        //        return false;
        //    }
        //}

        public bool ValidateToken(string token, out JwtSecurityToken jwtSecurityToken)
        {
            jwtSecurityToken = null;
            if (token == null)
            {
                return false;
            }
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_config["Jwt:Key"]);
            try
            {
                tokenHandler.ValidateToken(token, new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key)
    ,
                    ValidateIssuer = true,
                    ValidateLifetime = true,
                    ValidateAudience = false,
                    ValidIssuer = _config["Jwt:Issuer"],
                    ClockSkew = TimeSpan.Zero
                }, out SecurityToken validatedToken);

                jwtSecurityToken = (JwtSecurityToken)validatedToken;
                var email = jwtSecurityToken.Claims.First(x => x.Type == "email").Value;
                if (jwtSecurityToken != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                return (false);
            }
        }
    }
}
