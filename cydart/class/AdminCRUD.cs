using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using cydart.Admin;

namespace cydart
{
    public class AdminCRUD
    {
        Db db = new Db();

        Sifre sifre = new Sifre();

        public bool kontrol(Adminn admin)
        {
            bool cevap;
            int kaysay;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from AdminTbl where (Admin_Email=@a or Admin_Kadi=@b) and Admin_Sifre=@c", db.baglanti);
            komut.Parameters.AddWithValue("@a", admin.Email);
            komut.Parameters.AddWithValue("@b", admin.Kadi);
            komut.Parameters.AddWithValue("@c", sifre.sifrele(admin.Sifre));
            kaysay = Convert.ToInt16(komut.ExecuteScalar());
            if (kaysay == 0)
            {
                cevap = false;
            }
            else
            {
                cevap = true;
            }
            db.kapat();
            return cevap;
        }

        public Adminn getir(Adminn admin)
        {
            DataTable dt = new DataTable();
            Adminn bilgi = new Adminn();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from AdminTbl where (Admin_Email=@a or Admin_Kadi=@b) and Admin_Sifre=@c", db.baglanti);
            komut.Parameters.AddWithValue("@a", admin.Email);
            komut.Parameters.AddWithValue("@b", admin.Kadi);
            komut.Parameters.AddWithValue("@c", sifre.sifrele(admin.Sifre));
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            bilgi.No = Convert.ToInt16(dt.Rows[0][0]);
            bilgi.Kadi = dt.Rows[0][1].ToString();
            bilgi.Ad = dt.Rows[0][2].ToString();
            bilgi.Soyad = dt.Rows[0][3].ToString();
            bilgi.Email = dt.Rows[0][4].ToString();
            bilgi.Tel = dt.Rows[0][5].ToString();
            bilgi.Sifre = dt.Rows[0][6].ToString();
            bilgi.Yetki = Convert.ToByte(dt.Rows[0][7]);
            bilgi.Ryol = dt.Rows[0][8].ToString();
            db.kapat();
            return bilgi;
        }

        public Adminn bilgigetir(int gid)
        {
            DataTable dt = new DataTable();
            Adminn admin = new Adminn();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from AdminTbl where Admin_No=@id", db.baglanti);
            komut.Parameters.AddWithValue("@id", gid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            admin.No = Convert.ToInt16(dt.Rows[0][0]);
            admin.Kadi = dt.Rows[0][1].ToString();
            admin.Ad = dt.Rows[0][2].ToString();
            admin.Soyad = dt.Rows[0][3].ToString();
            admin.Email = dt.Rows[0][4].ToString();
            admin.Tel = dt.Rows[0][5].ToString();
            admin.Sifre = sifre.sifreyicoz(dt.Rows[0][6].ToString());
            admin.Yetki = Convert.ToByte(dt.Rows[0][7]);
            admin.Ryol = dt.Rows[0][8].ToString();
            db.kapat();
            return admin;
        }

        public bool ekle(Adminn admin)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into AdminTbl values(@kadi, @ad, @soyad, @mail, @tel, @sfr, @yetki, @yol)", db.baglanti);
            komut.Parameters.AddWithValue("@kadi", admin.Kadi);
            komut.Parameters.AddWithValue("@ad", admin.Ad);
            komut.Parameters.AddWithValue("@soyad", admin.Soyad);
            komut.Parameters.AddWithValue("@mail", admin.Email);
            komut.Parameters.AddWithValue("@tel", admin.Tel);
            komut.Parameters.AddWithValue("@sfr", sifre.sifrele(admin.Sifre));
            komut.Parameters.AddWithValue("@yetki", admin.Yetki);
            komut.Parameters.AddWithValue("@yol", admin.Ryol);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }

            db.kapat();
            return cevap;
        }

        public DataTable tumliste()
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from AdminTbl", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool sil(int gid)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from AdminTbl where Admin_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", gid);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }

            db.kapat();
            return cevap;
        }

        public bool guncelle(int gid, string ykadi, string yad, string ysoyad, string ymail, string ytel, string ysifre, byte yyetki, string yresim)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("update AdminTbl set Admin_Kadi=@kadi, Admin_Ad=@a, Admin_Soyad=@b, Admin_Email=@mail, Admin_Tel=@tel, Admin_Sifre=@sfr, Yetki=@yetki, Admin_Resim=@yol where Admin_No=@id", db.baglanti);
            komut.Parameters.AddWithValue("@kadi", ykadi);
            komut.Parameters.AddWithValue("@a", yad);
            komut.Parameters.AddWithValue("@b", ysoyad);
            komut.Parameters.AddWithValue("@mail", ymail);
            komut.Parameters.AddWithValue("@tel", ytel);
            komut.Parameters.AddWithValue("@sfr", sifre.sifrele(ysifre));
            komut.Parameters.AddWithValue("@yetki", yyetki);
            komut.Parameters.AddWithValue("@yol", yresim);
            komut.Parameters.AddWithValue("@id", gid);
            int sonuc = komut.ExecuteNonQuery();
            
            if (sonuc == 0)
            {
                cevap = false;
            }

            db.kapat();
            return cevap;
        }

        public bool kayitkontrol(string email, string kadi)
        {
            bool cevap;
            int kaysay;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from AdminTbl where Admin_Email=@a or Admin_Kadi=@b", db.baglanti);
            komut.Parameters.AddWithValue("@a", email);
            komut.Parameters.AddWithValue("@b", kadi);
            kaysay = Convert.ToInt16(komut.ExecuteScalar());
            if (kaysay == 0)
            {
                cevap = false;
            }
            else
            {
                cevap = true;
            }
            db.kapat();
            return cevap;
        }
    }
}