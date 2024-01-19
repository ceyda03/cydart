using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class Urun
    {
        string barkod, ad, aciklama, resim;
        int katid, altkatid, markaid, stok, sipAdet;
        double fiyat;

        public string Barkod { get => barkod; set => barkod = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Aciklama { get => aciklama; set => aciklama = value; }
        public string Resim { get => resim; set => resim = value; }
        public int Katid { get => katid; set => katid = value; }
        public int Altkatid { get => altkatid; set => altkatid = value; }
        public int Markaid { get => markaid; set => markaid = value; }
        public int Stok { get => stok; set => stok = value; }
        public int SipAdet { get => sipAdet; set => sipAdet = value; }
        public double Fiyat { get => fiyat; set => fiyat = value; }

        public Urun() { }

        public Urun(string barkod, string ad, int katid, int altkatid, double fiyat, int stok, int markaid, string aciklama, string resim)
        {
            Barkod = barkod;
            Ad = ad;
            Katid = katid;
            Altkatid = altkatid;
            Fiyat = fiyat;
            Stok = stok;
            Markaid = markaid;
            Aciklama = aciklama;
            Resim = resim;
        }
    }
}