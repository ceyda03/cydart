using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class altkatekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                DataTable dt = kategoriCRUD.listele();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList1.Items.Add(dt.Rows[i][1].ToString());
                    DropDownList1.Items[i].Value = dt.Rows[i][0].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AltKategori altKategori = new AltKategori(Convert.ToInt16(DropDownList1.SelectedValue), TextBox1.Text);
            AltKategoriCRUD altKategoriCRUD = new AltKategoriCRUD();
            bool gelen = altKategoriCRUD.ekle(altKategori);

            Response.Redirect("altkatlistele.aspx");
        }
    }
}