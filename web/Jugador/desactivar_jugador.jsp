<%-- 
    Document   : modificar_jugador
    Created on : 10-10-2018, 0:29:38
    Author     : Artiko1
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>

        <%
            //CONECTANOD A LA BASE DE DATOS:
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
            ps = con.prepareStatement("SELECT j.id, j.nombre, j.ap_paterno, j.rut, j.user, j.pass, t.id ,t.descripcion_tipoj, e.id, e.descripcion_estadoj, s.id, s.descripcion_seleccion, eq.id, eq.nombre_equipo "
                    + "                FROM jugador j "
                    + "                JOIN tipo_jugador t "
                    + "                ON j.tipo = t.id "
                    + "                JOIN estado_jugador e "
                    + "                ON j.estado = e.id "
                    + "                JOIN seleccion_jugador S "
                    + "                ON j.seleccion = s.id "
                    + "                JOIN equipo eq "
                    + "                ON J.equipo = eq.id where j.id=" + id);
            rs = ps.executeQuery();

            while (rs.next()) {
        %>
        <%--Query para mostrar los datos en la lista--%>


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
                <h1>Modificar Datos del Jugador</h1>
                <form action="../procesoJugador" method="POST">
                    <table border="1">
                        <tbody>
                            <tr>
                                <td>ID:</td>
                                <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("j.id")%>"></td>
                            </tr>
                            <tr>
                                <td>Nombre:</td>
                                <td><input type="text" name="txtNombre" readonly="" value="<%= rs.getString("nombre")%>"></td>
                            </tr>
                            <tr>
                                <td>Apellido Paterno:</td>
                                <td><input type="text" name="txtApellido" readonly="" value="<%= rs.getString("ap_paterno")%>"></td>
                            </tr>
                            <tr>
                                <td>Rut:</td>
                                <td><input type="text" name="txtRut" readonly="" value="<%= rs.getString("rut")%>"></td>
                            </tr>
                            <tr>
                                <td>Usuario:</td>
                                <td><input type="text" name="txtUser" readonly="" value="<%= rs.getString("user")%>"></td>
                            </tr>
                            <tr>
                                <td>contraseña:</td>
                                <td><input type="text" name="txtPass" readonly="" value="<%= rs.getString("pass")%>"></td>
                            </tr>
                            <tr>
                                <td>Tipo Usuario</td>
                                <td>
                                    <select name="cboTipo" >
                                        <option value="<%= rs.getString("t.id")%>" ><%= rs.getString("t.descripcion_tipoj")%></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Estado:</td>
                                <td>
                                    <select name="cboEstado">
                                        <option value="<%= rs.getString("e.id")%>"><%= rs.getString("e.descripcion_estadoj")%></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Seleccion:</td>
                                <td>
                                    <select name="cboSeleccion">
                                        <option value="<%= rs.getString("s.id")%>"><%= rs.getString("s.descripcion_seleccion")%></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Equipo:</td>
                                <td>
                                    <select name="cboEquipo">
                                        <option value="<%= rs.getString("eq.id")%>"><%= rs.getString("eq.nombre_equipo")%></option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <input type="submit" value="Eliminar" name="btnAccion" class="btn btn-info"/>    
                </form>
            </c:when>

            <c:when test="${tipoSU == 2 && estadoSU==1}">
                <jsp:include page="../Menú/menuAdmin.jsp"></jsp:include>
                <h1>Modificar Datos del Jugador</h1>
                <form action="../procesoJugador" method="POST">
                    <table border="1">
                        <tbody>
                            <tr>
                                <td>ID:</td>
                                <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("j.id")%>"></td>
                            </tr>
                            <tr>
                                <td>Nombre:</td>
                                <td><input type="text" name="txtNombre" readonly="" value="<%= rs.getString("nombre")%>"></td>
                            </tr>
                            <tr>
                                <td>Apellido Paterno:</td>
                                <td><input type="text" name="txtApellido" readonly="" value="<%= rs.getString("ap_paterno")%>"></td>
                            </tr>
                            <tr>
                                <td>Rut:</td>
                                <td><input type="text" name="txtRut" readonly="" value="<%= rs.getString("rut")%>"></td>
                            </tr>
                            <tr>
                                <td>Usuario:</td>
                                <td><input type="text" name="txtUser" readonly="" value="<%= rs.getString("user")%>"></td>
                            </tr>
                            <tr>
                                <td>contraseña:</td>
                                <td><input type="text" name="txtPass" readonly="" value="<%= rs.getString("pass")%>"></td>
                            </tr>
                            <tr>
                                <td>Tipo Usuario</td>
                                <td>
                                    <select name="cboTipo" >
                                        <option value="<%= rs.getString("t.id")%>" ><%= rs.getString("t.descripcion_tipoj")%></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Estado:</td>
                                <td>
                                    <select name="cboEstado">
                                        <option value="<%= rs.getString("e.id")%>"><%= rs.getString("e.descripcion_estadoj")%></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Seleccion:</td>
                                <td>
                                    <select name="cboSeleccion">
                                        <option value="<%= rs.getString("s.id")%>"><%= rs.getString("s.descripcion_seleccion")%></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Equipo:</td>
                                <td>
                                    <select name="cboEquipo">
                                        <option value="<%= rs.getString("eq.id")%>"><%= rs.getString("eq.nombre_equipo")%></option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <input type="submit" value="Eliminar" name="btnAccion" class="btn btn-info"/>    
                </form>
            </c:when>
        </c:choose>

        <%}%>
    </body>
</html>
