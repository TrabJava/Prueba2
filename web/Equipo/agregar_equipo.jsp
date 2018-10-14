
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" user="mojaber_ali" password="12345"></sql:setDataSource>

                <sql:query dataSource="${dataSource}" var="liga">
                    SELECT id, descripcion FROM liga
                </sql:query> 


        <jsp:include page="../Menú/menuEquipo.jsp"></jsp:include>

            <div class="panel-body" style="margin-left:40%;">
                <form  action="../procesoEquipo" method="POST">
                    <table border="1">
                        <tbody>
                            <tr>
                                <td><label> Nombre Equipo: </label></td>
                                <td><input type="text" name="txtEquipo" value="" placeholder="ingresar nombre del equipo"/></td>
                            </tr>
                            <tr>
                                <td><label>Liga: </label></td>
                                <td>
                                    <select name="cboLiga">
                                    <c:forEach var="ligas" items="${liga.rows}">
                                        <option value="${ligas.id}">${ligas.descripcion}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="btnAccion" value="Agregar"/></td>
                        </tr>

                    </tbody>

                </table>
            </form>
            ${mensaje}
        </div>
    </body>
</html>
