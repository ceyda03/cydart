<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="katguncelle.aspx.cs" Inherits="cydart.Admin.katguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Kategori Güncelleme</h2>

    <%
        int gid = Convert.ToInt16(Request.QueryString["gunid"]);
        cydart.KategoriCRUD kategoriCRUD = new cydart.KategoriCRUD();
        cydart.Kategori kategori = kategoriCRUD.bilgigetir(gid);
        TextBox2.Text = kategori.Ad;
    %>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Kategori No</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Kategori No" runat="server" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Kategori Adı</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Kategori Adı" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Kategori Resmi</label> <br />
                    <img src="<%=kategori.Resim %>" alt="Alternate Text" width="100" height="100" />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>

                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
