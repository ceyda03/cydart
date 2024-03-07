<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="urundetay.aspx.cs" Inherits="cydart.urundetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" Value="1" />

    <%
        string barkod = Request.QueryString["urun"];
        cydart.Class.UrunCRUD urunCRUD = new cydart.Class.UrunCRUD();
        cydart.Class.Urun urun = urunCRUD.bilgigetir(barkod);
    %>
    <section class="ftco-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mb-5 ftco-animate">
                    <%if (urun.Resim != "")
                      {%>
                        <a href="Admin/<% =urun.Resim %>" class="image-popup">
                            <img src="Admin/<% =urun.Resim %>" class="img-fluid" alt="Colorlib Template">
                        </a>
                    <%}
                      else
                      {%>
                        <a href="#" class="image-popup prod-img-bg">
                            <img src="Admin/img/default200.png" class="img-fluid" alt="Colorlib Template">
                        </a>
                    <%}%>
                </div>
                <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                    <h3><% =urun.Ad %></h3>
                    <div class="cat">
                        <span></span>
                    </div>
                    <p class="price"><span><% =String.Format("{0:0.00}", urun.Fiyat) %> ₺</span></p>
                    <p><% =urun.Aciklama %></p>
                    <div class="w-100"></div>
                    <%if (urun.Stok <= 10)
                        {%>
                        <div class="col-md-12">
                            <p style="color: #000;">Stokta son <% =urun.Stok %> adet kaldı!</p>
                        </div>
                    <%}%>
                    <p>
                        <%if (Session["uye"] != null)
                          {%>
                            <a href="urundetay.aspx?urun=<% =urun.Barkod %>&ekle=<% =urun.Barkod %>" class="btn btn-black py-3 px-5 mr-2">Sepete Ekle</a>
                            <a href="urundetay.aspx?ekle=<% =urun.Barkod %>&sepet=true" class="btn btn-primary py-3 px-5">Hemen Al</a>
                        <%}
                          else
                          {%>
                            <a href="uyegiris.aspx" class="btn btn-black py-3 px-5 mr-2">Ürün Satın Almak İçin Giriş Yapın</a>
                        <%}%>
                    </p>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-md-12 nav-link-wrap">
                    <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Ürün Açıklaması</a>
                    </div>
                </div>
                <div class="col-md-12 tab-wrap">
                    <div class="tab-content bg-light" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                            <div class="p-4">
                                <h3 class="mb-4"><% =urun.Ad %></h3>
                                <p><% =urun.Aciklama %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
