<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.TipoMembresia"%>
<% TipoMembresia tipoMembresia = (TipoMembresia) request.getAttribute("tipoMembresia");%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Eliminar Tipo de Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Eliminar Tipo de Membresia</h5>
            <form action="TipoMembresia" method="post">  
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>"> 
                <input type="hidden" name="id" value="<%=tipoMembresia.getId()%>">  
                <div class="row">
                    <div class="input-field col l4 s12">
                        <input  id="txtNombre" type="text" value="<%=tipoMembresia.getNombre()%>" disabled>
                        <label for="txtNombre">Nombre</label>
                    </div>                       
                    <div class="input-field col l4 s12">
                        <input  id="txtDescripcion" type="text" value="<%=tipoMembresia.getDescripcion()%>" disabled>
                        <label for="txtDescripcion">Descripcion</label>
                    </div> 
                    <div class="input-field col l4 s12">
                        <input  id="txtPrecio" type="text" value="<%=tipoMembresia.getPrecio()%>" disabled>
                        <label for="txtPrecio">Precio</label>
                    </div>      
                    <div class="input-field col l4 s12">
                        <input  id="txtDuracion" type="text" value="<%=tipoMembresia.getDuracion()%>" disabled>
                        <label for="txtDuracion">Duracion</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input id="txtEstatus" type="text" value="<%=tipoMembresia.getEstatus()%>" disabled>
                        <label for="txtEstatus">Estatus</label>
                    </div> 
                </div>
                <div class="row">
                    <div class="col l12 s12">
                        <button type="sutmit" class="waves-effect waves-light btn blue"><i class="material-icons right">delete</i>Eliminar</button>
                        <a href="TipoMembresia" class="waves-effect waves-light btn blue"><i class="material-icons right">cancel</i>Cancelar</a>                          
                    </div>
                </div>
            </form>          
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>
