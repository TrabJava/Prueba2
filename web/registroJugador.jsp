<%-- 
    Document   : registroJugador
    Created on : 15-10-2018, 17:51:11
    Author     : Berni
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <style>
        body{
            background: url(img/lolcito.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style> 
    </head>
    <body>
        
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="tipo">
            SELECT id, descripcion_tipoj FROM tipo_jugador
        </sql:query>
         <sql:query dataSource="${dataSource}" var="estado">
            SELECT id, descripcion_estadoj FROM estado_jugador
        </sql:query> 
            <br>
            <br>
            <br>
            <img src="img/AGOC.png" alt="" style="margin-left: 500px"/>
        <form  action="procesoJugador" method="POST">
            <table  class="table table-dark" style="width: 400px;margin-left: 480px">
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
                                    <option value="${tipos.id}">${tipos.descripcion_tipoj}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Estado: </label></td>
                        <td>
                            <select name="cboEstado">
                                <c:forEach var="estados" items="${estado.rows}">
                                    <option value="${estados.id}">${estados.descripcion_estadoj}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                <td><input hidden="" type="text" name="txtSeleccion" value="null"/></td>
                <td><input hidden="" type="text" name="txtEquipo" value="null" /></td>
                    <tr>
                        <td><input type="submit" name="btnAccion" value="Agregar_Jugador"/></td>
                    </tr>

                </tbody>

            </table>
        </form>
        ${mensaje}
    </body>
</html>
