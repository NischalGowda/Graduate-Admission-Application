<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Home-Page</title>
<style>
.jumbotron {
	background: rgba(255, 255, 255, 0.5);
}

body {
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
</head>
<body background="image3.jpg">
	<div class="container" style="margin: 60px">
		<div class="col-sm-9">
			<div class="jumbotron" style="margin: 120px;">
				<div class="col-sm-15">
					<marquee direction="right" style="color: crimson;">
						<h2>Welcome to CS Grad Admission!!</h2>
					</marquee>
					<%-- <p>
					<h3 style="color: mediumvioletred;">Hello, ${role}</h3>
					</p> --%>
					<ul>
						<li><h3>
								<a href="register.html">Register</a>
							</h3></li>
						<li><h3>
								<a href="login.html">Login</a>
							</h3></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>