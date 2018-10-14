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
            SELECT id, descripcion_tipoj FROM tipo_jugador
        </sql:query> 

        <sql:query dataSource="${dataSource}" var="liga">
            SELECT id, descripcion_liga FROM liga
        </sql:query> 

        <sql:query dataSource="${dataSource}" var="estado">
            SELECT id, descripcion_estadoe FROM estado_equipo
        </sql:query> 


        <h1>Agregar Jugador</h1>
        <form  action="../procesoEquipo" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td><label>Nombre: </label></td>
                        <td><input type="text" name="txtNombreEquipo" value="" placeholder="ingresar nombre Equipo"/></td>
                    </tr>
                    <tr>
                        <td><label>Liga </label></td>
                        <td>
                            <select name="cboLiga">
                                <c:forEach var="liga" items="${liga.rows}">
                                    <option value="${liga.id}">${liga.descripcion_liga}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Estado: </label></td>
                        <td>
                            <select name="cboEstado">
                                <c:forEach var="estado" items="${estado.rows}">
                                    <option value="${estado.id}">${estado.descripcion_estadoe}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Seleccion: </label></td>
                        <td>
                            <div class="form-group">
                            </div>
                            <div class="form-group">
                                <input type="file" class="form-control-file border" name="file">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnAccion" value="Agregar"/></td>
                    </tr>

                </tbody>

            </table>
        </form>
        ${mensaje}
    </body>
</html>
