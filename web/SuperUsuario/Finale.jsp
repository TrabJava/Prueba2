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
        <title>Semi | LoL</title>
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
</head>
<body>
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                       url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                       user = "mojaber_ali"  password = "12345"/>

    <%--Query para mostrar los datos en la lista--%>
    <sql:query dataSource = "${snapshot}" var = "admin">
        SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 5 and e.liga =2
    </sql:query>


    <c:choose>
        <c:when test="${usuario == null }">
            <div class="jumbotron" heigth="8000" style="text-align: center">
                <h1 class="display-4">Tiene que iniciar sesión primero</h1>
                <h1 class="lead">Creiste que podías entrar por url Rufián?</h1>
                <h3 class="lead">Querías que el profe Juilliet nos Humillara??</h3>
                <hr class="my-4">
                <h3>Pues BERNAL valido Urls Prueba con : <a class="btn btn-primary btn-lg" href="../login1.jsp" role="button">Iniciar sesión</a></h3>

                <img src="../img/519.gif" alt="" width="300" height="250" />
                <br><br><br><br><br><br>


            </div>
        </c:when>
        <c:when test="${tipoSU == 1 && estadoSU!=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipoSU == 2 && estadoSU!=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipoSU == 2 && estadoSU==1}">
                <jsp:include page="../Menú/menuAdmin.jsp"></jsp:include>
                <div class="row">
                    <div class="col-4">

                        <div class="row">
                            <div class="col-1">

                            </div>
                            <div class="col-10">
                                <form method="POST" action="../procesoSuperUsuario">
                                    <table class="table table-dark" style="width: 350px"  height="500">
                                        <thead>

                                            <tr><td colspan="2" heigth="70"><h1><img src="../img/Semifinal.png" alt="" width="300" height="30"/></h1></td></tr>

                                            <tr><td colspan="2" heigth="70"><img src="../img/ali.png" alt="" width="200" height="50"/> </td></tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var = "row" items = "${admin.rows}">
                                        <form action="procesoSuperUsuario" method="GET">

                                            <tr height="150">



                                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>

                                            </tr>


                                        </c:forEach>

                                        <img src="../img/smur.png" alt="" style="position: absolute;width: 80px;margin-left: 230px;margin-top: 80px"/>
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
                                        <h4 class="modal-title">Semi final de League of legends</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        Bienvenido a nuestra ronda Inicial. Aquí podrás revisar los equipos que han sido Seleccionados para pelear en nuestro torneo de League of Legends,Ya vamos en cuartos de Final, Analiza Bien y Apuesta en nuestros comentarios
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>
                    <br><br><br><br>
                    <div class="container">
                        <div class="row">
                            <div class="col-4">
                                <div class="col-1">

                                </div>
                                <div class="col-11">
                                    <img src="../img/1.jpg" alt="" width="200" height="200" class="border border-warning"/>
                                </div>

                            </div>
                            <div class="col-4">
                                <div class="col-1">

                                </div>
                                <div class="col-11">
                                    <img src="../img/2.jpg" alt="" width="200" height="200" class="border border-warning" />
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="col-1">

                                </div>
                                <div class="col-11">
                                    <img src="../img/3.jpg" alt="" width="200" height="200" class="border border-warning" />
                                </div>

                            </div>
                        </div>
                        <br><br>
                        <div class="row">
                            <div class="col-4">
                                <div class="col-1">

                                </div>
                                <div class="col-11">
                                    <img src="../img/4.jpg" alt="" width="200" height="200" class="border border-warning"/>
                                </div>

                            </div>
                            <div class="col-4">
                                <div class="col-1">

                                </div>
                                <div class="col-11">
                                    <img src="../img/5.jpg" alt="" width="200" height="200" class="border border-warning" />
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="col-1">

                                </div>
                                <div class="col-11">
                                    <img src="../img/6.jpg" alt="" width="200" height="200" class="border border-warning"/>
                                </div>

                            </div>
                        </div>

                    </div>

                    <br><br>
                    <div class="container">
                        <table class="table" style="width: 830px" >
                            <thead class="thead-dark">
                                <tr>
                                    <th>Dejanos tu delicioso Comentario, recuerda no flamear mancos</th>
                                </tr>
                            </thead>
                        </table>
                        <table class="table" style="width: 830px">
                            <thead class="thead-light">
                                <tr>
                                    <th>
                                        <div id="fb-root"></div>
                                        <script>(function (d, s, id) {
                                                var js, fjs = d.getElementsByTagName(s)[0];
                                                if (d.getElementById(id))
                                                    return;
                                                js = d.createElement(s);
                                                js.id = id;
                                                js.src = 'https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v3.1';
                                                fjs.parentNode.insertBefore(js, fjs);
                                            }(document, 'script', 'facebook-jssdk'));</script>
                                        <div class="fb-comments" data-href="http://localhost:8080/Prueba2/SuperUsuario/octavos.jsp" data-numposts="50" data-width="800" ></div>

                                    </th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </c:when>
                <c:when test="${tipoSU == 1 && estadoSU==1}">
                    <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                        <div class="row">
                            <div class="col-4">

                                <div class="row">
                                    <div class="col-1">

                                    </div>
                                    <div class="col-10">
                                        <form method="POST" action="../procesoSuperUsuario">
                                            <table class="table table-dark" style="width: 350px"  height="500">
                                                <thead>

                                                    <tr><td colspan="2" heigth="70"><h1><img src="../img/Semifinal.png" alt="" width="300" height="30"/></h1></td></tr>

                                                    <tr><td colspan="2" heigth="70"><img src="../img/ali.png" alt="" width="200" height="50"/> </td></tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var = "row" items = "${admin.rows}">
                                                <form action="procesoSuperUsuario" method="GET">

                                                    <tr height="150">


                                                    <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                                    <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                                    </tr>


                                                </c:forEach>    
                                                <img src="../img/smur.png" alt="" style="position: absolute;width: 80px;margin-left: 230px;margin-top: 80px"/>
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
                                                <h4 class="modal-title">Semi final de League of legends</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                Bienvenido a nuestra ronda Inicial. Aquí podrás revisar los equipos que han sido Seleccionados para pelear en nuestro torneo de League of Legends,Ya vamos en cuartos de Final, Analiza Bien y Apuesta en nuestros comentarios
                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                            </div>
                            <br><br><br><br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <img src="../img/1.jpg" alt="" width="200" height="200" class="border border-warning"/>
                                        </div>

                                    </div>
                                    <div class="col-4">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <img src="../img/2.jpg" alt="" width="200" height="200" class="border border-warning" />
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <img src="../img/3.jpg" alt="" width="200" height="200" class="border border-warning" />
                                        </div>

                                    </div>
                                </div>
                                <br><br>
                                <div class="row">
                                    <div class="col-4">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <img src="../img/4.jpg" alt="" width="200" height="200" class="border border-warning"/>
                                        </div>

                                    </div>
                                    <div class="col-4">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <img src="../img/5.jpg" alt="" width="200" height="200" class="border border-warning" />
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <img src="../img/6.jpg" alt="" width="200" height="200" class="border border-warning"/>
                                        </div>

                                    </div>
                                </div>

                            </div>

                            <br><br>
                            <div class="container">
                                <table class="table" style="width: 830px" >
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Dejanos tu delicioso Comentario, recuerda no flamear mancos</th>
                                        </tr>
                                    </thead>
                                </table>
                                <table class="table" style="width: 830px">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>
                                                <div id="fb-root"></div>
                                                <script>(function (d, s, id) {
                                                        var js, fjs = d.getElementsByTagName(s)[0];
                                                        if (d.getElementById(id))
                                                            return;
                                                        js = d.createElement(s);
                                                        js.id = id;
                                                        js.src = 'https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v3.1';
                                                        fjs.parentNode.insertBefore(js, fjs);
                                                    }(document, 'script', 'facebook-jssdk'));</script>
                                                <div class="fb-comments" data-href="http://localhost:8080/Prueba2/SuperUsuario/octavos.jsp" data-numposts="50" data-width="800" ></div>

                                            </th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>

                        </c:when>
                    </c:choose>
                    </body>
                    </html>
