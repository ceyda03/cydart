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
    public partial class urunguncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string gid = Request.QueryString["gunid"];
            UrunCRUD urunCRUD = new UrunCRUD();
            Urun urun = urunCRUD.bilgigetir(gid);

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

                AltKategoriCRUD altKategoriCRUD = new AltKategoriCRUD();
                DataTable altkategoriler = altKategoriCRUD.filtrele(urun.Katid);

                for (int i = 0; i < altkategoriler.Rows.Count; i++)
                {
                    DropDownList2.Items.Add(altkategoriler.Rows[i][1].ToString());
                    DropDownList2.Items[i].Value = altkategoriler.Rows[i][0].ToString();
                }

                MarkaCRUD markaCRUD = new MarkaCRUD();
                DataTable markalar = markaCRUD.listele();

                for (int i = 0; i < markalar.Rows.Count; i++)
                {
                    DropDownList3.Items.Add(markalar.Rows[i][1].ToString());
                    DropDownList3.Items[i].Value = markalar.Rows[i][0].ToString();
                }

                TextBox1.Text = urun.Barkod;
                TextBox2.Text = urun.Ad;
                DropDownList1.SelectedValue = urun.Katid.ToString();
                DropDownList2.SelectedValue = urun.Altkatid.ToString();
                DropDownList3.SelectedValue = urun.Markaid.ToString();
                TextBox3.Text = urun.Fiyat.ToString();
                TextBox4.Text = urun.Stok.ToString();
                TextBox5.Text = urun.SipAdet.ToString();
                TextBox6.Text = urun.Aciklama;
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

                UrunCRUD urunCRUD = new UrunCRUD();
                sonuc = urunCRUD.guncelle(TextBox1.Text, TextBox2.Text, Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(DropDownList2.SelectedValue), Convert.ToInt16(DropDownList3.SelectedValue), Convert.ToDouble(TextBox3.Text), Convert.ToInt16(TextBox4.Text), Convert.ToInt16(TextBox5.Text), TextBox6.Text, "img/" + sayi + FileUpload1.FileName);
            }
            else
            {
                UrunCRUD urunCRUD = new UrunCRUD();
                Urun urun = urunCRUD.bilgigetir(Request.QueryString["gunid"]);
                sonuc = urunCRUD.guncelle(TextBox1.Text, TextBox2.Text, Convert.ToInt16(DropDownList1.SelectedValue), Convert.ToInt16(DropDownList2.SelectedValue), Convert.ToInt16(DropDownList3.SelectedValue), Convert.ToDouble(TextBox3.Text), Convert.ToInt16(TextBox4.Text), Convert.ToInt16(TextBox5.Text), TextBox6.Text, urun.Resim);
            }

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