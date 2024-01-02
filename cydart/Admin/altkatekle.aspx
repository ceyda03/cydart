<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="altkatekle.aspx.cs" Inherits="cydart.Admin.altkatekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Alt Kategori Ekleme</h2>
    
    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
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
