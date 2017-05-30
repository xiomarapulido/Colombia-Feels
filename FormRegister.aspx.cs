using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FormRegister : System.Web.UI.Page
{
    #region PageLoad && Constants

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
        else
        {

        }

    }

    #endregion

    #region Methods
    public void LimpiarCammpos()
    {
        Txt_Nombres.Text = "";
        Txt_Apellidos.Text = "";
        Txt_Documento.Text = "";
        DdlTiposDoc.SelectedValue = "-1";
        Txt_Correo.Text = "";
        Txt_Telefono.Text = "";
        TxtContraseña.Text = "";
        TxtContraseña2.Text = "";

    }
    #endregion

    #region Events
    protected void BtnEnviar_Click(object sender, EventArgs e)
    {
        try
        {
            ProyectADO ProyectADO = new ProyectADO();

            if (Txt_Nombres.Text == "" || Txt_Apellidos.Text == "" || Txt_Documento.Text == "" || DdlTiposDoc.SelectedValue == "-1" ||
                Txt_Correo.Text == "" || Txt_Telefono.Text == "" || TxtContraseña.Text == "" || TxtContraseña2.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "mensaje", "alert('Para continuar con el registro debe diligenciar todos los campos')", true);
                return;

            }
            else if (TxtContraseña.Text.Trim() != TxtContraseña2.Text.Trim())
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "mensaje", "alert('La confirmacion de la contraseña no corresponde a la contraseña ingresada')", true);
                return;
            }
            else
            {
                ProyectADO.InsertarPersona("1", Txt_Correo.Text.Trim(), TxtContraseña.Text.Trim(), Txt_Nombres.Text.Trim(), Txt_Apellidos.Text.Trim(), DdlTiposDoc.SelectedValue, Txt_Documento.Text.Trim(), Txt_Documento.Text.Trim());
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "mensaje", "alert('Registro terminado.')", true);
                
                LimpiarCammpos();
                return;
            }

        }
        catch (Exception)
        {

            throw;
        }

    }
    #endregion


}
