<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="muslistele.aspx.cs" Inherits="cydart.Admin.muslistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Müşteri Listesi</h2>

    <script type="text/javascript">
        function silmeOnay(musNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "muslistele.aspx?id=" + musNo;
            }
        }
    </script>

</asp:Content>
