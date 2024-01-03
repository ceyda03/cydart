﻿using System;
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
    }
}