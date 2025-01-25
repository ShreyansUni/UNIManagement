using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using UNIManagement.Entities.DataModels;

namespace UNIManagement.Repositories.CommanHelper
{
    public class Helper
    {   
        public static string UploadFile(IFormFile UploadFile, int ID, string rootPath, string filename)
        {
            if (UploadFile != null)
            {
                string FilePath = "wwwroot\\Documents\\" + rootPath + "\\" + ID;
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
             
                string newfilename = filename;
                string fileNameWithPath = Path.Combine(path, newfilename);
                string uploadPath = FilePath.Replace("wwwroot\\Documents\\" + rootPath + "\\" + ID , "/"+ rootPath + "/") + "/" + newfilename;

                using (FileStream stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    UploadFile.CopyTo(stream);
                }

                return filename;
            }

            return null;
        }
        public static bool SendMail(string to, string subject, string body)
        {
            using (var client = new SmtpClient("smtp.gmail.com", 587))
            {
                try
                {
                    client.Credentials = new NetworkCredential("noreply.ventasemail@gmail.com", "pfhh fave jogk mcnv");
                    client.EnableSsl = true;

                    var mailMessage = new MailMessage
                    {
                        From = new MailAddress("noreply.ventasemail@gmail.com"),
                        Subject = subject,
                        Body = body,
                        IsBodyHtml = true
                    };
                    mailMessage.To.Add(to);
                    mailMessage.IsBodyHtml = true;
                    client.Send(mailMessage);

                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

    }
}
