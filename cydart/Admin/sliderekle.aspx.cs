using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class sliderekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            int sayi = r.Next(0, 1000);
            FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

            Slider slider = new Slider(TextBox1.Text, TextBox2.Text, TextBox3.Text, "img/" + sayi + FileUpload1.FileName, TextBox4.Text);
            SliderCRUD sliderCRUD = new SliderCRUD();
            bool sonuc = sliderCRUD.ekle(slider);

            if (sonuc)
            {
                Response.Redirect("sliderlistele.aspx");
            }
            else
            {
                basarisiz.Visible = true;
            }
        }
    }
}