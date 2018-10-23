<%-- 
    Document   : agregar_administrador
    Created on : 07-10-2018, 20:23:23
    Author     : Berni
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>



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
        <title>JSP Page</title>
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
            SELECT id, descripcion_tiposu FROM tipo_super
        </sql:query> 

        <c:choose>
            <c:when test="${usuario == null }">
                <div class="jumbotron" heigth="8000" style="text-align: center">
                    <h1 class="display-4">Tiene que iniciar sesión primero</h1>
                    <h1 class="lead">Creiste que podías entrar por url Rufián?</h1>
                    <h3 class="lead">Querías que el profe Juilliet nos Humillara??</h3>
                    <hr class="my-4">
                    <h3>Pues BERNAL valido Urls Prueba con : <a class="btn btn-primary btn-lg" href="../login1.jsp" role="button">Iniciar sesión</a></h3>

                    <img src="../img/519.gif" alt="" width="300" height="250" />
                    <br><br><br><br><br><br>


                </div>
            </c:when>
            <c:when test="${tipoSU == 2 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 2 && estadoSU==1}">
                <h1>Tu usuario es incorrecto</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 1 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 1 && estadoSU==1}">
                    <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                    <div class="panel-body" style="margin-left:40%;">
                        <form action="../procesoSuperUsuario" method="POST">
                            <table border="1">
                                <tbody>
                                    <tr>
                                        <td>USER :</td>
                                        <td><input type="text" name="txtUser" value="" required="" minlength="3" maxlength="50" onblur="limpia()"  onkeypress="return soloLetras(event)"/></td>
                                    </tr>
                                    <tr>
                                        <td>PASS :</td>
                                        <td><input type="password" name="txtPass" value="" required="" minlength="3" maxlength="50" onblur="limpia()"  onkeypress="return soloLetras(event)"/></td>
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

                                <tr>
                                    <td colspan="5">
                                        <input type="submit" name="btnAccion" value="Agregar" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form> 
                    <div class="alert alert-light alert-dismissible"  style="width: 200px">
                        <button  type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong>${mensaje}</strong>
                    </div>
                </div>
            </c:when>
        </c:choose>              
    </body>
</html>









