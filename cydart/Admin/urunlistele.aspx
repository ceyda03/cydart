<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="urunlistele.aspx.cs" Inherits="cydart.Admin.urunlistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Ürün Listesi</h2>

    <script type="text/javascript">
        function silmeOnay(urunNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "urunlistele.aspx?id=" + urunNo;
            }
        }
    </script>

</asp:Content>
