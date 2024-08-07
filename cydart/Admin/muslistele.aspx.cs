﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cydart.Class;

namespace cydart.Admin
{
    public partial class muslistele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int gid = Convert.ToInt16(Request.QueryString["id"]);
                MusteriCRUD musteriCRUD = new MusteriCRUD();
                bool sonuc = musteriCRUD.sil(gid);

                if (sonuc)
                {
                    basarili.Visible = true;
                    basarisiz.Visible = false;
                }
                else
                {
                    basarili.Visible = false;
                    basarisiz.Visible = true;
                }
            }
        }
    }
}