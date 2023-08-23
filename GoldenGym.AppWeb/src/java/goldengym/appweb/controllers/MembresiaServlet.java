package goldengym.appweb.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;


import java.util.ArrayList;
import goldengym.accesoadatos.ClienteDAL;
import goldengym.accesoadatos.TipoMembresiaDAL;
import goldengym.accesoadatos.MembresiaDAL;
import goldengym.appweb.utils.*;
import goldengym.entidadesdenegocio.Cliente;
import goldengym.entidadesdenegocio.TipoMembresia;
import goldengym.entidadesdenegocio.Membresia;

@WebServlet(name = "MembresiaServlet", urlPatterns = {"/Membresia"})
public class MembresiaServlet extends HttpServlet {
    
     private Membresia obtenerMembresia(HttpServletRequest request) {
        String accion = Utilidad.getParameter(request, "accion", "index");
        Membresia membresia = new Membresia();
        
        if (accion.equals("create") == false) {
            membresia.setId(Integer.parseInt(Utilidad.getParameter(request, "id", "0")));
        }   
         membresia.setFechaRegistro(LocalDate.parse(Utilidad.getParameter(request, "fechaRegistro", "")));
         membresia.setFechaVencimiento(LocalDate.parse(Utilidad.getParameter(request, "fechaVencimiento", "")));       
         membresia.setEstatus(Byte.parseByte(Utilidad.getParameter(request, "estatus", "0")));
         membresia.setIdCliente(Integer.parseInt(Utilidad.getParameter(request, "idCliente", "0")));
         membresia.setIdTipoMembresia(Integer.parseInt(Utilidad.getParameter(request, "idTipoMembresia", "0")));
        
        if (accion.equals("index")) {
            membresia.setTop_aux(Integer.parseInt(Utilidad.getParameter(request, "top_aux", "10")));
            membresia.setTop_aux(membresia.getTop_aux() == 0 ? Integer.MAX_VALUE : membresia.getTop_aux());
        }
        
        return membresia;
    }
     private void doGetRequestIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Membresia membresia = new Membresia();
            membresia.setTop_aux(10);
            ArrayList<Membresia> membresias = MembresiaDAL.buscarIncluirRelaciones(membresia);
            request.setAttribute("membresias", membresias);
            request.setAttribute("top_aux", membresia.getTop_aux());
            request.getRequestDispatcher("Views/Membresia/index.jsp").forward(request, response);
        } catch (Exception ex) {
            Utilidad.enviarError(ex.getMessage(), request, response);
        }
    }

    private void doPostRequestIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Membresia membresia = obtenerMembresia(request);
            ArrayList<Membresia> membresias = MembresiaDAL.buscarIncluirRelaciones(membresia);
            request.setAttribute("membresias", membresias);
            request.setAttribute("top_aux", membresia.getTop_aux());
            request.getRequestDispatcher("Views/Membresia/index.jsp").forward(request, response);
        } catch (Exception ex) {
            Utilidad.enviarError(ex.getMessage(), request, response);
        }
    }

    private void doGetRequestCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Views/Membresia/create.jsp").forward(request, response);
    }

    private void doPostRequestCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Membresia membresia = obtenerMembresia(request);
            int result = MembresiaDAL.crear(membresia);
            if (result != 0) {
                request.setAttribute("accion", "index");
                doGetRequestIndex(request, response);
            } else {
                Utilidad.enviarError("No se logro guardar el nuevo registro", request, response);
            }
        } catch (Exception ex) {
            Utilidad.enviarError(ex.getMessage(), request, response);
        }

    }

    private void requestObtenerPorId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Membresia membresia = obtenerMembresia(request);
            Membresia membresia_result = MembresiaDAL.obtenerPorId(membresia);
            if (membresia_result.getId() > 0) {
                Cliente cliente = new Cliente();
                cliente.setId(membresia_result.getIdCliente());
                TipoMembresia tipoMembresia = new TipoMembresia();
                tipoMembresia.setId(membresia_result.getIdTipoMembresia());
                membresia_result.setCliente(ClienteDAL.obtenerPorId(cliente));
                membresia_result.setTipomembresia(TipoMembresiaDAL.obtenerPorId(tipoMembresia));
                request.setAttribute("membresia", membresia_result);
            } else {
                Utilidad.enviarError("El Id:" + membresia_result.getId() + " no existe en la tabla de Empresas", request, response);
            }
        } catch (Exception ex) {
            Utilidad.enviarError(ex.getMessage(), request, response);
        }
    }

    private void doGetRequestEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestObtenerPorId(request, response);
        request.getRequestDispatcher("Views/Membresia/edit.jsp").forward(request, response);
    }

    private void doPostRequestEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Membresia membresia = obtenerMembresia(request);
            int result = MembresiaDAL.modificar(membresia);
            if (result != 0) {
                request.setAttribute("accion", "index");
                doGetRequestIndex(request, response);
            } else {
                Utilidad.enviarError("No se logro actualizar el registro", request, response);
            }
        } catch (Exception ex) {
            Utilidad.enviarError(ex.getMessage(), request, response);
        }
    }

    private void doGetRequestDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestObtenerPorId(request, response);
        request.getRequestDispatcher("Views/Membresia/details.jsp").forward(request, response);
    }

    private void doGetRequestDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestObtenerPorId(request, response);
        request.getRequestDispatcher("Views/Membresia/delete.jsp").forward(request, response);
    }

    private void doPostRequestDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Membresia membresia = obtenerMembresia(request);
            int result = MembresiaDAL.eliminar(membresia);
            if (result != 0) {
                request.setAttribute("accion", "index");
                doGetRequestIndex(request, response);
            } else {
                Utilidad.enviarError("No se logro eliminar el registro", request, response);
            }
        } catch (Exception ex) {
            Utilidad.enviarError(ex.getMessage(), request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SessionUser.authorize(request, response, () -> {
            String accion = Utilidad.getParameter(request, "accion", "index");
            switch (accion) {
                case "index":
                    request.setAttribute("accion", accion);
                    doGetRequestIndex(request, response);
                    break;
                case "create":
                    request.setAttribute("accion", accion);
                    doGetRequestCreate(request, response);
                    break;
                case "edit":
                    request.setAttribute("accion", accion);
                    doGetRequestEdit(request, response);
                    break;
                case "delete":
                    request.setAttribute("accion", accion);
                    doGetRequestDelete(request, response);
                    break;
                case "details":
                    request.setAttribute("accion", accion);
                    doGetRequestDetails(request, response);
                    break;
                default:
                    request.setAttribute("accion", accion);
                    doGetRequestIndex(request, response);
            }
        });
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SessionUser.authorize(request, response, () -> {
            String accion = Utilidad.getParameter(request, "accion", "index");
            switch (accion) {
                case "index":
                    request.setAttribute("accion", accion);
                    doPostRequestIndex(request, response);
                    break;
                case "create":
                    request.setAttribute("accion", accion);
                    doPostRequestCreate(request, response);
                    break;
                case "edit":
                    request.setAttribute("accion", accion);
                    doPostRequestEdit(request, response);
                    break;
                case "delete":
                    request.setAttribute("accion", accion);
                    doPostRequestDelete(request, response);
                    break;
                default:
                    request.setAttribute("accion", accion);
                    doGetRequestIndex(request, response);
            }
        });
    }
    
// </editor-fold>
}
