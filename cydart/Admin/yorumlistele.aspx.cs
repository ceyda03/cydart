using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class yorumliste : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int gid = Convert.ToInt16(Request.QueryString["id"]);
                YorumCRUD yorumCRUD = new YorumCRUD();
                bool sonuc = yorumCRUD.sil(gid);
                
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

                Response.Redirect("yorumlistele.aspx");
            }

            if (!IsPostBack)
            {
                Session["alici"] = TextBox1.Text;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string alici = Session["alici"].ToString();
            string baslik = TextBox2.Text;
            string mesaj = TextBox3.Text;

            Email email = new Email();
            email.cevapla(alici, baslik, mesaj);
            gonderildi.Visible = true;
        }
    }
}