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


        <c:choose>
            <c:when test="${tipo == 1 && estado !=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipo == 2 && estado !=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipo == 1 && estado ==1}">
            <h1>Tu usuario es incorrecto</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipo == 1 && estado ==1}">
            <h1>Tu usuario es incorrecto</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${usuario == null }">
                <h1>Tiene que iniciar sesión primero</h1>
                <h3><a href="../login1.jsp">(Iniciar Sesión)</a></h3>
            </c:when>
            <c:when test="${tipoSU == 2 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 1 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 2 && estadoSU==1}">
                    <jsp:include page="../Menú/menuAdmin.jsp"></jsp:include>
                    <div class="panel-body" style="margin-left:40%;">
                        <form action="../procesoLiga" method="POST">
                            <table border="1">
                                <tbody>
                                    <tr>
                                        <td>Ingrese el nombre de la liga :</td>
                                        <td><input type="text" name="txtNombreLiga" value="" required="" minlength="3" maxlength="50" onblur="limpia()"  onkeypress="return soloLetras(event)"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <input type="submit" name="btnAccion" value="Agregar" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form> 
                         <div class="alert alert-light alert-dismissible"  style="width: 200px">
                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                      <%
                        if (request.getAttribute("msjAgregarLiga")!=null) {
                            out.println(request.getAttribute("msjAgregarLiga"));
                                
                            }
                        %>
                        
                    <strong>${msjAgregarLiga}</strong>
                </div>
                </div>
            </c:when>
            <c:when test="${tipoSU == 1 && estadoSU==1}">
                <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                    <div class="panel-body" style="margin-left:40%;">
                        <form action="../procesoLiga" method="POST">
                            <table border="1">
                                <tbody>
                                    <tr>
                                        <td>Ingrese el nombre de la liga :</td>
                                        <td><input type="text" name="txtNombreLiga" value="" required="" minlength="3" maxlength="50" onblur="limpia()"  onkeypress="return soloLetras(event)"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <input type="submit" name="btnAccion" value="Agregar" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form> 
                       <div class="alert alert-light alert-dismissible"  style="width: 200px">
                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                      <%
                        if (request.getAttribute("msjAgregarLiga")!=null) {
                            out.println(request.getAttribute("msjAgregarLiga"));
                                
                            }
                        %>
                        
                    <strong>${msjAgregarLiga}</strong>
                </div>
                </div>
            </c:when>
        </c:choose>




    </body>
</html>
