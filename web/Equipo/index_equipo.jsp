<%-- 
    Document   : index_equipo
    Created on : 14-10-2018, 0:47:09
    Author     : Berni
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <c:choose>
        <c:when test="${usuario == null }">
                <h1>Tiene que iniciar sesión primero</h1>
                <h3><a href="../login1.jsp">(Iniciar Sesión)</a></h3>
            </c:when>
                <c:when test="${tipo ==1 && estado!=1}">
                <h1>Tu usuario es incorrecto</h1>
                <h3><a href="../login1.jsp"></a></h3>
            </c:when>
                <c:when test="${tipo ==2 && estado!=1}">
                <h1>Tu usuario es incorrecto</h1>
                <h3><a href="../login1.jsp"></a></h3>
            </c:when>
               <c:when test="${tipo ==1 && estado==1}">
                <h1>Tu usuario es incorrecto</h1>
                <h3><a href="../login1.jsp"></a></h3>     
            </c:when>
                 <c:when test="${tipo ==2 && estado==1}">
                     <jsp:include page="../Menú/menuCoach.jsp"></jsp:include>
                
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
            </c:when>
            <c:when test="${tipoSU == 1 && estadoSU==1}">
                    <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
            </c:when>
   </c:choose> 
    </body>
</html>
