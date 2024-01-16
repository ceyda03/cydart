<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="urunler.aspx.cs" Inherits="cydart.urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Ana Sayfa /</a></span> <span>Ürünler</span></p>
                    <h1 class="mb-0 bread">Ürünler</h1>
                </div>
            </div>
        </div>
    </div>

    <%
        cydart.Class.UrunCRUD urunCRUD = new cydart.Class.UrunCRUD();
        System.Data.DataTable urunler = new System.Data.DataTable();

        if (Request.QueryString["secim"] != null)
        {
            int gid = Convert.ToInt16(Request.QueryString["secim"]);
            urunler = urunCRUD.secimlistele(gid);
        }
        else
        {
            urunler = urunCRUD.listele();
        }
    %>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-lg-10 order-md-last">
                    <div class="row">
                        <%for (int i = 0; i < urunler.Rows.Count; i++)
                          {%>
                            <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
                                <div class="product d-flex flex-column">
                                    <a href="#" class="img-prod">
                                        <img class="img-fluid" src="Admin/<% =urunler.Rows[i][8] %>" alt="Colorlib Template">
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3">
                                        <div class="d-flex">
                                            <div class="cat">
                                                <span><% =urunler.Rows[i][6] %></span>  
                                            </div>
                                            <div class="rating">
                                                <p class="text-right mb-0">
                                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                </p>
                                            </div>
                                        </div>
                                        <h3><a href="#"><% =urunler.Rows[i][1] %></a></h3>
                                        <div class="pricing">
                                            <p class="price"><span><% =Convert.ToDouble(urunler.Rows[i][4]).ToString("0.##") %>₺</span></p>
                                        </div>
                                        <p class="bottom-area d-flex px-3">
                                            <a href="#" class="add-to-cart text-center py-2 mr-1">
                                                <span>Sepete Ekle <i class="ion-ios-add ml-1"></i></span>
                                            </a>
                                            <a href="#" class="buy-now text-center py-2">
                                                Hemen Al<span><i class="ion-ios-cart ml-1"></i></span>
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        <%} %>
                    </div>
                    <div class="row mt-5">
                        <div class="col text-center">
                            <div class="block-27">
                                <ul>
                                    <li><a href="#">&lt;</a></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&gt;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>                

                <%
                    cydart.Class.KategoriCRUD kategoriCRUD = new cydart.Class.KategoriCRUD();
                    System.Data.DataTable kattablo = kategoriCRUD.listele();
                %>

                <div class="col-md-4 col-lg-2">
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
                                                        <%cydart.Class.AltKategoriCRUD altKategoriCRUD = new cydart.Class.AltKategoriCRUD();
                                                            System.Data.DataTable altkattablo = altKategoriCRUD.filtrele(Convert.ToInt16(kattablo.Rows[i][0]));
                                                            for (int j = 0; j < altkattablo.Rows.Count; j++)
                                                            {%>
                                                                <li><a href="urunler.aspx?secim=<% =altkattablo.Rows[j][0] %>"><% =altkattablo.Rows[j][1] %></a></li>
                                                        <%} %>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar-box-2">
                            <h2 class="heading">Fiyat Aralığı</h2>
                            <form method="post" class="colorlib-form-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="guests">Price from:</label>
                                            <div class="form-field">
                                                <i class="icon icon-arrow-down3"></i>
                                                <select name="people" id="people" class="form-control">
                                                    <option value="#">1</option>
                                                    <option value="#">200</option>
                                                    <option value="#">300</option>
                                                    <option value="#">400</option>
                                                    <option value="#">1000</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="guests">Price to:</label>
                                            <div class="form-field">
                                                <i class="icon icon-arrow-down3"></i>
                                                <select name="people" id="people" class="form-control">
                                                    <option value="#">2000</option>
                                                    <option value="#">4000</option>
                                                    <option value="#">6000</option>
                                                    <option value="#">8000</option>
                                                    <option value="#">10000</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
