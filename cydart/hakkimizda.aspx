<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="hakkimizda.aspx.cs" Inherits="cydart.hakkimizda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Ana Sayfa / </a></span> <span>Hakkımızda</span></p>
                    <h1 class="mb-0 bread">Hakkımızda</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section ftco-no-pt ftco-no-pb">
        <div class="container">
            <div class="row no-gutters ftco-services">
                <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services p-4 py-md-5">
                        <div class="icon d-flex justify-content-center align-items-center mb-4">
                            <span class="flaticon-bag"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Ücretsiz Kargo</h3>
                            <p>300 TL ve üzeri alışverişlerinizde kargo ücreti ödemezsiniz</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services p-4 py-md-5">
                        <div class="icon d-flex justify-content-center align-items-center mb-4">
                            <span class="flaticon-customer-service"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Müşteri Desteği</h3>
                            <p>Her an ulaşabileceğiniz, sonuç odaklı müşteri destek hattımızla en iyi hizmeti sunma amacındayız</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services p-4 py-md-5">
                        <div class="icon d-flex justify-content-center align-items-center mb-4">
                            <span class="flaticon-payment-security"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Güvenli Ödeme</h3>
                            <p>Ödemelerinizi yaptığınız alanlar tamamen güvenlidir</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
        <div class="container">
            <div class="row">
                <div class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/about.jpg);">
                    <a href="https://vimeo.com/45830194" class="icon popup-vimeo d-flex justify-content-center align-items-center">
                        <span class="icon-play"></span>
                    </a>
                </div>
                <div class="col-md-7 py-md-5 wrap-about pb-md-5 ftco-animate">
                    <div class="heading-section-bold mb-4 mt-md-5">
                        <div class="ml-md-0">
                            <h2 class="mb-4">2004'ten Beri Hizmetinizde</h2>
                        </div>
                    </div>
                    <div class="pb-md-5 pb-4">
                        <p>20 yıllık tecrübemizle, her zaman daha iyi hizmet verebilmek için uğraşıyoruz.</p>
                        <p>Seçkin markalardan geniş ürün kataloğumuzla aradığınız tüm sanat malzemeleri için buradayız. Kaliteli ürünler, hızlı teslimat ve etkili müşteri hizmetlerimizle kolay ve mutlu bir alışveriş serüveni yaşamanız için her ayrıntıyı düşünüyoruz.</p>
                        <p><a href="#" class="btn btn-primary">Alışverişe Başla</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section testimony-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="services-flow">
                        <div class="services-2 p-4 d-flex ftco-animate">
                            <div class="icon">
                                <span class="flaticon-bag"></span>
                            </div>
                            <div class="text">
                                <h3>Ücretsiz Kargo</h3>
                                <p class="mb-0">300 Tl ve üzeri alışverişlerde kargo ücretsiz!</p>
                            </div>
                        </div>
                        <div class="services-2 p-4 d-flex ftco-animate">
                            <div class="icon">
                                <span class="flaticon-heart-box"></span>
                            </div>
                            <div class="text">
                                <h3>Özenli Paketleme</h3>
                                <p class="mb-0">Ürünlerinizin size hasarsız ulaşabilmesi için tüm önlemleri alıyoruz.</p>
                            </div>
                        </div>
                        <div class="services-2 p-4 d-flex ftco-animate">
                            <div class="icon">
                                <span class="flaticon-payment-security"></span>
                            </div>
                            <div class="text">
                                <h3>Güvenli Ödeme</h3>
                                <p class="mb-0">Güvenli ödeme sistemimizle aklınızda soru işareti kalmasın.</p>
                            </div>
                        </div>
                        <div class="services-2 p-4 d-flex ftco-animate">
                            <div class="icon">
                                <span class="flaticon-customer-service"></span>
                            </div>
                            <div class="text">
                                <h3>Müşteri Desteği</h3>
                                <p class="mb-0">Müşteri hizmetlerimiz sayesinde tüm sorunlarınıza hızlıca çözüm bulabilirsiniz.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    cydart.Class.YorumCRUD yorumCRUD = new cydart.Class.YorumCRUD();
                    System.Data.DataTable yorumlar = yorumCRUD.filtrele("Yorum");
                %>

                <div class="col-lg-7">
                    <div class="heading-section ftco-animate mb-5">
                        <h2 class="mb-4">Müşterilerimizin Geri Dönüşleri</h2>
                    </div>
                    <div class="carousel-testimony owl-carousel ftco-animate">
                        <%for (int i = 0; i < yorumlar.Rows.Count; i++)
                          {%>
                            <div class="item">
                                <div class="testimony-wrap">
                                    <div class="user-img mb-4" style="background-image: url(images/user.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="mb-4 pl-4 line"><% =yorumlar.Rows[i][4] %></p>
                                        <p class="name"><% =yorumlar.Rows[i][1] %></p>
                                    </div>
                                </div>
                            </div>
                        <%} %>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
