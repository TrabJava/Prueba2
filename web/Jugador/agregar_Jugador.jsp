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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="tipo">
            SELECT id, descripcion_tipoj FROM tipo_jugador
        </sql:query> 

        <sql:query dataSource="${dataSource}" var="estado">
            SELECT id, descripcion_estadoj FROM estado_jugador
        </sql:query> 

        <sql:query dataSource="${dataSource}" var="seleccion">
            SELECT id, descripcion_seleccion FROM seleccion_jugador
        </sql:query> 

        <sql:query dataSource="${dataSource}" var="equipo">
            SELECT id, nombre_equipo FROM equipo
        </sql:query> 

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

        <c:choose>
            <c:when test="${tipo ==1 && estado!=1}">
                <h1>Tu usuario esta  inactivo</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipo ==2 && estado!=1}">
                <h1>Tu usuario esta inactivo</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>


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

            <c:when test="${tipoSU == 1 && estadoSU==1}">
                <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                    <h1>Agregar Jugador</h1>
                    <form  action="../procesoJugador" method="POST">
                        <table border="1">
                            <tbody>
                                <tr>
                                    <td><label>Nombre: </label></td>
                                    <td><input type="text" name="txtNombreJugador" value="" placeholder="ingresar nombre jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Apellido Paterno: </label></td>
                                    <td><input type="text" name="txtApellidoPaterno" value="" placeholder="ingresar apellido jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Rut: </label></td>
                                    <td><input type="text" name="txtRutJugador" value="" placeholder="ingresar rut jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Usuario: </label></td>
                                    <td><input type="text" name="txtUser" value="" placeholder="ingresar nombre usuario" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Contraseña: </label></td>
                                    <td><input type="text" name="txtContrasenia" value="" placeholder="ingresar nombre jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
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
                            <tr>
                                <td><label>Seleccion: </label></td>
                                <td>
                                    <select name="cboSeleccion">
                                        <c:forEach var="seleccionados" items="${seleccion.rows}">
                                            <option value="${seleccionados.id}">${seleccionados.descripcion_seleccion}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Equipo: </label></td>
                                <td>
                                    <select name="cboEquipo">
                                        <c:forEach var="equipos" items="${equipo.rows}">
                                            <option value="${equipos.id}">${equipos.nombre_equipo}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="btnAccion" value="Agregar"/></td>
                            </tr>

                        </tbody>

                    </table>
                </form>
                <div class="alert alert-light alert-dismissible"  style="width: 200px">
                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>${mensaje}</strong>
                </div>
            </c:when>

            <c:when test="${tipoSU == 2 && estadoSU==1}">
                <jsp:include page="../Menú/menuAdmin.jsp"></jsp:include>
                    <h1>Agregar Jugador</h1>
                    <form  action="../procesoJugador" method="POST">
                        <table border="1">
                            <tbody>
                                <tr>
                                    <td><label>Nombre: </label></td>
                                    <td><input type="text" name="txtNombreJugador" value="" placeholder="ingresar nombre jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Apellido Paterno: </label></td>
                                    <td><input type="text" name="txtApellidoPaterno" value="" placeholder="ingresar apellido jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Rut: </label></td>
                                    <td><input type="text" name="txtRutJugador" value="" placeholder="ingresar rut jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Usuario: </label></td>
                                    <td><input type="text" name="txtUser" value="" placeholder="ingresar nombre usuario" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Contraseña: </label></td>
                                    <td><input type="text" name="txtContrasenia" value="" placeholder="ingresar nombre jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
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
                            <tr>
                                <td><label>Seleccion: </label></td>
                                <td>
                                    <select name="cboSeleccion">
                                        <c:forEach var="seleccionados" items="${seleccion.rows}">
                                            <option value="${seleccionados.id}">${seleccionados.descripcion_seleccion}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Equipo: </label></td>
                                <td>
                                    <select name="cboEquipo">
                                        <c:forEach var="equipos" items="${equipo.rows}">
                                            <option value="${equipos.id}">${equipos.nombre_equipo}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="btnAccion" value="Agregar"/></td>
                            </tr>

                        </tbody>

                    </table>
                </form>
                <div class="alert alert-light alert-dismissible"  style="width: 200px">
                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>${mensaje}</strong>
                </div>
            </c:when>
            <c:when test="${tipo ==1 && estado==1}">
                <jsp:include page="../Menú/menuJugador.jsp"></jsp:include>
                    <h1>Agregar Jugador</h1>
                    <form  action="../procesoJugador" method="POST">
                        <table border="1">
                            <tbody>
                                <tr>
                                    <td><label>Nombre: </label></td>
                                    <td><input type="text" name="txtNombreJugador" value="" placeholder="ingresar nombre jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Apellido Paterno: </label></td>
                                    <td><input type="text" name="txtApellidoPaterno" value="" placeholder="ingresar apellido jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Rut: </label></td>
                                    <td><input type="text" name="txtRutJugador" value="" placeholder="ingresar rut jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Usuario: </label></td>
                                    <td><input type="text" name="txtUser" value="" placeholder="ingresar nombre usuario" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Contraseña: </label></td>
                                    <td><input type="text" name="txtContrasenia" value="" placeholder="ingresar nombre jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
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
                            <tr>
                                <td><label>Seleccion: </label></td>
                                <td>
                                    <select name="cboSeleccion">
                                        <c:forEach var="seleccionados" items="${seleccion.rows}">
                                            <option value="${seleccionados.id}">${seleccionados.descripcion_seleccion}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Equipo: </label></td>
                                <td>
                                    <select name="cboEquipo">
                                        <c:forEach var="equipos" items="${equipo.rows}">
                                            <option value="${equipos.id}">${equipos.nombre_equipo}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="btnAccion" value="Agregar"/></td>
                            </tr>

                        </tbody>

                    </table>
                </form>
                <div class="alert alert-light alert-dismissible"  style="width: 200px">
                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>${mensaje}</strong>
                </div>
            </c:when>
            <c:when test="${tipo ==2 && estado==1}">
                <jsp:include page="../Menú/menuCoach.jsp"></jsp:include>
                    <h1>Agregar Jugador</h1>
                    <form  action="../procesoJugador" method="POST">
                        <table border="1">
                            <tbody>
                                <tr>
                                    <td><label>Nombre: </label></td>
                                    <td><input type="text" name="txtNombreJugador" value="" placeholder="ingresar nombre jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Apellido Paterno: </label></td>
                                    <td><input type="text" name="txtApellidoPaterno" value="" placeholder="ingresar apellido jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Rut: </label></td>
                                    <td><input type="text" name="txtRutJugador" value="" placeholder="ingresar rut jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Usuario: </label></td>
                                    <td><input type="text" name="txtUser" value="" placeholder="ingresar nombre usuario" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
                                </tr>
                                <tr>
                                    <td><label>Contraseña: </label></td>
                                    <td><input type="text" name="txtContrasenia" value="" placeholder="ingresar nombre jugador" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"/></td>
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
                            <tr>
                                <td><label>Seleccion: </label></td>
                                <td>
                                    <select name="cboSeleccion">
                                        <c:forEach var="seleccionados" items="${seleccion.rows}">
                                            <option value="${seleccionados.id}">${seleccionados.descripcion_seleccion}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Equipo: </label></td>
                                <td>
                                    <select name="cboEquipo">
                                        <c:forEach var="equipos" items="${equipo.rows}">
                                            <option value="${equipos.id}">${equipos.nombre_equipo}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="btnAccion" value="Agregar"/></td>
                            </tr>

                        </tbody>

                    </table>
                </form>
                <div class="alert alert-light alert-dismissible"  style="width: 200px">
                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>${mensaje}</strong>
                </div>
            </c:when>
        </c:choose>
    </body>
</html>
