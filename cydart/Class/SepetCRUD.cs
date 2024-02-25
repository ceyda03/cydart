using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class SepetCRUD
    {
        Db db = new Db();

        public bool sipekle(int musid, DateTime siptar)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Siparis values(@musid, @tar, 0, 0)", db.baglanti);
            komut.Parameters.AddWithValue("@musid", musid);
            komut.Parameters.AddWithValue("@tar", siptar);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public bool detayekle(int sipid, string barkodno, double bfiyat, int miktar, double tfiyat)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into S_Detay values(@sipid, @uid, @bfiyat, @miktar, @tfiyat)", db.baglanti);
            komut.Parameters.AddWithValue("@sipid", sipid);
            komut.Parameters.AddWithValue("@uid", barkodno);
            komut.Parameters.AddWithValue("@bfiyat", bfiyat);
            komut.Parameters.AddWithValue("@miktar", miktar);
            komut.Parameters.AddWithValue("@tfiyat", tfiyat);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public bool tutarekle(int sipid, double aratop, double kargo, double geneltop)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into Tutar_Detay values(@sipid, @ara, @kargo, @genel)", db.baglanti);
            komut.Parameters.AddWithValue("@sipid", sipid);
            komut.Parameters.AddWithValue("@ara", aratop);
            komut.Parameters.AddWithValue("@kargo", kargo);
            komut.Parameters.AddWithValue("@genel", geneltop);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }
        
        public DataTable siplistele(int musid)
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Siparis where Mus_id=@a and Satis_Durum=0", db.baglanti);
            komut.Parameters.AddWithValue("@a", musid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public DataTable sepetliste(int sipid)
        {
            DataTable dt = new DataTable();
            db.ac();
            SqlCommand komut = new SqlCommand("select * from Urun, S_Detay where Urun.Barkod_No=S_Detay.Urun_id and S_Detay.Sip_Kodu=@kod", db.baglanti);
            komut.Parameters.AddWithValue("@kod", sipid);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);
            db.kapat();
            return dt;
        }

        public bool detaysil(int detayno)
        {
            bool cevap = true;
            db.ac();
            SqlCommand komut = new SqlCommand("delete from S_Detay where Sira_No=@a", db.baglanti);
            komut.Parameters.AddWithValue("@a", detayno);
            int sonuc = komut.ExecuteNonQuery();

            if (sonuc == 0)
            {
                cevap = false;
            }
            db.kapat();
            return cevap;
        }

        public int sipariskontrol(int musid)
        {
            int cevap = 0;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Siparis where Mus_id=@a and Satis_Durum=0", db.baglanti);
            komut.Parameters.AddWithValue("@a", musid);
            int sonuc = Convert.ToInt16(komut.ExecuteScalar());

            if (sonuc == 1)
            {
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand("select * from Siparis where Mus_id=@b and Satis_Durum=0", db.baglanti);
                cmd.Parameters.AddWithValue("@b", musid);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                cevap = Convert.ToInt16(dt.Rows[0][0]);
            }
            db.kapat();
            return cevap;
        }

        public bool sepetkontrol(int musid)
        {
            bool cevap = false;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from Siparis where Mus_id=@a and Satis_Durum=0", db.baglanti);
            komut.Parameters.AddWithValue("@a", musid);
            int sonuc = Convert.ToInt16(komut.ExecuteScalar());

            if (sonuc == 1)
            {
                cevap = true;
            }
            db.kapat();
            return cevap;
        }
    }
}