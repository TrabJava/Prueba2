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
            SELECT ju.id,ju.nombre,ju.ap_paterno,ju.rut,ju.user,ju.pass, ju.tipo, ju.estado, ju.seleccion, ju.equipo FROM jugador ju JOIN tipo_jugador t ON ju.tipo = t.id JOIN estado_jugador e ON ju.estado = e.id JOIN seleccion_jugador s ON ju.seleccion = s.id JOIN equipo eq ON ju.equipo = eq.id
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

                    <c:forEach var = "row" items = "${jugador.rows}">
                        <tr>
                            <td><input type="text" name="txtId" value="${row.id}"/></td>
                            <td><input type="text" name="txtNombre" value="${row.nombre}"/></td>
                            <td><input type="text" name="txtApellido" value="${row.ap_paterno}"/></td>
                            <td><input type="text" name="txtRut" value="${row.rut}" ></td>
                            <td><input type="text" name="txtUser" value="${row.user}"/></td>
                            <td><input type="text" name="txtPass" value="${row.pass}"/></td>
                            <td><input type="text" name="txtTipo" value="${row.tipo}"/></td>
                            <td><input type="text" name="txtEstado" value="${row.estado}"/></td>
                            <td><input type="text" name="txtSeleccion" value="${row.seleccion}"/></td>
                            <td><input type="text" name="txtEquipo" value="${row.equipo}"/></td>
                            <td><a href="modificar_jugador.jsp?id=${row.id}" id="url" class="btn btn-info" style="color: white"/>Modificar</a>
                                <input type="submit" name="btnAccion" value="Eliminar" class="btn btn-danger"/>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </form>
        ${mensaje}
    </body>
</html>