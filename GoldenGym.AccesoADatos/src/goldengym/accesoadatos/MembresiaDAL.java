package goldengym.accesoadatos;

import java.util.*;
import java.sql.*;
import goldengym.entidadesdenegocio.*;

public class MembresiaDAL {
    static String obtenerCampos() {
        return "m.Id, m.IdCliente, m.IdTipoMembresia, m.FechaRegistro, m.FechaVencimiento, m.Estatus";
    }
    private static String obtenerSelect(Membresia pMembresia) {
        String sql;
        sql = "SELECT ";
        if (pMembresia.getTop_aux() > 0 && ComunDB.TIPODB == ComunDB.TipoDB.SQLSERVER) {
             sql += "TOP " + pMembresia.getTop_aux() + " ";
        }
        sql += (obtenerCampos() + " FROM Membresia m");
        return sql;
    }
    private static String agregarOrderBy(Membresia pMembresia) {
        String sql = " ORDER BY m.Id DESC";
        if (pMembresia.getTop_aux() > 0 && ComunDB.TIPODB == ComunDB.TipoDB.MYSQL) {
            sql += " LIMIT " + pMembresia.getTop_aux() + " ";
        }
        return sql;
    }
    public static int crear(Membresia pMembresia) throws Exception {
        int result;
        String sql;
        
        try ( Connection conn = ComunDB.obtenerConexion();) {
            sql = "INSERT INTO Membresia(IdCliente,IdTipoMembresia,FechaRegistro,FechaVencimiento,Estatus) VALUES(?,?,?,?,?)";
            try ( PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pMembresia.getIdCliente());
                ps.setInt(2, pMembresia.getIdTipoMembresia());
                ps.setDate(3, java.sql.Date.valueOf(pMembresia.getFechaRegistro()));
                ps.setDate(4, java.sql.Date.valueOf(pMembresia.getFechaVencimiento()));
                ps.setByte(5, pMembresia.getEstatus());
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
    public static int modificar(Membresia pMembresia) throws Exception {
        int result;
        String sql;
        try ( Connection conn = ComunDB.obtenerConexion();) {
            sql = "UPDATE Membresia SET IdCliente=?, IdTipoMembresia=?, Estatus=?    WHERE Id=?";
            try ( PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pMembresia.getIdCliente());
                ps.setInt(2, pMembresia.getIdTipoMembresia());
                ps.setByte(3, pMembresia.getEstatus());
                ps.setInt(4, pMembresia.getId());
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
    
    public static int eliminar(Membresia pMembresia) throws Exception {
        int result;
        String sql;
        try (Connection conn = ComunDB.obtenerConexion();) { 
            sql = "DELETE FROM Membresia WHERE Id=?"; 
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pMembresia.getId());
                result = ps.executeUpdate();
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        }
        catch (SQLException ex) {
            throw ex;
        }
        return result;
    }
    static int asignarDatosResultSet(Membresia pMembresia, ResultSet pResultSet, int pIndex) throws Exception {
        pIndex++;
        pMembresia.setId(pResultSet.getInt(pIndex)); 
        pIndex++;
        pMembresia.setIdCliente(pResultSet.getInt(pIndex)); 
        pIndex++;
        pMembresia.setIdTipoMembresia(pResultSet.getInt(pIndex)); 
        pIndex++;
        java.sql.Date sqlDate = pResultSet.getDate(pIndex);
        if (sqlDate != null) {
        pMembresia.setFechaRegistro(sqlDate.toLocalDate());
        }
        pIndex++;
        java.sql.Date sqlDate2 = pResultSet.getDate(pIndex);
        if (sqlDate2 != null) {
        pMembresia.setFechaVencimiento(sqlDate2.toLocalDate());
        }
        pIndex++;
        pMembresia.setEstatus(pResultSet.getByte(pIndex));
        return pIndex;
    }
    //por si da error//
    private static void obtenerDatos(PreparedStatement pPS, ArrayList<Membresia> pMembresia) throws Exception {
        try (ResultSet resultSet = ComunDB.obtenerResultSet(pPS);) { 
            while (resultSet.next()) {
                Membresia membresia = new Membresia();
                asignarDatosResultSet(membresia, resultSet, 0);
                pMembresia.add(membresia);
            }
            resultSet.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
    
    private static void obtenerDatosIncluirRelaciones(PreparedStatement pPS, ArrayList<Membresia> pMembresia) throws Exception {
        try (ResultSet resultSet = ComunDB.obtenerResultSet(pPS);) {
            HashMap<Integer, Cliente> clienteMap = new HashMap(); 
            HashMap<Integer, TipoMembresia> tipomembresiaMap = new HashMap();
            
            while (resultSet.next()) {
                Membresia membresia = new Membresia();
                int index = asignarDatosResultSet(membresia, resultSet, 0);
                
                if (clienteMap.containsKey(membresia.getIdCliente()) == false) {
                    Cliente cliente = new Cliente();
                    ClienteDAL.asignarDatosResultSet(cliente, resultSet, index);
                    clienteMap.put(cliente.getId(), cliente); 
                    membresia.setCliente(cliente); 
                } else {
                    membresia.setCliente(clienteMap.get(membresia.getIdCliente())); 
                }
                
                if (tipomembresiaMap.containsKey(membresia.getIdTipoMembresia()) == false) {
                    TipoMembresia tipomembresia = new TipoMembresia();
                    TipoMembresiaDAL.asignarDatosResultSet(tipomembresia, resultSet, index+10);
                    tipomembresiaMap.put(tipomembresia.getId(), tipomembresia); 
                    membresia.setTipomembresia(tipomembresia); 
                } else {
                    membresia.setTipomembresia(tipomembresiaMap.get(membresia.getIdTipoMembresia())); 
                }
                
                pMembresia.add(membresia); 
            }
            resultSet.close();
        } catch (SQLException ex) {
            throw ex; 
        }
    }
    
    
    
    public static Membresia obtenerPorId(Membresia pMembresia) throws Exception {
        Membresia membresia = new Membresia();
        ArrayList<Membresia> membresias = new ArrayList();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = obtenerSelect(pMembresia);
            sql += " WHERE m.Id=?";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pMembresia.getId());
                obtenerDatos(ps, membresias);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        }
        catch (SQLException ex) {
            throw ex;
        }
        if (membresias.size() > 0) {
            membresia = membresias.get(0);
        }
        return membresia;
    }
    
    public static ArrayList<Membresia> obtenerTodos() throws Exception {
        ArrayList<Membresia> membresias = new ArrayList<>();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = obtenerSelect(new Membresia()); 
            sql += agregarOrderBy(new Membresia());
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                obtenerDatos(ps, membresias);
                ps.close();
            } catch (SQLException ex) {
                throw ex; 
            }
            conn.close();
        }
        catch (SQLException ex) {
            throw ex;
        }
        return membresias;
    }
    
    static void querySelect(Membresia pMembresia, ComunDB.utilQuery pUtilQuery) throws SQLException {
        PreparedStatement statement = pUtilQuery.getStatement();
        if (pMembresia.getId() > 0) {
            pUtilQuery.AgregarNumWhere(" m.Id=? ");
            if (statement != null) {
                statement.setInt(pUtilQuery.getNumWhere(), pMembresia.getId());
            }
        }

        if (pMembresia.getIdCliente()> 0) {
            pUtilQuery.AgregarNumWhere(" m.IdCliente=? ");
            if (statement != null) {
                statement.setInt(pUtilQuery.getNumWhere(), pMembresia.getIdCliente());
            }
        }
        
        if (pMembresia.getIdTipoMembresia()> 0) {
            pUtilQuery.AgregarNumWhere(" m.IdTipoMembresia=? ");
            if (statement != null) {
                statement.setInt(pUtilQuery.getNumWhere(), pMembresia.getIdTipoMembresia());
            }
        }

        if (pMembresia.getFechaRegistro() != null) {
                pUtilQuery.AgregarNumWhere(" m.FechaRegistro=? ");
            if (statement != null) {
                statement.setDate(pUtilQuery.getNumWhere(), java.sql.Date.valueOf(pMembresia.getFechaRegistro()));
            }
        }

        if (pMembresia.getFechaVencimiento() != null) {
                pUtilQuery.AgregarNumWhere(" m.FechaVencimiento=? ");
            if (statement != null) {
                statement.setDate(pUtilQuery.getNumWhere(), java.sql.Date.valueOf(pMembresia.getFechaVencimiento()));
            }
        }

        if (pMembresia.getEstatus() > 0) {
            pUtilQuery.AgregarNumWhere(" m.Estatus=? ");
            if (statement != null) { 
                statement.setByte(pUtilQuery.getNumWhere(), pMembresia.getEstatus()); 
            }
        }
    }
    
    public static ArrayList<Membresia> buscar(Membresia pMembresia) throws Exception {
        ArrayList<Membresia> membresias = new ArrayList();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = obtenerSelect(pMembresia);
            ComunDB comundb = new ComunDB();
            ComunDB.utilQuery utilQuery = comundb.new utilQuery(sql, null, 0);
            querySelect(pMembresia, utilQuery);
            sql = utilQuery.getSQL();
            sql += agregarOrderBy(pMembresia);
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                utilQuery.setStatement(ps);
                utilQuery.setSQL(null);
                utilQuery.setNumWhere(0);
                querySelect(pMembresia, utilQuery);
                obtenerDatos(ps, membresias);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        } 
        catch (SQLException ex) {
            throw ex;
        }
        return membresias;
    }
    
