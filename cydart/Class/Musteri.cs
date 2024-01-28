using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class Musteri
    {
        int no;
        string ad, soyad, tel, email, adres, sifre;
        DateTime dogTar;

        public int No { get => no; set => no = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Soyad { get => soyad; set => soyad = value; }
        public string Tel { get => tel; set => tel = value; }
        public string Email { get => email; set => email = value; }
        public string Adres { get => adres; set => adres = value; }
        public string Sifre { get => sifre; set => sifre = value; }
        public DateTime DogTar { get => dogTar; set => dogTar = value; }

        public Musteri() { }

        public Musteri(string ad, string soyad, string tel, string email, string adres, DateTime dogTar, string sifre)
        {
            Ad = ad;
            Soyad = soyad;
            Tel = tel;
            Email = email;
            Adres = adres;
            DogTar = dogTar;
            Sifre = sifre;
        }
    }
}