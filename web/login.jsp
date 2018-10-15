<%-- 
    Document   : login
    Created on : 08-10-2018, 15:54:45
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
        <title>Login</title>
    </head>
    <body>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="tipo">
            SELECT id, descripcion_tiposu FROM tipo_super
        </sql:query> 
    <center>
        <h1>Login de Usuario</h1>
        <form method="GET" action="procesoAcceso">

            <table border="1">
                <tbody>
                    <tr>
                        <td>Nombre Usuario: </td>
                        <td><input type="text" name="txtNombreUsuario" placeholder="Nombre Usuario"></td>
                    </tr>
                    <tr>
                        <td>Contraseña: </td>
                        <td><input type="password" name="txtPassword" placeholder="Contraseña"></td>
                    </tr>
                    <tr>
                         <td>TIPO :</td>
                                <td>
                                    <select name="cboTipo" >
                                    <c:forEach var="tipos" items="${tipo.rows}">
                                        <option value="${tipos.id}">${tipos.descripcion_tiposu}</option>
                                    </c:forEach>
                                </select></td>
                    </tr>
                </tbody>
            </table>
            <td><input type="submit" name="btnAccion" value="Ingresar"></td>
        </form>
        ${mensaje}
    </center>
</body>
</html>
