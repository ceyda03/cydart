﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cydart.Admin
{
    public partial class altkatekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                KategoriCRUD kategoriCRUD = new KategoriCRUD();
                dt = kategoriCRUD.anaKatListele();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList1.Items.Add(dt.Rows[i][2].ToString());
                    DropDownList1.Items[i].Value = dt.Rows[i][0].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Kategori kategori = new Kategori(Convert.ToInt16(DropDownList1.SelectedValue), TextBox1.Text);
            KategoriCRUD kategoriCRUD = new KategoriCRUD();
            bool gelen = kategoriCRUD.altKatEkle(kategori);

            Response.Redirect("altkatlistele.aspx");
        }
    }
}