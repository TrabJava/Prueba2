<%-- 
    Document   : index
    Created on : 06-10-2018, 22:02:10
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
                        Menu administrador
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../SuperUsuario/agregar_administrador.jsp">Agregar Administrador</a>
                        <a class="dropdown-item" href="../SuperUsuario/listar_admin.jsp">Listar administradores</a>
                    </div>
                </li>
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
                        <a class="dropdown-item" href="../SuperUsuario/OctavoDetalle.jsp">Main Campeonato</a>
                        <a class="dropdown-item" href="../SuperUsuario/CuartoDetalle.jsp">Main Octavos</a>
                        <a class="dropdown-item" href="../SuperUsuario/SemiFinalDetalle.jsp">Main Cuartos</a>
                        <a class="dropdown-item" href="../SuperUsuario/SegundoDetalle.jsp">Main SemiFinal</a>
                        <a class="dropdown-item" href="../SuperUsuario/FinalDetalle.jsp">Main Final</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Equipos
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../Equipo/agregar_equipo.jsp">Agregar Equipo</a>
                        <a class="dropdown-item" href="../Equipo/listar_equipo.jsp">Listar Equipos</a>
                        <a class="dropdown-item" href="../Equipo/modificar_equipo.jsp">Modificar Equipos</a>
                        <a class="dropdown-item" href="#">Listar Jugadores de Equipos</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Jugadores
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../Jugador/Agregar_a_equipo.jsp">Agregar Equipo</a>
                        <a class="dropdown-item" href="../Jugador/agregar_Jugador.jsp">Agregar Jugador</a>
                        <a class="dropdown-item" href="../Jugador/listar_Jugador.jsp">Listar Jugadores</a>
                        <a class="dropdown-item" href="../Jugador/desactivar_jugador.jsp">desactivar Jugadores</a>
                        <a class="dropdown-item" href="../Jugador/listar_JugadorSinEquipo.jsp">Jugadores Sin equipo</a>
                        <a class="dropdown-item" href="../Jugador/modificar_jugador.jsp">Modificar Jugadores</a>
                    </div>
                </li>
                 <li><a href="../procesoSession">Cerrar Sesion</a></li>

            </ul>
        </nav>
        <br>



    </body>
</html>