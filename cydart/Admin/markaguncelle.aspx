<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="markaguncelle.aspx.cs" Inherits="cydart.Admin.markaguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Kategori Güncelleme</h2>

    <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
        <strong>Kayıt başarılı!</strong> Kayıt başarıyla güncellendi
    </div>

    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Değişiklikler kaydedilemedi
    </div>


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
                    <img id="imgPreview" src="#" alt="Ön izleme" height="100" runat="server" />
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="showPreview()" />
                </div>

                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click" />
            </div>
        </div>
    </div>

    <script>
        window.onload = function () {
            var imgPreview = document.getElementById('<%= imgPreview.ClientID %>');
            imgPreview.src = '<% =marka.Resim %>';
        }

        function showPreview() {
            var fileInput = document.getElementById('ContentPlaceHolder1_FileUpload1');
            var imgPreview = document.getElementById('ContentPlaceHolder1_imgPreview');

            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    imgPreview.src = e.target.result;
                }

                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    </script>
</asp:Content>
