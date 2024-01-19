<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="sliderlistele.aspx.cs" Inherits="cydart.Admin.sliderlistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Duyuru Listesi</h2>

    <div id="basarili" class="alert alert-success alert-dismissible fade show" role="alert" visible="false" runat="server">
        <strong>Kayıt silindi</strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <div id="basarisiz" class="alert alert-warning alert-dismissible fade show" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Kayıt silinemedi
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <script type="text/javascript">
        function silmeOnay(sliderNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "sliderlistele.aspx?id=" + sliderNo;
            }
        }
    </script>

    <%
        cydart.Class.SliderCRUD sliderCRUD = new cydart.Class.SliderCRUD();
        System.Data.DataTable tablo = sliderCRUD.listele();
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
                                <th>Duyuru No</th>
                                <th>Etiket</th>
                                <th>Başlık</th>
                                <th>Açıklama</th>
                                <th>Resim</th>
                                <th>Link</th>
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
                                    <td>
                                        <img src="<% =tablo.Rows[i][4] %>" alt="Alternate Text" style="max-height:50px" />
                                    </td>
                                    <td><% =tablo.Rows[i][5] %></td>
                                    <td>
                                        <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted sr-only">Action</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="sliderguncelle.aspx?gunid=<% =tablo.Rows[i][0] %>">Güncelle</a>
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
        </div> <!-- simple table -->
    </div> <!-- end section -->
</asp:Content>
