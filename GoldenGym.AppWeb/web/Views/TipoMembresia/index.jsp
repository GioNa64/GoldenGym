<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.TipoMembresia"%>
<%@page import="java.util.ArrayList"%>

<% ArrayList<TipoMembresia> tiposMembresias = (ArrayList<TipoMembresia>) request.getAttribute("tiposMembresias");
    int numPage = 1;
    int numReg = 10;
    int countReg = 0;
    if (tiposMembresias == null) {
        tiposMembresias = new ArrayList();
    } else if (tiposMembresias.size() > numReg) {
        double divNumPage = (double) tiposMembresias.size() / (double) numReg;
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
        <title>Lista de Tipos de Membresias</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Buscar TipoMembresia</h5>
            <form action="TipoMembresia" method="post">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>"> 
                <div class="row">
                    <div class="input-field col l4 s12">
                        <input  id="txtNombre" type="text" name="nombre">
                        <label for="txtNombre">Nombre</label>
                    </div>  
                    <div class="input-field col l4 s12">
                        <input  id="txtDescripcion" type="text" name="descripcion">
                        <label for="txtDescripcion">Descripcion</label>
                    </div> 
                    <div class="input-field col l4 s12">
                        <input  id="txtPrecio" type="text" name="precio">
                        <label for="txtPrecio">Precio</label>
                    </div>                    
                    <div class="input-field col l4 s12">
                        <input  id="txtDuracion" type="text" name="duracion">
                        <label for="txtDuracion">Duracion</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input  id="txtEstatus" type="text" name="estatus">
                        <label for="txtEstatus">Estatus</label>
                    </div>
                    
                    <div class="input-field col l4 s12">   
                        <jsp:include page="/Views/Shared/selectTop.jsp">
                            <jsp:param name="top_aux" value="<%=top_aux%>" />                        
                        </jsp:include>                        
                    </div> 
                </div>
                <div class="row">
                    <div class="col l12 s12">
                        <button type="sutmit" class="waves-effect waves-light btn blue"><i class="material-icons right">search</i>Buscar</button>
                        <a href="TipoMembresia?accion=create" class="waves-effect waves-light btn blue"><i class="material-icons right">add</i>Crear</a>                          
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col l12 s12">
                    <div style="overflow: auto">
                        <table class="paginationjs">
                            <thead>
                                <tr>                                     
                                    <th>Nombre</th>  
                                    <th>Descripcion</th> 
                                    <th>Precio</th>  
                                    <th>Duracion</th>  
                                    <th>Estatus</th>
                                </tr>
                            </thead>                       
                            <tbody>                           
                                <% for (TipoMembresia tiposMembresia : tiposMembresias) {
                                        int tempNumPage = numPage;
                                        if (numPage > 1) {
                                            countReg++;
                                            double divTempNumPage = (double) countReg / (double) numReg;
                                            tempNumPage = (int) Math.ceil(divTempNumPage);
                                        }
                                %>
                                <tr data-page="<%= tempNumPage%>">                                    
                                    <td><%=TipoMembresia.getNombre()%></td>  
                                    <td><%=TipoMembresia.getDescripcion()%></td>
                                    <td><%=TipoMembresia.getPrecio()%></td>  
                                    <td><%=TipoMembresia.getDuracion()%></td>
                                    <td><%=TipoMembresia.getEstatus()%></td>
                                    <td>
                                        <div style="display:flex">
                                             <a href="TipoMembresia?accion=edit&id=<%=tipomembresia.getId()%>" title="Modificar" class="waves-effect waves-light btn green">
                                            <i class="material-icons">edit</i>
                                        </a>
                                        <a href="TipoMembresia?accion=details&id=<%=tipomembresia.getId()%>" title="Ver" class="waves-effect waves-light btn blue">
                                            <i class="material-icons">description</i>
                                        </a>
                                        <a href="TipoMembresia?accion=delete&id=<%=tipomembresia.getId()%>" title="Eliminar" class="waves-effect waves-light btn red">
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
