<%-- 
    Document   : agregar_Jugador
    Created on : 10-10-2018, 0:28:54
    Author     : Artiko1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Agregar Jugador</h1>
        <table border="1">
            <tbody>
                <tr>
                    <td><label>Nombre: </label></td>
                    <td><input type="text" name="txtNombreJugador" value="" /></td>
                </tr>
                <tr>
                    <td><label>Apellido Paterno: </label></td>
                    <td><input type="text" name="txtApellidoPaterno" value="" /></td>
                </tr>
                <tr>
                    <td><label>Rut: </label></td>
                    <td><input type="text" name="txtRutJugador" value="" /></td>
                </tr>
                <tr>
                    <td><label>Usuario: </label></td>
                    <td><input type="text" name="txtUser" value="" /></td>
                </tr>
                <tr>
                    <td><label>Contraseña: </label></td>
                    <td><input type="text" name="txtContrasenia" value="" /></td>
                </tr>
                <tr>
                    <td><label>Tipo: </label></td>
                    <td>
                        <select name="cboTipo">
                            <option></option>
                            <option></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Estado: </label></td>
                    <td><select name="cboEstado">
                            <option></option>
                            <option></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
