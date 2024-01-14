<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="adminguncelle.aspx.cs" Inherits="cydart.Admin.adminguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Admin Kaydı Güncelleme</h2>

    <div id="basarili" class="alert alert-success alert-dismissible fade show" role="alert" runat="server">
        <strong>Kayıt başarılı!</strong> Kayıt başarıyla güncellendi
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <div id="basarisiz" class="alert alert-warning alert-dismissible fade show" role="alert" runat="server">
        <strong>Hata!</strong> Kullanıcı adı veya email zaten kayıtlı
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <%
        int gid = Convert.ToInt16(Request.QueryString["gunid"]);
        cydart.AdminCRUD adminCRUD = new cydart.AdminCRUD();
        cydart.Adminn admin = adminCRUD.bilgigetir(gid);
        TextBox6.Text = admin.Kadi;
        TextBox1.Text = admin.Ad;
        TextBox2.Text = admin.Soyad;
        TextBox3.Text = admin.Email;
        TextBox4.Text = admin.Tel;
        //TextBox5.Text = admin.Sifre;
        DropDownList1.SelectedIndex = admin.Yetki;
    %>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Admin No</label>
                    <asp:TextBox ID="TextBox7" CssClass="form-control" placeholder="ID" runat="server" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Kullanıcı Adı</label>
                    <asp:TextBox ID="TextBox6" CssClass="form-control" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Ad</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Ad" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail">Soyad</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Soyad" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="inputEmail">Email</label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Email" placeholder="Email" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="inputEmail">Telefon</label>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="Telefon" runat="server"></asp:TextBox>
                </div>

                <%--<div class="form-group">
                    <label for="inputPassword4">Şifre</label>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Şifre" runat="server"></asp:TextBox>
                </div>--%>

                <div class="form-group">
                    <label for="inputAddress">Yetki</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control select2" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="inputAddress2">Fotoğraf</label> <br />
                    <img src="<%=admin.Ryol %>" alt="Alternate Text" width="100" height="100" />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