    public static ArrayList<Membresia> buscarIncluirRelaciones(Membresia pMembresia) throws Exception {
        ArrayList<Membresia> membresias = new ArrayList();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = "SELECT ";
            if (pMembresia.getTop_aux() > 0 && ComunDB.TIPODB == ComunDB.TipoDB.SQLSERVER) {
                sql += "TOP " + pMembresia.getTop_aux() + " "; 
            }
            sql += obtenerCampos();
            sql += ", ";
            sql += ClienteDAL.obtenerCampos();
            sql += ", ";
            sql += TipoMembresiaDAL.obtenerCampos();
            sql += " FROM Membresia m";
            sql += " INNER JOIN Cliente c on (m.IdCliente = c.Id)";
            sql += " INNER JOIN TipoMembresia t on (m.IdTipoMembresia = t.Id)";
            ComunDB comundb = new ComunDB();
            ComunDB.utilQuery utilQuery = comundb.new utilQuery(sql, null, 0);
            querySelect(pMembresia, utilQuery);
            sql = utilQuery.getSQL();
            sql += agregarOrderBy(pMembresia);
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                utilQuery.setStatement(ps);
                utilQuery.setSQL(null);
                utilQuery.setNumWhere(0);
                querySelect(pMembresia, utilQuery);
                obtenerDatosIncluirRelaciones(ps, membresias);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return membresias;
    }
} 

    


   

