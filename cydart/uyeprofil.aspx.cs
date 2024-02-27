using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart
{
    public partial class uyeprofil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["uye"]) != true)
            {
                Response.Redirect("index.aspx");
            }
            else 
            {
                basarili.Visible = false;
                basarisiz.Visible = false;
                sifrehata.Visible = false;

                if (Request.QueryString["sil"] =="1")
                {
                    int id = Convert.ToInt16(Session["no"]);

                    MusteriCRUD musteriCRUD = new MusteriCRUD();
                    bool sonuc = musteriCRUD.sil(id);
                    if (sonuc)
                    {
                        Session.Abandon();
                        Session.RemoveAll();
                        Response.Redirect("uyeprofil.aspx");
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ysifre;
            MusteriCRUD musteriCRUD = new MusteriCRUD();
            Musteri musteri = musteriCRUD.bilgigetir(Convert.ToInt16(Session["no"]));

            if (TextBox8.Text != "")
            {
                if (TextBox7.Text == musteri.Sifre)
                {
                    ysifre = TextBox8.Text;

                    bool kontrol = musteriCRUD.guncellemekontrol(Convert.ToInt16(Session["no"]), TextBox4.Text);

                    if (kontrol)
                    {
                        basarisiz.Visible = true;
                    }
                    else
                    {
                        musteriCRUD.guncelle(Convert.ToInt16(Session["no"]), TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, Convert.ToDateTime(TextBox6.Text), ysifre);
                        basarili.Visible = true;
                    }
                }
                else
                {
                    sifrehata.Visible = true;
                }
            }
            else
            {
                bool kontrol = musteriCRUD.guncellemekontrol(Convert.ToInt16(Session["no"]), TextBox4.Text);

                if (kontrol)
                {
                    basarisiz.Visible = true;
                }
                else
                {
                    musteriCRUD.guncelle(Convert.ToInt16(Session["no"]), TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, Convert.ToDateTime(TextBox6.Text), musteri.Sifre);
                    basarili.Visible = true;
                }
            }
        }
    }
}