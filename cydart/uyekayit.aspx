<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="uyekayit.aspx.cs" Inherits="cydart.uyekayit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="ftco-section contact-section bg-light">
        <div class="container">
            <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
                <strong>Kayıt başarılı.</strong> Aramıza hoş geldiniz! Alışverişe başlamak için <a href="uyegiris.aspx">giriş yapın.</a>
            </div>

            <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
                <strong>Hata!</strong> Kayıt yapılamadı
            </div>

            <div class="row block-9">
                <div class="col-md-12 order-md-last d-flex m-auto">
                    <div class="bg-white p-5 contact-form">
                        <h2>Üye Ol</h2>
                        <hr/>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Ad</label>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" Placeholder="Ad" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Lütfen bu alanı doldurun"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Soyad</label>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" Placeholder="Soyad" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Lütfen bu alanı doldurun"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Telefon Numarası</label>
                                <asp:TextBox ID="TextBox3" CssClass="form-control" Placeholder="Telefon Numarası" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Lütfen bu alanı doldurun"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Email</label>
                                <asp:TextBox ID="TextBox4" CssClass="form-control" TextMode="Email" Placeholder="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Lütfen bu alanı doldurun"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Adres</label>
                            <asp:TextBox ID="TextBox5" CssClass="form-control" Placeholder="Adres" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Lütfen bu alanı doldurun"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Doğum Tarihi</label>
                            <asp:TextBox ID="TextBox6" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Lütfen seçim yapın"></asp:RequiredFieldValidator>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Şifre</label>
                                <asp:TextBox ID="TextBox7" CssClass="form-control" TextMode="Password" Placeholder="Şifre" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Lütfen bu alanı doldurun"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Şifre Tekrar</label>
                                <asp:TextBox ID="TextBox8" CssClass="form-control" TextMode="Password" Placeholder="Şifre" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Şifreler aynı değil!" ControlToCompare="TextBox7" ControlToValidate="TextBox8" Display="Dynamic"></asp:CompareValidator>
                            </div>
                        </div>

                        <div class="row mt-3 mx-auto" style="justify-content: space-between;">
                            <div class="form-group">
                                <asp:Button ID="Button1" CssClass="btn btn-primary py-3 px-5" runat="server" Text="Üye Ol" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
