<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.Cliente"%>
<%@page import="goldengym.entidadesdenegocio.Genero"%>
<%@page import="java.util.ArrayList"%>

<% ArrayList<Cliente> clientes = (ArrayList<Cliente>) request.getAttribute("clientes");
    int numPage = 1;
    int numReg = 10;
    int countReg = 0;
    if (clientes == null) {
        clientes = new ArrayList();
    } else if (clientes.size() > numReg) {
        double divNumPage = (double) clientes.size() / (double) numReg;
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
        <title>Lista de Clientes</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Buscar Cliente</h5>
            <form action="Cliente" method="post">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>"> 
                <div class="row">
                    <div class="input-field col l3 s12">
                        <input  id="txtNombre" type="text" name="nombre">
                        <label for="txtNombre">Nombre</label>
                    </div>
                    <div class="input-field col l3 s12">
                        <input  id="txtApellido" type="text" name="apellido">
                        <label for="txtApellido">Apellido</label>
                    </div>
                    <div class="input-field col l3 s12">
                        <input  id="txtCodigo" type="text" name="codigo">
                        <label for="txtCodigo">Codigo</label>
                    </div>
                    <div class="input-field col l3 s12">
                        <input  id="txtTelefono" type="text" name="telefono">
                        <label for="txtTelefono">Telefono</label>
                    </div> 
                    <div class="input-field col l3 s12">
                        <input  id="txtEmail" type="text" name="email">
                        <label for="txtEmail">Email</label>
                    </div>  

                    <div class="input-field col l3 s12">
                        <input  id="txtEdad" type="text" name="edad">
                        <label for="txtEdad">Edad</label>
                    </div>  
 
                    <div class="input-field col l4 s12">   
                        <select id="slEstatus" name="estatus" class="validate">
                            <option value="0">SELECCIONAR</option>
                            <option value="<%=Cliente.EstatusUsuario.ACTIVO%>">ACTIVO</option>
                            <option value="<%=Cliente.EstatusUsuario.INACTIVO%>">INACTIVO</option>
                        </select>       
                        <label for="slEstatus">Estatus</label>
                        <span id="slEstatus_error" style="color:red" class="helper-text"></span>
                    </div> 
                    <div class="input-field col l3 s12">   
                        <jsp:include page="/Views/Shared/selectTop.jsp">
                        <jsp:param name="top_aux" value="<%=top_aux%>" />                        
                        </jsp:include>                        
                    </div> 
                </div>
                <div class="row">
                    <div class="col l12 s12">
                        <button type="sutmit" class="waves-effect waves-light btn blue"><i class="material-icons right">search</i>Buscar</button>
                        <a href="Cliente?accion=create" class="waves-effect waves-light btn blue"><i class="material-icons right">add</i>Crear</a>                          
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col l12 s12">
                    <div style="overflow: auto">
                        <table class="paginationjs">
                            <thead>
                                <tr>
                                    <th>IdGenero</th>
                                    <th>Nombre</th> 
                                    <th>Apellido</th> 
                                    <th>Codigo</th> 
                                    <th>Email</th>
                                    <th>Telefono</th>
                                    <th>Edad</th>
                                    <th>FechaRegistro</th>
                                    <th>Estatus</th>
                                </tr>
                            </thead>                       
                            <tbody>                           
                               <% for (Cliente cliente : clientes) {
                                        int tempNumPage = numPage;
                                        if (numPage > 1) {
                                            countReg++;
                                            double divTempNumPage = (double) countReg / (double) numReg;
                                            tempNumPage = (int) Math.ceil(divTempNumPage);
                                        }
                                        String Estatus = "";
                                        switch (cliente.getEstatus()) {
                                        case 1:
                                                Estatus = "ACTIVO";
                                                break;
                                                case 2:
                                                Estatus = "INACTIVO";
                                                break;
                                            default:
                                                Estatus = "";
                                        }
                                %>
                                <tr data-page="<%= tempNumPage%>">
                                    <td><%=cliente.getIdGenero()%></td> 
                                    <td><%=cliente.getNombre()%></td>
                                    <td><%=cliente.getApellido()%></td>
                                    <td><%=cliente.getCodigo()%></td>
                                    <td><%=cliente.getEmail()%></td>
                                    <td><%=cliente.getTelefono()%></td>
                                    <td><%=cliente.getEdad()%></td>
                                    <td><%=cliente.getFechaRegistro()%></td>
                                    <td><%=cliente.getEstatus()%></td>
                                    <td>
                                        <div style="display:flex">
                                            <a href="Cliente?accion=edit&id=<%=cliente.getId()%>" title="Modificar" class="waves-effect waves-light btn green">
                                                <i class="material-icons">edit</i>
                                            </a>
                                            <a href="Cliente?accion=details&id=<%=cliente.getId()%>" title="Ver" class="waves-effect waves-light btn blue">
                                                <i class="material-icons">description</i>
                                            </a>
                                            <a href="Cliente?accion=delete&id=<%=cliente.getId()%>" title="Eliminar" class="waves-effect waves-light btn red">
                                                <i class="material-icons">delete</i>
                                            </a>     
                                        </div>
                                    </td>                                   
                                </tr>
                                <% } %>                                                       
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