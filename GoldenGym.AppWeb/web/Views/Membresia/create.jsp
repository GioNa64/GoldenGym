<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.Membresia"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Crear Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Crear Membresia</h5>
            <form action="Membresia" method="post" onsubmit="return  validarFormulario()">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>">                
                <div class="row">
                     <div class="input-field col l4 s12">   
                        <jsp:include page="/Views/Cliente/select.jsp">                           
                        <jsp:param name="id" value="0" />  
                        </jsp:include>  
                        <span id="slCliente_error" style="color:red" class="helper-text"></span>
                    </div>                    
                     <div class="input-field col l4 s12">   
                        <jsp:include page="/Views/TipoMembresia/select.jsp">                           
                            <jsp:param name="id" value="0" />  
                        </jsp:include>  
                        <span id="slTipoMembresia_error" style="color:red" class="helper-text"></span>
                    </div>
                    <div class="input-field col l4 s12">
                        <input id="txtFechaRegistro" type="date" name="fechaRegistro" required class="validate">
                        <label for="txtFechaRegistro">Fecha Registro</label>
                    </div>

                     <div class="input-field col l4 s12">
                        <input id="txtFechaVencimiento" type="date" name="fechaVencimiento" required class="validate">
                        <label for="txtFechaVencimiento">Fecha Vencimiento</label>
                    </div>
                    <div class="input-field col l4 s12">   
                        <select id="slEstatus" name="estatus" class="validate">
                            <option value="0">SELECCIONAR</option>
                            <option value="<%=Membresia.EstatusUsuario.ACTIVO%>">ACTIVO</option>
                            <option value="<%=Membresia.EstatusUsuario.INACTIVO%>">INACTIVO</option>
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
                var slCliente = document.getElementById("slCliente");
                var slCliente_error = document.getElementById("slCliente_error");
                if (slCliente.value == 0) {
                    slCliente_error.innerHTML = "El Cliente es obligatorio";
                    result = false;
                } else {
                    slCliente_error.innerHTML = "";
                }
                var slTipoMembresia = document.getElementById("slTipoMembresia");
                var slTipoMembresia_error = document.getElementById("slTipoMembresia_error");
                if (slTipoMembresia.value == 0) {
                    slTipoMembresia_error.innerHTML = "Tipo Membresia es obligatorio";
                    result = false;
                } else {
                    slTipoMembresia_error.innerHTML = "";
                }

                return result;
            }
        </script>
    </body>
</html>
