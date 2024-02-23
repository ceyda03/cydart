using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart
{
    public partial class urundetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ekle"] != null)
            {
                string barkod = Request.QueryString["ekle"];
                int musID = Convert.ToInt16(Session["no"]);

                DateTime tarih = DateTime.Now;
                int adet = Convert.ToInt16(TextBox1.Text);

                UrunCRUD urunCRUD = new UrunCRUD();
                Urun urun = urunCRUD.bilgigetir(barkod);

                SepetCRUD sepetCRUD = new SepetCRUD();
                int kayit = sepetCRUD.sipariskontrol(musID);

                if (kayit == 0)
                {
                    sepetCRUD.sipekle(musID, tarih);
                    DataTable table = sepetCRUD.siplistele(musID);
                    int sipID = Convert.ToInt16(table.Rows[0][0]);
                    sepetCRUD.detayekle(sipID, urun.Barkod, urun.Fiyat, adet, urun.Fiyat * adet);
                }
                else
                {
                    sepetCRUD.detayekle(kayit, urun.Barkod, urun.Fiyat, adet, urun.Fiyat * adet);
                }

                if (Request.QueryString["sepet"] != null)
                {
                    Response.Redirect("sepet.aspx");
                }
            }
        }
    }
}