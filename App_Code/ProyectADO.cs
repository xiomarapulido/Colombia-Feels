using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



public class ProyectADO
{

    public string SqlConecction = "Data Source=USUARIO-PC;Initial Catalog=ColombiaFeels;Integrated Security=True";

    public ProyectADO()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    // estas regiones las dejo para que separemos el código de cada uno
    #region XP

    public DataTable ConsultarPersonas(string Op, string Usuario, string Contraseña)
    {
        SqlParameter _Op = new SqlParameter("@Op", SqlDbType.VarChar);
        _Op.Value = Op;

        SqlParameter _Usuario = new SqlParameter("@Usuario", SqlDbType.VarChar);
        _Usuario.Value = Usuario;

        SqlParameter _Contraseña = new SqlParameter("@Contraseña", SqlDbType.VarChar);
        _Contraseña.Value = Contraseña;

        SqlParameter[] Parametros = { _Op, _Usuario, _Contraseña };

        DataTable respuesta = null;

        using (SqlConnection conn = new SqlConnection(SqlConecction))
        {
            respuesta = new BDConnection(SqlConecction).runStoredPrcDt(Parametros, conn, "XP_CRUD_Personas", 300000);

        }
        return respuesta;


    }

    #endregion

    #region FC

    #endregion

    #region JR

    #endregion
}