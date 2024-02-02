<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="sliderekle.aspx.cs" Inherits="cydart.Admin.sliderekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Duyuru Ekleme</h2>

    <div id="basarisiz" class="alert alert-warning" role="alert" runat="server">
        <strong>Hata!</strong> Kayıt eklenemedi
    </div>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Etiket</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Etiket" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail">Başlık</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Başlık" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="inputEmail">Açıklama</label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Açıklama" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="inputEmail">Link</label>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="Link" runat="server"></asp:TextBox>
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
