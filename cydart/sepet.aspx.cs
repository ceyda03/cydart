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
    public partial class sepet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SepetCRUD sepetCRUD = new SepetCRUD();
            //if (Session["uye"] != null)
            //{            
            //    int musID = Convert.ToInt16(Session["no"]);
            //    sepetCRUD = new SepetCRUD();
            //    DataTable dt = sepetCRUD.siplistele(musID);
            //    int sipkod = Convert.ToInt16(dt.Rows[0][0]);

            //    int tutar = sepetCRUD.tutarkontrol(sipkod);

            //    if (tutar == 0)
            //    {
            //        sepetCRUD.tutarekle(sipkod, 0, 0, 0);
            //    }
            //    else
            //    {
            //        sepetCRUD.tutarguncelle(sipkod, 0, 0, 0);
            //    }
            //}

            if (Request.QueryString["urunsil"] != null)
            {
                int no = Convert.ToInt16(Request.QueryString["urunsil"]);
                sepetCRUD.detaysil(no);
                Response.Redirect("sepet.aspx");
            }

            if (Request.QueryString["id"] != null)
            {
                string btn = Request.QueryString["btn"];

                int detayID = Convert.ToInt16(Request.QueryString["id"]);
                
                DataTable detay = sepetCRUD.sepetdetaylistele(detayID);
                int adet = Convert.ToInt16(detay.Rows[0][4]);

                double birimfiy = Convert.ToDouble(detay.Rows[0][3]);
                double toplamfiy = Convert.ToDouble(detay.Rows[0][5]);

                if (btn == "Artir")
                {
                    adet++;
                    toplamfiy += birimfiy;
                }
                else if (btn == "Azalt")
                {
                    adet--;
                    toplamfiy -= birimfiy;
                }

                sepetCRUD.detayguncelle(detayID, adet, toplamfiy);

                int musID = Convert.ToInt16(Session["no"]);
                sepetCRUD = new SepetCRUD();
                DataTable dt = sepetCRUD.siplistele(musID);
                int sipkod = Convert.ToInt16(dt.Rows[0][0]);

                int tutar = sepetCRUD.tutarkontrol(sipkod);
                
                if (tutar == 0)
                {
                    sepetCRUD.tutarekle(sipkod, 0, 0, 0);
                }
                else
                {
                    sepetCRUD.tutarguncelle(sipkod, 0, 0, 0);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int musID = Convert.ToInt16(Session["no"]);
            SepetCRUD sepetCRUD = new SepetCRUD();
            DataTable dt = sepetCRUD.siplistele(musID);
            int sipkod = Convert.ToInt16(dt.Rows[0][1]);

            int tutar = sepetCRUD.tutarkontrol(sipkod);

            if (tutar == 0)
            {
                sepetCRUD.tutarekle(sipkod, 0, 0, 0);
            }
            else
            {
                sepetCRUD.tutarguncelle(sipkod, 0, 0, 0);
            }
        }
    }
}