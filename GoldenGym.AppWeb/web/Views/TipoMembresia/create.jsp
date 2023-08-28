<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.TipoMembresia"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Crear Tipo de Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Crear Tipo de Membresia</h5>
            <form action="TipoMembresia" method="post" onsubmit="return  validarFormulario()">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>">                
                <div class="row">
                    <div class="input-field col l4 s12">
                        <input  id="txtNombre" type="text" name="nombre" required class="validate" maxlength="50">
                        <label for="txtNombre">Nombre</label>
                    </div>                       
                    <div class="input-field col l4 s12">
                        <input  id="txtDescripcion" type="text" name="descripcion" required class="validate" maxlength="50">
                        <label for="txtDecripcion">Descripcion</label>
                    </div> 
                    <div class="input-field col l4 s12">
                        <input  id="txtPrecio" type="text" name="precio" required class="validate" maxlength="25">
                        <label for="txtPrecio">Precio</label>
                    </div> 
                    <div class="input-field col l4 s12">
                        <input  id="txtDuracion" type="text" name="duracion" required class="validate" minlength="5" maxlength="32">
                        <label for="txtDuracion">Duracion</label>
                    </div>  
                     <div class="input-field col l4 s12">
                        <input  id="txtEstatus" type="text" name="estatus" required class="validate" minlength="5" maxlength="32">
                        <label for="txtEstatus">Estatus</label>
                    </div> 
                    <div class="input-field col l4 s12">   
                        <jsp:include page="/Views/TipoMembresia/select.jsp">                           
                            <jsp:param name="id" value="0" />  
                        </jsp:include>  
                        <span id="slTipoMembresia_error" style="color:red" class="helper-text"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col l12 s12">
                        <button type="sutmit" class="waves-effect waves-light btn blue"><i class="material-icons right">save</i>Guardar</button>
                        <a href="TipoMembresia" class="waves-effect waves-light btn blue"><i class="material-icons right">cancel</i>Cancelar</a>                          
                    </div>
                </div>
            </form>          
        </main>
                        
        <jsp:include page="/Views/Shared/footerBody.jsp" />   
        <script>
            function validarFormulario() {
                var result = true;
                var slTipoMembresia = document.getElementById("slTipoMembresia");
                var slTipoMembresia_error = document.getElementById("slTipoMembresia_error");
                if (slTipoMembresia.value == 0) {
                    slTipoMembresia_error.innerHTML = "El Tipo de Membresia es obligatorio";
                    result = false;
                } else {
                    slTipoMembresia_error.innerHTML = "";
                }

                return result;
            }
        </script>
    </body>
</html>