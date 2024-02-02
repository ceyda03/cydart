<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="urunlistele.aspx.cs" Inherits="cydart.Admin.urunlistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Ürün Listesi</h2>

    <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
        <strong>Kayıt silindi</strong>
    </div>

    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Kayıt silinemedi
    </div>


    <script type="text/javascript">
        function silmeOnay(urunNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "urunlistele.aspx?id=" + urunNo;
            }
        }
    </script>

    <%
        System.Data.DataTable tablo = new System.Data.DataTable();
        cydart.Class.UrunCRUD urunCRUD = new cydart.Class.UrunCRUD();
        tablo = urunCRUD.listele();
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
                                <th>Barkod No</th>
                                <th>Ürün Adı</th>
                                <th>Kategori Adı</th>
                                <th>Alt Kategori Adı</th>
                                <th>Marka Adı</th>
                                <th>Fiyat</th>
                                <th>Stok</th>
                                <th>Sipariş Adet</th>
                                <th>Açıklama</th>
                                <th>Ürün Resmi</th>
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
                                    <td><% =Convert.ToDouble(tablo.Rows[i][5]).ToString("0.##") %></td>
                                    <td><% =tablo.Rows[i][6] %></td>
                                    <td><% =tablo.Rows[i][7] %></td>
                                    <td><% =tablo.Rows[i][8] %></td>
                                    <td>
                                        <% if (tablo.Rows[i][9].ToString() != "")
                                           { %>
                                                <img src="<% =tablo.Rows[i][9] %>" alt="Alternate Text" style="max-height:50px" />
                                        <% } 
                                           else
                                           { %>
                                                <img src="img/default100.jpg" alt="Alternate Text" style="max-height:50px" />
                                        <% } %>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted sr-only">Action</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="urunguncelle.aspx?gunid=<% =tablo.Rows[i][0] %>">Güncelle</a>
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
