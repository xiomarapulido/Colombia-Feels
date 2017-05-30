<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lista_actividades.aspx.cs" Inherits="lista_actividades" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Colombia Feels [Lista de actividades]</title>

    <!-- Bootstrap Core CSS -->
    <link href="Scripts/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Menu CSS -->
    <link href="CSS/menu.css" rel="stylesheet">

    <!-- Estilos -->
    <link href="CSS/estilos.css" rel="stylesheet">

    <!-- jQuery -->
    <script src="Scripts/js/jquery-1.11.3.min.js"></script>

    <!-- Custom Fonts -->
    <link href="CSS/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
    <body>
        <div id="wrapper">
        <!--Contenedor de las barras de menu configurables-->
        <!-- Configuracion de los permisos y vistas -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Desplegar navegación</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index-logged_in.aspx">
                    <img src="img/logo-temp.png" title="Colombia Feels" alt="Colombia Feels" style="margin-top: -15px; height: 50px;" class="img-rounded" />
                </a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <asp:PlaceHolder ID="nombreUser" runat="server" /> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                            <a onclick="#">
                                <i class="fa fa-user fa-fw"></i>Opciones del usuario
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <i class="fa fa-sign-out fa-fw"></i>Cerrar sesión
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>


            <!-- Configuracion de los permisos y vistas -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="index-logged_in.aspx"><i class="fa fa-trophy fa-fw"></i> Mis insignias</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-cubes fa-fw"></i> Caja de herramientas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <!--Listar modulos-->
                                <asp:PlaceHolder ID="listaModulos" runat="server" /> 
                            </ul>       
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-line-chart fa-fw"></i> Mi progreso</a>
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-users fa-fw"></i> Foros de discusión</a>
                        </li>
                        <li>
                            <a href="game.aspx"><i class="fa fa-gamepad fa-fw"></i> Mini juego</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <!--separador-->
        <div style="margin-top: 20px"></div>
        <!--Contenedor del panel principal-->
        <!-- Panel principal del Colombia Feels 1.0 -->
        <!-- vista de cada uno de los modulos configurados en el panel-->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Lista de actividades <asp:PlaceHolder ID="tituloModulo" runat="server" /></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <asp:PlaceHolder ID="descripModulo" runat="server" /> 
                            </h4>                           
                        </div>
                        <!-- .panel-heading -->
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <!--Aca se ubican las actividades de los modulos-->
                                <asp:PlaceHolder ID="actividadesModulo" runat="server" />
                            </div>
                        </div>
                        <!-- .panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
    </div>
        <nav class="navbar navbar-default navbar-form navbar-collapse">
            <div class="container-fluid">
                <p class="navbar-text">
                    | Copyright © 2017 Colombia Feels |
                </p>
                <p class="navbar-text">
                    | Version: 1.1.0 |
                </p>
                <p class="navbar-text pull-right">
                    <a href="http://www.centrodememoriahistorica.gov.co/" class="navbar-link" target="_blank">| Centro Nacional de Memoria Histórica |</a>
                </p>
            </div>
        </nav>
    <!-- Bootstrap Core JavaScript -->
    <script src="Scripts/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>

    <!-- Menu JavaScript -->
    <script src="Scripts/menu.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Scripts/panel.js"></script>


    </body>
</html>