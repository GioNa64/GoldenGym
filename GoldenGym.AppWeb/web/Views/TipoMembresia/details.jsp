<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.TipoMembresia"%>
<% TipoMembresia tipoMembresia = (TipoMembresia) request.getAttribute("tipoMembresia");%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Detalle del Tipo de Membresia</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Detalle del Tipo de Membresia</h5>
             <div class="row">
                <div class="row">
                    <div class="input-field col l4 s12">
                        <input  id="txtNombre" type="text" value="<%=tipoMembresia.getNombre()%>" disabled>
                        <label for="txtNombre">Nombre</label>
                    </div>                       
                    <div class="input-field col l4 s12">
                        <input  id="txtdescripcion" type="text" value="<%=tipoMembresias.getDescripcion()%>" disabled>
                        <label for="txtDecripcion">Decripcion</label>
                    </div> 
                    <div class="input-field col l4 s12">
                        <input  id="txtPrecio" type="text" value="<%=tipoMembresias.getPrecio()%>" disabled>
                        <label for="txtPrecio">Precio</label>
                    </div>      
                    <div class="input-field col l4 s12">
                        <input  id="txtDuracion" type="text" value="<%=tipoMembresias.getDuracion()%>" disabled>
                        <label for="txtDuracion">Duracion</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input id="txtEstatus" type="text" value="<%=tipoMembresias.getEstatus()%>" disabled>
                        <label for="txtEstatus">Estatus</label>
                    </div> 
                </div>

                <div class="row">
                    <div class="col l12 s12">
                         <a href="TipoMembresia?accion=edit&id=<%=TipoMembresia.getId()%>" class="waves-effect waves-light btn blue"><i class="material-icons right">edit</i>Ir modificar</a>            
                        <a href="TipoMembresia" class="waves-effect waves-light btn blue"><i class="material-icons right">cancel</i>Cancelar</a>                          
                    </div>
                </div>          
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>