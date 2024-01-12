using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart
{

    public class Marka
    {
        int no;
        string ad, resim;

        public int No { get => no; set => no = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Resim { get => resim; set => resim = value; }

        public Marka() { }

        public Marka(string ad, string resim)
        {
            Ad = ad;
            Resim = resim;
        }
    }
}