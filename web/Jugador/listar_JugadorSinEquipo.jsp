<%-- 
    Document   : listar_JugadorSinEquipo
    Created on : 15-10-2018, 18:55:58
    Author     : Berni
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
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
         <sql:setDataSource var="dataSource" 
                           driver="com.mysql.jdbc.Driver" 
                           url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" 
                           user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="jugador">
            SELECT * FROM jugador j 
            JOIN tipo_jugador t ON j.tipo = t.id 
            JOIN estado_jugador e ON j.estado = e.id   
            WHERE equipo is NULL AND j.tipo=1 ;
        </sql:query> 
            
        <div class="col-sm-8">
            <div class="container" style="margin-top: 30px">    
                <form action="../procesoJugador" method="GET">
                    <table class="table table-dark" style="width: 1000px" >
                        <tr>
                            <td>ID </td>
                            <td>Nombre </td>
                            <td>Apellido </td>
                            <td>Rut </td>
                            <td>Usuario </td>
                            <td>Contraseña </td>
                            <td>Tipo Usuario </td>
                            <td>Estado Usuario </td>
                            <td>Agregar a Equipo </td>

                        </tr>


                        <c:forEach var = "row" items = "${jugador.rows}">
                            <tr>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 60px;text-align: left;border: 0px" type="text" name="txtId" value="${row.id}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 60px;text-align: left;border: 0px" type="text" name="txtNombre" value="${row.nombre}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 60px;text-align: left;border: 0px" type="text" name="txtApellido" value="${row.ap_paterno}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 80px;text-align: left;border: 0px" type="text" name="txtRut" value="${row.rut}" ></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 80px;text-align: left;border: 0px" type="text" name="txtUser" value="${row.user}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 80px;text-align: left;border: 0px" type="text" name="txtPass" value="${row.pass}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 60px;text-align: left;border: 0px" type="text" name="txtTipo" value="${row.descripcion_tipoj}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 60px;text-align: left;border: 0px" type="text" name="txtEstado" value="${row.descripcion_estadoj}"/></td>
                                <td><a href="Agregar_a_equipo.jsp?id=${row.id}" id="url" class="btn btn-info" style="color: white"/>Agregar a Equipo</a></td>
                            </tr>
                        </c:forEach>

                    </table>
                </form>
                ${mensaje}
            </div>
        </div>
        
        
        
        
    </body>
</html>
