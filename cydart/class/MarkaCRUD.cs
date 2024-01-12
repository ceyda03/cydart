using System;
using System.Collections.Generic;
using System.Data;
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

        public DataTable listele()
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Marka", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool sil(int gid)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from Marka where Marka_No=@a", db.baglanti);
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
            SqlCommand komut = new SqlCommand("update Marka set Marka_Ad=@a, Marka_Resim=@b where Marka_No=@id", db.baglanti);
            komut.Parameters.AddWithValue("@a", ykatadi);
            komut.Parameters.AddWithValue("@b", yresim);
            komut.Parameters.AddWithValue("@id", gid);
            int sonuc = komut.ExecuteNonQuery();
            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;

        }

        public Marka bilgigetir(int gid)
        {
            DataTable dt = new DataTable();
            Marka marka = new Marka();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Marka where Marka_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            marka.No = Convert.ToInt16(dt.Rows[0][0]);
            marka.Ad = dt.Rows[0][1].ToString();
            marka.Resim = dt.Rows[0][2].ToString();
            db.kapat();
            return marka;
        }
    }
}