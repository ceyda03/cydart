<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="sliderekle.aspx.cs" Inherits="cydart.Admin.sliderekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Duyuru Ekleme</h2>

    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
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
                    <img id="imgPreview" src="#" alt="Ön izleme" height="100" runat="server" style="display: none;"/>
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="showPreview()"/>
                </div>
                
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click" />
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
