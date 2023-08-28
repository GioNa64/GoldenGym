<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.TipoMembresia"%>
<% TipoMembresia tipoMembresia = (TipoMembresia) request.getAttribute("tipoMembresia");%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Editar Tipo de Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Editar Tipo de Membresia</h5>
            <form action="TipoMembresia" method="post" onsubmit="return  validarFormulario()">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>"> 
                <input type="hidden" name="id" value="<%=tipoMembresia.getId()%>">  
                <div class="row">
                    <div class="input-field col l4 s12">
                        <input  id="txtNombre" type="text" name="nombre" value="<%=tipoMembresia.getNombre()%>" required class="validate" maxlength="50">
                        <label for="txtNombre">Nombre</label>
                    </div>                       
                    <div class="input-field col l4 s12">
                        <input  id="txtDescripcion" type="text" name="descripcion" value="<%=tipoMembresia.getDescripcion()%>" required class="validate" maxlength="30">
                        <label for="txtDescripcion">Descripcion</label>
                    </div> 
                    <div class="input-field col l4 s12">
                        <input  id="txtPrecio" type="text" name="precio" value="<%=tipoMembresia.getPrecio()%>" required  class="validate" maxlength="25">
                        <label for="txtPrecio">Precio</label>
                    </div>
                    
                    <div class="input-field col l4 s12">
                        <input  id="txtDuracion" type="text" name="duracion" value="<%=tipoMembresia.getDuracion()%>" required  class="validate" maxlength="25">
                        <label for="txtDuracion">Duracion</label>
                    </div>
                        
                    <div class="input-field col l4 s12">
                        <input  id="txtEstatus" type="text" name="estatus" value="<%=tipoMembresia.getEstatus()%>" required  class="validate" maxlength="25">
                        <label for="txtEstatus">Estatus</label>
                    </div>
                    
                    <div class="input-field col l4 s12">   
                        <jsp:include page="/Views/TipoMembresia/select.jsp">                           
                            <jsp:param name="id" value="<%=tipoMembresia.getIdTipoMembresia() %>" />  
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