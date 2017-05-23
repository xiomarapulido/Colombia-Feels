using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class IndexLogin : System.Web.UI.Page
{

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LimpiarLogin();
        }

    }

    protected void BtnIniciar_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable DtUsuarios = new DataTable();

            ProyectADO ProyectADO = new ProyectADO();

            DtUsuarios = ProyectADO.ConsultarPersonas("0", TxtUsuario.Value, TxtContrasena.Value);


            if (DtUsuarios.Rows.Count > 0)
            {
                DataRow row = DtUsuarios.Rows[0];  //Obtener el primer registro
                var controlID = Convert.ToInt32(row["Id_Persona"]);  //Almacenar el id de usuario
                var nombreUsuario = row["Nombres"];

                Page objp = new Page();  //Enviar variable de inicio de session
                objp.Session["controlID"] = controlID;  //Variable de inicio de sesion para el id usuario
                objp.Session["nombreUsuario"] = nombreUsuario; //Variable de inicio de sesion para el nombre usuario

                Response.Redirect("index-logged_in.aspx");
            }

            
            else
            {
                lblLoginError.Text = "correo o contraseña invalidos, intente nuevamente.";
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
    #endregion
    #region Methods

    

    public void LimpiarLogin()
    {
        TxtContrasena = null;
        TxtUsuario = null;
    }

    #endregion

}
