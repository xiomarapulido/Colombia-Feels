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
                Response.Redirect("Menu.aspx");
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