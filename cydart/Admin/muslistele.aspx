<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="muslistele.aspx.cs" Inherits="cydart.Admin.muslistele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Müşteri Listesi</h2>

    <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
        <strong>Kayıt silindi</strong>
    </div>

    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Kayıt silinemedi
    </div>

    <%
        cydart.Class.MusteriCRUD musteriCRUD = new cydart.Class.MusteriCRUD();
        System.Data.DataTable tablo = musteriCRUD.listele();
    %>

    <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
            <div class="card shadow">
                <div class="card-body">
                    <!-- table -->
                    <table class="table datatables" id="dataTable-1">
                        <thead>
                            <tr>
                                <th>Müşteri No</th>
                                <th>Ad</th>
                                <th>Soyad</th>
                                <th>Telefon</th>
                                <th>Email</th>
                                <th>Adres</th>
                                <th>Doğum Tarihi</th>
                                <th>İşlemler</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (int i = 0; i < tablo.Rows.Count; i++)
                                {
                            %>
                            <tr>
                                <td><% =tablo.Rows[i][0] %></td>
                                <td><% =tablo.Rows[i][1] %></td>
                                <td><% =tablo.Rows[i][2] %></td>
                                <td><% =tablo.Rows[i][3] %></td>
                                <td><% =tablo.Rows[i][4] %></td>
                                <td><% =tablo.Rows[i][5] %></td>
                                <td><% =Convert.ToDateTime(tablo.Rows[i][6]).ToShortDateString() %></td>
                                <td>
                                    <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-muted sr-only">Action</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#" onclick="silmeOnay(<% =tablo.Rows[i][0] %>)">Sil</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- simple table -->
    </div>
    <!-- end section -->

    <script type="text/javascript">
        function silmeOnay(musNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "muslistele.aspx?id=" + musNo;
            }
        }
    </script>

</asp:Content>
