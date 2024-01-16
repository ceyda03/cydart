using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class AltKategori
    {
        int no, katid;
        string ad;

        public int No { get => no; set => no = value; }
        public int Katid { get => katid; set => katid = value; }
        public string Ad { get => ad; set => ad = value; }

        public AltKategori() { }

        public AltKategori(int katid, string ad)
        {
            Katid = katid;
            Ad = ad;
        }
    }
}