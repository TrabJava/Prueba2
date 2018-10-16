<%-- 
    Document   : modificar_administrador
    Created on : 08-10-2018, 22:44:26
    Author     : Berni
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
            ps = con.prepareStatement("select * from super_usuario where id=" + id);
            rs = ps.executeQuery();

            PreparedStatement pre;
            ResultSet rset;
            pre = con.prepareStatement("select * from tipo_super");
            rset = pre.executeQuery();

            PreparedStatement pree;
            ResultSet rseet;
            pree = con.prepareStatement("select * from estado_super");
            rseet = pree.executeQuery();
            while (rs.next()) {
        %>
        <%--Query para mostrar los datos en la lista--%>


        <c:choose>
            <c:when test="${usuario == null }">
                <h1>Tiene que iniciar sesión primero</h1>
                <h3><a href="../login1.jsp">(Iniciar Sesión)</a></h3>
            </c:when>
            <c:when test="${estado != 1 }">

                <h1>Tu usuario es incorrecto</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipo == 2 && estado!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipo == 1 && estado!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipo == 2 && estado==1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>

            </c:when>
            <c:when test="${tipo == 1 && estado==1}">
                <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                    <div class="row centered-form" >
                        <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                            <div class="panel panel-default">

                                <div class="panel-body" style="margin-left: 100%;">


                                    <table>
                                        <form action="../procesoSuperUsuario" method="POST">
                                            <tbody>
                                                <tr>
                                                    <td>ID </td>
                                                    <td><input  readonly="" type="text" name="txtId" value="<%= rs.getInt("id")%>"></td>
                                            </tr>
                                            <tr>
                                                <td>Usuario</td>
                                                <td><input type="text" name="txtUser" value="<%= rs.getString("user")%>"  minlength="3" maxlength="50" required=""  onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                                            </tr>
                                            <tr>
                                                <td>Contraseña</td>
                                                <td><input type="text" name="txtPass" value="<%= rs.getString("pass")%>"  minlength="3" maxlength="50" required="" onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                                            </tr>
                                            <tr>
                                                <td>Tipo de Usuario</td>
                                                <td>
                                                    <select name="cboTipo" id="cboTipo" class="form-control">
                                                        <%
                                                    while (rset.next()) {%>
                                                        <option value="<%= rset.getInt("id")%>"><%= rset.getString("descripcion_tiposu")%></option>
                                                        <%}
                                                        %>
                                                    </select>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Estado del Usuario</td>
                                                <td>
                                                    <select name="cboEstado" id="cboEstado" class="form-control">
                                                        <%
                                                    while (rseet.next()) {%>
                                                        <option value="<%= rseet.getInt("id")%>"><%= rseet.getString("descripcion_super")%></option>
                                                        <%}
                                                        %>
                                                    </select>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="submit" name="btnAccion" value="Modificar" class="boton"></td> 
                                            </tr>
                                        </tbody>
                                    </form>

                                </table>


                                <%}%>
                            </div>


                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>

    </body>
</html>
