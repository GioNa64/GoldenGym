<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldeygym.entidadesdenegocio.Membresia"%>
<% Membresia membresia = (Membresia) request.getAttribute("membresia");%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Detalle de la Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Detalle de la Membresia</h5>
             <div class="row">
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
                        <input id="txtFechaRegistro" type="date" value="<%=membresia.getFechaRegistro()%>" disabled>
                        <label for="txtFechaRegistro">Fecha de Registro</label>
                    </div> 
                     <div class="input-field col l4 s12">
                        <input id="txtFechaVencimiento" type="date" value="<%=membresia.getFechaVencimiento()%>" disabled>
                        <label for="txtFechaVencimiento">Fecha de Vencimiento</label>
                    </div> 
                     <div class="input-field col l4 s12">   
                        <select id="slEstatus" name="estatus" disabled>
                            <option value="0" <%=(membresia.getEstatus() == 10) ? "selected" : ""%>>SELECCIONAR</option>
                            <option value="<%=Membresia.EstatusUsuario.ACTIVO%>"  <%=(membresia.getEstatus() == Membresia.EstatusUsuario.ACTIVO) ? "selected" : ""%>>ACTIVO</option>
                            <option value="<%=Membresia.EstatusUsuario.INACTIVO%>"  <%=(membresia.getEstatus() == Membresia.EstatusUsuario.INACTIVO) ? "selected" : ""%>>INACTIVO</option>
                        </select>       
                        <label for="slEstatus">Estatus</label>                       
                    </div>
                    
                </div>

                <div class="row">
                    <div class="col l12 s12">
                         <a href="Membresia?accion=edit&id=<%=membresia.getId()%>" class="waves-effect waves-light btn blue"><i class="material-icons right">edit</i>Ir modificar</a>            
                        <a href="Membresia" class="waves-effect waves-light btn blue"><i class="material-icons right">cancel</i>Cancelar</a>                          
                    </div>
                </div>          
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>
