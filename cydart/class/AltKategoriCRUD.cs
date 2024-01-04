﻿using System;
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
            SqlCommand komut = new SqlCommand("select AltKat_No, AltKat_Ad, Kat_Ad from AltKategori, Kategori where AltKategori.Kat_id=Kategori.Kat_No", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool sil(int gid)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from AltKategori where AltKat_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            int sonuc = komut.ExecuteNonQuery();
            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public bool guncelle(int gid, string yad, string ykatid)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("update AltKategori set AltKat_No=@a, Kat_id=@b", db.baglanti);
            komut.Parameters.AddWithValue("@a", yad);
            komut.Parameters.AddWithValue("@b", ykatid);
            int sonuc = komut.ExecuteNonQuery();
            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }
    }
}