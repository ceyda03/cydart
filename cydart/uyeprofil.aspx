<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="uyeprofil.aspx.cs" Inherits="cydart.uyeprofil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        if (!IsPostBack) { 
            cydart.Class.MusteriCRUD musteriCRUD = new cydart.Class.MusteriCRUD();
            cydart.Class.Musteri musteri = musteriCRUD.bilgigetir(Convert.ToInt16(Session["no"]));
            TextBox1.Text = musteri.Ad;
            TextBox2.Text = musteri.Soyad;
            TextBox3.Text = musteri.Tel;
            TextBox4.Text = musteri.Email;
            TextBox5.Text = musteri.Adres;
            TextBox6.Text = musteri.DogTar.ToString();
        }
    %>

    <section class="ftco-section contact-section bg-light">
        <div class="container">
            <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
                <strong>İşlem başarılı!</strong> Değişiklikleriniz başarıyla kaydedildi.
            </div>

            <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
                <strong>Hata!</strong> Kaydedilemedi
            </div>

            <div id="sifrehata" class="alert alert-warning" visible="false" role="alert" runat="server">
                <strong>Hata!</strong> Şu anki şifrenizi yanlış girdiniz
            </div>

            <div class="row block-9">
                <div class="col-md-12 order-md-last d-flex m-auto">
                    <div class="bg-white p-5 contact-form">
                        <h2>Üye Bilgileri</h2>
                        <hr />

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Ad</label>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" Placeholder="Ad" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Soyad</label>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" Placeholder="Soyad" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Telefon Numarası</label>
                                <asp:TextBox ID="TextBox3" CssClass="form-control" Placeholder="Telefon Numarası" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Email</label>
                                <asp:TextBox ID="TextBox4" CssClass="form-control" TextMode="Email" Placeholder="Email" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Adres</label>
                            <asp:TextBox ID="TextBox5" CssClass="form-control" TextMode="MultiLine" Rows="2" Placeholder="Adres" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Doğum Tarihi</label>
                            <asp:TextBox ID="TextBox6" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="Lütfen seçim yapın"></asp:RequiredFieldValidator>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Şu Anki Şifre</label>
                                <asp:TextBox ID="TextBox7" CssClass="form-control" TextMode="Password" Placeholder="Şifre" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Yeni Şifre</label>
                                <asp:TextBox ID="TextBox8" CssClass="form-control" TextMode="Password" Placeholder="Şifre" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row mt-3 mx-auto" style="justify-content: space-between;">
                            <div class="form-group">
                                <asp:Button ID="Button1" CssClass="btn btn-primary py-3 px-5" runat="server" Text="Değişiklikleri Kaydet" OnClick="Button1_Click" />
                            </div>
                            <div class="form-group">
                                <button class="btn btn-danger py-3 px-5" onclick="silmeOnay()">Hesabı Sil</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

   <script type="text/javascript">
        function silmeOnay() {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "uyeprofil.aspx?sil=1";
            }
        }
    </script> 
</asp:Content>
