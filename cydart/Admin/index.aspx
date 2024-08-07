﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="cydart.Admin.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Hoş geldin <%=Session["ad"] %></h2>
    
    <%
        cydart.Class.YorumCRUD yorumCRUD = new cydart.Class.YorumCRUD();
        System.Data.DataTable tablo = yorumCRUD.listele();
    %>

    <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title">Yorum / Öneri / Şikayet</strong>
                    <a class="float-right small text-muted" href="yorumlistele.aspx">Tümünü gör</a>
                </div>
                <div class="card-body">
                    <!-- table -->
                    <table class="table datatables" id="dataTable-1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Gönderen Adı</th>
                                <th>Gönderen Email</th>
                                <th>Konu</th>
                                <th>Mesaj</th>
                                <th>İşlemler</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (int i = 0; i < 3; i++)
                              { %>
                                <tr>
                                    <td><% =tablo.Rows[i][0] %></td>
                                    <td><% =tablo.Rows[i][1] %></td>
                                    <td><% =tablo.Rows[i][2] %></td>
                                    <td><% =tablo.Rows[i][3] %></td>
                                    <td><% =tablo.Rows[i][4] %></td>
                                    <td>
                                        <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="text-muted sr-only">Action</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" 
                                               href="index.aspx?cevap=<%if (tablo.Rows[i][3].ToString() == "Şikayet") {%>Şikayet<% }
                                                else if (tablo.Rows[i][3].ToString() == "Öneri") {%>Öneri<% } 
                                                else if (tablo.Rows[i][3].ToString() == "Yorum") {%>Yorum<% } %>&email=<% =tablo.Rows[i][2] %>">Cevapla</a>

                                            <a class="dropdown-item" href="#" onclick="silmeOnay(<% =tablo.Rows[i][0] %>)">Sil</a>
                                        </div>
                                    </td>
                                </tr>
                           <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div> <!-- simple table -->
    </div> <!-- end section -->


    <div class="row">
        <!-- Notification List -->
        <div class="col-md-6 mb-4">
            <div class="card shadow">
                <div class="card-header">
                    <strong class="card-title">Bildirimler</strong>
                    <a class="float-right small text-muted" href="#!">Tümünü gör</a>
                </div>
                <div class="card-body">
                    <div class="list-group list-group-flush my-n3">
                        <div class="list-group-item">
                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <span class="fe fe-box fe-24"></span>
                                </div>
                                <div class="col">
                                    <small><strong>Package has uploaded successfull</strong></small>
                                    <div class="my-0 text-muted small">Package is zipped and uploaded</div>
                                </div>
                                <div class="col-auto">
                                    <small class="badge badge-pill badge-light text-muted">1m ago</small>
                                </div>
                            </div>
                        </div>

                        <div class="list-group-item">
                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <span class="fe fe-download fe-24"></span>
                                </div>
                                <div class="col">
                                    <small><strong>Widgets are updated successfull</strong></small>
                                    <div class="my-0 text-muted small">Just create new layout Index, form, table</div>
                                </div>
                                <div class="col-auto">
                                    <small class="badge badge-pill badge-light text-muted">2m ago</small>
                                </div>
                            </div>
                        </div>

                        <div class="list-group-item">
                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <span class="fe fe-inbox fe-24"></span>
                                </div>
                                <div class="col">
                                    <small><strong>Notifications have been sent</strong></small>
                                    <div class="my-0 text-muted small">Fusce dapibus, tellus ac cursus commodo</div>
                                </div>
                                <div class="col-auto">
                                    <small class="badge badge-pill badge-light text-muted">30m ago</small>
                                </div>
                            </div> <!-- / .row -->
                        </div>
                        <div class="list-group-item">
                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <span class="fe fe-link fe-24"></span>
                                </div>
                                <div class="col">
                                    <small><strong>Link was attached to menu</strong></small>
                                    <div class="my-0 text-muted small">New layout has been attached to the menu</div>
                                </div>
                                <div class="col-auto">
                                    <small class="badge badge-pill badge-light text-muted">1h ago</small>
                                </div>
                            </div>
                        </div> <!-- / .row -->
                    </div> <!-- / .list-group -->
                </div> <!-- / .card-body -->
            </div> <!-- / .card -->
        </div> <!-- / .col-md-3 -->

        <!-- Recent Activity -->
        <div class="col-md-6 mb-4">
            <div class="card timeline">
                <div class="card-header">
                    <strong class="card-title">Son Etkinlikler</strong>
                    <a class="float-right small text-muted" href="#!">Tümünü gör</a>
                </div>
                <div class="card-body">
                    <div class="pb-3 timeline-item item-primary">
                        <div class="pl-5">
                            <div class="mb-1"><strong>@Brown Asher</strong><span class="text-muted small mx-2">Just create new layout Index, form, table</span><strong>Tiny Admin</strong></div>
                            <p class="small text-muted">Creative Design <span class="badge badge-light">1h ago</span>
                            </p>
                        </div>
                    </div>
                    <div class="pb-3 timeline-item item-warning">
                        <div class="pl-5">
                            <div class="mb-3"><strong>@Fletcher Everett</strong><span class="text-muted small mx-2">created new group for</span><strong>Tiny Admin</strong></div>
                            <ul class="avatars-list mb-2">
                                <li>
                                    <a href="#!" class="avatar avatar-sm">
                                        <img alt="..." class="avatar-img rounded-circle" src="./assets/avatars/face-1.jpg">
                                    </a>
                                </li>
                                <li>
                                    <a href="#!" class="avatar avatar-sm">
                                        <img alt="..." class="avatar-img rounded-circle" src="./assets/avatars/face-4.jpg">
                                    </a>
                                </li>
                                <li>
                                    <a href="#!" class="avatar avatar-sm">
                                        <img alt="..." class="avatar-img rounded-circle" src="./assets/avatars/face-3.jpg">
                                    </a>
                                </li>
                            </ul>
                            <p class="small text-muted">Front-End Development <span class="badge badge-light">1h ago</span>
                            </p>
                        </div>
                    </div>
                    <div class="pb-3 timeline-item item-success">
                        <div class="pl-5">
                            <div class="mb-2"><strong>@Kelley Sonya</strong><span class="text-muted small mx-2">has commented on</span><strong>Advanced table</strong></div>
                            <div class="card d-inline-flex mb-2">
                                <div class="card-body bg-light py-2 px-3"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. </div>
                            </div>
                            <p class="small text-muted">Back-End Development <span class="badge badge-light">1h ago</span>
                            </p>
                        </div>
                    </div>
                </div> <!-- / .card-body -->
            </div> <!-- / .card -->
        </div> <!-- / .col-md-6 -->
    </div> <!-- / .row -->

    <script type="text/javascript">
        function silmeOnay(yorumNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "index.aspx?id=" + yorumNo;
            }
        }
    </script>

    <script>
        const exampleModal = document.getElementById('exampleModal')
        if (exampleModal) {
            exampleModal.addEventListener('show.bs.modal', event => {
                // Button that triggered the modal
                const button = event.relatedTarget
                // Extract info from data-bs-* attributes
                const recipient = button.getAttribute('data-bs-whatever')
                // If necessary, you could initiate an Ajax request here
                // and then do the updating in a callback.

                // Update the modal's content.
                const modalTitle = exampleModal.querySelector('.modal-title')
                const modalBodyInput = exampleModal.querySelector('.modal-body input')

                modalTitle.textContent = `New message to ${recipient}`
                modalBodyInput.value = recipient
            })
        }
    </script>
</asp:Content>
