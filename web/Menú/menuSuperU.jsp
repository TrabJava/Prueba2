<%-- 
    Document   : index
    Created on : 06-10-2018, 22:02:10
    Author     : Berni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Inicio</a>
    </li>

    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Menu administrador
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="agregar_administrador.jsp">Agregar Administrador</a>
        <a class="dropdown-item" href="listar_admin.jsp">Listar administradores</a>
      </div>
    </li>
  </ul>
</nav>
<br>
  


</body>
</html>