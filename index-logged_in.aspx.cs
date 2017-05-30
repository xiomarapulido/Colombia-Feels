using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class index_logged_in : System.Web.UI.Page
{
    #region Events
    
    protected void Page_Load(object sender, EventArgs e)
    {
        var nameSessi = Convert.ToString(Session["nombreUsuario"]);
        var idSessi = Convert.ToInt32(Session["controlID"]);

        Globals.s_Name = nameSessi;
        Globals.s_Id = idSessi;

        nombreUser.Controls.Add(new Literal { Text = nameSessi.ToString() });

        if (!this.IsPostBack)
        {
            cargarModulosInsginias();
            listarModulos();
            listaProgreso();

        }
    }

    #endregion

    #region Methods

    public static class Globals
    {
        public static String s_Name;
        public static Int32 s_Id;
    }

    protected void cargarModulosInsginias()
    {
        try
        {
            var idPersona = Globals.s_Id;  //Idusuario del inicio de sesion

            DataTable dtModulos = new DataTable();  //Tabla para los modulos
            DataTable dtActividadPersonas = new DataTable(); //Consulta actividad por persona
            DataTable dtInsignias = new DataTable();  //Tabla para ingignias

            ProyectADO ProyectADO = new ProyectADO();  //Clase controlador

            dtModulos = ProyectADO.Modulos(0, 1, "", "", 1);  //Lista de modulos

            dtActividadPersonas = ProyectADO.ActividadPersonas(1, idPersona);  //Consulta de actividad por persona
            

            if (dtModulos.Rows.Count > 0)
            {
                var inicio = 0;

                StringBuilder html = new StringBuilder();

                foreach (DataRow row in dtModulos.Rows)
                {
                    var idModulo = Convert.ToInt32(row["Id_Modulo"]); //Id del modulo
                    var nombreModulo = row["Nombre"];
                    var descripModulo = row["Descripcion"];

                    //Nuevo item del carrusel
                    if ( inicio == 0 ) //Se define active para el primer item del resto solo item
                    {
                        html.Append("<div class='item active'>");
                    }
                    else
                    {
                        html.Append("<div class='item'>");
                    }
                    //caja para las insignias solo tres por item
                    html.Append("<div id='loadImagenes" + inicio + "'>");  //Insignias cargadas dependiendo del usuario

                    if (dtActividadPersonas.Rows.Count > 0)
                    {
                        DataRow row3 = dtActividadPersonas.Rows[0];
                        var idActividadPersona = Convert.ToInt32(row3["Id_ActividadPersona"]);

                        dtInsignias = ProyectADO.Insignias(1, 0, 0, idActividadPersona, 0, idPersona, idModulo); //Lista de insignias por persona
                    }

                    if(dtInsignias.Rows.Count > 0)
                    {
                        foreach (DataRow row2 in dtInsignias.Rows)
                        {
                            var idTipoInsignia = Convert.ToInt32(row2["Id_TipoInsignia"]);
                            //Insignia civil
                            if( idTipoInsignia == 1)
                            {
                                html.Append("<img src='img/insignia_civil.png' alt='Sin insignias'/>");
                            }else
                            {
                                html.Append("<img src='img/falta_insignia.png' alt='Sin insignias'/>");
                            }
                            //Insignia combatiente
                            if (idTipoInsignia == 2)
                            {
                                html.Append("<img src='img/insignia_combatiente.png' alt='Sin insignias'/>");
                            }
                            else
                            {
                                html.Append("<img src='img/falta_insignia.png' alt='Sin insignias'/>");
                            }
                            //Insignia veterano
                            if (idTipoInsignia == 3)
                            {
                                html.Append("<img src='img/insignia_veterano.png' alt='Sin insignias'/>");
                            }
                            else
                            {
                                html.Append("<img src='img/falta_insignia.png' alt='Sin insignias'/>");
                            }

                        }

                    }else{
                        //Contruir las imagenes del item sin insignias
                        html.Append("<img src='img/insignia_blanco.png' alt='Sin insignias'/>");
                        html.Append("<img src='img/sin_insignia.png' alt='Sin insignias'/>");
                        html.Append("<img src='img/insignia_blanco.png' alt='Sin insignias'/>");
                    }


                    //Cierra LodImagenes
                    html.Append("</div>");
                    //Agregar la cabecera al carrusel
                    html.Append("<div class='carousel-caption'>");
                    //Titulo de la cabecera
                    html.Append("<h3>" + nombreModulo + "</h3>"); //Nombre del modulo
                    //Descripcion Cabecera
                    html.Append("<p>" + descripModulo + "</p>");
                    //Cierra carousel-caption
                    html.Append("</div>");
                    //Cierra item
                    html.Append("</div>");

                    inicio++;  //Incremento del contador
                }

                verModulos.Controls.Add(new Literal { Text = html.ToString() });
            }
            else
            {
                StringBuilder html = new StringBuilder();

                html.Append("<div class='item active'>");
                html.Append("<div class='carousel-caption'>");
                html.Append("<h3>No hay materiales que mostrar</h3>");
                html.Append("<p>Los sentimos en el momento no hay materiales en la caja de herramientas.</p>");
                html.Append("</div>");
                html.Append("</div>");

                verModulos.Controls.Add(new Literal { Text = html.ToString() });
            }

        }
        catch (Exception)
        {
            throw;
        }

    }

    protected void listarModulos()
    {
        try
        {
            DataTable dtModulos = new DataTable();  //Tabla para los modulos
            ProyectADO ProyectADO = new ProyectADO();  //Clase controlador

            dtModulos = ProyectADO.Modulos(0, 1, "", "", 1);  //Lista de modulos


            if (dtModulos.Rows.Count > 0)
            {
                StringBuilder html = new StringBuilder();

                foreach (DataRow row in dtModulos.Rows)
                {
                    html.Append("<li>");
                    html.Append("<a href='lista_actividades.aspx?key=" + row["Id_Modulo"] + "'> " + row["Nombre"] + "</a>");
                    html.Append("</li>");
                }

                listaModulos.Controls.Add(new Literal { Text = html.ToString() });

            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void listaProgreso()
    {
        var persona = Convert.ToInt32(Globals.s_Id);      
        try
        {
            DataTable dtModulos = new DataTable();  //Tabla para los modulos
            DataTable dtProgreso = new DataTable();  //Tabla para los modulos
            ProyectADO ProyectADO = new ProyectADO();  //Clase controlador

            dtProgreso = ProyectADO.Progreso(1, 0, "", 0, persona, 0); 
             
            StringBuilder html = new StringBuilder();

            if (dtProgreso.Rows.Count > 0)
            {
                foreach (DataRow row in dtProgreso.Rows)
                {
                    var idModulo = Convert.ToInt32(row["Id_Modulo"]);
                    dtModulos = ProyectADO.Modulos(idModulo, 4, "", "", 1);

                    DataRow row2 = dtModulos.Rows[0];

                    html.Append("<li>");
                    html.Append("<a href='#'>");
                    html.Append("<div>");
                    html.Append("<p>");
                    html.Append("<strong>"+row2["Nombre"]+"</strong>");
                    html.Append("<span class='pull-right text-muted'>"+row["porcentaje"]+"% Completado</span>");
                    html.Append("</p>");
                    html.Append("<div class='progress progress-striped active'>");
                    html.Append("<div class='progress-bar progress-bar-info' role='progressbar' aria-valuenow='" + row["porcentaje"] + "' aria-valuemin='0' aria-valuemax='100' style='width: " + row["porcentaje"] + "%'>");
                    html.Append("<span class='sr-only'>" + row["porcentaje"] + "% Completado (success)</span>");
                    html.Append("</div>");
                    html.Append("</div>");
                    html.Append("</div>");
                    html.Append("</a>");
                    html.Append("</li>");
                    html.Append("<li class='divider'></li>");
                }
            }
            else
            {
                html.Append("<li>");
                html.Append("<a href='#'>");
                html.Append("<div>");
                html.Append("<p>");
                html.Append("<strong>No has realizado ningún progreso</strong>");
                html.Append("</p>");
                html.Append("</div>");
                html.Append("</a>");
                html.Append("</li>");
            }


            listaProgresoModulo.Controls.Add(new Literal { Text = html.ToString() });
        }
        catch (Exception)
        {
            throw;
        }

    }

    #endregion
}