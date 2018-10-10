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
    <center>
        <h1>Login de Usuario</h1>
        <form method="GET" action="procesoAcceso">

            <table border="1">
                <tbody>
                    <tr>
                        <td>Nombre Usuario: </td>
                        <td><input type="text" name="txtNombreUsuario" placeholder="Nombre Usuario"></td>
                    </tr>
                    <tr>
                        <td>Contraseña: </td>
                        <td><input type="password" name="txtPassword" placeholder="Contraseña"></td>
                    </tr>
                </tbody>
            </table>
            <td><input type="submit" name="btnAccion" value="Ingresar"></td>
        </form>
        ${mensaje}
    </center>
</body>
</html>
