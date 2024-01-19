using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class urunlistele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                UrunCRUD urunCRUD = new UrunCRUD();
                bool sonuc = urunCRUD.sil(Request.QueryString["id"]);

                if (sonuc)
                {
                    basarili.Visible = true;
                }
                else
                {
                    basarili.Visible = false;
                }
            }

        }
    }
}