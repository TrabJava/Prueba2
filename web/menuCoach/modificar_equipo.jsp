<%-- 
    Document   : modificar_equipo
    Created on : 14-10-2018, 0:47:42
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
            ps = con.prepareStatement("select * from equipo where id=" + id);
            rs = ps.executeQuery();

            PreparedStatement pre;
            ResultSet rset;
            pre = con.prepareStatement("select * from estado_equipo");
            rset = pre.executeQuery();

            PreparedStatement pree;
            ResultSet rseet;
            pree = con.prepareStatement("select * from liga");
            rseet = pree.executeQuery();
            while (rs.next()) {
        %>
<jsp:include page="../Menú/menuCoach.jsp"></jsp:include>
         
        <img src="../img/MODIFICAR.png" alt="" style="margin-left: 350px"/>
        <br>
          <br>
          <br>
          <br>


                            <table class="table table-dark" style="width: 500px;margin-left: 450px">
                                <form action="../procesoEquipo" method="POST">
                                    <tbody>
                                        <tr>
                                            <td>ID</td>
                                            <td><input  type="text" readonly="" name="txtId" value="<%= rs.getInt("id")%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Nombre Equipo</td>
                                        <td><input type="text" name="txtEquipo" value="<%= rs.getString("nombre_equipo")%>" minlength="5" maxlength="30" onblur="limpia()"  onkeypress="return soloLetras(event)"></td>
                                    </tr>
                                    <tr>
                                        <td>Estado de equipo</td>
                                        <td>
                                            <select name="cboEstado" id="cboEstado" class="form-control">
                                                <%
                                                    while (rset.next()) {%>
                                                <option value="<%= rset.getInt("id")%>"><%= rset.getString("descripcion_estadoe")%></option>
                                                <%}
                                                %>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Estado del Usuario</td>
                                        <td>
                                            <select name="cboLiga" id="cboLiga" class="form-control">
                                                <%
                                                    while (rseet.next()) {%>
                                                <option value="<%= rseet.getInt("id")%>"><%= rseet.getString("descripcion_liga")%></option>
                                                <%}
                                                %>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>Seleccion: </label></td>
                                        <td>
                                            <div class="form-group">
                                            </div>
                                            <div class="form-group">
                                                <input type="file" class="form-control-file border" name="file">
                                            </div>
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
            <div class="alert alert-dark" style="max-width: 500px;margin-left: 450px" >
                    <strong>Felicidades!</strong> ${mensaje}
                </div>
    </body>
</html>
