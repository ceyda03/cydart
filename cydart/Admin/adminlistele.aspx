﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="adminlistele.aspx.cs" Inherits="cydart.Admin.adminlistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Admin Listesi</h2>

    <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
        <strong>Kayıt silindi</strong>
    </div>

    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Kayıt silinemedi
    </div>

    <%
        System.Data.DataTable tablo = new System.Data.DataTable();
        cydart.Class.AdminCRUD adminCRUD = new cydart.Class.AdminCRUD();
        tablo = adminCRUD.tumliste();
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
                                <th>No</th>
                                <th>Fotoğraf</th>
                                <th>Kullanıcı Adı</th>
                                <th>Ad</th>
                                <th>Soyad</th>
                                <th>Email</th>
                                <th>Telefon</th>
                                <%--<th>Şifre</th>--%>
                                <th>Yetki</th>
                                <th>İşlemler</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (int i = 0; i < tablo.Rows.Count; i++)
                              {
                              %>
                                <tr>
                                    <td><% =tablo.Rows[i][0] %></td>
                                    <td>
                                        <%
                                            if (tablo.Rows[i][8].ToString() != "") 
                                            { %> 
                                                <img src="<% =tablo.Rows[i][8] %>" style="max-height:50px" />
                                         <% }  
                                            else
                                            { %>
                                                <img src="img/default100.jpg" style="max-height:50px" />
                                         <% }
                                        %>
                                    </td>
                                    <td><% =tablo.Rows[i][1] %></td>
                                    <td><% =tablo.Rows[i][2] %></td>
                                    <td><% =tablo.Rows[i][3] %></td>
                                    <td><% =tablo.Rows[i][4] %></td>
                                    <td><% =tablo.Rows[i][5] %></td>
                                    <%--<td><% =tablo.Rows[i][6] %></td>--%>
                                    <td><% =tablo.Rows[i][7] %></td>
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
        </div> <!-- simple table -->
    </div> <!-- end section -->

    
    <script type="text/javascript">
        function silmeOnay(adminNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "adminlistele.aspx?id=" + adminNo;
            }
        }
    </script>
</asp:Content>
