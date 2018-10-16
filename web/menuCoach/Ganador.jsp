<%-- 
    Document   : prueba2
    Created on : 12-10-2018, 13:24:26
    Author     : Jamesalfred
--%>
<!DOCTYPE html>
<%--Para hacer una Consulta directa a la bbd--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="../img/LOL_Logo.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ganador | LoL</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </script>
    <style>
        body{
            background: url(../img/vicoria.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
    <jsp:include page="../Menú/menuCoach.jsp"></jsp:include>
    </head>
    <body>
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                       url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                       user = "mojaber_ali"  password = "12345"/>

    <%--Query para mostrar los datos en la lista--%>
    <sql:query dataSource = "${snapshot}" var = "admin">
        SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 6 and e.liga =2
    </sql:query>

        <div>
                                   <c:forEach var = "row" items = "${admin.rows}">
                                <form action="procesoSuperUsuario" method="GET">
                                    <table border="0" style="margin-left: 584px;margin-top: 150px">
                                         <tr height="150">


                                             <td style="height: 100px"><img src="../img/${row.foto_link}" alt="" width="200" height="200" style="margin-left: 50px;position: static;margin-bottom:  10px"/></td>
                                   <img src="../img/corona.png" alt="" style="margin-left: 534px;position: absolute" width="400" height="300"/>
                                         </tr>
                                    

                                   </table>
                                    


                                </c:forEach>
                                    
        </div>
        <div>
            
        </div>
        <div>
            <img src="../img/ganadores.png" alt="" style="margin-left: 410px;margin-top: 100px"/>
        </div>
        
                                    
            </body>
            </html>
