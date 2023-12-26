using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace cydart
{
    public class AdminCRUD
    {
        Db db = new Db();

        public bool kontrol(Adminn admin)
        {
            bool cevap;
            int kaysay;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from AdminTbl where Admin_Email=@a and Admin_Sifre=@b", db.baglanti);
            komut.Parameters.AddWithValue("@a", admin.Email);
            komut.Parameters.AddWithValue("@b", admin.Sifre);
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
            SqlCommand komut = new SqlCommand("select * from AdminTbl where Admin_Email=@a and Admin_Sifre=@b", db.baglanti);
            komut.Parameters.AddWithValue("@a", admin.Email);
            komut.Parameters.AddWithValue("@b", admin.Sifre);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            bilgi.No = Convert.ToInt16(dt.Rows[0][0]);
            bilgi.Ad = dt.Rows[0][1].ToString();
            bilgi.Soyad = dt.Rows[0][2].ToString();
            bilgi.Email = dt.Rows[0][3].ToString();
            bilgi.Tel = dt.Rows[0][4].ToString();
            bilgi.Sifre = dt.Rows[0][5].ToString();
            bilgi.Yetki = Convert.ToByte(dt.Rows[0][6]);
            bilgi.Ryol = dt.Rows[0][7].ToString();
            db.kapat();
            return bilgi;
        }
    }
}