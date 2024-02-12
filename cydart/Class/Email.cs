using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Security;

namespace cydart.Class
{
    public class Email
    {
        public string sifreyenile(string kime)
        {
            string sifre = Membership.GeneratePassword(10, 3);

            string to = kime;
            MailAddress gonderenmail = new MailAddress("butgemwebtasarim@gmail.com", "Admin");
            MailAddress alicimail = new MailAddress(to, "Müşteri");
            const string gonderensifre = "unie silr vjbw ktcx";

            SmtpClient smtp = new SmtpClient();
            System.Net.NetworkCredential networkCredential = new NetworkCredential(gonderenmail.Address, gonderensifre);
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = networkCredential;

            MailMessage message = new MailMessage(gonderenmail, alicimail);
            string mailbody = "Şifre yenileme isteğinizi aldık. Yeni Şifreniz: " + sifre + "<br>Lütfen giriş yaptıktan sonra ayarlar kısmından şifrenizi değiştirin.";
            message.Subject = "Şifre Sıfırlama İşleminiz.";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;

            smtp.Send(message);

            return sifre;
        }

        public void onericevapla(string kime)
        {
            string to = kime;
            MailAddress gonderenmail = new MailAddress("butgemwebtasarim@gmail.com", "Admin");
            MailAddress alicimail = new MailAddress(to, "Müşteri");
            const string gonderensifre = "unie silr vjbw ktcx";

            SmtpClient smtp = new SmtpClient();
            System.Net.NetworkCredential networkCredential = new NetworkCredential(gonderenmail.Address, gonderensifre);
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = networkCredential;

            MailMessage message = new MailMessage(gonderenmail, alicimail);
            string mailbody = "Öneriniz için teşekkürler! Geri bildirimleriniz bizim için çok değerli. Hizmetimizi ilettiğiniz ayrıntılara göre geliştirmek için elimizden geleni yapacağız.";
            message.Subject = "Öneriniz İçin Teşekkürler!";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;

            smtp.Send(message);
        }

        public void sikayetcevapla(string kime)
        {
            string to = kime;
            MailAddress gonderenmail = new MailAddress("butgemwebtasarim@gmail.com", "Admin");
            MailAddress alicimail = new MailAddress(to, "Müşteri");
            const string gonderensifre = "unie silr vjbw ktcx";

            SmtpClient smtp = new SmtpClient();
            System.Net.NetworkCredential networkCredential = new NetworkCredential(gonderenmail.Address, gonderensifre);
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = networkCredential;

            MailMessage message = new MailMessage(gonderenmail, alicimail);
            string mailbody = "Sorun yaşamanıza üzüldük. Şikayetiniz bize ulaştı. Çözüm için çalışmalara başladık. En kısa zamanda size haber vereceğiz.";
            message.Subject = "Şikayetiniz Tarafımıza Ulaştı!";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;

            smtp.Send(message);
        }

        public void yorumcevapla(string kime)
        {
            string to = kime;
            MailAddress gonderenmail = new MailAddress("butgemwebtasarim@gmail.com", "Admin");
            MailAddress alicimail = new MailAddress(to, "Müşteri");
            const string gonderensifre = "unie silr vjbw ktcx";

            SmtpClient smtp = new SmtpClient();
            System.Net.NetworkCredential networkCredential = new NetworkCredential(gonderenmail.Address, gonderensifre);
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = networkCredential;

            MailMessage message = new MailMessage(gonderenmail, alicimail);
            string mailbody = "Yorumunuz için teşekkürler! Geri bildirimleriniz bizim için çok değerli.";
            message.Subject = "Yorumunuz İçin Teşekkürler!";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;

            smtp.Send(message);
        }

        //public void yanitgonder(string kime)
        //{
        //    string to = kime;
        //    string from = "ceydatak03@gmail.com";
        //    MailMessage message = new MailMessage(from, to);

        //    string mailbody = "Şifre yenileme işlemleri";
        //    message.Subject = "Şifre yenileme";
        //    message.Body = mailbody;
        //    message.BodyEncoding = Encoding.UTF8;
        //    message.IsBodyHtml = true;
        //    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        //    NetworkCredential basicCredential = new NetworkCredential("ceydatak03@gmail.com", "09876_abc");
        //    client.EnableSsl = true;
        //    client.UseDefaultCredentials = false;
        //    client.Credentials = basicCredential;
        //    client.Send(message);
        //}
    }
}