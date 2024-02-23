using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace cydart.Class
{
    public class UrunCRUD
    {
        Db db = new Db();

        public bool ekle(Urun urun)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Urun values(@barkod, @ad, @kat, @altkat, @marka, @fiyat, @stok, @acik, @resim)", db.baglanti);
            komut.Parameters.AddWithValue("@barkod", urun.Barkod);
            komut.Parameters.AddWithValue("@ad", urun.Ad);
            komut.Parameters.AddWithValue("@kat", urun.Katid);
            komut.Parameters.AddWithValue("@altkat", urun.Altkatid);
            komut.Parameters.AddWithValue("@marka", urun.Markaid);
            komut.Parameters.AddWithValue("@fiyat", urun.Fiyat);
            komut.Parameters.AddWithValue("@stok", urun.Stok);
            komut.Parameters.AddWithValue("@acik", urun.Aciklama);
            komut.Parameters.AddWithValue("@resim", urun.Resim);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public DataTable listele()
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select Barkod_No, Urun_Ad, Kategori.Kat_Ad, AltKategori.AltKat_Ad, Marka.Marka_Ad, Fiyat, Stok, Aciklama, Urun_Resim from Urun, Kategori, AltKategori, Marka where Urun.Kat_id=Kategori.Kat_No and Urun.AltKat_id=AltKategori.AltKat_No and Urun.Marka_id=Marka.Marka_No", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool sil(string gid)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from Urun where Barkod_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public bool guncelle(string barkodno, string yad, int ykat, int yaltkat, int ymarka, double yfiyat, int ystok, string yaciklama, string yresim)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("update Urun set Urun_Ad=@ad, Kat_id=@kat, AltKat_id=@altkat, Marka_id=@marka, Fiyat=@fiyat, Stok=@stok, Aciklama=@acik, Urun_Resim=@resim where Barkod_No=@barkod", db.baglanti);
            komut.Parameters.AddWithValue("@ad", yad);
            komut.Parameters.AddWithValue("@kat", ykat);
            komut.Parameters.AddWithValue("@altkat", yaltkat);
            komut.Parameters.AddWithValue("@marka", ymarka);
            komut.Parameters.AddWithValue("@fiyat", yfiyat);
            komut.Parameters.AddWithValue("@stok", ystok);
            komut.Parameters.AddWithValue("@acik", yaciklama);
            komut.Parameters.AddWithValue("@resim", yresim);
            komut.Parameters.AddWithValue("@barkod", barkodno);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public Urun bilgigetir(string barkodno)
        {
            DataTable dt = new DataTable();
            Urun urun = new Urun();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Urun where Barkod_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", barkodno);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            urun.Barkod = dt.Rows[0][0].ToString();
            urun.Ad = dt.Rows[0][1].ToString();
            urun.Katid = Convert.ToInt16(dt.Rows[0][2]);
            urun.Altkatid = Convert.ToInt16(dt.Rows[0][3]);
            urun.Markaid = Convert.ToInt16(dt.Rows[0][4]);
            urun.Fiyat = Convert.ToDouble(dt.Rows[0][5]);
            urun.Stok = Convert.ToInt16(dt.Rows[0][6]);
            urun.SipAdet = Convert.ToInt16(dt.Rows[0][7]);
            urun.Aciklama = dt.Rows[0][8].ToString();
            urun.Resim = dt.Rows[0][9].ToString();
            db.kapat();
            return urun;
        }

        public DataTable katsecimlistele(int gid)
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select Barkod_No, Urun_Ad, Kategori.Kat_Ad, AltKategori.AltKat_Ad, Marka.Marka_Ad, Fiyat, Stok, Aciklama, Urun_Resim from Urun, Kategori, AltKategori, Marka where Urun.Kat_id=Kategori.Kat_No and Urun.AltKat_id=AltKategori.AltKat_No and Urun.Marka_id=Marka.Marka_No and Urun.Kat_id=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public DataTable altkatsecimlistele(int gid)
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select Barkod_No, Urun_Ad, Kategori.Kat_Ad, AltKategori.AltKat_Ad, Marka.Marka_Ad, Fiyat, Stok, Aciklama, Urun_Resim from Urun, Kategori, AltKategori, Marka where Urun.Kat_id=Kategori.Kat_No and Urun.AltKat_id=AltKategori.AltKat_No and Urun.Marka_id=Marka.Marka_No and AltKat_id=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }
    }
}