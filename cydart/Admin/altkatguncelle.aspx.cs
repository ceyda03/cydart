using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class altkatguncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int gid = Convert.ToInt16(Request.QueryString["gunid"]);
            AltKategoriCRUD altKategoriCRUD = new AltKategoriCRUD();
            AltKategori altKategori = altKategoriCRUD.bilgigetir(gid);

            if (!IsPostBack)
            {
                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                DataTable dt = kategoriCRUD.listele();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList1.Items.Add(dt.Rows[i][1].ToString());
                    DropDownList1.Items[i].Value = dt.Rows[i][0].ToString();
                }

                TextBox2.Text = altKategori.No.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AltKategoriCRUD altKategoriCRUD = new AltKategoriCRUD();
            altKategoriCRUD.guncelle(Convert.ToInt16(TextBox2.Text), TextBox1.Text, DropDownList1.SelectedValue);

        }
    }
}