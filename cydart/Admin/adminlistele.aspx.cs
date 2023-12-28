using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class adminlistele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string gid;
            bool cevap;
            if (Request.QueryString["id"] != null)
            {
                gid = Request.QueryString["id"];
                AdminCRUD adminCRUD = new AdminCRUD();
                cevap = adminCRUD.sil(Convert.ToInt16(gid));
            }
        }
    }
}