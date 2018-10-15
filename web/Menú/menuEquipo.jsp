<%-- 
    Document   : menuEquipo
    Created on : 14-10-2018, 0:58:44
    Author     : Berni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
                        <a class="dropdown-item" href="listar_equipo.jsp">Listar Equipo</a>
                        <a class="dropdown-item" href="#">Agregar Jugador</a>
                    </div>
                </li>
            </ul>
        </nav>
        <br>



    </body>
</html>