<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="altkatekle.aspx.cs" Inherits="cydart.Admin.altkatekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Alt Kategori Ekleme</h2>
    
    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Kayıt eklenemedi
    </div>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Ana Kategori Adı</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control select2" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Lütfen seçim yapın" InitialValue="Lütfen Seçiniz"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Alt Kategori Adı</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Kategori Adı" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Lütfen bu alanı doldurun"></asp:RequiredFieldValidator>
                </div>

                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
