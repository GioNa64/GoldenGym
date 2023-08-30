<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.Cliente"%>
<% Cliente cliente = (Cliente) request.getAttribute("cliente");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Detalles del Contacto</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Detalles del Contacto</h5>
            <div class="row">
                <div class="input-field col l4 s12">
                    <input disabled  id="txtIdGenero" type="text" value="<%=cliente.getIdGenero()%>">
                    <label for="txtIdGenero">IdGenero</label>
                </div>
                <div class="input-field col l4 s12">
                    <input disabled  id="txtNombre" type="text" value="<%=cliente.getNombre()%>">
                    <label for="txtNombre">Nombre</label>
                </div>
                <div class="input-field col l4 s12">
                    <input disabled  id="txtApelldio" type="text" value="<%=cliente.getApellido()%>">
                    <label for="txtApellido">Apellido</label>
                </div>
                <div class="input-field col l4 s12">
                    <input disabled  id="txtCodigo" type="text" value="<%=cliente.getCodigo()%>">
                    <label for="txtCodigo">Codigo</label>
                </div>
                    <div class="input-field col l4 s12">
                    <input disabled  id="txtEmail" type="text" value="<%=cliente.getEmail()%>">
                    <label for="txtEmail">Email</label>
                </div>
                    <div class="input-field col l4 s12">
                    <input disabled  id="txtTelefono" type="text" value="<%=cliente.getTelefono()%>">
                    <label for="txtTelefono">Telefono</label>
                </div>
                    <div class="input-field col l4 s12">
                    <input disabled  id="txtEdad" type="text" value="<%=cliente.getEdad()%>">
                    <label for="txtEdad">Edad</label>
                </div>
                    <div class="input-field col l4 s12">
                    <input disabled  id="txtFechaRegistri" type="text" value="<%=cliente.getFechaRegistro()%>">
                    <label for="txtFechaRegistro">Fecha Registro</label>
                </div>
                    <div class="input-field col l4 s12">
                    <input disabled  id="txtEstatus" type="text" value="<%=cliente.getEstatus()%>">
                    <label for="txtEstatus">Estatus</label>
                </div>
            </div>
            <div class="row">
                <div class="col l12 s12">
                    <a href="Cliente?accion=edit&id=<%=cliente.getId()%>" class="waves-effect waves-light btn blue"><i class="material-icons right">edit</i>Ir modificar</a>                        
                    <a href="Cliente" class="waves-effect waves-light btn blue"><i class="material-icons right">cancel</i>Cancelar</a>                          
                </div>
            </div>         
        </main>
        <jsp:include page="/Views/Shared/footerBody.jsp" />
    </body>
</html>