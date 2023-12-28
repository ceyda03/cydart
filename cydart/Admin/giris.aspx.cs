using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class girisyap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Adminn admin = new Adminn();
            admin.Email = TextBox1.Text;
            admin.Sifre = TextBox2.Text;
            AdminCRUD adminCRUD = new AdminCRUD();
            bool sonuc = adminCRUD.kontrol(admin);
            if (sonuc)
            {
                Session["admin"] = true;

                admin.Ad = adminCRUD.getir(admin).Ad;
                Session["ad"] = admin.Ad;

                admin.Soyad = adminCRUD.getir(admin).Soyad;
                Session["soyad"] = admin.Soyad;

                admin.Tel = adminCRUD.getir(admin).Tel;
                Session["tel"] = admin.Tel;

                admin.Yetki = adminCRUD.getir(admin).Yetki;
                Session["yetki"] = admin.Yetki;

                admin.Ryol = adminCRUD.getir(admin).Ryol;
                Session["resim"] = admin.Ryol;
                Response.Redirect("index.aspx");
            }
            else
            {
                mesaj.InnerHtml = "Email ya da şifre hatalı";
            }
        }
    }
}