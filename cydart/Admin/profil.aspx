﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="profil.aspx.cs" Inherits="cydart.Admin.profil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="h3 mb-4 page-title">Profil</h2>
    <div class="row mt-5 align-items-center">
        <div class="col-md-3 text-center mb-5">
            <div class="avatar avatar-xl">
                <img src="<%=Session["resim"] %>" alt="..." class="avatar-img rounded-circle">
            </div>
        </div>
        <div class="col">
            <div class="row align-items-center">
                <div class="col-md-7">
                    <h4 class="mb-1"><%=Session["ad"]%> <%=Session["soyad"] %></h4>
                    <p class="small mb-3"><span class="badge badge-primary">
                        <%if (Convert.ToInt16(Session["yetki"]) == 0)
                          {%>
                            Süper Admin
                        <%} 
                          else if (Convert.ToInt16(Session["yetki"]) == 1)
                          {%>
                            Admin
                        <%} 
                          else if (Convert.ToInt16(Session["yetki"]) == 2)
                          {%>
                            Editör
                        <%} %></span>
                    </p>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-7">
                    <p class="text-muted"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit nisl ullamcorper, rutrum metus in, congue lectus. In hac habitasse platea dictumst. Cras urna quam, malesuada vitae risus at, pretium blandit sapien. </p>
                </div>
                <div class="col">
                    <p class="small mb-0 text-muted">Nec Urna Suscipit Ltd</p>
                    <p class="small mb-0 text-muted">P.O. Box 464, 5975 Eget Avenue</p>
                    <p class="small mb-0 text-muted"><%=Session["tel"] %></p>
                </div>
            </div>
        </div>
    </div>

    <div class="row my-4">
        <div class="col-md-4">
            <div class="card mb-4 shadow">
                <div class="card-body my-n3">
                    <div class="row align-items-center">
                        <div class="col-3 text-center">
                            <span class="circle circle-lg bg-light">
                                <i class="fe fe-user fe-24 text-primary"></i>
                            </span>
                        </div> <!-- .col -->
                        <div class="col">
                            <a href="#">
                                <h3 class="h5 mt-4 mb-1">Kişisel</h3>
                            </a>
                            <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit nisl ullamcorper, rutrum metus in, congue lectus.</p>
                        </div> <!-- .col -->
                    </div> <!-- .row -->
                </div> <!-- .card-body -->
                <div class="card-footer">
                    <a href="ayarlar.aspx" class="d-flex justify-content-between text-muted"><span>Hesap Ayarları</span><i class="fe fe-chevron-right"></i></a>
                </div> <!-- .card-footer -->
            </div> <!-- .card -->
        </div> <!-- .col-md-->

        <div class="col-md-4">
            <div class="card mb-4 shadow">
                <div class="card-body my-n3">
                    <div class="row align-items-center">
                        <div class="col-3 text-center">
                            <span class="circle circle-lg bg-light">
                                <i class="fe fe-shield fe-24 text-primary"></i>
                            </span>
                        </div> <!-- .col -->
                        <div class="col">
                            <a href="#">
                                <h3 class="h5 mt-4 mb-1">Güvenlik</h3>
                            </a>
                            <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit nisl ullamcorper, rutrum metus in, congue lectus.</p>
                        </div> <!-- .col -->
                    </div> <!-- .row -->
                </div> <!-- .card-body -->
                <div class="card-footer">
                    <a href="#" class="d-flex justify-content-between text-muted"><span>Güvenlik Ayarları</span><i class="fe fe-chevron-right"></i></a>
                </div> <!-- .card-footer -->
            </div> <!-- .card -->
        </div> <!-- .col-md-->

        <div class="col-md-4">
            <div class="card mb-4 shadow">
                <div class="card-body my-n3">
                    <div class="row align-items-center">
                        <div class="col-3 text-center">
                            <span class="circle circle-lg bg-light">
                                <i class="fe fe-bell fe-24 text-primary"></i>
                            </span>
                        </div> <!-- .col -->
                        <div class="col">
                            <a href="#">
                                <h3 class="h5 mt-4 mb-1">Bildirimler</h3>
                            </a>
                            <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit nisl ullamcorper, rutrum metus in, congue lectus.</p>
                        </div> <!-- .col -->
                    </div> <!-- .row -->
                </div> <!-- .card-body -->
                <div class="card-footer">
                    <a href="" class="d-flex justify-content-between text-muted"><span>Bildirim Ayarları</span><i class="fe fe-chevron-right"></i></a>
                </div> <!-- .card-footer -->
            </div> <!-- .card -->
        </div> <!-- .col-md-->
    </div> <!-- .row-->
</asp:Content>
