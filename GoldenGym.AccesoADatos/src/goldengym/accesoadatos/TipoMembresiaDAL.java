package goldengym.accesoadatos;
import java.util.*;
import java.sql.*;
import goldengym.entidadesdenegocio.*;

public class TipoMembresiaDAL {
    static String obtenerCampos() {
        return "t.Id, t.Nombre, t.Descripcion, t.Precio, t.Duracion, t.Estatus";
    }
    
    private static String obtenerSelect(TipoMembresia pTipoMembresia) {
        String sql;
        sql = "SELECT ";
        if (pTipoMembresia.getTop_aux() > 0 && ComunDB.TIPODB == ComunDB.TipoDB.SQLSERVER) {            
            sql += "TOP " + pTipoMembresia.getTop_aux() + " ";
        }
        sql += (obtenerCampos() + " FROM TipoMembresia t");
        return sql;
    }
    
    private static String agregarOrderBy(TipoMembresia pTipoMembresia) {
        String sql = " ORDER BY t.Id DESC";
        if (pTipoMembresia.getTop_aux() > 0 && ComunDB.TIPODB == ComunDB.TipoDB.MYSQL) {
            sql += " LIMIT " + pTipoMembresia.getTop_aux() + " ";
        }
        return sql;
    }
    
    public static int crear(TipoMembresia pTipoMembresia) throws Exception {
        int result;
        String sql;
        try (Connection conn = ComunDB.obtenerConexion();) { 
            sql = "INSERT INTO TipoMembresia(Nombre,Descripcion,Precio,Duracion,Estatus) VALUES(?,?,?,?,?)";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setString(1, pTipoMembresia.getNombre());
                ps.setString(2, pTipoMembresia.getDescripcion());
                ps.setDouble(3, pTipoMembresia.getPrecio());
                ps.setInt(4, pTipoMembresia.getDuracion());
                ps.setByte(5, pTipoMembresia.getEstatus());
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
    
    public static int modificar(TipoMembresia pTipoMembresia) throws Exception {
        int result;
        String sql;
        try (Connection conn = ComunDB.obtenerConexion();) {
            sql = "UPDATE TipoMembresia SET Nombre=?, Descripcion=?, Precio=?, Duracion=?, Estatus=? WHERE Id=?";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setString(1, pTipoMembresia.getNombre());
                ps.setString(2, pTipoMembresia.getDescripcion());
                ps.setDouble(3, pTipoMembresia.getPrecio());
                ps.setInt(4, pTipoMembresia.getDuracion());
                ps.setByte(5, pTipoMembresia.getEstatus());
                ps.setInt(6, pTipoMembresia.getId());
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
    
    public static int eliminar(TipoMembresia pTipoMembresia) throws Exception {
        int result;
        String sql;
        try (Connection conn = ComunDB.obtenerConexion();) {
            sql = "DELETE FROM TipoMembresia WHERE Id=?";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pTipoMembresia.getId());
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
    
    static int asignarDatosResultSet(TipoMembresia pTipoMembresia, ResultSet pResultSet, int pIndex) throws Exception {
        pIndex++;
        pTipoMembresia.setId(pResultSet.getInt(pIndex));
        pIndex++;
        pTipoMembresia.setNombre(pResultSet.getString(pIndex));
        pIndex++;
        pTipoMembresia.setDescripcion(pResultSet.getString(pIndex));
        pIndex++;
        pTipoMembresia.setPrecio(pResultSet.getDouble(pIndex));
        pIndex++;
        pTipoMembresia.setDuracion(pResultSet.getInt(pIndex));
        pIndex++;
        pTipoMembresia.setEstatus(pResultSet.getByte(pIndex));
        return pIndex;
    }
    
     private static void obtenerDatos(PreparedStatement pPS, ArrayList<TipoMembresia> pTiposMembresias) throws Exception {
        try (ResultSet resultSet = ComunDB.obtenerResultSet(pPS);) {
            while (resultSet.next()) {
                TipoMembresia tipoMembresia = new TipoMembresia(); 
                asignarDatosResultSet(tipoMembresia, resultSet, 0);
                pTiposMembresias.add(tipoMembresia);
            }
            resultSet.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }
     
     public static TipoMembresia obtenerPorId(TipoMembresia pTipoMembresia) throws Exception {
        TipoMembresia tipoMembresia = new TipoMembresia();
        ArrayList<TipoMembresia> tiposMembresias = new ArrayList();
        try (Connection conn = ComunDB.obtenerConexion();) { 
            String sql = obtenerSelect(pTipoMembresia);
            sql += " WHERE t.Id=?";
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pTipoMembresia.getId());
                obtenerDatos(ps, tiposMembresias);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        }
        catch (SQLException ex) {
            throw ex;
        }
        
        if (tiposMembresias.size() > 0) {
            tipoMembresia = tiposMembresias.get(0);
        }
        
        return tipoMembresia;
    }
     
     public static ArrayList<TipoMembresia> obtenerTodos() throws Exception {
        ArrayList<TipoMembresia> tiposMembresias = new ArrayList<>();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = obtenerSelect(new TipoMembresia());
            sql += agregarOrderBy(new TipoMembresia());
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                obtenerDatos(ps, tiposMembresias);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        } 
        catch (SQLException ex) {
            throw ex;
        }
        
        return tiposMembresias;
    }
     
     static void querySelect(TipoMembresia pTipoMembresia, ComunDB.utilQuery pUtilQuery) throws SQLException {
        PreparedStatement statement = pUtilQuery.getStatement();
        if (pTipoMembresia.getId() > 0) {
            pUtilQuery.AgregarNumWhere(" t.Id=? ");
            if (statement != null) { 
                statement.setInt(pUtilQuery.getNumWhere(), pTipoMembresia.getId()); 
            }
        }

        if (pTipoMembresia.getNombre() != null && pTipoMembresia.getNombre().trim().isEmpty() == false) {
            pUtilQuery.AgregarNumWhere(" t.Nombre LIKE ? "); 
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(), "%" + pTipoMembresia.getNombre() + "%"); 
            }
        }
        if (pTipoMembresia.getDescripcion() != null && pTipoMembresia.getDescripcion().trim().isEmpty() == false) {
            pUtilQuery.AgregarNumWhere(" t.Descripcion LIKE ? "); 
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(), "%" + pTipoMembresia.getDescripcion() + "%"); 
            }
        }
        if (pTipoMembresia.getPrecio() > 0) {
            pUtilQuery.AgregarNumWhere(" t.Precio=? "); 
            if (statement != null) {
                statement.setDouble(pUtilQuery.getNumWhere(),pTipoMembresia.getPrecio()); 
            }
        }
        if (pTipoMembresia.getDuracion() > 0) {
            pUtilQuery.AgregarNumWhere(" t.Duracion=? "); 
            if (statement != null) {
                statement.setInt(pUtilQuery.getNumWhere(), pTipoMembresia.getDuracion()); 
            }
        }
        if (pTipoMembresia.getEstatus() > 0) {
            pUtilQuery.AgregarNumWhere(" t.Estatus=? ");
            if (statement != null) { 
                statement.setByte(pUtilQuery.getNumWhere(), pTipoMembresia.getEstatus()); 
            }
        }
    }
     
     public static ArrayList<TipoMembresia> buscar(TipoMembresia pTipoMembresia) throws Exception {
        ArrayList<TipoMembresia> tiposMembresias = new ArrayList();
        try (Connection conn = ComunDB.obtenerConexion();) {
            String sql = obtenerSelect(pTipoMembresia);
            ComunDB comundb = new ComunDB();
            ComunDB.utilQuery utilQuery = comundb.new utilQuery(sql, null, 0); 
            querySelect(pTipoMembresia, utilQuery);
            sql = utilQuery.getSQL(); 
            sql += agregarOrderBy(pTipoMembresia);
            try (PreparedStatement ps = ComunDB.createPreparedStatement(conn, sql);) {
                utilQuery.setStatement(ps);
                utilQuery.setSQL(null);
                utilQuery.setNumWhere(0); 
                querySelect(pTipoMembresia, utilQuery);
                obtenerDatos(ps, tiposMembresias);
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
            conn.close();
        }
        catch (SQLException ex) {
            throw ex;
        }
        return tiposMembresias;
    }
}