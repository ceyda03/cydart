<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="cydart.iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Ana Sayfa /</a></span> <span>İletişim</span></p>
                    <h1 class="mb-0 bread">Bize Ulaşın</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section contact-section bg-light">
        <div class="container">
            <div class="row d-flex mb-5 contact-info">
                <div class="w-100"></div>
                <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                        <p><span>Adres:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
                    </div>
                </div>
                <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                        <p><span>Telefon:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
                    </div>
                </div>
                <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                        <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
                    </div>
                </div>
                <div class="col-md-3 d-flex">
                    <div class="info bg-white p-4">
                        <p><span>Website:</span> <a href="#">yoursite.com</a></p>
                    </div>
                </div>
            </div>
            <div class="row block-9">
                <div class="col-md-12 order-md-last d-flex">
                    <div class="bg-white p-5 contact-form">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Adınız" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <asp:TextBox ID="TextBox2" CssClass="form-control" TextMode="Email" placeholder="Email Adresiniz" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="MultiLine" Rows="7" Columns="30" placeholder="Mesajınız" runat="server"></asp:TextBox>
                        </div>
                        <div class="row">
                            <div class="form-group mr-5">
                                <asp:Button ID="Button1" runat="server" class="btn btn-primary py-3 px-5" Text="Gönder" OnClick="Button1_Click" />
                            </div>
                            <div id="yollandi" class="alert alert-success alert-dismissible fade show" role="alert" runat="server" visible="false">
                                <strong>Geri bildiriminiz için teşekkürler!</strong> Mesajınız sitemize ulaştı
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </section> 
</asp:Content>
