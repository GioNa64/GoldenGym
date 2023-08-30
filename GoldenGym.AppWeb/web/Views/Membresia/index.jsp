<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.Membresia"%>
<%@page import="goldengym.entidadesdenegocio.Cliente"%>
<%@page import="goldengym.entidadesdenegocio.TipoMembresia"%>
<%@page import="java.util.ArrayList"%>

<% ArrayList<Membresia> membresias = (ArrayList<Membresia>) request.getAttribute("membresias");
    int numPage = 1;
    int numReg = 10;
    int countReg = 0;
    if (membresias == null) {
        membresias = new ArrayList();
    } else if (membresias.size() > numReg) {
        double divNumPage = (double) membresias.size() / (double) numReg;
        numPage = (int) Math.ceil(divNumPage);
    }
    String strTop_aux = request.getParameter("top_aux");
    int top_aux = 10;
    if (strTop_aux != null && strTop_aux.trim().length() > 0) {
        top_aux = Integer.parseInt(strTop_aux);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Lista de Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Buscar Membresia</h5>
            <form action="Membresia" method="post">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>"> 
                <div class="row"> 
                    </div>
                    <div class="input-field col l4 s4">   
                        <select id="slEstatus" name="estatus">
                            <option value="0">SELECCIONAR</option>
                            <option value="<%=Membresia.EstatusUsuario.ACTIVO%>">ACTIVO</option>
                            <option value="<%=Membresia.EstatusUsuario.INACTIVO%>">INACTIVO</option>
                        </select>       
                        <label for="slEstatus">Estatus</label>
                    </div>
                    <div class="input-field col l4 s4">   
                        <jsp:include page="/Views/TipoMembresia/select.jsp">                           
                            <jsp:param name="id" value="0" />  
                        </jsp:include>                        
                    </div>
                         <div class="input-field col l4 s4">   
                        <jsp:include page="/Views/Cliente/select.jsp">                           
                            <jsp:param name="id" value="0" />  
                        </jsp:include>                        
                    </div>
                    <div class="input-field col l4 s4">   
                        <jsp:include page="/Views/Shared/selectTop.jsp">
                            <jsp:param name="top_aux" value="<%=top_aux%>" />                        
                        </jsp:include>                        
                    </div> 
                </div>
                <div class="row">
                    <div class="col l12 s12">
                        <button type="sutmit" class="waves-effect waves-light btn blue"><i class="material-icons right">search</i>Buscar</button>
                        <a href="Membresia?accion=create" class="waves-effect waves-light btn blue"><i class="material-icons right">add</i>Crear</a>                          
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col l12 s12">
                    <div style="overflow: auto">
                        <table class="paginationjs">
                            <thead>
                                <tr>                                     
                                    <th>Cliente</th>  
                                    <th>Tipo Membresia</th> 
                                    <th>Fecha de Registro</th>  
                                    <th>Fecha de Vencimiento</th>  
                                    <th>Estatus</th>     
                                    <th>Acciones</th>
                                </tr>
                            </thead>                       
                            <tbody>                           
                                <% for (Membresia membresia : membresias) {
                                        int tempNumPage = numPage;
                                        if (numPage > 1) {
                                            countReg++;
                                            double divTempNumPage = (double) countReg / (double) numReg;
                                            tempNumPage = (int) Math.ceil(divTempNumPage);
                                        }
                                %>
                                <tr data-page="<%= tempNumPage%>">                                    
                                    <td><%=membresia.getCliente().getNombre()%></td>  
                                    <td><%=membresia.getTipomembresia().getNombre()%></td>
                                    <td><%=membresia.getFechaRegistro()%></td>  
                                    <td><%=membresia.getFechaVencimiento()%></td>
                                    <td><%=membresia.getEstatus()%></td>  
                                    <td>
                                        <div style="display:flex">
                                             <a href="Membresia?accion=edit&id=<%=membresia.getId()%>" title="Modificar" class="waves-effect waves-light btn green">
                                            <i class="material-icons">edit</i>
                                        </a>
                                        <a href="Membresia?accion=details&id=<%=membresia.getId()%>" title="Ver" class="waves-effect waves-light btn blue">
                                            <i class="material-icons">description</i>
                                        </a>
                                        <a href="Membresia?accion=delete&id=<%=membresia.getId()%>" title="Eliminar" class="waves-effect waves-light btn red">
                                            <i class="material-icons">delete</i>
                                        </a>    
                                        </div>                                                                    
                                    </td>                                   
                                </tr>
                                <%}%>                                                       
                            </tbody>
                        </table>
                    </div>                  
                </div>
            </div>             
            <div class="row">
                <div class="col l12 s12">
                    <jsp:include page="/Views/Shared/paginacion.jsp">
                        <jsp:param name="numPage" value="<%= numPage%>" />                        
                    </jsp:include>
                </div>
            </div>
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>
