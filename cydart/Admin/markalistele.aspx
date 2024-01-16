<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="markalistele.aspx.cs" Inherits="cydart.Admin.markalistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Marka Listesi</h2>

    <script type="text/javascript">
        function silmeOnay(markaNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "markalistele.aspx?id=" + markaNo;
            }
        }
    </script>

    <%
        System.Data.DataTable tablo = new System.Data.DataTable();
        cydart.MarkaCRUD markaCRUD = new cydart.MarkaCRUD();
        tablo = markaCRUD.listele();
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
                                <th>Marka ID</th>
                                <th>Marka Adı</th>
                                <th>Marka Resmi</th>
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
                                                <img src="img/default100.jpg" alt="Alternate Text" style="max-height:50px" />
                                        <% } %>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted sr-only">Action</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="markaguncelle.aspx?gunid=<% =tablo.Rows[i][0] %>">Güncelle</a>
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
