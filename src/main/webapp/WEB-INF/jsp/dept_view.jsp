<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Dept Home-Page</title>
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: center;
}

table#t01 tr:nth-child(even) {
	background-color: #eee;
}

table#t01 tr:nth-child(odd) {
	background-color: #fff;
}

table#t01 th {
	background-color: burlywood;
	color: white;
}

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
	<div class="container" style="margin: 140px">
		<div class="col-sm-9">
			<div class="jumbotron" style="margin: 5px">
				<div class="col-sm-15">
					<div class="panel-heading">
						<h2 class="panel-title">
							<nav>
							<ul class="pager">
								<li><a href="admin.html" style="float: right;">Back</a>
									<h2 style="color: crimson;">Department Details</h2></li>
							</ul>
							</nav>
						</h2>
					</div>
					<div class="panel-body">
						<table border="1" id="t01">
							<tr>
								<th>Department ID</th>
								<th>Department Name</th>
								<th>Program Name</th>
								<th>Additional Req</th>
							</tr>

							<tr>
								<td>${dept.id}</td>
								<td>${dept.dept_name}</td>

								<td><c:forEach items="${pgm}" var="pgm">
										<ul>
											<li>${pgm.name}</li>
										</ul>
									</c:forEach></td>

								<td><c:forEach items="${info}" var="info">
										<ul>
											<li>${info.ftype}</li>
											<li>${info.fname}</li>
											<li>${info.fstatus}</li>
											<li>${info.fvalue}</li>
										</ul><br>
									</c:forEach></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>