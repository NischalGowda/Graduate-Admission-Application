<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> --%>

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

<title>Login</title>
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

label {
	border: none;
	width: 100px;
	margin: 0px auto;
}
</style>
</head>
<body background="image3.jpg">

	<div class="container" style="margin: 30px;">
		<div class="col-sm-9">
			<div class="jumbotron" style="margin: 120px;">
				<div class="col-sm-15">
					<div class="panel-heading">
						<div class="panel-title text-center">
							<nav>
							<ul class="pager">
								<li><a href="home1.html" style="float: right;">Back</a><br>
									<h2 style="color: crimson;">Sign In</h2></li>
							</ul>
							</nav>
						</div>
					</div>
					<div class="panel-body">
						<form action="login.html" method="post" align="center">
							<div>
								<label style="color: purple;"><font size="3">*Email</font></label>
								<input type="text" class="panel panel-primary" size=40
									placeholder="Enter your email" name="email" />
							</div>

							<div>
								<label style="color: purple;"><font size="3">*Password</font></label>
								<input type="password" class="panel panel-primary" size=40
									placeholder="Enter your Password" name="password" />
							</div>

							<div class="col-sm-12 controls">
								<button type="submit" class="btn btn-primary pull-right">
									<i class="glyphicon glyphicon-log-in"></i> Log In
								</button>
								<br />
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>





