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
                    <a class="nav-link" href="../menuCoach/index_equipo.jsp">Inicio</a>
                </li>

                <!-- Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Equipos
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../menuCoach/agregar_equipo.jsp">Agregar Equipo</a>
                        <a class="dropdown-item" href="../menuCoach/listar_equipo.jsp">Listar Equipos</a>
                    </div>
                </li>  
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Jugadores
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../menuCoach/agregar_Jugador.jsp">Agregar Jugador</a>
                        <a class="dropdown-item" href="../menuCoach/listar_Jugador.jsp">Listar Jugadores</a>
                    </div>
                </li> 
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Ligas
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../menuCoach/octavos.jsp">Octavos</a>
                        <a class="dropdown-item" href="../menuCoach/Cuartos.jsp">Cuartos</a>
                        <a class="dropdown-item" href="../menuCoach/SemiFinal.jsp">Semifinal</a>
                        <a class="dropdown-item" href="../menuCoach/Finale.jsp">Final</a>
                        <a class="dropdown-item" href="../menuCoach/Ganador.jsp">Ganador</a>
                        <a class="dropdown-item" href="../menuCoach/Clasificatoria.jsp">Esquema</a>
                    </div>
                </li>
                <li><a href="../procesoSession">Cerrar Sesion</a></li>
            </ul>
        </nav>
        <br>



    </body>
</html>