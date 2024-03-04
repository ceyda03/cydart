<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uyegiris.aspx.cs" Inherits="cydart.uyegiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giriş Yap</title>
    <link rel="icon" type="image/x-icon" href="Admin/assets/images/logo.png"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet"/>

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css"/>
    <link rel="stylesheet" href="css/animate.css"/>

    <link rel="stylesheet" href="css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
    <link rel="stylesheet" href="css/magnific-popup.css"/>

    <link rel="stylesheet" href="css/aos.css"/>

    <link rel="stylesheet" href="css/ionicons.min.css"/>

    <link rel="stylesheet" href="css/bootstrap-datepicker.css"/>
    <link rel="stylesheet" href="css/jquery.timepicker.css"/>


    <link rel="stylesheet" href="css/flaticon.css"/>
    <link rel="stylesheet" href="css/icomoon.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body class="goto-here bg-light">
     <section class="ftco-section contact-section">
        <div class="container">
            <div class="row block-9">
                <div class="col-md-6 order-md-last d-flex m-auto">
                    <form id="form1" runat="server" action="#" class="bg-white p-5 contact-form">
                        <div class="row">
                        <h2 class="col-md-8">Giriş Yap</h2>
                        <a href="Admin/giris.aspx" class="col-md-4 text-md-center" style="line-height:50px;">Yönetici Girişi</a>

                        </div>
                        <hr/>
                        <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" TextMode="Email" Placeholder="Email" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Şifre</label>
                            <asp:TextBox ID="TextBox2" CssClass="form-control" TextMode="Password" Placeholder="Şifre"  runat="server"></asp:TextBox>
                        </div>
                        <label>
                            <asp:CheckBox ID="CheckBox1" Value="remember-me" runat="server" />
                            Beni Hatırla
                        </label>                        
                        <div class="row mt-2 mx-auto" style="justify-content: space-between;">
                            <div class="form-group">
                                <asp:Button ID="Button1" CssClass="btn btn-primary py-3 px-5" runat="server" Text="Giriş Yap" OnClick="Button1_Click" />
                            </div>
                            <div class="form-group">
                                <a href="uyesifremiunuttum.aspx">
                                    <input value="Şifremi Unuttum" class="btn btn-outline-primary py-3 px-5"/>
                                </a>
                            </div>
                        </div>
                        <div id="mesaj" class="alert alert-danger" role="alert" runat="server" visible="false">
                            Yanlış email veya şifre
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
