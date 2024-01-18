using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class ayarlar : System.Web.UI.Page
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
            string ysifre;
            AdminCRUD adminCRUD = new AdminCRUD();
            Adminn admin = adminCRUD.bilgigetir(Convert.ToInt16(Session["id"]));

            if (TextBox7.Text != null)
            {
                ysifre = TextBox7.Text;
            }
            else
            {
                ysifre = admin.Sifre;
            }

            bool kontrol = adminCRUD.guncellemekontrol(Convert.ToInt16(Session["id"]), TextBox4.Text, TextBox3.Text);

            if (FileUpload1.HasFile)
            {
                Random r = new Random();
                int sayi = r.Next(1, 1000);
                FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

                if (kontrol)
                {
                    basarisiz.Visible = true;
                }
                else
                {
                    adminCRUD.guncelle(Convert.ToInt16(Session["id"]), TextBox3.Text, TextBox1.Text, TextBox2.Text, TextBox4.Text, TextBox5.Text, ysifre, Convert.ToByte(DropDownList1.SelectedIndex), "img/" + sayi + FileUpload1.FileName);
                    basarili.Visible = true;
                }
            }
            else
            {
                if (kontrol)
                {
                    basarisiz.Visible = true;
                }
                else
                {
                    adminCRUD.guncelle(Convert.ToInt16(Session["id"]), TextBox3.Text, TextBox1.Text, TextBox2.Text, TextBox4.Text, TextBox5.Text, ysifre, Convert.ToByte(DropDownList1.SelectedIndex), admin.Ryol);
                    basarili.Visible = true;
                }
            }
        }

        //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        //{
            
        //    try
        //    {
        //        args.IsValid = (args == Session["sifre"]);
        //    }

        //    catch (Exception ex)
        //    {
        //        args.IsValid = false;
        //    }
        //}
    }
}