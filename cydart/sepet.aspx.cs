using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart
{
    public partial class sepet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["urunsil"] != null)
            {
                int no = Convert.ToInt16(Request.QueryString["urunsil"]);
                SepetCRUD sepetCRUD = new SepetCRUD();
                sepetCRUD.detaysil(no);
                Response.Redirect("sepet.aspx");
            }
        }
    }
}