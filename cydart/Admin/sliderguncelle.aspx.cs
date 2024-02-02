using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class sliderguncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int gid = Convert.ToInt16(Request.QueryString["gunid"]);
            SliderCRUD sliderCRUD = new SliderCRUD();
            Slider slider = sliderCRUD.bilgigetir(gid);

            if (!IsPostBack)
            {
                TextBox1.Text = slider.No.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                Random r = new Random();
                int sayi = r.Next(0, 100);
                FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

                SliderCRUD sliderCRUD = new SliderCRUD();
                bool sonuc = sliderCRUD.guncelle(Convert.ToInt16(TextBox1.Text), TextBox2.Text, TextBox2.Text, TextBox3.Text, "img/" + sayi + FileUpload1.FileName, TextBox5.Text);

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
            else
            {
                SliderCRUD sliderCRUD = new SliderCRUD();
                Slider slider = sliderCRUD.bilgigetir(Convert.ToInt16(Request.QueryString["gunid"]));
                bool sonuc = sliderCRUD.guncelle(Convert.ToInt16(TextBox1.Text), TextBox2.Text, TextBox2.Text, TextBox3.Text, slider.Resim, TextBox5.Text);

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
}