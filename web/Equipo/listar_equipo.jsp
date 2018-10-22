<%-- 
    Document   : listar_equipo
    Created on : 14-10-2018, 0:47:20
    Author     : Berni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Equipos</title>
        <link rel="shortcut icon" href="../img/LOL_Logo.ico" />
        <style>
            body{
                background: url(../img/league.png) no-repeat center center fixed;
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

        <sql:query dataSource = "${snapshot}" var = "equipo">
            SELECT e.id,e.nombre_equipo,ep.descripcion_estadoe,l.descripcion_liga,e.foto_link FROM equipo e JOIN estado_equipo ep ON e.estado = ep.id JOIN liga l ON e.liga=l.id  
        </sql:query>



        <c:choose>
            <c:when test="${usuario == null }">
                <h1>Tiene que iniciar sesión primero</h1>
                <h3><a href="../login1.jsp">(Iniciar Sesión)</a></h3>
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
                    <img src="../img/laPrieta.png" alt="" width="1350" height="100" style="margin-left: 80px"/>
                    <br>
                    <br>
                    <div class="col-sm-6">

                        <div class="container">    
                            <form  action="../procesoEquipo" method="GET">
                                <table class="table table-dark" style="width: 800px;margin-left: 300px">
                                    <thead>
                                        <tr>

                                            <th>ID</th>
                                            <th>NOMBRE EQUIPO</th>
                                            <th>ESTADO</th>
                                            <th>LIGA</th>
                                            <th>ICONO</th>
                                            <th>MODIFICAR</th>
                                            <th>MODIFICAR</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var = "row" items ="${equipo.rows}">
                                        <tr>
                                            <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtId" readonly="" value="${row.id}" /></td>
                                            <td>${row.nombre_equipo}</td>
                                            <td>${row.descripcion_estadoe}</td>
                                            <td>${row.descripcion_liga}</td>
                                            <td><img src="../img/${row.foto_link}" alt="" width="50" height="50"/></td>

                                            <td><a href="modificar_equipo.jsp?id=${row.id}" id="url" style="color: white"/>Modificar</td>
                                            <td><a href="../Jugador/listar_Jugador.jsp?id=${row.id}" id="url" style="color: white"/>Ver jugadores</td>
                                        </tr>
                                    </c:forEach>

                            </table>
                        </form>


                    </div>
                </div>
                <div class="alert alert-light alert-dismissible"  style="width: 200px">
                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>${mensaje}</strong>
                </div>
            </c:when>
            <c:when test="${tipoSU == 1 && estadoSU==1}">
                <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>

                    <img src="../img/laPrieta.png" alt="" width="1150" height="100" style="margin-left: 80px"/>
                    <br>
                    <br>
                    <div class="col-sm-6">

                        <div class="container">    
                            <form  action="../procesoEquipo" method="GET">
                                <table class="table table-dark" style="width: 800px;margin-left: 220px">
                                    <thead>
                                        <tr>

                                            <th>ID</th>
                                            <th>NOMBRE EQUIPO</th>
                                            <th>ESTADO</th>
                                            <th>LIGA</th>
                                            <th>ICONO</th>
                                            <th>MODIFICAR</th>
                                            <th>MODIFICAR</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var = "row" items ="${equipo.rows}">
                                        <tr>
                                            <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtId" readonly="" value="${row.id}" /></td>
                                            <td>${row.nombre_equipo}</td>
                                            <td>${row.descripcion_estadoe}</td>
                                            <td>${row.descripcion_liga}</td>
                                            <td><img src="../img/${row.foto_link}" alt="" width="50" height="50"/></td>

                                            <td><a href="modificar_equipo.jsp?id=${row.id}" id="url" style="color: white"/>Modificar</td>
                                            <td><a href="../Jugador/listar_Jugador.jsp?id=${row.id}" id="url" style="color: white"/>Ver jugadores</td>
                                        </tr>
                                    </c:forEach>

                            </table>
                        </form>


                    </div>
                </div>
                <div class="alert alert-light alert-dismissible"  style="width: 200px">
                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>${mensaje}</strong>
                </div>
            </c:when>
        </c:choose>


    </body>
</html>
