using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class adminguncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int gid = Convert.ToInt16(Request.QueryString["gunid"]);
                AdminCRUD adminCRUD = new AdminCRUD();
                Adminn admin = adminCRUD.bilgigetir(gid);
                TextBox7.Text = admin.No.ToString();

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
                int sayi = r.Next(1, 1000);
                FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

                AdminCRUD adminCRUD = new AdminCRUD();
                bool kontrol = adminCRUD.guncellemekontrol(Convert.ToInt16(TextBox7.Text), TextBox3.Text, TextBox6.Text);
                if (kontrol)
                {
                    basarisiz.Visible = true;
                }
                else
                {
                    adminCRUD.guncelle(Convert.ToInt16(TextBox7.Text), TextBox6.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, Convert.ToByte(DropDownList1.SelectedIndex), "img/" + sayi + FileUpload1.FileName);
                    basarili.Visible = true;
                }
            }
            else
            {
                AdminCRUD adminCRUD = new AdminCRUD();
                Adminn admin = adminCRUD.bilgigetir(Convert.ToInt16(Request.QueryString["gunid"]));
                bool kontrol = adminCRUD.guncellemekontrol(Convert.ToInt16(TextBox7.Text), TextBox3.Text, TextBox6.Text);
                if (kontrol)
                {
                    basarisiz.Visible = true;
                }
                else
                {
                    adminCRUD.guncelle(Convert.ToInt16(TextBox7.Text), TextBox6.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, Convert.ToByte(DropDownList1.SelectedIndex), admin.Ryol);
                    basarili.Visible = true;
                }
            }
        }
    }
}