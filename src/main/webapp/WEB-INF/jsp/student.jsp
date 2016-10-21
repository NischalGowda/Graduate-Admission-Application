<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Student</title>
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
	<div class="container" style="margin: 140px">
		<div class="col-sm-9">
			<div class="jumbotron" style="margin: 5px">
				<div class="col-sm-15">
					<form action="welcome" method="post">
						<nav>
						<ul class="pager">
							<li><a href="logout.html"
								style="float: right; color: olive;" class="btn btn-info">Logout</a><br>
								<h2 style="color: sienna;">Welcome Student!!</h2></li>
						</ul>
						</nav>
						<br>
						<table id="t01" align="center">
							<tr>
								<th>Date</th>
								<th>Department</th>
								<th>Program</th>
								<th>Term</th>
								<th>Status</th>
								<th></th>
							</tr>

							<c:forEach items="${a}" var="app">
								<tr>
									<td><fmt:formatDate value="${app.date}" pattern="M/d/yyyy" /></td>
									<td>${app.program.department.dept_name}</td>
									<td>${app.program.name}</td>
									<td>${app.term}</td>
									<td>${app.status}</td>


									<td><a href="app_list.html?aid=${app.id}&uid=${app.user.id}">View</a> <c:if
											test="${app.status == 'Not Submitted'}">
									| <a href="app_edit.html?id=${app.id}">Edit</a>
										</c:if></td>

								</tr>
							</c:forEach>
						</table>
						<br> <a href="new_app.html?id=${q}"
							class="btn btn-danger btn-md active pull-right"
							style="float: center;">Add New</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>