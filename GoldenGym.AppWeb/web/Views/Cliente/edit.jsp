<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.Cliente"%>
<% Cliente cliente = (Cliente) request.getAttribute("cliente");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/Views/Shared/title.jsp" />
        <title>Editar Cliente</title>
    </head>
    <body>
        <jsp:include page="/Views/Shared/headerBody.jsp" />  
        <main class="container">   
            <h5>Editar Cliente</h5>
            <form action="Contacto" method="post">
                <input type="hidden" name="accion" value="<%=request.getAttribute("accion")%>">   
                <input type="hidden" name="id" value="<%=contacto.getId()%>">   
                <div class="row">
                    <div class="input-field col l4 s12">
                        <input  id="txtIdGenero" type="text" name="idgenero" value="<%=cliente.getIdGenero()%>" required class="validate" maxlength="50">
                        <label for="txtIdGenero">IdGenero</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input  id="txtNombre" type="text" name="nombre" value="<%=contacto.getNombre()%>" required class="validate" maxlength="50">
                        <label for="txtNombre">Nombre</label>
                    </div>
                     <div class="input-field col l4 s12">
                        <input  id="txtApellido" type="text" name="apellido" value="<%=cliente.getApellido()%>" required class="validate" maxlength="50">
                        <label for="txtApellido">Apellido</label>
                    </div>
                        <div class="input-field col l4 s12">
                        <input  id="txtCodigo" type="text" name="codigo" value="<%=cliente.getCodigo()%>" required class="validate" maxlength="15">
                        <label for="txtCodigo">Codigo</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input  id="txtEmail" type="text" name="email" value="<%=cliente.getEmail()%>" required class="validate" maxlength="100">
                        <label for="txtEmail">Email</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input  id="txtTelefono" type="text" name="telefono" value="<%=contacto.getTelefono()%>" required class="validate" maxlength="15">
                        <label for="txtTelefono">Teléfono</label>
                    </div>
                    <div class="input-field col l4 s12">
                        <input  id="txtEdad" type="text" name="edad" value="<%=cliente.getEdad()%>" required class="validate" maxlength="15">
                        <label for="txtEdad">Edad</label>
                    </div>
                        <div class="input-field col l4 s12">
                        <input  id="txtFechaRegistro" type="text" name="fechagistro" value="<%=cliente.getFecharegistro()%>" required class="validate" maxlength="15">
                        <label for="txtEdad">Edad</label>
                    </div>
                        <div class="input-field col l4 s12">
                        <input  id="txtEstatus" type="text" name="estatus" value="<%=cliente.getEstatus()%>" required class="validate" maxlength="50">
                        <label for="txtEstatus">Estatus</label>
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
    </body>
</html>

