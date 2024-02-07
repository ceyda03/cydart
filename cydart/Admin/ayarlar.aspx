<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ayarlar.aspx.cs" Inherits="cydart.Admin.ayarlar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="h3 mb-4 page-title">Ayarlar</h2>

    <div id="basarili" class="alert alert-success" visible="false" role="alert" runat="server">
        <strong>Kayıt başarılı!</strong> Kayıt başarıyla güncellendi
    </div>

    <div id="basarisiz" class="alert alert-warning" visible="false" role="alert" runat="server">
        <strong>Hata!</strong> Kullanıcı adı veya email zaten kayıtlı
    </div>

    <div id="sifrehata" class="alert alert-warning" visible="false" role="alert" runat="server">
        <strong>Hata!</strong> Şu anki şifrenizi yanlış girdiniz
    </div>

    <%
        cydart.Class.AdminCRUD adminCRUD = new cydart.Class.AdminCRUD();
        cydart.Class.Adminn admin = adminCRUD.bilgigetir(Convert.ToInt16(Session["id"]));
        TextBox1.Text = admin.Ad;
        TextBox2.Text = admin.Soyad;
        TextBox3.Text = admin.Kadi;
        TextBox4.Text = admin.Email;
        TextBox5.Text = admin.Tel;
        DropDownList1.SelectedIndex = admin.Yetki;
    %>

    <div class="my-4">
        <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Profil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Güvenlik</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Bildirimler</a>
            </li>
        </ul>
        
        <div class="row mt-5 align-items-center">
            <div class="col-md-3 text-center mb-5">
                <div class="avatar avatar-xl">
                    <img src="<% =Session["resim"] %>" alt="..." class="avatar-img rounded-circle">
                </div>
            </div>
            <div class="col">
                <div class="row align-items-center">
                    <div class="col-md-7">
                        <h4 class="mb-1"><% =Session["ad"] %> <% =Session["soyad"] %></h4>
                        <p class="small mb-3"><span class="badge badge-primary">
                            <%if (Convert.ToInt16(Session["yetki"]) == 0)
                                {%>
                                Süper Admin
                            <%} 
                                else if (Convert.ToInt16(Session["yetki"]) == 1)
                                {%>
                                Admin
                            <%} 
                                else if (Convert.ToInt16(Session["yetki"]) == 2)
                                {%>
                                Editör
                            <%} %></span>
                        </p>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-7">
                        <p class="text-muted"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit nisl ullamcorper, rutrum metus in, congue lectus. In hac habitasse platea dictumst. Cras urna quam, malesuada vitae risus at, pretium blandit sapien. </p>
                    </div>
                    <div class="col">
                        <p class="small mb-0 text-muted">Nec Urna Suscipit Ltd</p>
                        <p class="small mb-0 text-muted">P.O. Box 464, 5975 Eget Avenue</p>
                        <p class="small mb-0 text-muted"><%=Session["tel"] %></p>
                    </div>
                </div>
            </div>
        </div>
        <hr class="my-4">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="firstname">Ad</label>
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <label for="lastname">Soyad</label>
                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="firstname">Kullanıcı Adı</label>
                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <label for="lastname">Email</label>
                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="inputCompany5">Telefon</label>
                <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <label for="inputState5">Yetki</label>
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group col-md-4">
                <label for="inputState5">Fotoğraf</label> <br />
                <div class="row">
                    <div class="col-4">
                        <img src="<% =admin.Ryol %>" style="max-height: 100px" />
                    </div>
                    <div class="col-8">
                        <p>Yeni fotoğraf için:</p>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <hr class="my-4">
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="inputPassword4">Şu Anki Şifre</label>
                    <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="inputPassword5">Yeni Şifre</label>
                    <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="inputPassword6">Yeni Şifre Tekrar</label>
                    <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Yeni şifre ve şifre tekrarı uyuşmuyor!" ControlToValidate="TextBox8" ControlToCompare="TextBox7"></asp:CompareValidator>
                </div>
            </div>
            <div class="col-md-6">
                <p class="mb-2">Şifre gereklilikleri</p>
                <p class="small text-muted mb-2">Yeni bir şifre oluşturmak için şifreniz aşağıdaki şartlara uymalıdır:</p>
                <ul class="small text-muted pl-4 mb-0">
                    <li>En az 4 karakter</li>
                    <li>En az 1 rakam</li>
                    <li>Eski şifreyle aynı olamaz</li>
                    <li>Şifreniz rakamlar, harfler ve özel karakterler içerebilir</li>
                </ul>
            </div>
        </div>
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Değişiklikleri Kaydet" OnClick="Button1_Click"/>
    </div> <!-- /.card-body -->
</asp:Content>
