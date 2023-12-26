<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="cydart.Admin.girisyap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="favicon.ico" />
    <title>Giriş Yap</title>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="css/simplebar.css" />
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
    <!-- Icons CSS -->
    <link rel="stylesheet" href="css/feather.css" />
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="css/daterangepicker.css" />
    <!-- App CSS -->
    <link rel="stylesheet" href="css/app-light.css" id="lightTheme" />
    <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled />
</head>
<body class="light">
    <div class="wrapper vh-100">
        <div class="row align-items-center h-100">
            <form class="col-lg-3 col-md-4 col-10 mx-auto text-center" id="form1" runat="server">
                <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="./index.aspx">
                    <img src="assets/images/logo.svg" class="navbar-brand-img brand-md" alt="Alternate Text" />
                </a>
                <h1 class="h6 mb-3">Giriş Yap</h1>
                <div class="form-group">
                    <label for="inputEmail" class="sr-only">Email</label>
                    <asp:TextBox ID="TextBox1" TextMode="Email" CssClass="form-control form-control-lg" Placeholder="Email" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="sr-only">Şifre</label>
                    <asp:TextBox ID="TextBox2" TextMode="Password" CssClass="form-control form-control-lg" Placeholder="Password" runat="server"></asp:TextBox>
                </div>
                <div class="checkbox mb-3">
                    <label>
                        <asp:CheckBox ID="CheckBox1" Value="remember-me" runat="server" />
                        Beni Hatırla
                    </label>
                </div>
                <asp:Button ID="Button1" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Giriş Yap" OnClick="Button1_Click" />
                <div id="mesaj" runat="server"></div>
                <p class="mt-5 mb-3 text-muted">© 2020</p>
            </form>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/simplebar.min.js"></script>
    <script src='js/daterangepicker.js'></script>
    <script src='js/jquery.stickOnScroll.js'></script>
    <script src="js/tinycolor-min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/apps.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag()
        {
        dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'UA-56159088-1');
    </script>
</body>
</html>
