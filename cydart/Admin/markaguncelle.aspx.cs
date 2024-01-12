using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class markaguncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int gid = Convert.ToInt16(Request.QueryString["gunid"]);
            MarkaCRUD markaCRUD = new MarkaCRUD();
            Marka marka = markaCRUD.bilgigetir(gid);

            if (!IsPostBack)
            {
                TextBox1.Text = marka.No.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                Random r = new Random();
                int sayi = r.Next(0, 100);
                FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

                MarkaCRUD markaCRUD = new MarkaCRUD();
                markaCRUD.guncelle(Convert.ToInt16(TextBox1.Text), TextBox2.Text, "img/" + sayi + FileUpload1.FileName);
            }
            else
            {
                MarkaCRUD markaCRUD = new MarkaCRUD();
                Marka marka = markaCRUD.bilgigetir(Convert.ToInt16(Request.QueryString["gunid"]));
                markaCRUD.guncelle(Convert.ToInt16(TextBox1.Text), TextBox2.Text, marka.Resim);
            }
        }
    }
}