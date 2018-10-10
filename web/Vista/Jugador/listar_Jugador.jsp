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
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="jugador">
            SELECT j.id, j.nombre, j.ap_paterno, j.rut, j.user, j.pass, t.descripcion, es.descripcion, s.descripcion, e.nombre FROM jugador j JOIN tipo_jugador t ON t.id = j.tipo JOIN estado_jugador es ON es.id = j.estado JOIN seleccion_jugador s ON s.id= j.seleccion JOIN equipo e ON e.id = j.equipo
        </sql:query> 
            
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
                    </tr>
                    <tr>
                <c:forEach var = "row" items = "${jugador.rows}">
                        <td>${row.id}</td>
                        <td>${row.nombre}</td>
                        <td>${row.ap_paterno}</td>
                        <td>${row.rut}</td>
                        <td>${row.user}</td>
                        <td>${row.pass}</td>
                        <td>${row.descripcion}</td>
                        <td>${row.descripcion}</td>
                        <td>${row.descripcion}</td>
                        <td>${row.nombre}</td>
                </c:forEach>
                    </tr>
                </tbody>
            </table>

    </body>
</html>
