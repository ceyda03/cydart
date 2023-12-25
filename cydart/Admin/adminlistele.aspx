<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="adminlistele.aspx.cs" Inherits="cydart.Admin.adminlistele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Admin Listesi</h2>

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
                                <th>Ad</th>
                                <th>Soyad</th>
                                <th>Yetki</th>
                                <th>İşlemler</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>368</td>
                                <td>Imani Lara</td>
                                <td>(478) 446-9234</td>
                                <td>Asset Management</td>
                                <td>Borland</td>
                                <td>
                                    <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-muted sr-only">Action</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">Güncelle</a>
                                        <a class="dropdown-item" href="#">Sil</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div> <!-- simple table -->
    </div> <!-- end section -->
</asp:Content>
