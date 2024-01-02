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

        public bool anaKatEkle(Kategori kat)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Kategoriler values(0, @ad)", db.baglanti);
            komut.Parameters.AddWithValue("@ad", kat.Ad);
            int sonuc = komut.ExecuteNonQuery();
            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public bool altKatEkle(Kategori kat)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Kategoriler values(@pid, @ad)", db.baglanti);
            komut.Parameters.AddWithValue("@pid", kat.Pid);
            komut.Parameters.AddWithValue("@ad", kat.Ad);
            int sonuc = komut.ExecuteNonQuery();
            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public DataTable anaKatListele()
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Kategoriler where pid=0", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }
        
        public DataTable altKatListele()
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Kategoriler where pid!=0", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }
    }
}