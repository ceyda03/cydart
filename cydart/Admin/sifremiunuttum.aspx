<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sifremiunuttum.aspx.cs" Inherits="cydart.Admin.sifremiunuttum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Şifremi Unuttum</title>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="css/feather.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled>
</head>
<body class="light">
    <div class="wrapper vh-100">
        <div class="row align-items-center h-100">
            <form id="form1" class="col-lg-3 col-md-4 col-10 mx-auto text-center" runat="server">
                <div class="mx-auto text-center my-4">
                    <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="./index.html">
                        <img src="assets/images/logo.svg" class="navbar-brand-img brand-md" alt="Alternate Text" />
                    </a>
                    <h2 class="my-3">Şifre Yenileme</h2>
                </div>
                <p class="text-muted">Email adresini gir ve sana yeni şifreni yollayalım.</p>
                <div class="form-group">
                    <label for="inputEmail" class="sr-only">Email</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control form-control-lg" placeholder="Email adresi" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="Gönder" OnClick="Button1_Click" />
                <p class="mt-5 mb-3 text-muted">© 2020</p>
                <div id="yollandi" class="alert alert-success" role="alert" runat="server" visible="false">
                    Yeni şifreniz mailinize yollandı!
                </div>
                <div id="hata" class="alert alert-danger" role="alert" runat="server" visible="false">
                    Bu email adresi sistemde kayıtlı değil.
                </div>
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
