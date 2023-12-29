using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Db db = new Db();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            DataTable tablo = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Kategori",db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            SqlCommand cmd = new SqlCommand("select * from AltKategori", db.baglanti);
            SqlDataAdapter adap = new SqlDataAdapter(cmd);
            adap.Fill(tablo);
            db.kapat();

            Response.Write("<ul>");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Response.Write("<li>" + dt.Rows[i][1] + "<ul>");
                for (int j = 0; j < tablo.Rows.Count; j++)
                {
                    if (Convert.ToInt16(tablo.Rows[j][2]) == Convert.ToInt16(dt.Rows[i][0]))
                    {
                        Response.Write("<li>" + tablo.Rows[j][1] + "</li>");
                    }
                }
                Response.Write("</ul></li>");
            }
            Response.Write("</ul>");
        }
    }
}
