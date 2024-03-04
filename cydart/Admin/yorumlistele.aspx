<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="yorumlistele.aspx.cs" Inherits="cydart.Admin.yorumliste" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h2 class="page-title">Yorum / Öneri / Şikayet Listesi</h2>

    <div id="basarili" class="alert alert-success" role="alert" visible="false" runat="server">
        <strong>Kayıt silindi</strong>
    </div>

    <div id="basarisiz" class="alert alert-warning" role="alert" visible="false" runat="server">
        <strong>Hata!</strong> Kayıt silinemedi
    </div>

    <div id="gonderildi" class="alert alert-success" role="alert" visible="false" runat="server">
        <strong>Mail gönderildi</strong>
    </div>

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
                            <%for (int i = 0; i < tablo.Rows.Count; i++)
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

    <script type="text/javascript">
        function silmeOnay(yorumNo) {
            var silmeOnay = confirm("Silme işlemi geri alınamaz. Silmek istediğinizden emin misiniz?");
            if (silmeOnay) {
                window.location.href = "yorumlistele.aspx?id=" + yorumNo;
            }
        }

<%--        function cevapla(element) {
            document.getElementById("cevapla").style.display = "block";

            var mail = element.getAttribute("data-alici-mail");
            document.getElementById("<% =TextBox1.ClientID %>").value = mail;
        }

        function respCancel() {
            document.getElementById("cevapla").style.display = "none";
            document.getElementById("<%= TextBox2.ClientID %>").value = "";
            document.getElementById("<%= TextBox3.ClientID %>").value = "";
        }

        function respond() {
            var alici = document.getElementById("<%= TextBox1.ClientID %>").value;
            var baslik = document.getElementById("<%= TextBox2.ClientID %>").value;
            var mesaj = document.getElementById("<%= TextBox3.ClientID %>").value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "yorumlistele.aspx", true);
            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");

            xhr.onload = function () {
                if (xhr.status === 200) {
                    // success code
                } else {
                    // error code
                }
            };

            xhr.onerror = function () {
                // error code
            };

            xhr.send(JSON.stringify({ alici: alici, baslik: baslik, mesaj: mesaj }));
        };--%>
    </script>
</asp:Content>
