using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int gid = Convert.ToInt16(Request.QueryString["id"]);
                YorumCRUD yorumCRUD = new YorumCRUD();
                yorumCRUD.sil(gid);
            }

            if (Request.QueryString["cevap"] != null)
            {
                string kime = Request.QueryString["email"];
                string konu = Request.QueryString["cevap"];
                Email email = new Email();

                if (konu == "Öneri")
                {
                    email.onericevapla(kime);
                }
                else if (konu == "Şikayet")
                {
                    email.sikayetcevapla(kime);
                }
                else
                {
                    email.yorumcevapla(kime);
                }
            }
        }
    }
}