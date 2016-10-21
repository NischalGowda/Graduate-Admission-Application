<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>Admin Home-Page</title>

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
	background-color: #cccccc;
}

table#t01 tr:nth-child(odd) {
	background-color: #fff;
}

table#t01 th {
	background-color: palevioletred;
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
	<div class="container" style="margin: 80px">
		<div class="col-sm-9">
			<div class="jumbotron" style="margin: 10px">
				<div class="col-sm-15">
					<nav>
					<ul class="pager">
						<li><a href="logout.html"
							style="float: right; color: crimson;" class="btn btn-info">Logout</a><br>
							<h2 align="center" style="color: crimson;">Welcome Admin!!</h2></li>
					</ul>
					</nav>
					<br>
					<table id="t01" align="center">
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>No of programs</th>
							<th>Operations</th>
						</tr>
						<c:forEach items="${dept}" var="dept">
							<tr>
								<td>${dept.id}</td>
								<td>${dept.dept_name}</td>
								<td>${fn:length(dept.program)}</td>
								<td><a href="dept_view.html?id=${dept.id}">View</a> | <a
									href="dept_edit.html?id=${dept.id}">Edit</a></td>
							</tr>
						</c:forEach>
					</table>
					<br> <a href="add.html" class="btn btn-danger pull-right"
						style="float: center;">Add New</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>