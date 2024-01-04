<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="altkatguncelle.aspx.cs" Inherits="cydart.Admin.altkatguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Alt Kategori Güncelleme</h2>

    <%
        int gid = Convert.ToInt16(Request.QueryString["gunid"]);
        cydart.AltKategoriCRUD altKategoriCRUD = new cydart.AltKategoriCRUD();
        cydart.AltKategori altKategori = altKategoriCRUD.bilgigetir(gid);
        TextBox1.Text = altKategori.Ad;
        DropDownList1.SelectedValue = altKategori.Katid.ToString();
    %>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Alt Kategori No</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Kategori No" runat="server" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Ana Kategori Adı</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Alt Kategori Adı</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Kategori Adı" runat="server"></asp:TextBox>
                </div>


                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
