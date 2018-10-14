<%-- 
    Document   : listar_equipo
    Created on : 14-10-2018, 0:47:20
    Author     : Berni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    </head>
    <body>
        
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                           user = "mojaber_ali"  password = "12345"/>
        
        <sql:query dataSource = "${snapshot}" var = "equipo">
            SELECT e.id,e.nombre_equipo,ep.descripcion_estadoe,l.descripcion_liga FROM equipo e JOIN estado_equipo ep ON e.estado = ep.id JOIN liga l ON e.liga=l.id 
        </sql:query>
        
        
        
        
        <jsp:include page="../Menú/menuEquipo.jsp"></jsp:include>
        <div class="col-sm-6">

            <div class="container">    
                <form  action="../procesoEquipo" method="GET">
                    <table class="table table-dark" style="width: 800px">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NOMBRE EQUIPO</th>
                                <th>ESTADO</th>
                                <th>LIGA</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var = "row" items ="${equipo.rows}">
                                <tr>
                                    <td><input type="text" name="txtId" readonly="" value="${row.id}" /></td>
                                    <td><input type="text" name="txtUser" readonly="" value="${row.nombre_equipo}"/></td>
                                    <td><input type="text" name="txtEstado" readonly="" value="${row.descripcion_estadoe}"/></td>
                                    <td><input type="text" name="txtLiga" readonly="" value="${row.descripcion_liga}"/></td>
                                    <td><input type="submit" name="btnAccion" value="Actualizar"  style="background-color: transparent; color:white"></td>
                                    <td><a href="modificar_equipo.jsp?id=${row.id}" id="url" style="color: white"/>Modificar</td>
                                </tr>
                            </c:forEach>

                    </table>
                </form>
                <button type="button"   data-target="#demo"> ${mensaje}</button>

            </div>
        </div>
    </body>
</html>
