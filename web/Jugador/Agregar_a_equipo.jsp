<%-- 
    Document   : Agregar_a_equipo
    Created on : 15-10-2018, 19:37:25
    Author     : Berni
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
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
            ps = con.prepareStatement("select * from jugador where id=" + id);
            rs = ps.executeQuery();

            PreparedStatement pre;
            ResultSet rset;
            pre = con.prepareStatement("select * from tipo_jugador");
            rset = pre.executeQuery();

            PreparedStatement pree;
            ResultSet rseet;
            pree = con.prepareStatement("select * from estado_jugador");
            rseet = pree.executeQuery();

            PreparedStatement prep;
            ResultSet reseet;
            pree = con.prepareStatement("select * from seleccion_jugador");
            reseet = pree.executeQuery();

            PreparedStatement prepa;
            ResultSet resett;
            pree = con.prepareStatement("select * from equipo");
            resett = pree.executeQuery();

            while (rs.next()) {
        %>

        <c:choose>
            <c:when test="${usuario == null }">
                <h1>Tiene que iniciar sesión primero</h1>
                <h3><a href="../login1.jsp">(Iniciar Sesión)</a></h3>
            </c:when>
            <c:when test="${tipo == 2 && estado!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipo == 1 && estado!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipo == 1 && estado==1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
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
                    <h1>Modificar Datos del Jugador</h1>
                    <form action="../procesoJugador" method="POST">
                        <table border="1">
                            <tbody>
                                <tr>
                                    <td>ID:</td>
                                    <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("id")%>"></td>
                            </tr>
                            <tr>
                                <td>Nombre:</td>
                                <td><input type="text" name="txtNombre" readonly="" value="<%= rs.getString("nombre")%>" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td>Apellido Paterno:</td>
                                <td><input type="text" name="txtApellido" readonly="" value="<%= rs.getString("ap_paterno")%>" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td>Rut:</td>
                                <td><input type="text" name="txtRut" readonly="" value="<%= rs.getString("rut")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td>Usuario:</td>
                                <td><input type="text" name="txtUser" readonly="" value="<%= rs.getString("user")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td>contraseña:</td>
                                <td><input type="text" name="txtPass" readonly="" value="<%= rs.getString("pass")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td><input hidden="" type="text" name="txtTipo" value="1"/></td>
                                <td><input hidden="" type="text" name="txtEstado" value="1" /></td>
                            </tr>
                            <tr>
                                <td>Seleccion:</td>
                                <td>
                                    <select name="cboSeleccion">
                                        <%
                                            while (reseet.next()) {%>
                                        <option value="<%= reseet.getInt("id")%>"><%= reseet.getString("descripcion_seleccion")%></option>
                                        <%}
                                        %>
                                    </select>

                                </td>
                            </tr>
                            <tr>
                                <td>Equipo</td>
                                <td>
                                    <select name="cboEquipo">
                                        <%
                                            while (resett.next()) {%>
                                        <option value="<%= resett.getInt("id")%>"><%= resett.getString("nombre_equipo")%></option>
                                        <%}
                                        %>
                                    </select>

                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <br>
                    <input type="submit" value="Agregar_a_Equipo" name="btnAccion" class="btn btn-info"/>    
                </form>
            </c:when>
            <c:when test="${tipoSU == 1 && estadoSU==1}">
                <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                    <h1>Modificar Datos del Jugador</h1>
                    <form action="../procesoJugador" method="POST">
                        <table border="1">
                            <tbody>
                                <tr>
                                    <td>ID:</td>
                                    <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("id")%>"></td>
                            </tr>
                            <tr>
                                <td>Nombre:</td>
                                <td><input type="text" name="txtNombre" readonly="" value="<%= rs.getString("nombre")%>" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td>Apellido Paterno:</td>
                                <td><input type="text" name="txtApellido" readonly="" value="<%= rs.getString("ap_paterno")%>" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td>Rut:</td>
                                <td><input type="text" name="txtRut" readonly="" value="<%= rs.getString("rut")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td>Usuario:</td>
                                <td><input type="text" name="txtUser" readonly="" value="<%= rs.getString("user")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td>contraseña:</td>
                                <td><input type="text" name="txtPass" readonly="" value="<%= rs.getString("pass")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                            </tr>
                            <tr>
                                <td><input hidden="" type="text" name="txtTipo" value="1"/></td>
                                <td><input hidden="" type="text" name="txtEstado" value="1" /></td>
                            </tr>
                            <tr>
                                <td>Seleccion:</td>
                                <td>
                                    <select name="cboSeleccion">
                                        <%
                                            while (reseet.next()) {%>
                                        <option value="<%= reseet.getInt("id")%>"><%= reseet.getString("descripcion_seleccion")%></option>
                                        <%}
                                        %>
                                    </select>

                                </td>
                            </tr>
                            <tr>
                                <td>Equipo</td>
                                <td>
                                    <select name="cboEquipo">
                                        <%
                                            while (resett.next()) {%>
                                        <option value="<%= resett.getInt("id")%>"><%= resett.getString("nombre_equipo")%></option>
                                        <%}
                                        %>
                                    </select>

                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <br>
                    <input type="submit" value="Agregar_a_Equipo" name="btnAccion" class="btn btn-info"/>      
                </c:when>
                <c:when test="${tipo == 2 && estado==1}">
                    <jsp:include page="../Menú/menuCoach.jsp"></jsp:include>
                        <h1>Modificar Datos del Jugador</h1>
                        <form action="../procesoJugador" method="POST">
                            <table border="1">
                                <tbody>
                                    <tr>
                                        <td>ID:</td>
                                        <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("id")%>"></td>
                                </tr>
                                <tr>
                                    <td>Nombre:</td>
                                    <td><input type="text" name="txtNombre" readonly="" value="<%= rs.getString("nombre")%>" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                                </tr>
                                <tr>
                                    <td>Apellido Paterno:</td>
                                    <td><input type="text" name="txtApellido" readonly="" value="<%= rs.getString("ap_paterno")%>" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                                </tr>
                                <tr>
                                    <td>Rut:</td>
                                    <td><input type="text" name="txtRut" readonly="" value="<%= rs.getString("rut")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                                </tr>
                                <tr>
                                    <td>Usuario:</td>
                                    <td><input type="text" name="txtUser" readonly="" value="<%= rs.getString("user")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                                </tr>
                                <tr>
                                    <td>contraseña:</td>
                                    <td><input type="text" name="txtPass" readonly="" value="<%= rs.getString("pass")%>" onblur="limpia()" required=""  onkeypress="return soloLetras(event)"></td>
                                </tr>
                                <tr>
                                    <td><input hidden="" type="text" name="txtTipo" value="1"/></td>
                                    <td><input hidden="" type="text" name="txtEstado" value="1" /></td>
                                </tr>
                                <tr>
                                    <td>Seleccion:</td>
                                    <td>
                                        <select name="cboSeleccion">
                                            <%
                                            while (reseet.next()) {%>
                                            <option value="<%= reseet.getInt("id")%>"><%= reseet.getString("descripcion_seleccion")%></option>
                                            <%}
                                            %>
                                        </select>

                                    </td>
                                </tr>
                                <tr>
                                    <td>Equipo</td>
                                    <td>
                                        <select name="cboEquipo">
                                            <%
                                            while (resett.next()) {%>
                                            <option value="<%= resett.getInt("id")%>"><%= resett.getString("nombre_equipo")%></option>
                                            <%}
                                            %>
                                        </select>

                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <br>
                        <input type="submit" value="Agregar_a_Equipo" name="btnAccion" class="btn btn-info"/>      
                    </c:when>
                </c:choose>
                <%}%>
                </body>
                </html>
