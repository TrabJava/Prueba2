<%-- 
    Document   : modificar_equipo
    Created on : 14-10-2018, 0:47:42
    Author     : Berni
--%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
                background: url(../img/2.jpg) no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Equipo</title>
        <link rel="shortcut icon" href="../img/LOL_Logo.ico" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
        <%
            //CONECTANDO A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "mojaber_ali";
            String clave = "12345";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
            PreparedStatement ps;
            ResultSet rs;
            String id = request.getParameter("id");
            ps = con.prepareStatement("SELECT j.id, j.nombre, j.ap_paterno, j.rut, j.user, j.pass, t.descripcion_tipoj, e.descripcion_estadoj, s.descripcion_seleccion, eq.nombre_equipo FROM jugador j JOIN tipo_jugador t ON t.id=j.tipo JOIN estado_jugador e ON e.id=j.estado JOIN seleccion_jugador s ON s.id=j.seleccion JOIN equipo eq ON eq.id=j.equipo WHERE eq.id =" + id);
            rs = ps.executeQuery();

            

           %>

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
            <c:when test="${tipoSU == 1 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 2 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 2 && estadoSU==1}">
                <h1>Tu usuario es incorrecto</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 1 && estadoSU==1}">
                <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                <table class="table table-dark">

                    <tbody>
                        <tr>
                            <td>ID</td>
                            <td>Nombre</td>
                            <td>Apellido</td>
                            <td>Rut</td>
                            <td>Usuario</td>
                            <td>Contraseña</td>
                            <td>Tipo de usuario</td>
                            <td>Estado</td>
                            <td>Seleccion</td>
                            <td>Equipo</td>
                            <td>Modificar</td>
                        </tr>     
                        <tr>
                            <% while (rs.next()) {%>                             



                            <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("j.id")%>" /></td>
                            <td><input type="text" name="txtNombre" readonly="" value="<%= rs.getString("j.nombre")%>" /></td>
                            <td><input type="text" name="txtApellido" readonly="" value="<%= rs.getString("j.ap_paterno")%>" /></td>
                            <td><input type="text" name="txtRut" readonly="" value="<%= rs.getString("j.rut")%>" /></td>
                            <td><input type="text" name="txtUsuario" readonly="" value="<%= rs.getString("j.user")%>" /></td>
                            <td><input type="password" name="txtContrasenia" readonly="" value="<%= rs.getString("j.pass")%>" /></td>
                            <td><input type="text" name="txtTipo" readonly="" value="<%= rs.getString("t.descripcion_tipoj")%>" /></td>
                            <td><input type="text" name="txtEstado" readonly="" value="<%= rs.getString("e.descripcion_estadoj")%>" /></td>
                            <td><input type="text" name="txtSeleccion" readonly="" value="<%= rs.getString("s.descripcion_seleccion")%>" /></td>
                            <td><input type="text" name="txtEquipo" readonly="" value="<%= rs.getString("eq.nombre_equipo")%>" /></td>
                            <td><a href="modificar_jugador.jsp?id=<%= rs.getInt("j.id")%>" id="url" style="color: white">Modificar Jugador</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </c:when>
            <c:when test="${tipoSU == 2 && estadoSU==1}">
                <jsp:include page="../Menú/menuAdmin.jsp"></jsp:include>
                <table class="table table-dark">

                    <tbody>
                        <tr>
                            <td>ID</td>
                            <td>Nombre</td>
                            <td>Apellido</td>
                            <td>Rut</td>
                            <td>Usuario</td>
                            <td>Contraseña</td>
                            <td>Tipo de usuario</td>
                            <td>Estado</td>
                            <td>Seleccion</td>
                            <td>Equipo</td>
                            <td>Modificar</td>
                        </tr>     
                        <tr>
                            <% while (rs.next()) {%>                             



                            <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("j.id")%>" /></td>
                            <td><input type="text" name="txtNombre" readonly="" value="<%= rs.getString("j.nombre")%>" /></td>
                            <td><input type="text" name="txtApellido" readonly="" value="<%= rs.getString("j.ap_paterno")%>" /></td>
                            <td><input type="text" name="txtRut" readonly="" value="<%= rs.getString("j.rut")%>" /></td>
                            <td><input type="text" name="txtUsuario" readonly="" value="<%= rs.getString("j.user")%>" /></td>
                            <td><input type="password" name="txtContrasenia" readonly="" value="<%= rs.getString("j.pass")%>" /></td>
                            <td><input type="text" name="txtTipo" readonly="" value="<%= rs.getString("t.descripcion_tipoj")%>" /></td>
                            <td><input type="text" name="txtEstado" readonly="" value="<%= rs.getString("e.descripcion_estadoj")%>" /></td>
                            <td><input type="text" name="txtSeleccion" readonly="" value="<%= rs.getString("s.descripcion_seleccion")%>" /></td>
                            <td><input type="text" name="txtEquipo" readonly="" value="<%= rs.getString("eq.nombre_equipo")%>" /></td>
                            <td><a href="modificar_jugador.jsp?id=<%= rs.getInt("j.id")%>" id="url" style="color: white">Modificar Jugador</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </c:when>


        </c:choose>
    </body>
</body>
</html>
