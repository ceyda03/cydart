<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="markaguncelle.aspx.cs" Inherits="cydart.Admin.markaguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Kategori Güncelleme</h2>

    <%
        int gid = Convert.ToInt16(Request.QueryString["gunid"]);
        cydart.Class.MarkaCRUD markaCRUD = new cydart.Class.MarkaCRUD();
        cydart.Class.Marka marka = markaCRUD.bilgigetir(gid);
        TextBox2.Text = marka.Ad;
    %>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Marka No</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Kategori No" runat="server" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Marka Adı</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Kategori Adı" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Marka Resmi</label> <br />
                    <img src="<%=marka.Resim %>" alt="Alternate Text" width="100" height="100" />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>

                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
