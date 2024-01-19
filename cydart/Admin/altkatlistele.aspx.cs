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
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                dt = kategoriCRUD.listele();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList1.Items.Add(dt.Rows[i][1].ToString());
                    DropDownList1.Items[i].Value = dt.Rows[i][0].ToString();
                }
            }

            if (Request.QueryString["id"] != null)
            {
                int gid = Convert.ToInt16(Request.QueryString["id"]);
                AltKategoriCRUD altKategoriCRUD = new AltKategoriCRUD();
                bool sonuc= altKategoriCRUD.sil(gid);

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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            AltKategoriCRUD altKategoriCRUD = new AltKategoriCRUD();
            DataTable tablo = altKategoriCRUD.filtrele(Convert.ToInt16(DropDownList1.SelectedValue));
        }
    }
}