<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.entidadesdenegocio.TipoMembresia"%>
<%@page import="goldengym.accesoadatos.TipoMembresiaDAL"%>
<%@page import="java.util.ArrayList"%>

<% ArrayList<TipoMembresia> tiposMembresias = TipoMembresiaDAL.obtenerTodos();
    int id = Integer.parseInt(request.getParameter("id"));
%>
<select id="slTipoMembresia" name="idTipoMembresia">
    <option <%=(id == 0) ? "selected" : ""%>  value="0">SELECCIONAR</option>
    <% for (TipoMembresia tipoMembresia : tiposMembresias) {%>
        <option <%=(id == tipoMembresia.getId()) ? "selected" : "" %>  value="<%=tipoMembresia.getId()%>"><%= tipoMembresia.getNombre()%></option>
    <%}%>
</select>
<label for="idTipoMembresia">TipoMembresia</label>
