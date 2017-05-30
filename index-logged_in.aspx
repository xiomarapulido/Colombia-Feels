<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index-logged_in.aspx.cs" Inherits="index_logged_in" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Colombia Feels [Inicio]</title>

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

    <!--Funcion al cargar el documento, cargar el slider-->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sliderInsignias").addClass("carousel slide");
        });
    </script>
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
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i> Mi progreso <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <asp:PlaceHolder ID="listaProgresoModulo" runat="server" />
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>
                        <asp:PlaceHolder ID="nombreUser" runat="server" />
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                            <a onclick="">
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
             <!-- /.dropdown -->


            <!-- Configuracion de los permisos y vistas -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#"><i class="fa fa-trophy fa-fw"></i> Mis insignias</a>
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
                    <h1 class="page-header">Bienvenidos a Colombia Feels</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <!-- /.col-lg-12 -->
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Un viaje por la memoria histórica
                        </div>
                        <div class="panel-body">
                            <p>
                                Caja de herramientas: Un viaje por la memoria histórica. "Aprender la paz y desaprender
                                la guerra”,
                        un instrumento pedagógico creado y consolidado entre el Centro Nacional de Memoria Histórica
                                y el Ministerio de Educación Nacional
                        y apoyada por la Agencia de los Estados Unidos para el Desarrollo Internacional (USAID)
                                y
                                  de la Organización Internacional para
                        las Migraciones (OIM), con el que se busca reconocer al sector educativo como un vehículo
                                fundamental en la construcción de ciudadanía
                        y consciente de las afectaciones del conflicto armado.
                            </p>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
                <!-- /.col-lg-12 -->
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Insignias conseguidas
                        </div>
                        <div class="panel-body">
                            <div id="sliderInsignias" data-ride="carousel">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <!--Cada clase item representa un modulo de la caja de herramientas-->
                                    <asp:PlaceHolder ID="verModulos" runat="server" />                                                                        
                                    <!--fin del carrusel inner-->
                                </div>
                                <!-- Controles de derecha y izquierda -->
                                <a class="left carousel-control" href="#sliderInsignias" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#sliderInsignias" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                                <!--fin del carrusel slide-->
                            </div>
                            <!--fin del panel body-->
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
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
                <a href="http://www.centrodememoriahistorica.gov.co/" class="navbar-link" target="_blank">
                    | Centro Nacional de Memoria Histórica |</a>
            </p>
        </div>
    </nav>
    <!-- Bootstrap Core JavaScript -->
    <script src="Scripts/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>

    <!-- Menu JavaScript -->
    <script src="Scripts/menu.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Scripts/panel.js"></script>

    <!-----------------------Div efecto de cargando en el boby------------------------------>
    <div class="cargando">
        <i class="fa fa-cog fa-spin fa-5x fa-fw"></i>
        <span class="sr-only">Cargando...</span>
        <!-- Coloque en la parte inferior de la página -->
    </div>

    <!-- *******************************************Div donde se cargan la ventana de contraseña usuarios*************************************** -->
    <!-- Modal -->
    <div class="modal fade" id="cargarPerfil" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Perfil de usuario</h4>
                </div>
                <div class="modal-body">
                    <div id="actuaPerfil" title="Detalles del usuario">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
</body>
</html>