using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Compilation;

namespace cydart.Class
{
    public class SliderCRUD
    {
        Db db = new Db();

        public bool ekle(Slider slider)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Slider values(@etiket, @baslik, @acik, @resim, @link)", db.baglanti);
            komut.Parameters.AddWithValue("@etiket", slider.Etiket);
            komut.Parameters.AddWithValue("@baslik", slider.Baslik);
            komut.Parameters.AddWithValue("@acik", slider.Aciklama);
            komut.Parameters.AddWithValue("@resim", slider.Resim);
            komut.Parameters.AddWithValue("@link", slider.Link);
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
            SqlCommand komut = new SqlCommand("select * from Slider", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool sil(int gid)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from Slider where Slider_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public bool guncelle(int no, string yetiket, string ybaslik, string yaciklama, string yresim, string ylink)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("update Slider set Etiket=@eti, Baslik=@bas, Aciklama=@acik, Resim=@resim, Link=@link where Slider_No=@no", db.baglanti);
            komut.Parameters.AddWithValue("@eti", yetiket);
            komut.Parameters.AddWithValue("@bas", ybaslik);
            komut.Parameters.AddWithValue("@acik", yaciklama);
            komut.Parameters.AddWithValue("@resim", yresim);
            komut.Parameters.AddWithValue("@link", ylink);
            komut.Parameters.AddWithValue("@no", no);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public Slider bilgigetir(int gid)
        {
            DataTable dt = new DataTable();
            Slider slider = new Slider();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Slider where Slider_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            slider.No = Convert.ToInt16(dt.Rows[0][0]);
            slider.Etiket = dt.Rows[0][1].ToString();
            slider.Baslik= dt.Rows[0][2].ToString();
            slider.Aciklama = dt.Rows[0][3].ToString();
            slider.Resim = dt.Rows[0][4].ToString();
            slider.Link = dt.Rows[0][5].ToString();
            db.kapat();
            return slider;
        }

    }
}