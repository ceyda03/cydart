using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace cydart
{

    public class MarkaCRUD
    {
        Db db = new Db();

        public bool ekle(Marka marka)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Marka values(@ad, @resim)", db.baglanti);
            komut.Parameters.AddWithValue("@ad", marka.Ad);
            komut.Parameters.AddWithValue("@resim", marka.Resim);
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