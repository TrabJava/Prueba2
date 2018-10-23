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
                        Clasificatorias
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../SuperUsuario/octavos.jsp">Octavos</a>
                        <a class="dropdown-item" href="../SuperUsuario/Cuartos.jsp">Cuartos</a>
                        <a class="dropdown-item" href="../SuperUsuario/SemiFinal.jsp">Semifinal</a>
                        <a class="dropdown-item" href="../SuperUsuario/Finale.jsp">Final</a>
                        <a class="dropdown-item" href="../SuperUsuario/Ganador.jsp">Ganador</a>
                        <a class="dropdown-item" href="../SuperUsuario/Clasificatoria.jsp">Esquema</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Asignar Ganadores
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../SuperUsuario/ClasificacionDetalle.jsp">Main Agregar a Campeonato</a>
                        <a class="dropdown-item" href="../SuperUsuario/OctavoDetalle.jsp">Main Octavos</a>
                        <a class="dropdown-item" href="../SuperUsuario/CuartoDetalle.jsp">Main Cuartos</a>
                        <a class="dropdown-item" href="../SuperUsuario/SemiFinalDetalle.jsp">Main SemiFinal</a>
                        <a class="dropdown-item" href="../SuperUsuario/FinalDetalle.jsp">Main Final</a>
                        <a class="dropdown-item" href="../SuperUsuario/Ganador.jsp">Main Ganador</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Equipos
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../Equipo/agregar_equipo.jsp">Agregar Equipo</a>
                        <a class="dropdown-item" href="../Equipo/listar_equipo.jsp">Listar Equipos</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Jugadores
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../Jugador/agregar_Jugador.jsp">Agregar Jugador</a>
                        <a class="dropdown-item" href="../Jugador/listar_JugadorSinEquipo.jsp">Jugadores Sin equipo</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Ligas
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../Liga/agregar_liga.jsp">Agregar Liga</a>
                        <a class="dropdown-item" href="../Liga/listar_Liga.jsp">Listar Liga</a>
                    </div>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="../procesoSession">Cerrar Sesion</a>
                </li>
               <li class="nav-item">
                    <a class="nav-link" href="#">BIENVENIDO: ${usuario}</a>
                </li>            </ul>
        </nav>
        <br>



    </body>
</html>