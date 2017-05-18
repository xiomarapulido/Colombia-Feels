<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndexLogin.aspx.cs" Inherits="IndexLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/StandardStyle.css" rel="stylesheet" />
    <link href="Scripts/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="js/bootstrap.min.js"></script>
    <script src="Scripts/js/jquery-1.11.3.min.js"></script>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-12 text-center">
                <img src="img/logo-temp.png" title="Colombia Feels" alt="Colombia Feels" style="margin-top: -15px; height:50px;" class="img-rounded"/>        
            </div>
            <div class="col-md-12">
                <p>
                    <asp:Label Text="" ID="lblLoginError" runat="server" />
                </p>
                <div class="login-wrap">

                    <div class="form">

                        <input id="TxtUsuario" type="text" placeholder="Correo" name="un" runat="server" />
                        <input type="password" name="pw" id="TxtContrasena" placeholder="Contraseña" runat="server" />
                        <asp:Button Text="Iniciar Sesion" ID="BtnIniciar" runat="server" class="login-button" OnClick="BtnIniciar_Click"
                            />
                    </div>
                </div>
                <div class="col-md-12">
                
                    <h6 style="text-align: center; color: #00698c"><a href="FormRegister.aspx">Registrarse</a>
                    </h6>
          
            </div>
            </div>
            <div class="col-md-12">
                <footer>
                    <h6 style="margin-top: 9%; text-align: center; color: #00698c">Copyright © 2017 | Xiomara Andrea Pulido| Abel Felipe Chaux Gutierrez | John Alvaro Ramírez Murcia
                    </h6>
                </footer>
            </div>
        </div>
    </form>
</body>
</html>
