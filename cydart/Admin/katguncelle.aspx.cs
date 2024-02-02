using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class katguncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int gid = Convert.ToInt16(Request.QueryString["gunid"]);
            KategoriCRUD kategoriCRUD = new KategoriCRUD();
            Kategori kategori = kategoriCRUD.bilgigetir(gid);

            if (!IsPostBack)
            {
                TextBox1.Text = kategori.No.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool sonuc;

            if (FileUpload1.HasFile)
            {
                Random r = new Random();
                int sayi = r.Next(0,100);
                FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                sonuc = kategoriCRUD.guncelle(Convert.ToInt16(TextBox1.Text), TextBox2.Text, "img/" + sayi + FileUpload1.FileName);
            }
            else
            {
                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                Kategori kategori = kategoriCRUD.bilgigetir(Convert.ToInt16(Request.QueryString["gunid"]));
                sonuc = kategoriCRUD.guncelle(Convert.ToInt16(TextBox1.Text), TextBox2.Text, kategori.Resim);
            }

            if (sonuc)
            {
                basarili.Visible = true;
                basarisiz.Visible = false;
            }
            else
            {
                basarili.Visible = false;
                basarisiz.Visible = true;
            }
        }
    }
}