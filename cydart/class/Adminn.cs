using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class Adminn
    {
        int no;
        string kadi, ad, soyad, email, tel, sifre, ryol;
        byte yetki;

        public int No { get => no; set => no = value; }
        public string Kadi { get => kadi; set => kadi = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Soyad { get => soyad; set => soyad = value; }
        public string Email { get => email; set => email = value; }
        public string Tel { get => tel; set => tel = value; }
        public string Sifre { get => sifre; set => sifre = value; }
        public string Ryol { get => ryol; set => ryol = value; }
        public byte Yetki { get => yetki; set => yetki = value; }

        public Adminn() { }

        public Adminn(string kadi, string ad, string soyad, string email, string tel, string sifre, byte yetki, string ryol)
        {
            Kadi = kadi;
            Ad = ad;
            Soyad = soyad;
            Email = email;
            Tel = tel;
            Sifre = sifre;
            Yetki = yetki;
            Ryol = ryol;
        }
    }
}