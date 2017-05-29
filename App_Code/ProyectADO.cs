using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



public class ProyectADO
{

    public string SqlConecction = "Data Source=AUX_INSTRUMENTA;Initial Catalog=ColombiaFeels;Integrated Security=True";

    public ProyectADO()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    // estas regiones las dejo para que separemos el código de cada uno
    #region XP
        
        public DataTable ConsultarPersonas(string Op, string Usuario, string Contraseña, string Nombres, string Apellidos, string TipoDoc, string NumDoc, string Telefono)
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

    public int InsertarPersona(string Op, string Usuario, string Contraseña, string Nombres, string Apellidos, string TipoDoc, string NumDoc, string Telefono)
    {
        using (SqlConnection con = new SqlConnection(SqlConecction))
        {
            con.Open();
            SqlCommand OrdenSql = new SqlCommand("XP_CRUD_Personas", con);
            OrdenSql.CommandType = CommandType.StoredProcedure;
            try
            {
                OrdenSql.Parameters.AddWithValue("@Op", Op);
                OrdenSql.Parameters.AddWithValue("@Usuario", Usuario);
                OrdenSql.Parameters.AddWithValue("@contraseña", Contraseña);
                OrdenSql.Parameters.AddWithValue("@Nombres", Nombres);
                OrdenSql.Parameters.AddWithValue("@Apellidos", Apellidos);
                OrdenSql.Parameters.AddWithValue("@Id_TipoDoc", TipoDoc);
                OrdenSql.Parameters.AddWithValue("@NumDoc", NumDoc);
                OrdenSql.Parameters.AddWithValue("@Telefono", Telefono);

                return OrdenSql.ExecuteNonQuery();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                con.Close();
                con.Dispose();
                OrdenSql.Dispose();
            }
        }
    }

    #endregion

    #region FC

    public DataTable Modulos(int id, int tipo, String nombre, String descripcion, int tipomodulo)
    {

        SqlParameter ID = new SqlParameter("@idmodulo", SqlDbType.VarChar);
        ID.Value = id;

        SqlParameter TIPO = new SqlParameter("@tipo", SqlDbType.VarChar);
        TIPO.Value = tipo;

        SqlParameter NOMBRE = new SqlParameter("@nombre", SqlDbType.VarChar);
        NOMBRE.Value = nombre;

        SqlParameter DESCRIPCION = new SqlParameter("@descripcion", SqlDbType.VarChar);
        DESCRIPCION.Value = nombre;

        SqlParameter IDTIPOMODULO = new SqlParameter("@idtipomodulo", SqlDbType.VarChar);
        IDTIPOMODULO.Value = tipomodulo;


        SqlParameter[] Parametros = { ID, TIPO, NOMBRE, DESCRIPCION, IDTIPOMODULO };

        DataTable respuesta = null;

        using (SqlConnection conn = new SqlConnection(SqlConecction))
        {
            respuesta = new BDConnection(SqlConecction).runStoredPrcDt(Parametros, conn, "FC_CRUD_Modulos", 5000);

        }
        return respuesta;

    }

    #endregion

    #region JR

    public DataTable ActividadPersonas(int Op, int Id_Persona)
    {
        SqlParameter _Op = new SqlParameter("@Op", SqlDbType.Int);
        _Op.Value = Op;

        SqlParameter _Id_Persona = new SqlParameter("@Id_Persona", SqlDbType.Int);
        _Id_Persona.Value = Id_Persona;

        SqlParameter[] Parametros = { _Op, _Id_Persona };

        DataTable respuesta = null;

        using (SqlConnection conn = new SqlConnection(SqlConecction))
        {
            respuesta = new BDConnection(SqlConecction).runStoredPrcDt(Parametros, conn, "JR_actividad_persona", 300000);
        }
        return respuesta;
    }


    public DataTable Insignias(int Op, int Id_Insignia, int Id_Progreso, int Id_ActividadPersona, int Id_TipoInsignia, int Id_persona, int Id_modulo)
    {
        SqlParameter _Op = new SqlParameter("@Op", SqlDbType.Int);
        _Op.Value = Op;
        
        SqlParameter _Id_Insignia = new SqlParameter("@Id_Insignia", SqlDbType.Int);
        _Id_Insignia.Value = Id_Insignia;
        
        SqlParameter _Id_Progreso = new SqlParameter("@Id_Progreso", SqlDbType.Int);
        _Id_Progreso.Value = Id_Progreso;
        
        SqlParameter _Id_ActividadPersona = new SqlParameter("@Id_ActividadPersona", SqlDbType.Int);
        _Id_ActividadPersona.Value = Id_ActividadPersona;
        
        SqlParameter _Id_TipoInsignia = new SqlParameter("@Id_TipoInsignia", SqlDbType.Int);
        _Id_TipoInsignia.Value = Id_TipoInsignia;
        
        SqlParameter _Id_persona = new SqlParameter("@Id_persona", SqlDbType.Int);
        _Id_persona.Value = Id_persona;

        SqlParameter _Id_modulo = new SqlParameter("@Id_modulo", SqlDbType.Int);
        _Id_modulo.Value = Id_modulo;

        SqlParameter[] Parametros = { _Op, _Id_Insignia, _Id_Progreso, _Id_ActividadPersona, _Id_TipoInsignia, _Id_persona, _Id_modulo };

        DataTable respuesta = null;

        using (SqlConnection conn = new SqlConnection(SqlConecction))
        {
            respuesta = new BDConnection(SqlConecction).runStoredPrcDt(Parametros, conn, "JR_crud_insignias", 5000);

        }
        return respuesta;
    }

    #endregion



}
