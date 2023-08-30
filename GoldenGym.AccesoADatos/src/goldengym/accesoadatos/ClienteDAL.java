package goldengym.accesoadatos;

import java.util.*;
import java.sql.*;
import goldengym.entidadesdenegocio.*;

public class ClienteDAL {
    static String obtenerCampos() {
        return "c.Id, c.IdGenero, c.Nombre, c.Apellido, c.Codigo, c.Email, c.Telefono, c.Edad, c.FechaRegistro, c.Estatus";
    }
    
    private static String obtenerSelect(Cliente pCliente) {
        String sql;
        sql = "SELECT ";
        if (pCliente.getTop_aux() > 0 && ComunDB.TIPODB == ComunDB.TipoDB.SQLSERVER) {            
            sql += "TOP " + pCliente.getTop_aux() + " ";
        }
        sql += (obtenerCampos() + " FROM Cliente c");
        return sql;
    }
    
    private static String agregarOrderBy(Cliente pCliente) {
        String sql = " ORDER BY c.Id DESC";
        if (pCliente.getTop_aux() > 0 && ComunDB.TIPODB == ComunDB.TipoDB.MYSQL) {
            sql += " LIMIT " + pCliente.getTop_aux() + " ";
        }
        return sql;
    }
    
    public static int crear(Cliente pCliente) throws Exception {
        int result;
        String sql;
        try (Connection conn = ComunDB.obtenerConexion();) { 
            sql = "INSERT INTO Cliente(IdGenero, Nombre, Apellido, Codigo, Email, Telefono, Edad, FechaRegistro, Estatus) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pCliente.getIdGenero());
                ps.setString(2, pCliente.getNombre());
                ps.setString(3, pCliente.getApellido());
                ps.setString(4, pCliente.getCodigo());
                ps.setString(5, pCliente.getEmail());
                ps.setString(6, pCliente.getTelefono());
                ps.setInt(7, pCliente.getEdad());
                ps.setDate(8, java.sql.Date.valueOf(pCliente.getFechaRegistro()));
                ps.setByte(9, pCliente.getEstatus());
                result = ps.executeUpdate();
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return result;
    }
    
    public static int modificar(Cliente pCliente) throws Exception {
        int result;
        String sql;
        try (Connection conn = ComunDB.obtenerConexion();) {
            sql = "UPDATE Cliente SET IdGenero = ?, Nombre = ?, Apellido = ?, Codigo = ?, Email = ?, Telefono = ?, Edad = ?, Estatus = ? WHERE Id=?";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pCliente.getIdGenero());
                ps.setString(2, pCliente.getNombre());
                ps.setString(3, pCliente.getApellido());
                ps.setString(4, pCliente.getCodigo());
                ps.setString(5, pCliente.getEmail());
                ps.setString(6, pCliente.getTelefono());
                ps.setInt(7, pCliente.getEdad());
                ps.setByte(8, pCliente.getEstatus());
                ps.setInt(9, pCliente.getId());
                result = ps.executeUpdate();
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return result;
    }
    
     public static int eliminar(Cliente pCliente) throws Exception {
        int result;
        String sql;
        try (Connection conn = ComunDB.obtenerConexion();) {
            sql = "DELETE FROM Cliente WHERE Id=?";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pCliente.getId());
                result = ps.executeUpdate();
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return result;
    }
     
     static int asignarDatosResultSet(Cliente pCliente, ResultSet pResultSet, int pIndex) throws Exception {
        pIndex++;
        pCliente.setId(pResultSet.getInt(pIndex));
        pIndex++;
        pCliente.setIdGenero(pResultSet.getInt(pIndex));
        pIndex++;
        pCliente.setNombre(pResultSet.getString(pIndex));
        pIndex++;
        pCliente.setApellido(pResultSet.getString(pIndex));
        pIndex++;
        pCliente.setCodigo(pResultSet.getString(pIndex));
        pIndex++;
        pCliente.setEmail(pResultSet.getString(pIndex));
        pIndex++;
        pCliente.setTelefono(pResultSet.getString(pIndex));
        pIndex++;
        pCliente.setEdad(pResultSet.getInt(pIndex));
        pIndex++;
        java.sql.Date sqlDate = pResultSet.getDate(pIndex);
        if (sqlDate != null) {
        pCliente.setFechaRegistro(sqlDate.toLocalDate());
        }
        return pIndex;
    }
     
     private static void obtenerDatos(PreparedStatement pPS, ArrayList<Cliente> pClientes) throws Exception {
        try (ResultSet resultSet = ComunDB.obtenerResultSet(pPS);) {
            while (resultSet.next()) {
                Cliente cliente = new Cliente(); 
                asignarDatosResultSet(cliente, resultSet, 0);
                pClientes.add(cliente);
            }
            resultSet.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
     
     private static void obtenerDatosIncluirGenero(PreparedStatement pPS, ArrayList<Cliente> pCliente) throws Exception {
        try (ResultSet resultSet = ComunDB.obtenerResultSet(pPS);) {
            HashMap<Integer, Genero> generoMap = new HashMap(); 
            while (resultSet.next()) {
                Cliente cliente = new Cliente();
                int index = asignarDatosResultSet(cliente, resultSet, 0);
                if (generoMap.containsKey(cliente.getIdGenero()) == false) {
                    Genero genero = new Genero();
                    GeneroDAL.asignarDatosResultSet(genero, resultSet, index);
                    generoMap.put(genero.getId(), genero); 
                    cliente.setGenero(genero); 
                } else {
                    cliente.setGenero(generoMap.get(cliente.getIdGenero())); 
                }
                pCliente.add(cliente); 
            }
            resultSet.close();
        } catch (SQLException ex) {
            throw ex; 
        }
    }
     
     public static Cliente obtenerPorId(Cliente pCliente) throws Exception {
        Cliente cliente = new Cliente();
        ArrayList<Cliente> clientes = new ArrayList();
        try (Connection conn = ComunDB.obtenerConexion();) { 
            String sql = obtenerSelect(pCliente);
            sql += " WHERE c.Id=?";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pCliente.getId());
                obtenerDatos(ps, clientes);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        }
        catch (SQLException ex) {
            throw ex;
        }
        if (clientes.size() > 0) {
            cliente = clientes.get(0);
        }
        return cliente;
    }
     
     public static ArrayList<Cliente> obtenerTodos() throws Exception {
        ArrayList<Cliente> clientes = new ArrayList<>();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = obtenerSelect(new Cliente());
            sql += agregarOrderBy(new Cliente());
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                obtenerDatos(ps, clientes);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        } 
        catch (SQLException ex) {
            throw ex;
        }
        return clientes;
    }
     
     static void querySelect(Cliente pCliente, ComunDB.utilQuery pUtilQuery) throws SQLException {
        PreparedStatement statement = pUtilQuery.getStatement();
        if (pCliente.getId() > 0) {
            pUtilQuery.AgregarNumWhere(" c.Id=? ");
            if (statement != null) { 
                statement.setInt(pUtilQuery.getNumWhere(), pCliente.getId()); 
            }
        }
        if (pCliente.getIdGenero() > 0) {
            pUtilQuery.AgregarNumWhere(" c.IdGenero=? ");
            if (statement != null) { 
                statement.setInt(pUtilQuery.getNumWhere(), pCliente.getId()); 
            }
        }

        if (pCliente.getNombre() != null && pCliente.getNombre().trim().isEmpty() == false) {
            pUtilQuery.AgregarNumWhere(" c.Nombre LIKE ? "); 
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(), "%" + pCliente.getNombre() + "%"); 
            }
        }
        if (pCliente.getApellido() != null && pCliente.getApellido().trim().isEmpty() == false) {
            pUtilQuery.AgregarNumWhere(" c.Apellido LIKE ? "); 
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(), "%" + pCliente.getApellido() + "%"); 
            }
        }
        if (pCliente.getCodigo() != null && pCliente.getCodigo().trim().isEmpty() == false) {
            pUtilQuery.AgregarNumWhere(" c.Codigo LIKE ? "); 
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(), "%" + pCliente.getCodigo() + "%"); 
            }
        }
        
        if (pCliente.getEmail()!= null && pCliente.getEmail().trim().isEmpty() == false) {
            pUtilQuery.AgregarNumWhere(" c.Email LIKE ? "); 
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(), "%" + pCliente.getEmail()+ "%"); 
            }
        }
        
        if (pCliente.getTelefono()!= null && pCliente.getTelefono().trim().isEmpty() == false) {
            pUtilQuery.AgregarNumWhere(" c.Telefono LIKE ? "); 
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(), "%" + pCliente.getTelefono()+ "%"); 
            }
        }
        
        if (pCliente.getEdad() > 0) {
            pUtilQuery.AgregarNumWhere(" c.Edad=? ");
            if (statement != null) { 
                statement.setInt(pUtilQuery.getNumWhere(), pCliente.getEdad()); 
            }
        }
          if (pCliente.getFechaRegistro() != null) {
                pUtilQuery.AgregarNumWhere(" c.FechaRegistro=? ");
            if (statement != null) {
                statement.setDate(pUtilQuery.getNumWhere(), java.sql.Date.valueOf(pCliente.getFechaRegistro()));
            }
        }
        
        if (pCliente.getEstatus() > 0) {
            pUtilQuery.AgregarNumWhere(" c.Estatus=? ");
            if (statement != null) { 
                statement.setByte(pUtilQuery.getNumWhere(), pCliente.getEstatus()); 
            }
        }
    }
     
     public static ArrayList<Cliente> buscar(Cliente pCliente) throws Exception {
        ArrayList<Cliente> clientes = new ArrayList();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = obtenerSelect(pCliente);
            ComunDB comundb = new ComunDB();
            ComunDB.utilQuery utilQuery = comundb.new utilQuery(sql, null, 0); 
            querySelect(pCliente, utilQuery);
            sql = utilQuery.getSQL(); 
            sql += agregarOrderBy(pCliente);
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                utilQuery.setStatement(ps);
                utilQuery.setSQL(null);
                utilQuery.setNumWhere(0); 
                querySelect(pCliente, utilQuery);
                obtenerDatos(ps, clientes);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        }
        catch (SQLException ex) {
            throw ex;
        }
        return clientes;
    }
     
    public static ArrayList<Cliente> buscarIncluirGenero(Cliente pCliente) throws Exception {
        ArrayList<Cliente> clientes = new ArrayList();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = "SELECT ";
            if (pCliente.getTop_aux() > 0 && ComunDB.TIPODB == ComunDB.TipoDB.SQLSERVER) {
                sql += "TOP " + pCliente.getTop_aux() + " "; 
            }
            sql += obtenerCampos();
            sql += ",";
            sql += GeneroDAL.obtenerCampos();
            sql += " FROM Cliente c";
            sql += " JOIN Genero g on (c.IdGenero=g.Id)";
            ComunDB comundb = new ComunDB();
            ComunDB.utilQuery utilQuery = comundb.new utilQuery(sql, null, 0);
            querySelect(pCliente, utilQuery);
            sql = utilQuery.getSQL();
            sql += agregarOrderBy(pCliente);
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                utilQuery.setStatement(ps);
                utilQuery.setSQL(null);
                utilQuery.setNumWhere(0);
                querySelect(pCliente, utilQuery);
                obtenerDatosIncluirGenero(ps, clientes);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return clientes;
    }
}
