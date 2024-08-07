﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="urunler.aspx.cs" Inherits="cydart.urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%
        cydart.Class.UrunCRUD urunCRUD = new cydart.Class.UrunCRUD();
        System.Data.DataTable urunler = new System.Data.DataTable();

        if (Request.QueryString["katsecim"] != null)
        {
            int gid = Convert.ToInt16(Request.QueryString["katsecim"]);
            urunler = urunCRUD.katsecimlistele(gid);
        }
        else if (Request.QueryString["altkatsecim"] != null)
        {
            int gid = Convert.ToInt16(Request.QueryString["altkatsecim"]);
            urunler = urunCRUD.altkatsecimlistele(gid);
        }
        else if (Request.QueryString["markasecim"] != null)
        {
            int gid = Convert.ToInt16(Request.QueryString["markasecim"]);
            urunler = urunCRUD.markasecimlistele(gid);
        }
        else
        {
            urunler = urunCRUD.listele();
        }
    %>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-lg-9 order-md-last">
                    <div class="row">
                        <%for (int i = 0; i < urunler.Rows.Count; i++)
                          {%>
                            <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
                                <div class="product d-flex flex-column">
                                    <a href="urundetay.aspx?urun=<% =urunler.Rows[i][0] %>" class="img-prod">
                                        <%if (urunler.Rows[i][8].ToString() != "")
                                          {%>
                                            <img class="img-fluid" src="Admin/<% =urunler.Rows[i][8] %>" alt="Colorlib Template">
                                        <%}
                                          else
                                          {%>
                                            <img class="img-fluid" src="Admin/img/default200.png" alt="Colorlib Template">
                                        <%}%>
                                        
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3">
                                        <div class="d-flex">
                                            <div class="cat">
                                                <span><% =urunler.Rows[i][4] %></span>  
                                            </div>
                                        </div>
                                        <h3><a href="urundetay.aspx?urun=<% =urunler.Rows[i][0] %>"><% =urunler.Rows[i][1] %></a></h3>
                                        <div class="pricing">
                                            <p class="price"><span><% =String.Format("{0:0.00}", urunler.Rows[i][5]) %>₺</span></p>
                                        </div>
                                        <%if (Session["uye"] != null)
                                          {%>
                                            <p class="bottom-area d-flex px-3">
                                                <a href="urunler.aspx?ekle=<% =urunler.Rows[i][0] %>" class="add-to-cart text-center py-2 mr-1">
                                                    <span>Sepete Ekle <i class="ion-ios-add ml-1"></i></span>
                                                </a>
                                                <a href="urunler.aspx?ekle=<% =urunler.Rows[i][0] %>&sepet=true" class="buy-now text-center py-2">
                                                    Hemen Al<span><i class="ion-ios-cart ml-1"></i></span>
                                                </a>
                                            </p>
                                        <%} %>
                                    </div>
                                </div>
                            </div>
                        <%} %>
                    </div>
                </div>                

                <%
                    cydart.Class.KategoriCRUD kategoriCRUD = new cydart.Class.KategoriCRUD();
                    System.Data.DataTable kattablo = kategoriCRUD.listele();
                %>

                <div class="col-md-4 col-lg-3">
                    <div class="sidebar">
                        <div class="sidebar-box-2">
                            <h2 class="heading">Kategoriler</h2>
                            <div class="fancy-collapse-panel">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                    <%for (int i = 0; i < kattablo.Rows.Count; i++)
                                        {
                                            string headingID = "heading" + i;
                                            string collapseID = "collapse" + i;
                                        %>
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="<% =headingID %>">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#<% =collapseID %>" aria-expanded="false" aria-controls="<% =collapseID %>"><% =kattablo.Rows[i][1] %>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="<% =collapseID %>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="<% =headingID %>">
                                                <div class="panel-body">
                                                    <ul>
                                                        <li><a href="urunler.aspx?katsecim=<% =kattablo.Rows[i][0] %>">Tüm <% =kattablo.Rows[i][1] %></a></li>
                                                        <%cydart.Class.AltKategoriCRUD altKategoriCRUD = new cydart.Class.AltKategoriCRUD();
                                                            System.Data.DataTable altkattablo = altKategoriCRUD.filtrele(Convert.ToInt16(kattablo.Rows[i][0]));
                                                            for (int j = 0; j < altkattablo.Rows.Count; j++)
                                                            {%>
                                                                <li><a href="urunler.aspx?altkatsecim=<% =altkattablo.Rows[j][0] %>"><% =altkattablo.Rows[j][1] %></a></li>
                                                        <%} %>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
