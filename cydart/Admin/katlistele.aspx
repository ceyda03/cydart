<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="katlistele.aspx.cs" Inherits="cydart.Admin.katlistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Kategori Listesi</h2>

    <%
        System.Data.DataTable tablo = new System.Data.DataTable();
        cydart.KategoriCRUD kategoriCRUD = new cydart.KategoriCRUD();
        tablo = kategoriCRUD.listele();
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
                                <th>Kategori ID</th>
                                <th>Kategori Adı</th>
                                <th>Kategori Resmi</th>
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
                                    <td>
                                        <% if (tablo.Rows[i][2].ToString() != "")
                                           { %>
                                                <img src="<% =tablo.Rows[i][2] %>" alt="Alternate Text" style="max-height:50px" />
                                        <% } 
                                           else
                                           { %>
                                                <img src="#" alt="Alternate Text" style="max-height:50px" />
                                        <% } %>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted sr-only">Action</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="katguncelle.aspx?gunid=<% =tablo.Rows[i][0] %>">Güncelle</a>
                                            <a class="dropdown-item" href="katlistele.aspx?id=<% =tablo.Rows[i][0] %>">Sil</a>
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
