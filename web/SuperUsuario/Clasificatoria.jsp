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
        <title>Clasificatorias | LoL</title>
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

    <style type="text/css">
        .table-wrapper-scroll-y {
            display: block;
            max-height: 120000000px;
            max-width:  1900000px;
            overflow-y: auto;
            -ms-overflow-style: -ms-autohiding-scrollbar;
        }
    </style>

</head>
<body>
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                       url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                       user = "mojaber_ali"  password = "12345"/>

    <%--Query para mostrar los datos en la lista--%>
    <sql:query dataSource = "${snapshot}" var = "admin">
        SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 2 and e.liga =2
    </sql:query>

    <sql:query dataSource = "${snapshot}" var = "admin1">
        SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 3 and e.liga =2
    </sql:query>


    <sql:query dataSource = "${snapshot}" var = "admin2">
        SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 4 and e.liga =2
    </sql:query>

    <sql:query dataSource = "${snapshot}" var = "admin3">
        SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 5 and e.liga =2
    </sql:query>

    <c:choose>
        <c:when test="${usuario == null }">
            <div class="jumbotron" heigth="8000" style="text-align: center">
                <h1 class="display-4">Tiene que iniciar sesión primero</h1>
                <h1 class="lead">Creiste que podías entrar por url Rufián?</h1>
                <h3 class="lead">Querías que el profe Juilliet nos Humillara??</h3>
                <hr class="my-4">
                <h3>Pues Jamesito valido Urls Prueba con : <a class="btn btn-primary btn-lg" href="../login1.jsp" role="button">Iniciar sesión</a></h3>

                <img src="../img/519.gif" alt="" width="300" height="250" />
                <br><br><br><br><br><br>


            </div>
        </c:when>
         <c:when test="${tipo == 1 && estado !=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipo == 2 && estado !=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipo == 1 && estado ==1}">
            <h1>Tu usuario es incorrecto</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
        <c:when test="${tipoSU == 2 && estadoSU!=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipoSU == 1 && estadoSU!=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipoSU == 2 && estadoSU==1}">
                <jsp:include page="../Menú/menuAdmin.jsp"></jsp:include>
                <div class="row">
                    <div class="col">
                        <table class="table table-dark" style="width: 260px"  height="500">
                            <thead>

                                <tr><td colspan="2" heigth="70"><h1><img src="../img/octavos.png" alt="" width="260" height="30"/></h1></td></tr>

                                <tr><td colspan="2" heigth="70"><img src="../img/Primera sangre.png" alt="" width="200" height="50"/> </td></tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${admin.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">


                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  870px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1170px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1470px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1770px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  2070px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  2370px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Jinx.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
                <div class="col">
                    <div class="col-sm">
                        <table class="table table-dark" style="width: 260px"  height="500">
                            <thead>

                                <tr><td colspan="2" heigth="70"><h1><img src="../img/Cuartos.png" alt="" width="260" height="30"/></h1></td></tr>

                                <tr><td colspan="2" heigth="70"><img src="../img/Segunda.png" alt="" width="200" height="50"/> </td></tr>
                            </thead>
                            <tbody>
                                <c:forEach var = "row" items = "${admin1.rows}">
                                <form action="procesoSuperUsuario" method="GET">

                                    <tr height="150">


                                    <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                    <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                    </tr>


                                </c:forEach>
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  870px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  1170px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/123.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                        </table>
                    </div>
                </div>
                <div class="col">
                    <table class="table table-dark" style="width: 270px"  height="500">
                        <thead>

                            <tr><td colspan="2" heigth="70"><h1><img src="../img/Semifinal.png" alt="" width="270" height="30"/></h1></td></tr>

                            <tr><td colspan="2" heigth="70"><img src="../img/aliado.png" alt="" width="200" height="50"/> </td></tr>
                        </thead>
                        <tbody>
                            <c:forEach var = "row" items = "${admin2.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">


                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/1234.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
                <div class="col">
                    <table class="table table-dark" style="width: 270px"  height="500">
                        <thead>

                            <tr><td colspan="2" heigth="70"><h1><img src="../img/Final.png" alt="" width="270" height="30"/></h1></td></tr>

                            <tr><td colspan="2" heigth="70"><img src="../img/ulti.png" alt="" width="200" height="50"/> </td></tr>
                        </thead>
                        <tbody>
                            <c:forEach var = "row" items = "${admin3.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  280px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/12345.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
            </div>   


        </c:when>
        <c:when test="${tipoSU == 1 && estadoSU==1}">
            <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                <div class="row">
                    <div class="col">
                        <table class="table table-dark" style="width: 260px"  height="500">
                            <thead>

                                <tr><td colspan="2" heigth="70"><h1><img src="../img/octavos.png" alt="" width="260" height="30"/></h1></td></tr>

                                <tr><td colspan="2" heigth="70"><img src="../img/Primera sangre.png" alt="" width="200" height="50"/> </td></tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${admin.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">


                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  870px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1170px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1470px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1770px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  2070px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  2370px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Jinx.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
                <div class="col">
                    <div class="col-sm">
                        <table class="table table-dark" style="width: 260px"  height="500">
                            <thead>

                                <tr><td colspan="2" heigth="70"><h1><img src="../img/Cuartos.png" alt="" width="260" height="30"/></h1></td></tr>

                                <tr><td colspan="2" heigth="70"><img src="../img/Segunda.png" alt="" width="200" height="50"/> </td></tr>
                            </thead>
                            <tbody>
                                <c:forEach var = "row" items = "${admin1.rows}">
                                <form action="procesoSuperUsuario" method="GET">

                                    <tr height="150">


                                    <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                    <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                    </tr>


                                </c:forEach>
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  870px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  1170px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/123.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                        </table>
                    </div>
                </div>
                <div class="col">
                    <table class="table table-dark" style="width: 270px"  height="500">
                        <thead>

                            <tr><td colspan="2" heigth="70"><h1><img src="../img/Semifinal.png" alt="" width="270" height="30"/></h1></td></tr>

                            <tr><td colspan="2" heigth="70"><img src="../img/aliado.png" alt="" width="200" height="50"/> </td></tr>
                        </thead>
                        <tbody>
                            <c:forEach var = "row" items = "${admin2.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">


                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/1234.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
                <div class="col">
                    <table class="table table-dark" style="width: 270px"  height="500">
                        <thead>

                            <tr><td colspan="2" heigth="70"><h1><img src="../img/Final.png" alt="" width="270" height="30"/></h1></td></tr>

                            <tr><td colspan="2" heigth="70"><img src="../img/ulti.png" alt="" width="200" height="50"/> </td></tr>
                        </thead>
                        <tbody>
                            <c:forEach var = "row" items = "${admin3.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  280px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/12345.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
            </div>   
        </c:when>
            <c:when test="${tipo == 2 && estado ==1}">
                <jsp:include page="../Menú/menuCoach.jsp"></jsp:include>
                <div class="row">
                    <div class="col">
                        <table class="table table-dark" style="width: 260px"  height="500">
                            <thead>

                                <tr><td colspan="2" heigth="70"><h1><img src="../img/octavos.png" alt="" width="260" height="30"/></h1></td></tr>

                                <tr><td colspan="2" heigth="70"><img src="../img/Primera sangre.png" alt="" width="200" height="50"/> </td></tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${admin.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">


                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  870px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1170px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1470px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  1770px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  2070px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  2370px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/Jinx.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
                <div class="col">
                    <div class="col-sm">
                        <table class="table table-dark" style="width: 260px"  height="500">
                            <thead>

                                <tr><td colspan="2" heigth="70"><h1><img src="../img/Cuartos.png" alt="" width="260" height="30"/></h1></td></tr>

                                <tr><td colspan="2" heigth="70"><img src="../img/Segunda.png" alt="" width="200" height="50"/> </td></tr>
                            </thead>
                            <tbody>
                                <c:forEach var = "row" items = "${admin1.rows}">
                                <form action="procesoSuperUsuario" method="GET">

                                    <tr height="150">


                                    <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                    <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                    </tr>


                                </c:forEach>
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  870px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  1170px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <img src="../img/123.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                        </table>
                    </div>
                </div>
                <div class="col">
                    <table class="table table-dark" style="width: 270px"  height="500">
                        <thead>

                            <tr><td colspan="2" heigth="70"><h1><img src="../img/Semifinal.png" alt="" width="270" height="30"/></h1></td></tr>

                            <tr><td colspan="2" heigth="70"><img src="../img/aliado.png" alt="" width="200" height="50"/> </td></tr>
                        </thead>
                        <tbody>
                            <c:forEach var = "row" items = "${admin2.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">


                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  270px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  570px;position: absolute;margin-left:  132px" width="50" height="50" />
                            <img src="../img/1234.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
                <div class="col">
                    <table class="table table-dark" style="width: 270px"  height="500">
                        <thead>

                            <tr><td colspan="2" heigth="70"><h1><img src="../img/Final.png" alt="" width="270" height="30"/></h1></td></tr>

                            <tr><td colspan="2" heigth="70"><img src="../img/ulti.png" alt="" width="200" height="50"/> </td></tr>
                        </thead>
                        <tbody>
                            <c:forEach var = "row" items = "${admin3.rows}">
                            <form action="procesoSuperUsuario" method="GET">

                                <tr height="150">
                                <img src="../img/Icono_VS.png" alt="" style="margin-top:  280px;position: absolute;margin-left:  132px" width="50" height="50" />
                                <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" style="margin-left: 110px"/><p style="margin-left: 100px">${row.nombre_equipo}</p></td>
                                </tr>


                            </c:forEach>
                            <img src="../img/12345.png" alt="" style="position: absolute;width: 80px;margin-left: 200px;margin-top: 80px"/>
                    </table>
                </div>
            </div>  
            </c:when>
    </c:choose>
</body>
</html>
