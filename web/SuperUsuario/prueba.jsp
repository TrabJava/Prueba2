<%-- 
    Document   : listar_admin
    Created on : 07-10-2018, 20:30:55
    Author     : Berni
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--Para hacer una Consulta directa a la bbd--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

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
        <%--Iniciamos la conexion a la bbd--%>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                           user = "mojaber_ali"  password = "12345"/>

        <%--Query para mostrar los datos en la lista--%>
        <sql:query dataSource = "${snapshot}" var = "admin">
            SELECT e.nombre_equipo ,e.foto_link FROM detalle d JOIN equipo e ON e.id = d.equipo where clasificatoria = 2 and e.liga =2
        </sql:query>
        <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>


            <div class="container" style="margin-top:30px">
                <div class="row">
                    <div class="col-sm-4">
                        <h2>Conocelos!</h2>
                        <img src="../img/30818.png" alt="" width="360" height="300"/>
                        <h3>Más Acciones</h3>
                        <p>Eres libre de navegar en tu sitio</p>
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Jugadores</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Ligas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Torneos</a>
                            </li>
                        </ul>
                        <hr class="d-sm-none">
                    </div>
                    <div class="col-sm-8">
                        <h2>Modifica o Desactiva a los mancos</h2>
                        <h5>Recuerda que toda acción trae consecuencias</h5>
                        <br>
                        <div class="container">    
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
                </div>
            </div>
        </div>

        <br><br>

        <jsp:include page="../Menú/footer.jsp"></jsp:include>

    </body>
</html>
