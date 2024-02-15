<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="katekle.aspx.cs" Inherits="cydart.Admin.katekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Kategori Ekleme</h2>
    
    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Kayıt eklenemedi
    </div>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Kategori Adı</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Kategori Adı" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Kategori Resmi</label> <br />
                    <img id="imgPreview" src="#" alt="Ön izleme" height="100" runat="server" style="display: none;"/>
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="showPreview()"/>
                </div>

                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click"/>
            </div>
        </div>
    </div>

    <script>
        function showPreview() {
            var fileInput = document.getElementById('<%= FileUpload1.ClientID %>');
            var imgPreview = document.getElementById('<%= imgPreview.ClientID %>');

            if (fileInput.files && fileInput.files[0]) {
                imgPreview.style.display = "inline"; 

                var reader = new FileReader();

                reader.onload = function (e) {
                    imgPreview.src = e.target.result;
                }

                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    </script>
</asp:Content>
