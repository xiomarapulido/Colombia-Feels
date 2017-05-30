using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class lista_actividades : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        var nameSessi = Convert.ToString(Session["nombreUsuario"]);
        var idSessi = Convert.ToInt32(Session["controlID"]);

        string valor = Convert.ToString(Request.QueryString["key"]);

        Globals.s_Name = nameSessi;
        Globals.s_Id = idSessi;
        Globals.s_id_modulo = valor;

        nombreUser.Controls.Add(new Literal { Text = nameSessi.ToString() });

        if (!this.IsPostBack)
        {
            listarModulos();
            nombreDescripModulo();
            listaActividades();
        }

    }

    #endregion

    #region Methods

    public static class Globals
    {
        public static String s_Name;
        public static Int32 s_Id;
        public static String s_id_modulo;
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

    protected void listaActividades()
    {
        var idModulo = Convert.ToInt32(Globals.s_id_modulo); //convertir a entero

        try
        {

            DataTable dtActividades = new DataTable();  //Tabla para los modulos
            ProyectADO ProyectADO = new ProyectADO();  //Clase controlador

            dtActividades = ProyectADO.Actividades(1, 0, "", "", idModulo);  //Lista de modulos

            StringBuilder html = new StringBuilder();

            if (dtActividades.Rows.Count > 0)
            {
                var contador = 1;

                foreach (DataRow row in dtActividades.Rows)
                {
                    var collapse = "";

                    if (contador == 1){collapse = "in";}

                    html.Append("<div class='panel panel-default'>");
                    html.Append("<div class='panel-heading'>");
                    html.Append("<h4 class='panel-title'>");
                    html.Append("<a data-toggle='collapse' data-parent='#accordion' href='#collapse" + contador + "'>" + row["Nombre"] + "</a>");
                    html.Append("</h4>");
                    html.Append("</div>");
                    html.Append("<div id='collapse" + contador + "' class='panel-collapse collapse " + collapse + "'>");
                    html.Append("<div class='panel-body'>");
                    html.Append(row["Descripcion"]);
                    html.Append("</div>");
                    html.Append("</div>");
                    html.Append("</div>");

                    contador++;
                }
            }
            else
            {
                html.Append("<div class='panel panel-default'>");
                html.Append("<div class='panel-heading'>");
                html.Append("<h4 class='panel-title'>");
                html.Append("<a data-toggle='collapse' data-parent='#accordion' href='#collapseOne'>Sin actividades para el material</a>");
                html.Append("</h4>");
                html.Append("</div>");
                html.Append("<div id='collapseOne' class='panel-collapse collapse in'>");
                html.Append("<div class='panel-body'>");
                html.Append("En este momento este material se encuentra sin actividades, por favor lo invitamos a que ingrese más tarde para saber más de la memoria histórica.");
                html.Append("</div>");
                html.Append("</div>");
                html.Append("</div>");
            }

            actividadesModulo.Controls.Add(new Literal { Text = html.ToString() });

        }
        catch (Exception)
        {
            throw;
        }

    }

    protected void nombreDescripModulo()
    {
        var idModulo = Convert.ToInt32(Globals.s_id_modulo); //convertir a entero

        try
        {
            DataTable dtModulos = new DataTable();  //Tabla para los modulos
            ProyectADO ProyectADO = new ProyectADO();  //Clase controlador

            dtModulos = ProyectADO.Modulos(idModulo, 4, "", "", 1);  //Lista de modulos

            StringBuilder html = new StringBuilder();
            StringBuilder html2 = new StringBuilder();

            if (dtModulos.Rows.Count > 0)
            {
                DataRow row = dtModulos.Rows[0];
                html2.Append(row["Nombre"]);
                html.Append(row["Descripcion"]);
            }
            else
            {
                html2.Append("Material - 0");
                html.Append("No hay modulos disponibles");
            }

            tituloModulo.Controls.Add(new Literal { Text = html2.ToString() });
            descripModulo.Controls.Add(new Literal { Text = html.ToString() });
        }
        catch (Exception)
        {
            throw;
        }

    }

    #endregion

}
