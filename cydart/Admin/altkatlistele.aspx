﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="altkatlistele.aspx.cs" Inherits="cydart.Admin.altkatlistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <h2 class="page-title col-9">Alt Kategori Listesi</h2>
    </div>

    <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
        <strong>Kayıt silindi</strong>
    </div>

    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Kayıt silinemedi
    </div>

    <%
        System.Data.DataTable tablo = new System.Data.DataTable();
        cydart.Class.AltKategoriCRUD altKategoriCRUD = new cydart.Class.AltKategoriCRUD();
        tablo = altKategoriCRUD.listele();
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
                                <th>Alt Kategori ID</th>
                                <th>Alt Kategori Adı</th>
                                <th>Ana Kategori Adı</th>
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
                                    <td>
                                        <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted sr-only">Action</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="altkatguncelle.aspx?gunid=<% =tablo.Rows[i][0] %>">Güncelle</a>
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


    <script type="text/javascript">
        function silmeOnay(altkatNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "altkatlistele.aspx?id=" + altkatNo;
            }
        }
    </script>
</asp:Content>
