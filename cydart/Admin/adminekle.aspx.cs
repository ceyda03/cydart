using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class adminekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Add("Süper Admin");
                DropDownList1.Items.Add("Admin");
                DropDownList1.Items.Add("Editör");
            }

            basarili.Visible = false;
            basarisiz.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                Random r = new Random();
                int sayi = r.Next(0, 1000);
                FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

                Adminn admin = new Adminn(TextBox6.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, Convert.ToByte(DropDownList1.SelectedIndex), "img/" + sayi + FileUpload1.FileName);
                AdminCRUD adminCRUD = new AdminCRUD();
                bool kontrol = adminCRUD.kayitkontrol(admin.Email, admin.Kadi);
                if (kontrol)
                {
                    basarisiz.Visible = true;
                }
                else
                {
                    bool gelen = adminCRUD.ekle(admin);
                    basarili.Visible = true;
                    Response.Redirect("adminlistele.aspx");
                }
            }
            else
            {
                Adminn admin = new Adminn(TextBox6.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, Convert.ToByte(DropDownList1.SelectedIndex), "");
                AdminCRUD adminCRUD = new AdminCRUD();
                bool kontrol = adminCRUD.kayitkontrol(admin.Email, admin.Kadi);
                if (kontrol)
                {
                    basarisiz.Visible = true;
                }
                else
                {
                    bool gelen = adminCRUD.ekle(admin);
                    basarili.Visible = true;
                    Response.Redirect("adminlistele.aspx");
                }
            }
        }
    }
}