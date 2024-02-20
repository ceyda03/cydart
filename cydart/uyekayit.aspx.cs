using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart
{
    public partial class uyekayit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Musteri musteri = new Musteri(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, Convert.ToDateTime(TextBox6.Text), TextBox7.Text);
            MusteriCRUD musteriCRUD = new MusteriCRUD();
            bool sonuc = musteriCRUD.ekle(musteri);

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

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
    }
}