<%-- 
    Document   : agregar_administrador
    Created on : 07-10-2018, 20:23:23
    Author     : Berni
--%>
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

        <script type='text/javascript'>
            function cerrarelemento(){
            div = document.getElementById( & quot; cerrarelemento & quot; );
            div.style.display = & quot; none & quot; ;
            }
        </script>
    </head>
    <body>

        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull" user="mojaber_ali" password="12345"></sql:setDataSource>

        <sql:query dataSource="${dataSource}" var="tipo">
            SELECT id, descripcion_tiposu FROM tipo_super
        </sql:query> 

        <sql:query dataSource="${dataSource}" var="estado">
            SELECT id, descripcion_super FROM estado_super
        </sql:query> 

        <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>


            <div class="panel-body" style="margin-left:40%;">
                <form action="../procesoSuperUsuario" method="POST">
                    <table border="1">
                        <tbody>
                            <tr>
                                <td>USER :</td>
                                <td><input type="text" name="txtUser" value="" /></td>
                            </tr>
                            <tr>
                                <td>PASS :</td>
                                <td><input type="password" name="txtPass" value="" /></td>
                            </tr>
                            <tr>
                                <td>TIPO :</td>
                                <td>
                                    <select name="cboTipo" >
                                    <c:forEach var="tipos" items="${tipo.rows}">
                                        <option value="${tipos.id}">${tipos.descripcion_tiposu}</option>
                                    </c:forEach>
                                </select></td>
                        </tr>
                        <tr>
                            <td>ESTADO :</td>
                            <td>
                                <select name="cboEstado" >
                                    <c:forEach var="estados" items="${estado.rows}">
                                        <option value="${estados.id}">${estados.descripcion_super}</option>
                                    </c:forEach>
                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <input type="submit" name="btnAccion" value="Agregar" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form> 
            <button type="button"   data-target="#demo"> ${mensaje}</button>
        </div>
    </body>
</html>









