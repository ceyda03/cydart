using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart
{
    public class Kategori
    {
        int id, pid;
        string ad;

        public int Id { get => id; set => id = value; }
        public int Pid { get => pid; set => pid = value; }
        public string Ad { get => ad; set => ad = value; }

        public Kategori() { }

        public Kategori(string anaKatAd)
        {
            Ad = anaKatAd;
        }

        public Kategori(int pid, string altKatAd)
        {
            Pid = pid;
            Ad = altKatAd;
        }
    }
}