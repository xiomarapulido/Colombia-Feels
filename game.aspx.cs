using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class game : System.Web.UI.Page
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
            listarModulos();
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

    #endregion
}