using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace cydart
{

    public class AltKategoriCRUD
    {
        Db db = new Db();

        public bool ekle(AltKategori altkat)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into AltKategori values(@ad, @katid)", db.baglanti);
            komut.Parameters.AddWithValue("@ad", altkat.Ad);
            komut.Parameters.AddWithValue("@katid", altkat.Katid);
            int sonuc = komut.ExecuteNonQuery();
            if(sonuc == 0)
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
            SqlCommand komut = new SqlCommand("select AltKat_No, AltKat_Ad, Kat_Ad from AltKategori, Kategori where AltKategori.Kat_id=Kategori.Kat_No", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }
    }
}