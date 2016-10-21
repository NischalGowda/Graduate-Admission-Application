<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Register</title>
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
	<div class="container" style="margin: 10px">
		<div class="col-sm-9">
			<div class="jumbotron" style="margin: 10px">
				<div class="col-sm-15">
					<div class="panel-heading">
						<h2 class="panel-title">
							<nav>
							<ul class="pager">
								<li><a href="home1.html" style="float: right;">Back</a><br>
									<h2 style="color: purple;">Sign Up</h2></li>
							</ul>
							</nav>
						</h2>
					</div>
					<div class="panel-body">
						<form:form modelAttribute="user" align="center">
							<div>
								<label style="color: darkred;"><font size="3">*Email</font></label>
								<form:input path="email" class="panel panel-primary" size="40"
									placeholder="Enter your Email address" />
								<form:errors style="color:#436eee;" path="email" />
							</div>
							<div>
								<label style="color: darkred;"><font size="3">*Password</font></label>
								<form:password path="password" class="panel panel-primary"
									size="40" placeholder="Enter your Password" />
								<form:errors style="color:#436eee;" path="password" />
							</div>
							<div>
								<label style="color: darkred;"><font size="3">*LastName</font></label>
								<form:input path="Lname" class="panel panel-primary" size="40"
									placeholder="Enter the Last Name" />
								<form:errors style="color:#436eee;" path="Lname" />
							</div>
							<div>
								<label style="color: darkred;"><font size="3">*FirstName</font></label>
								<form:input path="Fname" class="panel panel-primary" size="40"
									placeholder="Enter the First Name" />
								<form:errors style="color:#436eee;" path="Fname" />
							</div>

							<%-- <div>
								<label style="color: darkred;"><font size="3">*CIN</font></label>
								<form:input path="CIN" class="panel panel-primary" size="40"
									placeholder="Enter your CIN" />
								<form:errors style="color:#436eee;" path="CIN" />
							</div>

							<div>
								<label style="color: darkred;"><font size="3">*Phone</font></label>
								<form:input path="phone" class="panel panel-primary" size="40"
									placeholder="Enter your phone number" />
								<form:errors style="color:#436eee;" path="phone" />
							</div>

							<div>
								<label style="color: darkred;"><font size="3">*Gender</font></label>
								<form:input path="gender" class="panel panel-primary" size="40"
									placeholder="Enter your gender" />
								<form:errors style="color:#436eee;" path="gender" />
							</div>

							<div>
								<label style="color: darkred;"><font size="3">*DOB</font></label>
								<form:input path="DOB" class="panel panel-primary" size="40"
									placeholder="Enter your Birth Date" />
								<form:errors style="color:#436eee;" path="DOB" />
							</div>

							<div>
								<label style="color: darkred;"><font size="3">*Citizenship</font></label>
								<form:input path="citizenship" class="panel panel-primary"
									size="40" placeholder="Enter your Citizenship" />
								<form:errors style="color:#436eee;" path="citizenship" />
							</div> --%>

							<input type="submit" name="register" value="Register"
								class="btn btn-primary pull-right" />
							<br />
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>