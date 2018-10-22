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
        <title>Agregar Equipo</title>
        <link rel="shortcut icon" href="../img/LOL_Logo.ico" />
        <style>
            body{
                background: url(../img/1.jpg) no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
        <script>
            function soloLetras(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = "qwertyuiopasdfghjklñzxcvbnm-_123456789/";
                especiales = "8-37-39-46";
                tecla_especial = false
                for (var i in especiales) {
                    if (key == especiales[i]) {
                        tecla_especial = true;
                        break;
                    }
                }
                if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                    return false;
                }
            }
        </script>
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
                    <img src="../img/AGREGAR.png" alt="" style="margin-left: 400px"/>
                    <br> <br> <br> 
                    <form  action="../procesoEquipo" method="POST">
                        <table border="1" class="table table-dark" style="width: 800px;margin-left: 330px">
                            <tbody>
                                <tr>
                                    <td><label>Nombre </label></td>
                                    <td><input type="text" name="txtNombreEquipo" value="" placeholder="ingresar nombre Equipo" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"/></td>
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
            <div class="alert alert-light alert-dismissible"  style="width: 200px">
                <button  type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>${mensaje}</strong>
            </div>
        </c:when>
        <c:when test="${tipoSU == 1 && estadoSU==1}">
            <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                <img src="../img/AGREGAR.png" alt="" style="margin-left: 400px"/>
                <br> <br> <br> 
                <form  action="../procesoEquipo" method="POST">
                    <table border="1" class="table table-dark" style="width: 800px;margin-left: 330px">
                        <tbody>
                            <tr>
                                <td><label>Nombre </label></td>
                                <td><input type="text" name="txtNombreEquipo" value="" placeholder="ingresar nombre Equipo" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"/></td>
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
        <div class="alert alert-light alert-dismissible"  style="width: 200px">
            <button  type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>${mensaje}</strong>
        </div>
    </c:when>
</c:choose>
</body>
</html
