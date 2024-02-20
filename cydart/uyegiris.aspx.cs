using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart
{
    public partial class uyegiris : System.Web.UI.Page
    {
        HttpCookie cerez = new HttpCookie("uyebilgi");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["uyebilgi"] != null)
                {
                    cerez = Request.Cookies["uyebilgi"];
                    TextBox1.Text = cerez["email"];
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Musteri musteri = new Musteri();
            musteri.Email = TextBox1.Text;
            musteri.Sifre = TextBox2.Text;
            MusteriCRUD musteriCRUD = new MusteriCRUD();
            bool sonuc = musteriCRUD.kontrol(musteri);
            if (sonuc)
            {
                Session["uye"] = true;

                musteri.Ad = musteriCRUD.getir(musteri).Ad;
                musteri.Soyad = musteriCRUD.getir(musteri).Soyad;
                Session["ad"] = musteri.Ad + " " + musteri.Soyad;

                musteri.No = musteriCRUD.getir(musteri).No;
                Session["no"] = musteri.No;

                if (CheckBox1.Checked)
                {
                    cerez["email"] = TextBox1.Text;
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