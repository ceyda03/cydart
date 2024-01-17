<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="cydart.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- hero start -->
    <section id="home-section" class="hero">
        <div class="home-slider owl-carousel">
            <div class="slider-item js-fullheight">
                <div class="overlay"></div>
                <div class="container-fluid p-0">
                    <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
                        <img class="order-md-last img-fluid" src="images/kalemler.png" alt="">
                        <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <div class="text">
                                <span class="subheading">#Yeni Gelenler</span>
                                <div class="horizontal">
                                    <h1 class="mb-4 mt-3">Capcanlı renkleriyle marker kalemler</h1>
                                    <p class="mb-4">En kaliteli markaların en sevilen kalemleri</p>
			            
                                    <p><a href="#" class="btn-custom">Şimdi Keşfet</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item js-fullheight">
                <div class="overlay"></div>
                <div class="container-fluid p-0">
                    <div class="row d-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
                        <img class="one-third order-md-last img-fluid" src="images/siyah-kalemler.png" alt="">
                        <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <div class="text">
                                <span class="subheading">#Çok Satanlar</span>
                                <div class="horizontal">
                                    <h1 class="mb-4 mt-3">Çizim yapan herkesin favorisi</h1>
                                    <p class="mb-4">Tüm kullananların vazgeçilmezleri, en uygun fiyatlarla</p>
			            
                                    <p><a href="#" class="btn-custom">Şimdi Keşfet</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- hero end -->

    <!-- products start -->
    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center mb-3 pb-3">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <h2 class="mb-4">New Shoes Arrival</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                </div>
            </div>   		
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
                    <div class="product d-flex flex-column">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/product-1.png" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3">
                            <div class="d-flex">
                                <div class="cat">
                                    <span>Lifestyle</span>
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
                            <h3><a href="#">Nike Free RN 2019 iD</a></h3>
                            <div class="pricing">
                                <p class="price"><span>$120.00</span></p>
                            </div>
                            <p class="bottom-area d-flex px-3">
                                <a href="#" class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
                                <a href="#" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
                    <div class="product d-flex flex-column">
                        <a href="#" class="img-prod"><img class="img-fluid" src="images/product-2.png" alt="Colorlib Template">
                            <span class="status">50% Off</span>
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3">
                            <div class="d-flex">
                                <div class="cat">
                                    <span>Lifestyle</span>
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
                            <h3><a href="#">Nike Free RN 2019 iD</a></h3>
                            <div class="pricing">
                                <p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p>
                            </div>
                            <p class="bottom-area d-flex px-3">
                                <a href="#" class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
                                <a href="#" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
                <div class="product">
                <a href="#" class="img-prod"><img class="img-fluid" src="images/product-3.png" alt="Colorlib Template">
                <div class="overlay"></div>
                </a>
                <div class="text py-3 pb-4 px-3">
                <div class="d-flex">
                <div class="cat">
                <span>Lifestyle</span>
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
                <h3><a href="#">Nike Free RN 2019 iD</a></h3>
                <div class="pricing">
                <p class="price"><span>$120.00</span></p>
                </div>
                <p class="bottom-area d-flex px-3">
                <a href="#" class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
                <a href="#" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>
                </p>
                </div>
                </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
                <div class="product">
                <a href="#" class="img-prod"><img class="img-fluid" src="images/product-4.png" alt="Colorlib Template">
                <div class="overlay"></div>
                </a>
                <div class="text py-3 pb-4 px-3">
                <div class="d-flex">
                <div class="cat">
                <span>Lifestyle</span>
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
                <h3><a href="#">Nike Free RN 2019 iD</a></h3>
                <div class="pricing">
                <p class="price"><span>$120.00</span></p>
                </div>
                <p class="bottom-area d-flex px-3">
                <a href="#" class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
                <a href="#" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>
                </p>
                </div>
                </div>
                </div>
            </div>
        </div>
    </section>
    <!-- products end -->


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
                            <a href="#" class="gallery image-popup img d-flex align-items-center" style="background-image: url(Admin/<% =markalar.Rows[i][2] %>);">
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
