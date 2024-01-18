using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class Slider
    {
        int no;
        string etiket, baslik, aciklama, resim, link;

        public int No { get => no; set => no = value; }
        public string Etiket { get => etiket; set => etiket = value; }
        public string Baslik { get => baslik; set => baslik = value; }
        public string Aciklama { get => aciklama; set => aciklama = value; }
        public string Resim { get => resim; set => resim = value; }
        public string Link { get => link; set => link = value; }

        public Slider() { }

        public Slider(string etiket, string baslik, string aciklama, string resim, string link)
        {
            Etiket = etiket;
            Baslik = baslik;
            Aciklama = aciklama;
            Resim = resim;
            Link = link;
        }
    }
}