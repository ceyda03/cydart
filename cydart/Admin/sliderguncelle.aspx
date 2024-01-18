<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="sliderguncelle.aspx.cs" Inherits="cydart.Admin.sliderguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Duyuru Güncelleme</h2>

    <%
        int gid = Convert.ToInt16(Request.QueryString["gunid"]);
        cydart.Class.SliderCRUD sliderCRUD = new cydart.Class.SliderCRUD();
        cydart.Class.Slider slider = sliderCRUD.bilgigetir(gid);
        TextBox2.Text = slider.Etiket;
        TextBox3.Text = slider.Baslik;
        TextBox4.Text = slider.Aciklama;
        TextBox5.Text = slider.Link;
    %>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Duyuru No</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Etiket</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="inputEmail4">Başlık</label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Açıklama</label>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Link</label>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Kategori Resmi</label> <br />
                    <img src="<%=slider.Resim %>" alt="Alternate Text" width="100" height="100" />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>

                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="Button1_Click"/>
            </div>
        </div>
    </div>

</asp:Content>
