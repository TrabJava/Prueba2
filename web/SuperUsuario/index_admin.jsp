<%-- 
    Document   : index_admin
    Created on : 07-10-2018, 20:22:42
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body{
            background: url(../img/4.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
    </head>
    
    <body>
        <c:choose>
            <c:when test="${usuario == null }">
                <h1>Tiene que iniciar sesión primero</h1>
                <h3><a href="../login1.jsp">(Iniciar Sesión)</a></h3>
            </c:when>
               <c:when test="${tipoSU != 1 || tipo ==1 || tipo ==2}">
                <h1>Tu usuario es incorrecto</h1>
                <h3><a href="../login1.jsp"></a></h3>
            </c:when>
                <c:when test="${tipoSU == 2 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipoSU == 2 && estadoSU==1}">
                <jsp:include page="../Menú/menuAdmin.jsp"></jsp:include>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
        
    </body>
</html>
