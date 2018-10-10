<%-- 
    Document   : agregar_Jugador
    Created on : 10-10-2018, 0:28:54
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

        <sql:query dataSource="${dataSource}" var="tipo">
            SELECT id, descripcion_tipo FROM tipo_super
        </sql:query> 

        <sql:query dataSource="${dataSource}" var="estado">
            SELECT id, descripcion FROM estado_jugador
        </sql:query> 

        <sql:query dataSource="${dataSource}" var="seleccion">
            SELECT id, descripcion FROM seleccion_jugador
        </sql:query> 
            
        <sql:query dataSource="${dataSource}" var="equipo">
            SELECT id, nombre FROM equipo
        </sql:query> 


        <h1>Agregar Jugador</h1>
        <table border="1">
            <tbody>
                <tr>
                    <td><label>Nombre: </label></td>
                    <td><input type="text" name="txtNombreJugador" value="" placeholder="ingresar nombre jugador"/></td>
                </tr>
                <tr>
                    <td><label>Apellido Paterno: </label></td>
                    <td><input type="text" name="txtApellidoPaterno" value="" placeholder="ingresar apellido jugador"/></td>
                </tr>
                <tr>
                    <td><label>Rut: </label></td>
                    <td><input type="text" name="txtRutJugador" value="" placeholder="ingresar rut jugador"/></td>
                </tr>
                <tr>
                    <td><label>Usuario: </label></td>
                    <td><input type="text" name="txtUser" value="" placeholder="ingresar nombre usuario"/></td>
                </tr>
                <tr>
                    <td><label>Contraseña: </label></td>
                    <td><input type="text" name="txtContrasenia" value="" placeholder="ingresar nombre jugador"/></td>
                </tr>
                <tr>
                    <td><label>Tipo: </label></td>
                    <td>
                        <select name="cboTipo">
                            <c:forEach var="tipos" items="${tipo.rows}">
                                <option value="${tipos.id}">${tipos.descripcion_tipo}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Estado: </label></td>
                    <td>
                        <select name="cboEstado">
                           <c:forEach var="estados" items="${estado.rows}">
                                <option value="${estados.id}">${estados.descripcion}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Seleccion: </label></td>
                    <td>
                        <select name="cboSeleccion">
                            <c:forEach var="seleccionados" items="${seleccion.rows}">
                                <option value="${seleccionados.id}">${seleccionados.descripcion}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Equipo: </label></td>
                    <td>
                        <select name="cboEquipo">
                            <c:forEach var="equipos" items="${equipo.rows}">
                                <option value="${equipos.id}">${equipos.nombre}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnAccion" value="Agregar"/></td>
                </tr>
                
            </tbody>
        </table>

    </body>
</html>
