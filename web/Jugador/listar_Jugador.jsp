<%-- 
    Document   : listar_Jugador
    Created on : 10-10-2018, 0:29:15
    Author     : Artiko1
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dataSource" 
                           driver="com.mysql.jdbc.Driver" 
                           url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" 
                           user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="jugador">
            SELECT * FROM jugador;
        </sql:query> 

        <div class="col-sm-8">
            <div class="container" style="margin-top: 30px">    
                <form action="../procesoJugador" method="GET">
                    <table class="table table-dark" style="width: 800px" >
                        <tr>
                            <td>ID: </td>
                            <td>Nombre: </td>
                            <td>Apellido: </td>
                            <td>Rut: </td>
                            <td>Usuario: </td>
                            <td>Contraseña: </td>
                            <td>Tipo Usuario: </td>
                            <td>Estado Usuario: </td>
                            <td>Seleccionado: </td>
                            <td>Equipo: </td>
                            <td>Herramientas</td>
                        </tr>


                        <c:forEach var = "row" items = "${jugador.rows}">
                            <tr>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtId" value="${row.id}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtNombre" value="${row.nombre}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtApellido" value="${row.ap_paterno}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 80px;text-align: left;border: 0px" type="text" name="txtRut" value="${row.rut}" ></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 80px;text-align: left;border: 0px" type="text" name="txtUser" value="${row.user}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 80px;text-align: left;border: 0px" type="text" name="txtPass" value="${row.pass}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtTipo" value="${row.tipo}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtEstado" value="${row.estado}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtSeleccion" value="${row.seleccion}"/></td>
                                <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtEquipo" value="${row.equipo}"/></td>
                                <td><a href="modificar_jugador.jsp?id=${row.id}" id="url" class="btn btn-info" style="color: white"/>Modificar</a>
                                    <a href="desactivar_jugador.jsp?id=${row.id}" id="url" class="btn btn-info" style="color: white"/>Desactivar</a>
                                </td>
                            </tr>
                        </c:forEach>

                    </table>
                </form>
                ${mensaje}
            </div>
        </div>
        
    </body>
</html>