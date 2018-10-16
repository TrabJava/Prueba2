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
<style>
            body{
                background: url(../img/2.jpg) no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
        <title>Modificar Jugador</title>
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
        <%--Query para mostrar los datos en la lista--%>

        <br>
        <img src="../img/MODIFICAR HU.png" alt="" style="margin-left: 250px"/>
        <br><br><br>
        <form action="../procesoJugador" method="POST">
            <table border="1" class="table table-dark" style="max-width: 400px;margin-left: 450px">
                <tbody>
                    <tr>
                        <td>ID:</td>
                        <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("id")%>"></td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" name="txtNombre" value="<%= rs.getString("nombre")%>"></td>
                    </tr>
                    <tr>
                        <td>Apellido Paterno:</td>
                        <td><input type="text" name="txtApellido" value="<%= rs.getString("ap_paterno")%>"></td>
                    </tr>
                    <tr>
                        <td>Rut:</td>
                        <td><input type="text" name="txtRut" value="<%= rs.getString("rut")%>"></td>
                    </tr>
                    <tr>
                        <td>Usuario:</td>
                        <td><input type="text" name="txtUser" value="<%= rs.getString("user")%>"></td>
                    </tr>
                    <tr>
                        <td>contraseña:</td>
                        <td><input type="text" name="txtPass" value="<%= rs.getString("pass")%>"></td>
                    </tr>
                    <tr>
                        <td>Tipo de Usuario:</td>
                        <td>
                            <select name="cboTipo">
                                <%
                                while (rset.next()) {%>
                                <option value="<%= rset.getInt("id")%>"><%= rset.getString("descripcion_tipoj")%></option>
                                <%}
                                %>
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <td>Estado:</td>
                        <td>
                            <select name="cboEstado">
                                <%
                                while (rseet.next()) {%>
                                <option value="<%= rseet.getInt("id")%>"><%= rseet.getString("descripcion_estadoj")%></option>
                                <%}
                                %>
                            </select>

                        </td>
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
            <input type="submit" value="Modificar" name="btnAccion" class="btn btn-info" style="margin-left: 650px"/>    
        </form>
        <%}%>
    </body>
</html>
