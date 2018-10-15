<%-- 
    Document   : menuAdmin
    Created on : 15-10-2018, 3:32:09
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
            </ul>
        </nav>
        <br>



    </body>
</html>