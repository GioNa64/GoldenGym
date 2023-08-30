<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="goldengym.appweb.utils.*"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>

            <% if (SessionUser.isAuth(request)) {  %>
            <!-- Dropdown Structure -->
            <ul id="dropdown1" class="dropdown-content">
                <li><a href="Cliente">Clientes</a></li>
                <li><a href="Usuario">Usuarios</a></li>
                <li><a href="Rol">Roles</a></li>
                <li><a href="Genero">Géneros</a></li>
                <li><a href="TipoMembresia">Tipos de Membresias</a></li>
                <li><a href="Usuario?accion=cambiarpass">Cambiar password</a></li>
                <li class="divider"></li>
                <li><a href="Usuario?accion=login">Cerrar sesión</a></li>

            </ul>
            <nav>
                <div class="nav-wrapper blue">
                    <a href="Home" class="brand-logo">GoldenGym</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="Home">Inicio</a></li>
                        <li><a href="Membresia">Membresias</a></li>
                        <!-- Dropdown Trigger -->
                        <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Mantenimiento<i class="material-icons right">arrow_drop_down</i></a></li>
                    </ul>
                </div>
            </nav>
            <%}%>

<ul class="sidenav" id="mobile-demo">
     <% if (SessionUser.isAuth(request)) {  %>
            <li><a href="Home">Inicio</a></li>
            <li><a href="Membresia">Membresias</a></li>
            <li><a href="Genero">Géneros</a></li>
            <li><a href="Cliente">Clientes</a></li>
            <li><a href="Usuario">Usuarios</a></li>
            <li><a href="Rol">Roles</a></li
            <li><a href="Genero">Géneros</a></li>
            <li><a href="TipoMembresia">Tipos de Membresias</a></li>
            <li><a href="Usuario?accion=cambiarpass">Cambiar password</a></li>
            <li><a href="Usuario?accion=login">Cerrar sesión</a></li>
     <%}%>
</ul>
