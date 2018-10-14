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

        <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
            <div class="row centered-form" >
                <div class="col-xs-12 col-sm-8 col-md-5 col-sm-offset-2 col-md-offset-4">
                    <div class="panel panel-default">

                        <div class="panel-body" style="margin-left: 100%;">


                            <table>
                                <form action="../procesoSuperUsuario" method="POST">
                                    <tbody>
                                    <td><input  hidden="" type="text" name="txtId" value="<%= rs.getInt("id")%>"></td>
                                <tr>
                                    <td>Usuario</td>
                                    <td><input type="text" name="txtUser" value="<%= rs.getString("user")%>"></td>
                                </tr>
                                <tr>
                                    <td>Contraseña</td>
                                    <td><input type="text" name="txtPass" value="<%= rs.getString("pass")%>"></td>
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
    </body>
</html>
