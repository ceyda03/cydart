<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="adminekle.aspx.cs" Inherits="cydart.Admin.adminekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Admin Kaydı Ekleme</h2>

    <div id="basarisiz" class="alert alert-warning" role="alert" runat="server">
        <strong>Hata!</strong> Kullanıcı adı veya email zaten kayıtlı
    </div>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
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

                <div class="form-group">
                    <label for="inputPassword4">Şifre</label>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Şifre" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputAddress">Yetki</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control select2" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="inputAddress2">Fotoğraf</label> <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
