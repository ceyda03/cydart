using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class markaekle : System.Web.UI.Page
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

                Marka marka = new Marka(TextBox1.Text, "img/" + sayi + FileUpload1.FileName);
                MarkaCRUD markaCRUD = new MarkaCRUD();
                bool gelen = markaCRUD.ekle(marka);
            }
            else
            {
                Marka marka = new Marka(TextBox1.Text, "");
                MarkaCRUD markaCRUD = new MarkaCRUD();
                bool gelen = markaCRUD.ekle(marka);
            }

            Response.Redirect("markalistele.aspx");
        }
    }
}