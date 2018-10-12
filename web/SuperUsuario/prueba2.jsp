<%-- 
    Document   : prueba2
    Created on : 12-10-2018, 13:24:26
    Author     : Jamesalfred
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 70%;
        }
    </style>
</head>
<body style="background-color: #0A0A2A">
    <jsp:include page="../Menú/menuSuperU.jsp"></jsp:include>
    <div id="demo" class="carousel slide" data-ride="carousel" style="width: 1520;height: 800px">
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                
                <img src="../img/league.png" alt="Los Angeles" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>Los Angeles</h3>
                    <p>We had such a great time in LA!</p>
                </div>   
            </div>
            <div class="carousel-item">
                <img src="../img/lolcito.jpg" alt="Chicago" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>Chicago</h3>
                    <p>Thank you, Chicago!</p>
                </div>   
            </div>
            <div class="carousel-item">
                <img src="../img/lolo.jpg" alt="New York" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>New York</h3>
                    <p>We love the Big Apple!</p>
                </div>   
            </div>
        </div>
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    <div class="row">
        <div class="col-8" style="background-color: #ffffff">
            .col-8
            <div class="row">
                <div class="col-6" style="background-color: activecaption">.col-6</div>
                <div class="col-6" style="background-color: aqua">.col-6</div>
            </div>
        </div>
        <div class="col-4" style="background-color: #ff0000">.col-4</div>
    </div>

</body>
</html>
