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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </script>
    <style>
        body{
            background: url(../img/lolcito.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
    <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
</head>
<body>
     <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                           user = "mojaber_ali"  password = "12345"/>

        <%--Query para mostrar los datos en la lista--%>
        <sql:query dataSource = "${snapshot}" var = "admin">
            SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 2 and e.liga =2
        </sql:query>
    <div class="row">
  <div class="col-4">
      
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
            <form method="POST" action="../procesoSuperUsuario">
                                <table class="table table-dark" style="width: 400px"  height="500">
                                    <thead>
                                        <tr><td colspan="2"><h1>Octavos de final</h1></td></tr>
                                        <tr><td colspan="2"><h4>Primer encuentro</h4></td></tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var = "row" items = "${admin.rows}">
                                    <form action="procesoSuperUsuario" method="GET">
                                        
                                        <tr height="150">
                                            
                                            <td>${row.nombre_equipo}</td>
                                            <img src="../img/Icono_VS.png" alt="" style="margin-top:  250px;position: absolute;margin-left:  250px" width="50" height="50" />
                                            <td><img src="../img/${row.foto_link}" alt="" width="70" height="70" /></td>
                                        </tr>
                                        

                                    </c:forEach>
                                        <img src="../img/Icono_VS.png" alt="" style="margin-top:  550px;position: absolute;margin-left:  250px" width="50" height="50" />
                            </table>
                                
                            
                        </form>
        </div>
        <div class="col-1"></div>
    </div>
  </div>
        
  <div class="col-8">
      <img src="../img/lol-logo.png" alt="" style="margin-left: 20px"/>
  </div>
</div>
   
</body>
</html>
