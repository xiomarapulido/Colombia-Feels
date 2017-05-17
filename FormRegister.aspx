<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormRegister.aspx.cs" Inherits="FormRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro</title>
    <link href="Scripts/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="js/bootstrap.min.js"></script>
    <script src="Scripts/js/jquery-1.11.3.min.js"></script>
     <link href="CSS/StandardStyle.css" rel="stylesheet" />
    <style>
        .img-responsive {
            margin: 0 auto;
        }
 
        html, body {
            background: white;
        }
 
        #form {
             background: #ecf0f1;
            box-shadow: 5px 5px 15px #555;
                border-radius: 5px;
                outline: 0;
                -moz-outline-style: none;
                border: 1px solid #5199B0;
        }
 
 
        input, button, label {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            font-size: 15px;
            font-weight: 500;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
 
            input[type=text], input[type=password] {
                padding: 0 10px;
                width: 100%;
                margin: 0px auto;
                height: 32px;
                color: #bbb;
                text-shadow: 1px 1px 1px black;
                background: rgba(0, 0, 0, 0.16);
                border: 0;
                border-radius: 12px;
                -webkit-box-shadow: inset 0 1px 4px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.06);
                box-shadow: inset 0 1px 4px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.06);
            }
 
                input[type=text]:focus, input[type=password]:focus {
                    color: white;
                    background: rgba(0, 0, 0, 0.1);
                    outline: 0;
                }
 
        label {
            float: left;
            width: 100px;
            line-height: 40px;
            padding-right: 10px;
            font-weight: 100;
            text-align: right;
            letter-spacing: 1px;
        }
 
 
        #enviar {
            text-align: center;
            margin-top: 7%;
            margin-bottom: 5%;
        }
    </style>
    <script>
        $(document).ready(function () {
           
            $("#Txt_Correo").on("blur", function () {
                var correo = $(this).val();
                if (!$.ValidarEmail(correo)) {
                    alert("Correo No Valido!");
                }
            });

            $('#TxtContraseña').click(function () {

                if ($("#TxtContraseña").val().length != 9) {
                    alert("La contraseña debe tener 9 caracteres");
                    return false;
                }
            });
        });

        function sololetras(e) {
            key = e.keyCode || e.wich;
            teclado = String.fromCharCode(key);
            letras = "qwertyuiopasdfghjklñzxcvbnm QWERTYUIOPASDFGHJKLÑZXCVBNM";

            especiales = "8-37-46-38";
            teclado_especial = false;
            for (var i in especiales) {
                if (key == especiales[i]) {
                    teclado_especial = true;
                }


            }
            if (letras.indexOf(teclado) == -1 && !teclado_especial) {
                return false;
            }
        }

        function Solonumeros(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        $.ValidarEmail = function (correo) {
            var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
            if (regex.test($.trim(correo))) {
                return true;
                //alert('Correo validado');
            }
            else {
                return false;
                //alert('La direccion de correo no es valida');
            }
        };


    </script>

</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
            <div class="col-md-12" style="text-align: right;">
            <br />
                <strong>
                    <button id="PaginaPrincipal" value="" class="btn btn-sm btn-default" style="margin-bottom: 0%; color: #00698C">
                        <a href="IndexLogin.aspx">Página Principal</a>
                    </button>
                </strong>
            </div>
            
            <div class="col-md-4">
            </div>
            <div id="form" class="col-md-4" >
                <font color="#00698c">
                    <h4>Nombres:</h4>
                    <asp:TextBox id="Txt_Nombres" runat="server" onkeypress="return sololetras(event)" onpaste="return false" />
 
                    <h4>Apellidos:</h4>
                    <asp:TextBox id="Txt_Apellidos" runat="server" onkeypress="return sololetras(event)" onpaste="return false"/>
 
 
                    <h4>Documento de identidad:</h4>
                    <asp:TextBox id="Txt_Documento" runat="server" onkeypress="return Solonumeros(event)" onpaste="return false" />
 
                    <h4>Telefono celular:</h4>
                    <asp:TextBox id="Txt_Telefono" runat="server" onkeypress="return Solonumeros(event)" onpaste="return false" />
 
                    <h4>Correo electronico:</h4>
                    <asp:TextBox id="Txt_Correo" runat="server" />
 
                    <h4>Contraseña:</h4>
                    <asp:TextBox id="TxtContraseña" runat="server" type="password" name="password"  />
 
                    <h4>Confirmar contraseña:</h4>
                    <asp:TextBox id="TxtContraseña2" runat="server" type="password" name="password"  />
 
                    
                    <asp:HiddenField ID="HiddEstado" runat="server" Value="1"></asp:HiddenField>
 
                    <div id="enviar"><asp:Button id="BtnEnviar" Text="Enviar" runat="server" class="login-button"/> </div>
                    <asp:Label ID="LblMensaje" runat="server"></asp:Label>
                     
           </font>
            </div>
            <div class="col-md-4">
            </div>
 
        </div>
    </form>
</body>
</html>
