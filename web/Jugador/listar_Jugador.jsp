





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
        <title>JSP Page</title>
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
        <sql:setDataSource var="dataSource" 
                           driver="com.mysql.jdbc.Driver" 
                           url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" 
                           user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="jugador">
            SELECT j.id,j.nombre,j.ap_paterno,j.rut,j.user,j.pass,t.descripcion_tipoj,e.descripcion_estadoj,s.descripcion_seleccion,eq.nombre_equipo FROM jugador j JOIN tipo_jugador t ON j.tipo = t.id JOIN estado_jugador e on e.id = j.estado JOIN seleccion_jugador s ON s.id = j.seleccion JOIN equipo eq on j.equipo = eq.id
        </sql:query> 




        <jsp:include page="../Menú/menuEquipo.jsp"></jsp:include>
            <br>
            <img src="../img/laPrieta.png" alt="" width="1000" height="100" style="margin-left: 170px"/>
            <br>
            <br>

                <div class="container">    
                    <form  action="../procesoJugador" method="GET">
                        <table class="table table-dark" style="width: 800px" >
                        <tr>
                            <td>ID: </td>
                            <td>Nombre: </td>
                            <td>Apellido: </td>
                            <td>Rut: </td>
                            <td>Usuario: </td>
                            <td>Contraseña: </td>
                            <td>Tipo de Usuario: </td>
                            <td>Estado Usuario: </td>
                            <td>Seleccionado: </td>
                            <td style="width:500px" width="1000">Equipo Asociado </td>
                            <td>Modificar</td>
                           <%--  <td>Desactivar</td>  --%>
                        </tr>


                        <c:forEach var = "row" items = "${jugador.rows}">
                            <tr>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtId" value="${row.id}"/></td>
                                <td>${row.nombre}</td>
                                <td>${row.ap_paterno}</td>
                                <td>${row.rut}</td>
                                <td>${row.user}</td>
                                <td>${row.pass}</td>
                                <td>${row.descripcion_tipoj}</td>
                                <td>${row.descripcion_estadoj}</td>
                                <td>${row.descripcion_seleccion}</td>
                                <td style="width:500px">${row.nombre_equipo}</td>
                                <td><a href="modificar_jugador.jsp?id=${row.id}" id="url" class="btn btn-info" style="color: white"/>Modificar</a></td>
                                <%--  <td><a href="desactivar_jugador.jsp?id=${row.id}" id="url" class="btn btn-info" style="color: white"/>Desactivar</a></td>  --%>
                                
                                
                            </tr>
                        </c:forEach>

                    </table>
                </form>
                    

            </div>
            <div class="alert alert-dark" style="max-width: 800px;margin-left: 330px" >
                    <strong>Felicidades!</strong> ${mensaje}
                </div>
    </body>
</html>
