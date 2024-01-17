using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart
{
    public partial class iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Add("Şikayet");
                DropDownList1.Items.Add("Öneri");
                DropDownList1.Items.Add("Yorum");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Yorum yorum = new Yorum(TextBox1.Text, TextBox2.Text, DropDownList1.SelectedValue, TextBox3.Text);
            YorumCRUD yorumCRUD = new YorumCRUD();
            bool sonuc = yorumCRUD.ekle(yorum);
            if (sonuc)
            {
                yollandi.Visible = true;
            }
        }
    }
}