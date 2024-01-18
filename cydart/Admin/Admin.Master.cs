using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Convert.ToBoolean(Session["admin"]) != true)
            //{
            //    Response.Redirect("giris.aspx");
            //}
        }
    }
}