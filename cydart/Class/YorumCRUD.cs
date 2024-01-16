using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class YorumCRUD
    {
        Db db = new Db();
        public bool ekle(Yorum yorum)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Yorum values(@gonadi, @email, @konu, @mesaj)", db.baglanti);
            komut.Parameters.AddWithValue("@gonadi", yorum.Gonadi);
            komut.Parameters.AddWithValue("@email", yorum.Email);
            komut.Parameters.AddWithValue("@konu", yorum.Konu);
            komut.Parameters.AddWithValue("@mesaj", yorum.Mesaj);
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
            SqlCommand komut = new SqlCommand("select * from Yorum", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool sil(int gid)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from Yorum where Yorum_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
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