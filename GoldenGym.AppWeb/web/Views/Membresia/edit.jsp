<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.Membresia"%>
<% Membresia membresia = (Membresia) request.getAttribute("membresia");%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Editar Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Editar Membresia</h5>
            <form action="Membresia" method="post" onsubmit="return  validarFormulario()">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>"> 
                <input type="hidden" name="id" value="<%=membresia.getId()%>">  
                <div class="row">
                    <div class="input-field col l4 s12">   
                        <jsp:include page="/Views/Cliente/select.jsp">                           
                            <jsp:param name="id" value="<%=membresia.getCliente().getNombre() %>" />  
                        </jsp:include>  
                        <span id="slCliente_error" style="color:red" class="helper-text"></span>
                    </div>
                    <div class="input-field col l4 s12">   
                        <jsp:include page="/Views/TipoMembresia/select.jsp">                           
                            <jsp:param name="id" value="<%=membresia.getTipomembresia().getNombre()%>" />  
                        </jsp:include>  
                        <span id="slTipoMembresia_error" style="color:red" class="helper-text"></span>
                    </div>
                    
                    <div class="input-field col l4 s12">
                        <input  id="txtFechaRegistro" type="date" name="fechaRegistro" value="<%=membresia.getFechaRegistro()%>" required class="validate" maxlength="50">
                        <label for="txtFechaRegistro">Fecha de Registro</label>
                    </div>                       
                    <div class="input-field col l4 s12">
                        <input  id="txtFechaVencimiento" type="date" name="fechaVencimiento" value="<%=membresia.getFechaVencimiento()%>" required class="validate" maxlength="30">
                        <label for="txtFechaVencimiento">Fecha de Vencimiento</label>
                    </div> 
                   <div class="input-field col l4 s12">   
                        <select id="slEstatus" name="estatus" class="validate">
                            <option value="0" <%=(membresia.getEstatus() == 10) ? "selected" : ""%>>SELECCIONAR</option>
                            <option value="<%=Membresia.EstatusUsuario.ACTIVO%>"  <%=(membresia.getEstatus() == Membresia.EstatusUsuario.ACTIVO) ? "selected" : ""%>>ACTIVO</option>
                            <option value="<%=Membresia.EstatusUsuario.INACTIVO%>"  <%=(membresia.getEstatus() == Membresia.EstatusUsuario.INACTIVO) ? "selected" : ""%>>INACTIVO</option>
                        </select>       
                        <label for="slEstatus">Estatus</label>
                        <span id="slEstatus_error" style="color:red" class="helper-text"></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col l12 s12">
                        <button type="sutmit" class="waves-effect waves-light btn blue"><i class="material-icons right">save</i>Guardar</button>
                        <a href="Membresia" class="waves-effect waves-light btn blue"><i class="material-icons right">cancel</i>Cancelar</a>                          
                    </div>
                </div>
            </form>          
        </main>
                        
        <jsp:include page="/Views/Shared/footerBody.jsp" />   
        <script>
             function validarFormulario() {
                var result = true;
                var slEstatus = document.getElementById("slEstatus");
                var slEstatus_error = document.getElementById("slEstatus_error");
                var slCliente = document.getElementById("slCliente");
                var slCliente_error = document.getElementById("slCliente_error");
                var slTipoMembresia = document.getElementById("slTipoMembresia");
                var slTipoMembresia_error = document.getElementById("slTipoMembresia_error");
                if (slEstatus.value == 0) {
                    slEstatus_error.innerHTML = "El estatus es obligatorio";
                    result = false;
                } else {
                    slEstatus_error.innerHTML = "";
                }
                if (slCliente.value == 0) {
                    slCliente_error.innerHTML = "Cliente es obligatorio";
                    result = false;
                } else {
                    slCliente_error.innerHTML = "";
                }
                if (slTipoMembresia.value == 0) {
                    slTipoMembresia_error.innerHTML = "El tipo de membresia es obligatorio";
                    result = false;
                } else {
                    slTipoMembresia_error.innerHTML = "";
                }


                return result;
            }
        </script>
    </body>
</html>
