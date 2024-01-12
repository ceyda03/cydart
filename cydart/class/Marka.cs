using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart
{

    public class Marka
    {
        int id;
        string ad, resim;

        public int Id { get => id; set => id = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Resim { get => resim; set => resim = value; }

        public Marka() { }

        public Marka(string ad, string resim)
        {
            Ad = ad;
            Resim = resim;
        }

        public static implicit operator Marka(Kategori v)
        {
            throw new NotImplementedException();
        }
    }
}