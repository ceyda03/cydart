using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace cydart
{

    public class KategoriCRUD
    {
        Db db = new Db();

        public bool ekle(Kategori kat)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Kategori values(@ad, @resim)", db.baglanti);
            komut.Parameters.AddWithValue("@ad", kat.Ad);
            komut.Parameters.AddWithValue("@resim", kat.Resim);
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
            SqlCommand komut = new SqlCommand("select * from Kategori", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool sil(int gid)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from Kategori where Kat_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            int sonuc = komut.ExecuteNonQuery();
            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public bool guncelle(int gid, string ykatadi, string yresim)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("update Kategori set Kat_Ad=@a, Kat_Resim=@b", db.baglanti);
            komut.Parameters.AddWithValue("@a", ykatadi);
            komut.Parameters.AddWithValue("@b", yresim);
            int sonuc = komut. ExecuteNonQuery();
            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public Kategori bilgigetir(int gid)
        {
            DataTable dt = new DataTable();
            Kategori kategori = new Kategori();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Kategori where Kat_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            kategori.No = Convert.ToInt16(dt.Rows[0][0]);
            kategori.Ad = dt.Rows[0][1].ToString();
            kategori.Resim = dt.Rows[0][2].ToString();
            db.kapat();
            return kategori;
        }
    }
}