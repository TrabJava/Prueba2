<%-- 
    Document   : login
    Created on : 08-10-2018, 15:54:45
    Author     : Artiko1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login de Usuario</h1>
        <form method="GET" action="procesoAcceso">
            <input type="text" name="txtNombreUsuario">
            <input type="password" name="txtPassword">
            <input type="submit" name="btnAccion" value="Ingresar">
        </form>
        ${mensaje}
    </body>
</html>
