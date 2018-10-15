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
            ps = con.prepareStatement("select * from liga where id=" + id);
            rs = ps.executeQuery();


            while (rs.next()) {
        %>
        <%--Query para mostrar los datos en la lista--%>

        <h1>Modificar Datos del Jugador</h1>
        <form action="../procesoLiga" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>ID:</td>
                        <td><input type="text" name="txtId" readonly="" value="<%= rs.getInt("id")%>"></td>
                    </tr>
                    <tr>
                        <td>Nombre De la liga:</td>
                        <td><input type="text" name="txtNombreLiga" value="<%= rs.getString("descripcion_liga")%>"></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Modificar" name="btnAccion" class="btn btn-info"/>    
        </form>
        <%}%>
    </body>
</html>
