<%-- 
    Document   : prueba2
    Created on : 12-10-2018, 13:24:26
    Author     : Jamesalfred
--%>
<!DOCTYPE html>
<%--Para hacer una Consulta directa a la bbd--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="../img/LOL_Logo.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Octavos | LoL</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </script>
    <style>
        body{
            background: url(../img/lolcito.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
    <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
    </head>
    <body>
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                       url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                       user = "mojaber_ali"  password = "12345"/>

    <%--Query para mostrar los datos en la lista--%>
    <sql:query dataSource = "${snapshot}" var = "admin">
        SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 2 and e.liga =2
    </sql:query>
    <div class="row">
        <div class="col-4">

            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <form method="POST" action="../procesoSuperUsuario">
                        <table class="table table-dark" style="width: 350px"  height="500">
                            <thead>
                                <tr><td colspan="2"><h1>Octavos de final</h1></td></tr>
                                <tr><td colspan="2"><h4>Primer encuentro</h4></td></tr>
                            </thead>
                            <tbody>
                                <c:forEach var = "row" items = "${admin.rows}">
                                <form action="procesoSuperUsuario" method="GET">

                                    <tr height="150">


                                    <img src="../img/Icono_VS.png" alt="" style="margin-top:  253px;position: absolute;margin-left:  132px" width="50" height="50" />
                                    <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                    </tr>


                                </c:forEach>
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  556px;position: absolute;margin-left:  132px" width="50" height="50" />
                        </table>


                    </form>
                </div>
                <div class="col-1"></div>
            </div>
        </div>



        <%--   -------------------Comienza nuestro segundo row ------------------------------ --%>



        <div class="col-8">
            <img src="../img/lol-logo.png" alt="" style="margin-left: 220px"/>

            <div class="container" style="margin-left: 270px">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                   ¿De que se trata?
                </button>

                <!-- The Modal -->
                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Octavos de final de League of legends</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                Bienvenido a nuestra ronda Inicial. Aquí podrás revisar los equipos que han sido Seleccionados para pelear en nuestro torneo de League of Legends
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
