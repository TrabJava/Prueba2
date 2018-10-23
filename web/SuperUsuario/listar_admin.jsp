<%-- 
    Document   : listar_admin
    Created on : 07-10-2018, 20:30:55
    Author     : Berni
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--Para hacer una Consulta directa a la bbd--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            SELECT su.id,su.user,su.pass,t.descripcion_tiposu,e.descripcion_super FROM super_usuario su JOIN estado_super e on su.estado = e.id JOIN tipo_super t on su.tipo=t.id  where su.tipo = 2
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


                            </table>
                        </form>


                </div>
            </c:when>
            <c:when test="${tipo == 1 && estado!=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipo == 2 && estado!=1}">
            <h1>Tu usuario esta desactivado</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipo == 1 && estado==1}">
            <h1>Tu usuario es incorrecto</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipo == 2 && estado==1}">
            <h1>Tu usuario es incorrecto</h1>
            <h3><a href="../login1.jsp"></a></h3>
            </c:when>
            <c:when test="${tipoSU == 1 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 2 && estadoSU!=1}">
                <h1>Tu usuario esta desactivado</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 2 && estadoSU==1}">
                <h1>Tu usuario es incorrecto</h1>
                <h3><a href="../login1.jsp"></a></h3>
                </c:when>
                <c:when test="${tipoSU == 1 && estadoSU==1}">
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
                                    <form  action="../procesoSuperUsuario" method="GET">
                                        <table class="table table-dark" style="width: 800px">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>NOMBRE</th>
                                                    <th>PASS</th>
                                                    <th>TIPO</th>
                                                    <th>ESTADO</th>
                                                    <th>ACCIONES</th>
                                                    <th>MODIFICAR</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var = "row" items ="${admin.rows}">
                                                <tr>
                                                    <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 40px;text-align: left;border: 0px" type="text" name="txtId" readonly="" value="${row.id}" /></td>
                                                    <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 60px;text-align: left;border: 0px" type="text" name="txtUser" readonly="" value="${row.user}"/></td>
                                                    <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 60px;text-align: left;border: 0px" type="text" name="txtPass" readonly="" value="${row.pass}"/></td>
                                                    <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 70px;text-align: left;border: 0px" type="text" name="txtTipo" readonly="" value="${row.descripcion_tiposu}"</td>
                                                    <td><input style="background-color:rgba(0, 0, 0, 0);color: white;width: 70px;text-align: left;border: 0px" type="text" name="txtDescripcion" readonly="" value="${row.descripcion_super}"</td>
                                                    <td><a href="desactivar_usuario.jsp?id=${row.id}" id="url" style="color: white"/>Desactivar</a></td>
                                                    <td><a href="modificar_administrador.jsp?id=${row.id}" id="url" style="color: white"/>Modificar</a></td>
                                                </tr>
                                            </c:forEach>
                                    </table>
                                </form>
                                <div class="alert alert-light alert-dismissible"  style="width: 200px">
                                    <button  type="button" class="close" data-dismiss="alert">&times;</button>
                                    <strong>${mensaje}</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <br><br>



                <br><br>
                <%-- <jsp:include page="../Menú/footer.jsp"></jsp:include>--%>
            </c:when>
        </c:choose>

    </body>
</html>
