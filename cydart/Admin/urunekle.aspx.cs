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
            bool sonuc;

            if (FileUpload1.HasFile)
            {
                Random r = new Random();
                int sayi = r.Next(0, 100);
                FileUpload1.SaveAs(Server.MapPath("img/") + sayi + FileUpload1.FileName);

                Urun urun = new Urun(TextBox1.Text, TextBox2.Text, Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(DropDownList2.SelectedValue), Convert.ToDouble(TextBox3.Text), Convert.ToInt16(TextBox4.Text), Convert.ToInt16(DropDownList3.SelectedValue), TextBox5.Text, "img/" + sayi + FileUpload1.FileName);
                UrunCRUD urunCRUD = new UrunCRUD();
                sonuc = urunCRUD.ekle(urun);
            }
            else
            {
                Urun urun = new Urun(TextBox1.Text, TextBox2.Text, Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(DropDownList2.SelectedValue), Convert.ToDouble(TextBox3.Text), Convert.ToInt16(TextBox4.Text), Convert.ToInt16(DropDownList3.SelectedValue), TextBox5.Text, "");
                UrunCRUD urunCRUD = new UrunCRUD();
                sonuc = urunCRUD.ekle(urun);
            }

            if (sonuc)
            { 
                Response.Redirect("urunlistele.aspx");
            }
            else
            {
                basarisiz.Visible = true;
            }
        }
    }
}