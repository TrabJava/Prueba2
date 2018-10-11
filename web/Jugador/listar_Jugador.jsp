<%-- 
    Document   : listar_Jugador
    Created on : 10-10-2018, 0:29:15
    Author     : Artiko1
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="jugador">
            SELECT ju.id,ju.nombre,ju.ap_paterno,ju.rut,ju.user,ju.pass,t.descripcion_tipoj,e.descripcion_estadoj, s.descripcion_seleccion,eq.nombre_equipo FROM jugador ju JOIN tipo_jugador t ON ju.tipo = t.id JOIN estado_jugador e ON ju.estado = e.id JOIN seleccion_jugador s ON ju.seleccion = s.id JOIN equipo eq ON ju.equipo = eq.id
        </sql:query> 
        <form action="../procesoJugador" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>ID: </td>
                        <td>Nombre: </td>
                        <td>Apellido: </td>
                        <td>Rut: </td>
                        <td>Usuario: </td>
                        <td>Contraseña: </td>
                        <td>Tipo Usuario: </td>
                        <td>Estado Usuario: </td>
                        <td>Seleccionado: </td>
                        <td>Equipo: </td>
                        <td>Herramientas</td>
                    </tr>
                    <tr>
                        <c:forEach var = "row" items = "${jugador.rows}">
                            <td>${row.id}</td>
                            <td>${row.nombre}</td>
                            <td>${row.ap_paterno}</td>
                            <td>${row.rut}</td>
                            <td>${row.user}</td>
                            <td>${row.pass}</td>
                            <td>${row.descripcion_tipoj}</td>
                            <td>${row.descripcion_estadoj}</td>
                            <td>${row.descripcion_seleccion}</td>
                            <td>${row.nombre_equipo}</td>
                            <td><a href="modificar_jugador.jsp?id=${row.id}" id="url" class="btn btn-info" style="color: white"/>Modificar</a>
                                <input type="submit" name="btnAccion" value="Eliminar" class="btn btn-danger"/>
                            </td>
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
