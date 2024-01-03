using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class katekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                Random r = new Random();
                int sayi = r.Next(0, 100);
                FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

                Kategori kategori = new Kategori(TextBox1.Text, "img/" + sayi + FileUpload1.FileName);
                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                bool gelen = kategoriCRUD.ekle(kategori);
            }
            else
            {
                Kategori kategori = new Kategori(TextBox1.Text, "");
                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                bool gelen = kategoriCRUD.ekle(kategori);
            }
            
            Response.Redirect("katlistele.aspx");
        }
    }
}