using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class Urun
    {
        string barkod, ad, aciklama, resim;
        int katid, altkatid, stok, fiyat, markaid;

        public string Barkod { get => barkod; set => barkod = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Aciklama { get => aciklama; set => aciklama = value; }
        public string Resim { get => resim; set => resim = value; }
        public int Katid { get => katid; set => katid = value; }
        public int Altkatid { get => altkatid; set => altkatid = value; }
        public int Stok { get => stok; set => stok = value; }
        public int Fiyat { get => fiyat; set => fiyat = value; }
        public int Markaid { get => markaid; set => markaid = value; }

        public Urun() { }

        public Urun(string barkod, string ad, int katid, int altkatid, int stok, int fiyat, int markaid, string aciklama, string resim)
        {
            Barkod = barkod;
            Ad = ad;
            Katid = katid;
            Altkatid = altkatid;
            Stok = stok;
            Fiyat = fiyat;
            Markaid = markaid;
            Aciklama = aciklama;
            Resim = resim;
        }
    }
}