using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart
{
    public partial class uyesifremiunuttum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MusteriCRUD musteriCRUD = new MusteriCRUD();
            bool kontrol = musteriCRUD.emailkontrol(TextBox1.Text);

            if (kontrol)
            {
                Email email = new Email();
                email.sifreyenile(TextBox1.Text);
                yollandi.Visible = true;
                hata.Visible = false;
            }
            else
            {
                hata.Visible = true;
                yollandi.Visible = false;
            }
        }
    }
}