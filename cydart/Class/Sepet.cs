using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class Sepet
    {
        int sipID, musID, detayID, urunID, tutarID, miktar;
        double birimFiyat, topFiyat, kargoUcret, araToplam, genToplam;
        DateTime sipTar;
        byte satisDurum, sipDurum;

        public int SipID { get => sipID; set => sipID = value; }
        public int MusID { get => musID; set => musID = value; }
        public int DetayID { get => detayID; set => detayID = value; }
        public int UrunID { get => urunID; set => urunID = value; }
        public int TutarID { get => tutarID; set => tutarID = value; }
        public int Miktar { get => miktar; set => miktar = value; }
        public double BirimFiyat { get => birimFiyat; set => birimFiyat = value; }
        public double TopFiyat { get => topFiyat; set => topFiyat = value; }
        public double KargoUcret { get => kargoUcret; set => kargoUcret = value; }
        public double AraToplam { get => araToplam; set => araToplam = value; }
        public double GenToplam { get => genToplam; set => genToplam = value; }
        public DateTime SipTar { get => sipTar; set => sipTar = value; }
        public byte SatisDurum { get => satisDurum; set => satisDurum = value; }
        public byte SipDurum { get => sipDurum; set => sipDurum = value; }
    }
}