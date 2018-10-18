<%-- 
    Document   : menuAdmin
    Created on : 15-10-2018, 3:32:09
    Author     : Berni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
                        Gestion de Equipos
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Agregar Equipo</a>
                        <a class="dropdown-item" href="#">Agregar Jugador</a>
                        <a class="dropdown-item" href="#">Listar Equipos</a>
                    </div>
                </li>   
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Ligas
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="octavos.jsp">Octavos</a>
                        <a class="dropdown-item" href="Cuartos.jsp">Cuartos</a>
                        <a class="dropdown-item" href="SemiFinal.jsp">Semifinal</a>
                        <a class="dropdown-item" href="Finale.jsp">Final</a>
                        <a class="dropdown-item" href="Ganador.jsp">Ganador</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Asignar Ganadores
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="OctavoDetalle.jsp">Main Octavos</a>
                        <a class="dropdown-item" href="CuartoDetalle.jsp">Main Cuartos</a>
                        <a class="dropdown-item" href="SegundoDetalle.jsp">Main Semifinal</a>
                        <a class="dropdown-item" href="FinalDetalle.jsp">Main Final</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Equipos
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Agregar coach</a>
                        <a class="dropdown-item" href="#">Agregar Jugador</a>
                    </div>
                </li>
                <li><a href="../procesoSession">Cerrar Sesion</a></li>
                <li>BIENVENIDO: ${usuario}</li>
            </ul>
        </nav>
        <br>



    </body>
</html>