<%-- 
    Document   : menuEquipo
    Created on : 14-10-2018, 0:58:44
    Author     : Berni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <!-- Brand -->

            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Inicio</a>
                </li>

                <!-- Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Menu de Administracion de Equipo
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="agregar_equipo.jsp">Agregar Equipo</a>
                    </div>
                </li>
                <li><a href="../procesoSession">Cerrar Sesion</a></li>
                 <li>BIENVENIDO: ${usuario}</li>
            </ul>
        </nav>
        <br>



    </body>
</html>