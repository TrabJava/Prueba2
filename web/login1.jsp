<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
	<title>student portal form a Flat Responsive Widget Template :: w3layouts</title>
<!-- metatags-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="student portal form a Flat Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
	function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!-- Custom-Style-Sheet -->
	<link href="login/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<link href="login/css/style.css" rel="stylesheet" type="text/css" media="all"/><!--style_sheet-->
	<link rel="stylesheet" href="login/css/flexslider.css" type="text/css" media="screen" property="" />
	<link rel="stylesheet" href="login/css/font-awesome.css"> <!-- Font-Awesome_Icons-CSS -->
<!--//Custom-Style-Sheet -->
<!--online_fonts-->	
	<link href="//fonts.googleapis.com/css?family=Audiowide" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Montserrat+Alternates" rel="stylesheet">
        
<!--//online_fonts-->
</head>
<body>
<div class="w3l-head">
    
	<h1><img src="img/laPrieta.png" alt=""/></h1>
</div>
<div class="w3l-main">
<div class="w3l-left-side">
	
<div class="flexslider">
  <ul class="slides">
    <li>
      <img src="login/images/g1.png" alt="image"/>
    </li>
    <li>
      <img src="login/images/g22.jpg" alt="image"/>
    </li>
    <li>
      <img src="login/images/g33.jpg" alt="image"/>
    </li>
    <li>
      <img src="login/images/g44.jpg" alt="image"/>
    </li>
	<li>
      <img src="login/images/g55.jpg" alt="image"/>
    </li>
  </ul>
</div>
</div>

<div class="w3l-rigt-side">
	<form action="#" method="post">
		<div class="w3l-signin">
			<a class="w3_play_icon1" href="#small-dialog1"> sign in</a>
		</div>
		<div class="w3l-signup">
			<a class="w3_play_icon1" href="#small-dialog2"> sign up</a>
		</div>
		<div class="clear"></div>
	</form>	
</div>
<div class="clear"></div>
</div>

<!--sign in form -->
<div id="small-dialog1" class="mfp-hide">
	<div class="wthree-container">
		<div class="wthree-form">
			<div class="agileits-2">
				<h2>sign in</h2>
			</div>
			<form action="#" method="post">
				<div class="w3-user">
					<span><i class="fa fa-user-o" aria-hidden="true"></i></span>
					<input type="text" name="Username" placeholder="Username" required="">
				</div>
				<div class="clear"></div>
				<div class="w3-psw">
					<span><i class="fa fa-key" aria-hidden="true"></i></span>
					<input type="password" name="password" placeholder="Password" required="">
				</div>
				<div class="clear"></div>
				<div class="w3l-check">
					<input type="checkbox" class="checkbox">
					<span><a href="#">forgot password ?</a></span>  
				</div>
				<div class="clear"></div>
				<div class="signin">
					<input type="submit" value="sign in">
				</div>
				<div class="clear"></div>
			</form>
		</div>
	</div>
</div>
<!--sign in form -->
<!-- for register popup -->

<!--sign up form -->
<div id="small-dialog2" class="mfp-hide">
	<div class="wthree-container">
		<div class="wthree-form bg">	
			<div class="agileits-2">
				<h2>sign up here</h2>
			</div>
			<form action="#" method="post">
				<div class="w3-user">
					<span><i class="fa fa-user-o" aria-hidden="true"></i></span>
					<input type="text" name="Username" placeholder="Username" required="">
				</div>
				<div class="clear"></div>
				<div class="w3-email">
					<span><i class="fa fa-envelope" aria-hidden="true"></i></span>
					<input type="email" name="email" placeholder="Example@mail" required=""/>
				</div>
				<div class="clear"></div>
				<div class="w3-psw">
					<span><i class="fa fa-key" aria-hidden="true"></i></span>
					<input type="password" name="password" placeholder="Password" required="">
				</div>
				<div class="w3-cpsw">
					<span><i class="fa fa-key" aria-hidden="true"></i></span>
					<input type="password" name="password" placeholder="confirm-Password" required="">
				</div>
				<div class="clear"></div>
				<div class="w3l-check">
					<input type="checkbox" class="checkbox">
					<span><a href="#">i agree terms and conditions</a></span>  
				</div>
				<div class="clear"></div>
				<div class="signin">
					<input type="submit" value="sign up">
				</div>
				<div class="clear"></div>
			</form>
		</div>
	</div>
</div>
<!--sign in form -->	
<!-- //for register popup -->
<footer>  <a href="index1.jsp" >Inicio</a> | <a href="#" target="=_blank">Jinx? de Jinx? No seas tonto.</a></footer>

	
<script type="text/javascript" src="login/js/jquery-2.1.4.min.js"></script>

<!-- pop-up-box-js-file -->  
	<script src="login/js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box-js-file -->
<script>
	$(document).ready(function() {
	$('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});
																	
	});
</script>
<!-- flexSlider -->
	<script defer src="login/js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(window).load(function(){
		  $('.flexslider').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		});
	</script>
<!-- //flexSlider -->
</body>
</html>