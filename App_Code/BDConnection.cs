using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Descripción breve de DBConnection
/// </summary>
public class BDConnection
{
    private string connectionString;

    /// <summary>
    /// Inicializa la cadena de conexion
    /// </summary>
    /// <param name="_connectionString"></param>
    /// <autor>Xiomara Pulido</autor>


    public BDConnection(string _connectionString)
    {
        this.connectionString = _connectionString;
    }

    /// <summary>
    /// Abre la conexion
    /// </summary>
    /// <param name="conn">Sql Connection</param>
    /// <autor>Xiomara Pulido</autor>
    public void OpenConnection(SqlConnection conn)
    {
        try
        {
            conn = new SqlConnection(this.connectionString);
            conn.Open();
        }
        catch (Exception eException)
        {
            string sError = eException.Message;
        }
    }

    /// <summary>
    /// Cierra la conexion actual
    /// </summary>
    /// <param name="conn">Sql Connection</param>
    /// <autor>Xiomara Pulido</autor>
    public void CloseConnection(SqlConnection conn)
    {
        try
        {
            conn.Close();
        }
        catch (Exception eException)
        {
            string sError = eException.Message;
        }
    }

    /// <summary>
    /// Ejecuta el procedimiento almacenado
    /// </summary>
    /// <param name="sqlParameter">arreglo de parametros del proc</param>
    /// <param name="conn">Sql connection</param>
    /// <param name="sNameCommand">Nombre del procedimiento almacenado</param>
    /// <param name="timeOut">time out de la espera de .net en segundos... (si se desea el valor por defecto setear -1).</param>
    /// <returns>DataTable</returns>
    /// <autor>Xiomara Pulido</autor>
    public DataTable runStoredPrcDt(SqlParameter[] sqlParameter, SqlConnection conn, string sNameCommand, int timeOut)
    {
        DataTable dataTable = new DataTable("dt");
        SqlDataAdapter sqlAdapter = new SqlDataAdapter();
        try
        {
            SqlCommand cmd = new SqlCommand(sNameCommand, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //Si hay un tiempo de espera...
            if (timeOut > 0)
            {
                cmd.CommandTimeout = timeOut;
            }
            //Si hay parametros para agregar...
            if (sqlParameter.Length > 0)
            {
                cmd.Parameters.Clear();
                cmd.Parameters.AddRange(sqlParameter);
            }
            sqlAdapter.SelectCommand = cmd;
            sqlAdapter.Fill(dataTable);
        }
        catch (Exception eException)
        {
            string sError = eException.Message;
        }
        finally
        {
            CloseConnection(conn);
        }
        return dataTable;
    }


    /// <summary>
    /// Ejecuta el procedimiento almacenado
    /// </summary>
    /// <param name="sqlParameter">arreglo de parametros del proc</param>
    /// <param name="conn">Sql connection</param>
    /// <param name="sNameCommand">Nombre del procedimiento almacenado</param>
    /// <param name="timeOut">time out de la espera de .net en segundos... (si se desea el valor por defecto setear -1).</param>
    /// <returns>DataSet</returns>
    /// <autor>Xiomara Pulido</autor>
    public DataSet runStoredPrcDS(SqlParameter[] sqlParameter, SqlConnection conn, string sNameCommand, int timeOut)
    {
        DataSet ds = new DataSet("ds");
        SqlDataAdapter sqlAdapter = new SqlDataAdapter();
        try
        {
            SqlCommand cmd = new SqlCommand(sNameCommand, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //Si hay un tiempo de espera...
            if (timeOut > 0)
            {
                cmd.CommandTimeout = timeOut;
            }
            //Si hay parametros para agregar...
            if (sqlParameter.Length > 0)
            {
                cmd.Parameters.Clear();
                cmd.Parameters.AddRange(sqlParameter);
            }
            sqlAdapter.SelectCommand = cmd;
            sqlAdapter.Fill(ds);
        }
        catch (Exception eException)
        {
            string sError = eException.Message;
        }
        finally
        {
            CloseConnection(conn);
        }
        return ds;
    }

}