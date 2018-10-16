<%-- 
    Document   : OctavoDetalle
    Created on : 15-10-2018, 1:26:01
    Author     : James Johnson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignar | Final</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <style>
            body{
                background: url(../img/ashe.jpg) no-repeat center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                background-position-y: 50px;
            }
        </style>
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/liga_nos_vamos?zeroDateTimeBehavior=convertToNull"
                           user = "mojaber_ali"  password = "12345"/>

        <%--Query para mostrar los datos en la lista--%>
        <sql:query dataSource = "${snapshot}" var = "equipo">
            SELECT e.id,e.nombre_equipo FROM equipo e JOIN detalle d ON e.id = d.equipo WHERE d.clasificatoria=5
        </sql:query>

        <sql:query dataSource = "${snapshot}" var = "clasificatoria">
            SELECT descripcion_tipoclas FROM tipo_clasificatoria
        </sql:query>

        <c:choose>
           <c:when test="${usuario == null }">
            <div class="jumbotron" heigth="8000" style="text-align: center">
                <h1 class="display-4">Tiene que iniciar sesión primero</h1>
                <h1 class="lead">Creiste que podías entrar por url Rufián?</h1>
                <h3 class="lead">Querías que el profe Juilliet nos Humillara??</h3>
                <hr class="my-4">
                <h3>Pues BERNAL valido Urls Prueba con : <a class="btn btn-primary btn-lg" href="../login1.jsp" role="button">Iniciar sesión</a></h3>
                
                <img src="../img/519.gif" alt="" width="300" height="250" />
                <br><br><br><br><br><br>
                
                
            </div>
        </c:when>
        <c:when test="${tipo ==1 || tipo ==2}">
            <h1>Tu usuario es incorrecto</h1>
            <h3><a href="../login1.jsp"></a></h3>
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
                    <div class="container" style="margin-top:30px">
                        <div class="row">
                            <div class="col-sm-3" >
                                <img src="../img/jinxita.png" alt="" />
                                <p>Aquí podrás seleccionar a los próximos invocadores</p>
                                <h3>Jinx? de Jinx? </h3>
                                <h4>que tonto eres</h4>
                                <p>Necesitas Links?</p>
                                <ul class="nav nav-pills flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">Active</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Link</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Link</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link disabled" href="#">Disabled</a>
                                    </li>
                                </ul>
                                <hr class="d-sm-none">
                            </div>



                            <div class="col-sm-8">
                                <img src="../img/SEM.png" alt="" style="margin-left: 335px"/>
                                <iframe src="https://www.zeitverschiebung.net/clock-widget-iframe-v2?language=es&size=small&timezone=America%2FSantiago" width="100%" height="90" frameborder="0" seamless style="margin-left: 44px"></iframe>
                                <form  action="../procesoDetalle" method="POST">
                                    <table border="1" class="table table-dark" style="width: 400px;margin-left: 350px">
                                        <tbody>
                                            <tr>
                                                <td><label>EQUIPO </label></td>
                                                <td><select name="cboEquipoclas">
                                                    <c:forEach var="equipo" items="${equipo.rows}">
                                                        <option value="${equipo.id}">${equipo.nombre_equipo}</option>
                                                    </c:forEach>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td><label>CLASIFICATORIA </label></td>
                                            <td>
                                                FINAL
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" ><input type="submit" name="btnAccion" value="AgregarFinal" style="margin-left: 150px" class="btn btn-secondary"/></td>
                                        </tr>

                                    </tbody>

                                </table>
                            </form>
                            ${mensaje}
                            <br>

                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${tipoSU == 1 && estadoSU==1}">
                <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
                    <div class="container" style="margin-top:30px">
                        <div class="row">
                            <div class="col-sm-3" >
                                <img src="../img/jinxita.png" alt="" />
                                <p>Aquí podrás seleccionar a los próximos invocadores</p>
                                <h3>Jinx? de Jinx? </h3>
                                <h4>que tonto eres</h4>
                                <p>Necesitas Links?</p>
                                <ul class="nav nav-pills flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">Active</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Link</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Link</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link disabled" href="#">Disabled</a>
                                    </li>
                                </ul>
                                <hr class="d-sm-none">
                            </div>



                            <div class="col-sm-8">
                                <img src="../img/SEM.png" alt="" style="margin-left: 335px"/>
                                <iframe src="https://www.zeitverschiebung.net/clock-widget-iframe-v2?language=es&size=small&timezone=America%2FSantiago" width="100%" height="90" frameborder="0" seamless style="margin-left: 44px"></iframe>
                                <form  action="../procesoDetalle" method="POST">
                                    <table border="1" class="table table-dark" style="width: 400px;margin-left: 350px">
                                        <tbody>
                                            <tr>
                                                <td><label>EQUIPO </label></td>
                                                <td><select name="cboEquipoclas">
                                                    <c:forEach var="equipo" items="${equipo.rows}">
                                                        <option value="${equipo.id}">${equipo.nombre_equipo}</option>
                                                    </c:forEach>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td><label>CLASIFICATORIA </label></td>
                                            <td>
                                                FINAL
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" ><input type="submit" name="btnAccion" value="AgregarFinal" style="margin-left: 150px" class="btn btn-secondary"/></td>
                                        </tr>

                                    </tbody>

                                </table>
                            </form>
                            ${mensaje}
                            <br>

                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>

    </body>

</body>
</html>
