<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.Membresia"%>
<% Membresia membresia = (Membresia) request.getAttribute("membresia");%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Eliminar Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Eliminar Membresia</h5>
            <form action="Membresia" method="post">  
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>"> 
                <input type="hidden" name="id" value="<%=membresia.getId()%>">  
                <div class="row">
                    <div class="input-field col l4 s12">
                        <input id="txtCliente" type="text" value="<%=membresia.getCliente().getNombre()%>" disabled>
                        <label for="txtCliente">Cliente</label>
                    </div> 
                    <div class="input-field col l4 s12">
                        <input id="txtTipoMembresia" type="text" value="<%=membresia.getTipomembresia().getNombre()%>" disabled>
                        <label for="txtTipoMembresia">Tipo Membresia</label>
                    </div> 
                    <div class="input-field col l4 s12">
                        <input  id="txtFechaRegistro" type="text" value="<%=membresia.getFechaRegistro()%>" disabled>
                        <label for="txtFechaRegistro">Fecha Registro</label>
                    </div>                       
                    <div class="input-field col l4 s12">
                        <input  id="txtFechaVencimiento" type="text" value="<%=membresia.getFechaVencimiento()%>" disabled>
                        <label for="txtFechaVencimiento">Fecha Vencimiento</label>
                    </div> 
                    <div class="input-field col l4 s12">   
                        <select id="slEstatus" name="estatus" disabled>
                            <option value="0" <%=(membresia.getEstatus() == 10) ? "selected" : ""%>>SELECCIONAR</option>
                            <option value="<%=Membresia.EstatusUsuario.ACTIVO%>"  <%=(membresia.getEstatus() == Membresia.EstatusUsuario.ACTIVO) ? "selected" : ""%>>ACTIVO</option>
                            <option value="<%=Membresia.EstatusUsuario.INACTIVO%>"  <%=(membresia.getEstatus() == Membresia .EstatusUsuario.INACTIVO) ? "selected" : ""%>>INACTIVO</option>
                        </select>       
                        <label for="slEstatus">Estatus</label>                       
                    </div>
                </div>
                <div class="row">
                    <div class="col l12 s12">
                        <button type="sutmit" class="waves-effect waves-light btn blue"><i class="material-icons right">delete</i>Eliminar</button>
                        <a href="Membresia" class="waves-effect waves-light btn blue"><i class="material-icons right">cancel</i>Cancelar</a>                          
                    </div>
                </div>
            </form>          
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>
