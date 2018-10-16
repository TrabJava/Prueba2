<%-- 
    Document   : agregar_equipo
    Created on : 14-10-2018, 16:17:01
    Author     : Berni
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Jugador</title>
        <style>
            body{
                background: url(../img/1.jpg) no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../Menú/menuCoach.jsp"></jsp:include>
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


        <img src="../img/AGREGAR.png" alt="" style="margin-left: 400px"/>
        <br> <br> <br> 
            <form  action="../procesoEquipo" method="POST">
                <table border="1" class="table table-dark" style="width: 800px;margin-left: 330px">
                    <tbody>
                        <tr>
                            <td><label>Nombre </label></td>
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
                        <td><label>Seleccion </label></td>
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
        </div>
            <div class="alert alert-dark" style="max-width: 800px;margin-left: 330px" >
                    <strong>Felicidades!</strong> ${mensaje}
                </div>
    </body>
</html
