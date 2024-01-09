<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="cydart.iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">Bize Ulaşın</h1>
            <p>
                Aşağıdaki formu doldurarak her türlü öneri, yorum ve şikayetinizi bize iletebilirsiniz.
            </p>
        </div>
    </div>

    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form class="col-md-9 m-auto" method="post" role="form">
                <div class="row">
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">Ad</label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control mt-1" placeholder="Ad" runat="server"></asp:TextBox>
                        <%--<input type="text" class="form-control mt-1" id="name" name="name" placeholder="Name">--%>
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">Email</label>
                        <asp:TextBox ID="TextBox2" CssClass="form-control mt-1" placeholder="Email" runat="server"></asp:TextBox>
                        <%--<input type="email" class="form-control mt-1" id="email" name="email" placeholder="Email">--%>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputsubject">Konu</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-select" runat="server"></asp:DropDownList>
                    <%--<input type="text" class="form-control mt-1" id="subject" name="subject" placeholder="Subject">--%>
                </div>
                <div class="mb-3">
                    <label for="inputmessage">Mesaj</label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control mt-1" placeholder="Mesajınız" runat="server"></asp:TextBox>
                    <%--<textarea class="form-control mt-1" id="message" name="message" placeholder="Message" rows="8"></textarea>--%>
                </div>
                <div class="row">
                    <div class="col-8 mt-2">
                        <div id="yorumyollandi" class="alert alert-success alert-dismissible fade show" role="alert" runat="server" visible="false">
                          <strong>Geri bildiriminiz için teşekkürler!</strong> Mesajınız sitemize ulaştı
                          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </div>
                    <div class="col text-end mt-2">
                        <asp:Button ID="Button1" CssClass="btn btn-success btn-lg px-3" runat="server" Text="Gönder" OnClick="Button1_Click" />
                        <%--<button type="submit" class="btn btn-success btn-lg px-3">Let’s Talk</button>--%>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Contact -->
</asp:Content>
