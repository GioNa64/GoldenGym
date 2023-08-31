<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.Cliente"%>
<%@page import="goldengym.entidadesdenegocio.Genero"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Crear Cliente</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Crear Cliente</h5>
            <form action="Cliente" method="post">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>">                
                <div class="row">
                    <div class="input-field col l4 s12">   
                        <jsp:include page="/Views/Genero/select.jsp">                           
                            <jsp:param name="id" value="0" />  
                        </jsp:include>  
                        <span id="slGenero_error" style="color:red" class="helper-text"></span>
                    </div>
                </div>
                    <div class="input-field col l4 s12">
                        <input  id="txtNombre" type="text" name="nombre" required class="validate" maxlength="30">
                        <label for="txtNombre">Nombre</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input  id="txtApelldio" type="text" name="apellido" required class="validate" maxlength="30">
                        <label for="txtApellido">Apellido</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input  id="txtCodigo" type="text" name="codigo" required class="validate" maxlength="30">
                        <label for="txtCodigo">Codigo</label>
                    </div>
                      <div class="input-field col l4 s12">
                        <input  id="txtEmail" type="text" name="email" required class="validate" maxlength="30">
                        <label for="txtEmail">Email</label>
                    </div>
                      <div class="input-field col l4 s12">
                        <input  id="txtTelefono" type="text" name="telefono" required class="validate" maxlength="30">
                        <label for="txtTelefono">Telefono</label>
                    </div>
                      <div class="input-field col l4 s12">
                        <input  id="txtEdad" type="text" name="edad" required class="validate" maxlength="30">
                        <label for="txtEdad">Edad</label>
                        
                    <div class="input-field col l4 s12">   
                        <select id="slEstatus" name="estatus" class="validate">
                            <option value="0">SELECCIONAR</option>
                            <option value="<%=Cliente.EstatusCliente.ACTIVO%>">ACTIVO</option>
                            <option value="<%=Cliente.EstatusCliente.INACTIVO%>">INACTIVO</option>
                        </select>       
                        <label for="slEstatus">Estatus</label>
                        <span id="slEstatus_error" style="color:red" class="helper-text"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col l12 s12">
                        <button type="sutmit" class="waves-effect waves-light btn blue"><i class="material-icons right">save</i>Guardar</button>
                        <a href="Cliente" class="waves-effect waves-light btn blue"><i class="material-icons right">cancel</i>Cancelar</a>                          
                    </div>
                </div>
            </form>          
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
        <script>
            function validarFormulario() {
                var result = true;
                var slGenero = document.getElementById("slGenero");
                var slGenero_error = document.getElementById("slGenero_error");
                if (slGenero.value == 0) {
                    slGenero_error.innerHTML = "El Genero es obligatorio";
                    result = false;
                } else {
                    slGenero_error.innerHTML = "";
                }

                return result;
            }
        </script>
    </body>
</html>
