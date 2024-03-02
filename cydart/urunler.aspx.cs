using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart
{
    public partial class urunler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ekle"] != null)
            {
                string barkod = Request.QueryString["ekle"];
                int musID = Convert.ToInt16(Session["no"]);

                DateTime tarih = DateTime.Now;

                UrunCRUD urunCRUD = new UrunCRUD();
                Urun urun = urunCRUD.bilgigetir(barkod);

                SepetCRUD sepetCRUD = new SepetCRUD();
                int kayit = sepetCRUD.sipariskontrol(musID);

                if (kayit == 0)
                {
                    sepetCRUD.sipekle(musID, tarih);
                    DataTable table = sepetCRUD.siplistele(musID);
                    int sipID = Convert.ToInt16(table.Rows[0][0]);
                    sepetCRUD.detayekle(sipID, urun.Barkod, urun.Fiyat, 1, urun.Fiyat * 1);
                }
                else
                {
                    int detaykayit = sepetCRUD.detaykontrol(musID, urun.Barkod);

                    if (detaykayit == 0)
                    {
                        sepetCRUD.detayekle(kayit, urun.Barkod, urun.Fiyat, 1, urun.Fiyat * 1);
                    }
                    else
                    {
                        DataTable dt = sepetCRUD.detaylistele(musID, urun.Barkod);
                        int sirano = Convert.ToInt16(dt.Rows[0][0]);
                        int miktar = Convert.ToInt16(dt.Rows[0][4]);
                        double tfiyat = Convert.ToDouble(dt.Rows[0][5]);
                        sepetCRUD.detayguncelle(sirano, miktar + 1, tfiyat + urun.Fiyat);
                    }
                }

                if (Request.QueryString["sepet"] != null)
                {
                    Response.Redirect("sepet.aspx");
                }
            }
        }
    }
}