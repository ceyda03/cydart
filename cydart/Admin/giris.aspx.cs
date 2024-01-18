using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class girisyap : System.Web.UI.Page
    {
        HttpCookie cerez = new HttpCookie("bilgi");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["cikis"] != null)
            {
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("giris.aspx");
            }

            if(!IsPostBack)
            {
                if (Request.Cookies["bilgi"] != null)
                {
                    cerez = Request.Cookies["bilgi"];
                    TextBox1.Text = cerez["kadi"];
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Adminn admin = new Adminn();
            admin.Email = TextBox1.Text;
            admin.Kadi = TextBox1.Text;
            admin.Sifre = TextBox2.Text;
            AdminCRUD adminCRUD = new AdminCRUD();
            bool sonuc = adminCRUD.kontrol(admin);
            if (sonuc)
            {
                Session["admin"] = true;

                admin.No = adminCRUD.getir(admin).No;
                Session["id"] = admin.No;

                admin.Ad = adminCRUD.getir(admin).Ad;
                Session["ad"] = admin.Ad;

                admin.Soyad = adminCRUD.getir(admin).Soyad;
                Session["soyad"] = admin.Soyad; 

                Session["sifre"] = admin.Sifre;

                admin.Tel = adminCRUD.getir(admin).Tel;
                Session["tel"] = admin.Tel;

                admin.Yetki = adminCRUD.getir(admin).Yetki;
                Session["yetki"] = admin.Yetki;

                admin.Ryol = adminCRUD.getir(admin).Ryol;
                Session["resim"] = admin.Ryol;
                
                if (CheckBox1.Checked)
                {
                    cerez["kadi"] = TextBox1.Text;
                    cerez.Expires = DateTime.Now.AddMonths(3);
                    Response.Cookies.Add(cerez);
                }

                Response.Redirect("index.aspx");
            }
            else
            {
                mesaj.Visible = true;
            }
        }
    }
}