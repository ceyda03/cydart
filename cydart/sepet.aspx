<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="cydart.sepet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Ana Sayfa /</a></span> <span>Sepet</span></p>
                    <h1 class="mb-0 bread">Sepet</h1>
                </div>
            </div>
        </div>
    </div>


    <section class="ftco-section ftco-cart">
        <div class="container">
            <div class="row">
                <div class="col-md-12 ftco-animate">
                    <div class="cart-list">
                        <%
                            int musID = Convert.ToInt16(Session["no"]);
                            cydart.Class.SepetCRUD sepetCRUD = new cydart.Class.SepetCRUD();
                            bool sepet = sepetCRUD.sepetkontrol(musID);

                            if (sepet == false)
                            {%>
                                <table class="table">
                                    <thead class="thead-primary">
                                        <tr>
                                            <th>Sepetinizde Ürün Bulunmuyor</th>  
                                        </tr>
                                    </thead>
                                </table>
                            <%}
                            else
                            {%>
                                <table class="table">
                                    <thead class="thead-primary">
                                        <tr class="text-center">
                                            <th>&nbsp;</th>
                                            <th>&nbsp;</th>
                                            <th>Ürün Adı</th>
                                            <th>Fiyat</th>
                                            <th>Adet</th>
                                            <th>Toplam</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        System.Data.DataTable table = sepetCRUD.siplistele(musID);
                                        int sipID = Convert.ToInt16(table.Rows[0][0]);

                                        System.Data.DataTable sepettekiler = sepetCRUD.sepetliste(sipID);
                                        for (int i = 0; i < sepettekiler.Rows.Count; i++)
                                        {
                                            TextBox1.Text = sepettekiler.Rows[i][13].ToString();%>
                                            <tr class="text-center">
                                                <td class="product-remove"><a href="sepet.aspx?urunsil=<% =sepettekiler.Rows[i][9] %>"><span class="ion-ios-close"></span></a></td>

                                                <td class="image-prod">
                                                    <img src="Admin/<% =sepettekiler.Rows[i][8] %>" height="100"/>
                                                </td>

                                                <td class="product-name">
                                                    <h3><% =sepettekiler.Rows[i][1] %></h3>
                                                </td>

                                                <td class="price"><% =String.Format("{0:0.00}", sepettekiler.Rows[i][5]) %> ₺</td>

                                                <td class="quantity">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-btn mr-2">
                                                            <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                                                <i class="ion-ios-remove"></i>
                                                            </button>
                                                        </span>
                                                        <asp:TextBox ID="TextBox1" name="quantity" cssclass="quantity form-control input-number" min="1" max="100" runat="server"></asp:TextBox>
                                                        <span class="input-group-btn ml-2">
                                                            <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                                                <i class="ion-ios-add"></i>
                                                            </button>
                                                        </span>
                                                    </div>

                                                    <%--<div class="input-group mb-3">
                                                        <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                                                    </div>--%>
                                                </td>

                                                <td class="total"><% =String.Format("{0:0.00}", sepettekiler.Rows[i][14]) %> ₺</td>
                                            </tr>
                                      <%}%>
                                    </tbody>
                                </table>
                          <%}%>
                    </div>
                </div>
            </div>
            <div class="row justify-content-start">
                <div class="col col-lg-12 col-md-12 mt-5 cart-wrap ftco-animate">
                    <div class="row">
                        <div class="cart-total mb-3 col-md-5">
                            <h3>Sepet Tutarı</h3>
                            <p class="d-flex">
                                <span>Ara Toplam</span>
                                <span class="t-price">$20.60</span>
                            </p>
                            <p class="d-flex">
                                <span>Kargo Ücreti</span>
                                <span>$0.00</span>
                            </p>
                            <p class="d-flex">
                                <span>İndirim</span>
                                <span>$3.00</span>
                            </p>
                            <hr>
                            <p class="d-flex total-price">
                                <span>Genel Toplam</span>
                                <span>$17.60</span>
                            </p>
                        </div>
                        <div class="col-md-4">
                            <p>Lütfen ödeme sayfasına gitmeden önce "Sepeti Güncelle" butonuna tıklayınız.</p>
                            <asp:Button ID="Button1" CssClass="btn btn-primary py-3 px-4 mb-3" runat="server" Text="SEPETİ GÜNCELLE" />
                            <p class="text-center"><a href="odeme.aspx" class="btn btn-primary py-3 px-4">ÖDEMEYE GİT</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        $(document).ready(function () {
            total();

            $('.quantity-right-plus').on('click', function (e) {
                e.preventDefault();
                var quantityField = $(this).closest("td").find(".quantity");
                var quantity = parseInt(quantityField.val());
                quantityField.val(quantity + 1);

                rowtotal($(this).closest("tr"));
            });

            $('.quantity-left-minus').on('click', function(e) {
                e.preventDefault();
                var quantityField = $(this).closest("td").find(".quantity");
                var quantity = parseInt(quantityField.val());

                if (quantity > 1) {
                    quantityField.val(quantity - 1);
                }

                rowtotal($(this).closest("tr"));
            });


            function rowtotal($row) {
                var quantity = parseInt($row.find("#<%=TextBox1.ClientID %>").val());
                var price = parseInt($row.find(".price").text());
                var total = quantity * price;
                $row.find(".total").text(total.toFixed(2) + " ₺");
                total();
            };

            function total() {
                var total = 0;
                $(".total").each(function () {
                    total += parseInt($(this).text()) || 0;
                });
                $(".t-price").text(total.toFixed(2) + " ₺");
            };
        });
    </script>
</asp:Content>
