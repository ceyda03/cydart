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
            Kategori kategori = new Kategori(TextBox1.Text);
            KategoriCRUD kategoriCRUD = new KategoriCRUD();
            bool gelen = kategoriCRUD.anaKatEkle(kategori);

            Response.Redirect("katlistele.aspx");
        }
    }
}