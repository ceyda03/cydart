using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class MusteriCRUD
    {
        Db db = new Db();

        public bool ekle(Musteri mus)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Musteri values(@ad, @soyad, @tel, @email, @adres, @dogtar, @sifre)", db.baglanti);
            komut.Parameters.AddWithValue("@ad", mus.Ad);
            komut.Parameters.AddWithValue("@soyad", mus.Soyad);
            komut.Parameters.AddWithValue("@tel", mus.Tel);
            komut.Parameters.AddWithValue("@email", mus.Email);
            komut.Parameters.AddWithValue("@adres", mus.Adres);
            komut.Parameters.AddWithValue("@dogtar", mus.DogTar);
            komut.Parameters.AddWithValue("@sifre", mus.Sifre);
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
            SqlCommand komut = new SqlCommand("select * from Musteri", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool sil(int musno)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from Musteri where Mus_No=@no");
            komut.Parameters.AddWithValue("@no", musno);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public bool guncelle(int musno, string yad, string ysoyad, string ytel, string yemail, string yadres, DateTime ydogtar, string ysifre)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("update Musteri set Mus_Ad=@ad, Mus_Soyad=@soyad, Mus_Tel=@tel, Mus_Email=@email, Mus_Adres=@adres, DogTar=@dogtar, Mus_Sifre=@sifre where Mus_No=@no", db.baglanti);
            komut.Parameters.AddWithValue("@ad", yad);
            komut.Parameters.AddWithValue("@soyad", ysoyad);
            komut.Parameters.AddWithValue("@tel", ytel);
            komut.Parameters.AddWithValue("@email", yemail);
            komut.Parameters.AddWithValue("@adres", yadres);
            komut.Parameters.AddWithValue("@dogtar", ydogtar);
            komut.Parameters.AddWithValue("@sifre", ysifre);
            komut.Parameters.AddWithValue("@no", musno);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public Musteri bilgigetir(int gid)
        {
            Musteri musteri = new Musteri();
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Musteri where Mus_No=@no", db.baglanti);
            komut.Parameters.AddWithValue("@no", gid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            musteri.No = Convert.ToInt16(dt.Rows[0][0]);
            musteri.Ad = dt.Rows[0][1].ToString();
            musteri.Soyad = dt.Rows[0][2].ToString();
            musteri.Tel = dt.Rows[0][3].ToString();
            musteri.Email = dt.Rows[0][4].ToString();
            musteri.Adres = dt.Rows[0][5].ToString();
            musteri.DogTar = Convert.ToDateTime(dt.Rows[0][6]);
            musteri.Sifre = dt.Rows[0][7].ToString();
            db.kapat();
            return musteri;
        }
    }
}