using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class urunekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                DataTable kategoriler = kategoriCRUD.listele();

                DropDownList1.Items.Add("Lütfen Seçiniz");
                for (int i = 0; i < kategoriler.Rows.Count; i++)
                {
                    DropDownList1.Items.Add(kategoriler.Rows[i][1].ToString());
                    DropDownList1.Items[i + 1].Value = kategoriler.Rows[i][0].ToString();
                }

                MarkaCRUD markaCRUD = new MarkaCRUD();
                DataTable markalar = markaCRUD.listele();

                for (int i = 0; i < markalar.Rows.Count; i++)
                {
                    DropDownList3.Items.Add(markalar.Rows[i][1].ToString());
                    DropDownList3.Items[i].Value = markalar.Rows[i][0].ToString();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear();

            if (DropDownList1.SelectedIndex != 0)
            {
                byte kat = Convert.ToByte(DropDownList1.SelectedValue);

                AltKategoriCRUD altKategoriCRUD = new AltKategoriCRUD();
                DataTable altkategoriler = altKategoriCRUD.filtrele(kat);

                for (int i = 0; i < altkategoriler.Rows.Count; i++)
                {
                    DropDownList2.Items.Add(altkategoriler.Rows[i][1].ToString());
                    DropDownList2.Items[i].Value = altkategoriler.Rows[i][0].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}