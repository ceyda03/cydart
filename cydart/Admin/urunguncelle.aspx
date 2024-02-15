<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="urunguncelle.aspx.cs" Inherits="cydart.Admin.urunguncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Ürün Güncelleme</h2>

    <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
        <strong>Kayıt başarılı!</strong> Kayıt başarıyla güncellendi
    </div>

    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Değişiklikler kaydedilemedi
    </div>

    <%
        string gid = Request.QueryString["gunid"];
        cydart.Class.UrunCRUD urunCRUD = new cydart.Class.UrunCRUD();
        cydart.Class.Urun urun = urunCRUD.bilgigetir(gid);    
    %>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Barkod No</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" TextMode="Number" placeholder="Barkod No" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Ürün Adı</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Ürün Adı" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Ana Kategori Adı</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control select2" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Alt Kategori Adı</label>
                    <asp:DropDownList ID="DropDownList2" CssClass="form-control select2" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Marka Adı</label>
                    <asp:DropDownList ID="DropDownList3" CssClass="form-control select2" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Fiyat</label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Number" placeholder="Fiyat" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Stok</label>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" TextMode="Number" placeholder="Stok" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="inputEmail4">Sipariş Adet</label>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" TextMode="Number" placeholder="Stok" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Açıklama</label>
                    <asp:TextBox ID="TextBox6" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Açıklama" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Ürün Resmi</label>
                    <br />
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
            imgPreview.src = '<% =urun.Resim %>';
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
