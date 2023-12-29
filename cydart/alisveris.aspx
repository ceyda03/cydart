<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="alisveris.aspx.cs" Inherits="cydart.alisveris" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">

            <%
                cydart.Db db = new cydart.Db();
                System.Data.DataTable dt = new System.Data.DataTable();
                System.Data.DataTable tablo = new System.Data.DataTable();
                System.Data.DataTable urun = new System.Data.DataTable();
                db.ac();
                System.Data.SqlClient.SqlCommand komut = new System.Data.SqlClient.SqlCommand("select * from Kategori",db.baglanti);
                System.Data.SqlClient.SqlDataAdapter adp = new System.Data.SqlClient.SqlDataAdapter(komut);
                adp.Fill(dt);
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("select * from AltKategori", db.baglanti);
                System.Data.SqlClient.SqlDataAdapter adap = new System.Data.SqlClient.SqlDataAdapter(cmd);
                adap.Fill(tablo);
                System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand("select * from Urun", db.baglanti);
                System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter(command);
                adapter.Fill(urun);
                db.kapat();
            %>

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Kategoriler</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <%for (int i = 0; i < dt.Rows.Count; i++)
                      {%>
                        <li class="pb-3">
                            <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                                <%=dt.Rows[i][1] %>
                                <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                            </a>
                            <ul class="collapse list-unstyled pl-3">
                                <%for (int j = 0; j < tablo.Rows.Count; j++)
                                  {
                                    if (Convert.ToInt16(tablo.Rows[j][2]) == Convert.ToInt16(dt.Rows[i][0]))
                                    { %>
                                        <li><a class="text-decoration-none" href="#"><%=tablo.Rows[j][1] %></a></li>
                                 <% }
                                  } %>
                            </ul>
                        </li>
                    <%} %>
                </ul>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">All</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">Men's</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="#">Women's</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 pb-4">
                        <div class="d-flex">
                            <select class="form-control">
                                <option>Featured</option>
                                <option>A to Z</option>
                                <option>Item</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <%for (int i = 0; i < urun.Rows.Count; i++)
                      { %>        
                        <div class="col-md-4">
                            <div class="card mb-4 product-wap rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="assets/img/shop_01.jpg">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <ul class="list-unstyled">
                                            <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
                                            <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li>
                                            <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <a href="shop-single.html" class="h3 text-decoration-none"><% =urun.Rows[i][1] %></a>
                                    <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                        <li><% =urun.Rows[i][6] %></li>
                                        <li class="pt-2">
                                            <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                            <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                            <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                            <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                            <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                        </li>
                                    </ul>
                                    <ul class="list-unstyled d-flex justify-content-center mb-1">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                    </ul>
                                    <p class="text-center mb-0"><% =urun.Rows[i][4] %>₺</p>
                                </div>
                            </div>
                        </div>
                    <%} %>
                </div>
                <div div="row">
                    <ul class="pagination pagination-lg justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#" tabindex="-1">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">3</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <!-- End Content -->

</asp:Content>
