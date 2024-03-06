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
                        <div id="basarili" class="alert alert-success" role="alert" runat="server" visible="false">
                            <strong>Siparişiniz Alındı!</strong> Ödeme tamamlandı ve siparişiniz hazırlanmaya başladı.
                        </div>

                        <div id="basarisiz" class="alert alert-danger" role="alert" runat="server" visible="false">
                            <strong>Bir Hata Oluştu!</strong> Ödeme tamamlanamadı. Lütfen tekrar deneyin.
                        </div>

                        <%
                            int musID = Convert.ToInt16(Session["no"]);
                            cydart.Class.SepetCRUD sepetCRUD = new cydart.Class.SepetCRUD();
                            bool sepet = sepetCRUD.sepetkontrol(musID);

                            if (Session["uye"] == null)
                            {%>
                                <table class="table">
                                    <thead class="thead-primary">
                                        <tr>
                                            <th>Sepete Ürün Eklemek İçin <a href="uyegiris.aspx" style="color:white;">Giriş Yapın</a></th>  
                                        </tr>
                                    </thead>
                                </table>
                            <%}
                            else if (sepet == false)
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
                                            TextBox1.Text = sepettekiler.Rows[i][13].ToString();
                                            %>
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
                                                            <a href="sepet.aspx?id=<% =sepettekiler.Rows[i][9] %>&btn=Azalt">
                                                                <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                                                    <i class="ion-ios-remove"></i>
                                                                </button>
                                                            </a>
                                                        </span>
                                                        <asp:TextBox ID="TextBox1" name="quantity" cssclass="quantity form-control input-number" min="1" max="100" runat="server"></asp:TextBox>
                                                        <span class="input-group-btn ml-2">
                                                            <a href="sepet.aspx?id=<% =sepettekiler.Rows[i][9] %>&btn=Artir">
                                                                <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                                                    <i class="ion-ios-add"></i>
                                                                </button>
                                                            </a>
                                                        </span>
                                                    </div>
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

            <%
                if (sepet == true)
                {
                    System.Data.DataTable dt = sepetCRUD.siplistele(musID);
                    int sipid = Convert.ToInt16(dt.Rows[0][0]);

                    System.Data.DataTable sepettutar = sepetCRUD.tutarliste(sipid);

                    
                    %>
                    <div class="row justify-content-start">
                        <div class="col col-lg-12 col-md-12 mt-5 cart-wrap ftco-animate">
                            <div class="row">
                                <div class="cart-total mb-3 col-md-5">
                                    <h3>Sepet Tutarı</h3>
                                    <p class="d-flex">
                                        <span>Ara Toplam</span>
                                        <span class="t-price">
                                            <% =Convert.ToDouble(sepettutar.Rows[0][2]) %> ₺
                                        </span>
                                    </p>
                                    <p class="d-flex">
                                        <span>Kargo Ücreti</span>
                                        <span>
                                            <% =Convert.ToDouble(sepettutar.Rows[0][3]) %> ₺
                                        </span>
                                    </p>
                                    <hr>
                                    <p class="d-flex total-price">
                                        <span>Genel Toplam</span>
                                        <span>
                                            <% =Convert.ToDouble(sepettutar.Rows[0][4]) %> ₺
                                        </span>
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="Button1" CssClass="btn btn-primary py-3 px-4" runat="server" Text="ÖDEMEYE GİT" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
              <%} %>
        </div>
    </section>
</asp:Content>
