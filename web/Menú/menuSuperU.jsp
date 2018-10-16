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
                        <a class="dropdown-item" href="../SuperUsuario/OctavoDetalle.jsp">Main Octavos</a>
                        <a class="dropdown-item" href="../SuperUsuario/CuartoDetalle.jsp">Main Cuartos</a>
                        <a class="dropdown-item" href="../SuperUsuario/SemiFinalDetalle.jsp">Main Semifinal</a>
                        <a class="dropdown-item" href="../SuperUsuario/SegundoDetalle.jsp">Main Ginal</a>
                        <a class="dropdown-item" href="../SuperUsuario/FinalDetalle.jsp">Main Ganador</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Gestion de Equipos
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../Equipo/agregar_equipo.jsp">Agregar Equipo</a>
                        <a class="dropdown-item" href="../Jugador/agregar_Jugador.jsp">Agregar Jugador</a>
                        <a class="dropdown-item" href="../Equipo/listar_equipo.jsp">Listar Equipos</a>
                    </div>
                </li>
                 <li><a href="../procesoSession">Cerrar Sesion</a></li>

            </ul>
        </nav>
        <br>



    </body>
</html>