using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class altkatlistele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int gid = Convert.ToInt16(Request.QueryString["id"]);
                AltKategoriCRUD altKategoriCRUD = new AltKategoriCRUD();
                bool sonuc= altKategoriCRUD.sil(gid);

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
            }
        }
    }
}