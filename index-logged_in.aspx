<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index-logged_in.aspx.cs" Inherits="index_logged_in" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>    
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
  </head>
  <body>
      <div id="wrapper">
      <!--Contenedor de las barras de menu configurables-->
      <!--#include virtual = "includes/menu.inc"-->
      <!--separador-->
      <div style="margin-top:50px"></div>
      <!--Contenedor del panel principal-->
      <!--#include virtual = "includes/panel.inc"-->
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