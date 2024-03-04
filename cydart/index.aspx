<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="cydart.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- hero start -->
    <section id="home-section" class="hero">
        <div class="home-slider owl-carousel">
            <%
                cydart.Class.SliderCRUD sliderCRUD = new cydart.Class.SliderCRUD();
                System.Data.DataTable slider = sliderCRUD.listele();

                for (int i = 0; i < slider.Rows.Count; i++)
                {%>
                    <div class="slider-item js-fullheight">
                        <div class="overlay"></div>
                        <div class="container-fluid p-0">
                            <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
                                <img class="one-third order-md-last img-fluid" src="Admin/<% =slider.Rows[i][4] %>" alt="">
                                <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                                    <div class="text">
                                        <span class="subheading">#<% =slider.Rows[i][1] %></span>
                                        <div class="horizontal">
                                            <h1 class="mb-4 mt-3"><% =slider.Rows[i][2] %></h1>
                                            <p class="mb-4"><% =slider.Rows[i][3] %></p>
			            
                                            <p><a href="<% =slider.Rows[i][5] %>" class="btn-custom">Şimdi Keşfet</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
              <%}%>
        </div>
    </section>
    <!-- hero end -->

    <!-- categories start -->
    <section class="ftco-gallery">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 heading-section text-center my-4 ftco-animate">
                    <h2 class="mb-4">Kategoriler</h2>
                </div>
            </div>
        </div>
        <%            
            cydart.Class.KategoriCRUD kategoriCRUD = new cydart.Class.KategoriCRUD();
            System.Data.DataTable kategoriler = kategoriCRUD.listele();
        %>
        <div class="container-fluid px-0">
            <div class="row no-gutters">
                <%for (int i = 0; i < kategoriler.Rows.Count; i++)
                  {
                      if (kategoriler.Rows[i][2].ToString() != "")
                      {%>
                        <div class="col-md-4 col-lg-2 ftco-animate">
                            <a href="urunler.aspx?katsecim=<% =kategoriler.Rows[i][0] %>" class="gallery img d-flex align-items-center" style="background-image: url(Admin/<% =kategoriler.Rows[i][2] %>);">
                                <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                    <span style="text-align:center;"><% =kategoriler.Rows[i][1] %></span>
                                </div>
                            </a>
                        </div>
                    <%}
                  } %>
            </div>
        </div>
    </section>
    <!-- categories end -->

    <!-- pens start -->
    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-3 pb-3">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <h2 class="mb-4">Kalemler</h2>
                </div>
            </div>   		
        </div>
        <div class="container">
            <div class="row">
                <%
                    cydart.Class.UrunCRUD urunCRUD = new cydart.Class.UrunCRUD();
                    System.Data.DataTable urunler = urunCRUD.katsecimlistele(1);

                    for (int i = 0; i < 4; i++)
                    {%>
                        <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
                            <div class="product d-flex flex-column">
                                <a href="#" class="img-prod">
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
                                            <span><% =urunler.Rows[i][2] %></span>
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
                                        <p class="price"><span><% =Convert.ToDouble(urunler.Rows[i][5]).ToString("0.##") %>₺</span></p>
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
                  <%}%>
            </div>
        </div>
    </section>
    <!-- pens end -->

    <!-- paints start -->
    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-3 pb-3">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <h2 class="mb-4">Boyalar</h2>
                </div>
            </div>   		
        </div>
        <div class="container">
            <div class="row">
                <%
                    cydart.Class.UrunCRUD uruncrud = new cydart.Class.UrunCRUD();
                    System.Data.DataTable boyalar = urunCRUD.katsecimlistele(2);

                    for (int i = 0; i < 4; i++)
                    {%>
                        <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
                            <div class="product d-flex flex-column">
                                <a href="#" class="img-prod">
                                    <%if (boyalar.Rows[i][8].ToString() != "")
                                      {%>
                                        <img class="img-fluid" src="Admin/<% =boyalar.Rows[i][8] %>" alt="Colorlib Template">
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
                                            <span><% =boyalar.Rows[i][2] %></span>
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
                                    <h3><a href="#"><% =boyalar.Rows[i][1] %></a></h3>
                                    <div class="pricing">
                                        <p class="price"><span><% =Convert.ToDouble(boyalar.Rows[i][5]).ToString("0.##") %>₺</span></p>
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
                  <%}%>
            </div>
        </div>
    </section>
    <!-- paints end -->

    <!-- brands start -->
    <section class="ftco-gallery">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 heading-section text-center my-4 ftco-animate">
                    <h2 class="mb-4">Satıştaki Bazı Markalar</h2>
                </div>
            </div>
        </div>
        <%            
            cydart.Class.MarkaCRUD markaCRUD = new cydart.Class.MarkaCRUD();
            System.Data.DataTable markalar = markaCRUD.listele();
        %>
        <div class="container-fluid px-0">
            <div class="row no-gutters">
                <%for (int i = 0; i < 7; i++)
                  {
                      if (markalar.Rows[i][2].ToString() != "")
                      {%>
                        <div class="col-md-4 col-lg-2 ftco-animate">
                            <a href="urunler.aspx?markasecim=<% =markalar.Rows[i][0] %>" class="gallery img d-flex align-items-center" style="background-image: url(Admin/<% =markalar.Rows[i][2] %>);">
                                <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                    <span style="text-align:center;"><% =markalar.Rows[i][1] %></span>
                                </div>
                            </a>
                        </div>
                      <%}
                  } %>
            </div>
        </div>
    </section>
    <!-- brands end -->
</asp:Content>
