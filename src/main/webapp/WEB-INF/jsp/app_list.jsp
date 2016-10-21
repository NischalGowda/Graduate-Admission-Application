<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Application Details</title>
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
	background-color: tan;
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
	<div class="container" style="margin: 5px">
		<div class="col-sm-9">
			<div class="jumbotron" style="margin: 0px">
				<div class="col-sm-15">
					<div class="panel-heading">
						<h2 class="panel-title">
							<nav>
							<ul class="pager">
								<li><a href="student.html?id=${a1.user.id}"
									style="float: right;">Back</a>
									<h2 style="color: sienna;">Application Details</h2></li>
							</ul>
							</nav>
						</h2>
					</div>

					<div class="panel-body">
						<table border="1" id="t01">
							<tr>
								<th>Department</th>
								<td>${a1.dept.dept_name}</td>
							</tr>
							<tr>
								<th>Program</th>
								<td>${a1.program.name}</td>
							</tr>
							<tr>
								<th>Term</th>
								<td>${a1.term}</td>
							</tr>
						</table>
					</div>

					<h3 align="center" style="color: sienna;">Basic Info</h3>
					<div class="panel-body">
						<table border="1" id="t01">
							<c:forEach items="${a4}" var="v">
								<tr>
									<th>Last Name</th>
									<td>${v.lastname}</td>
								</tr>
								<tr>
									<th>First Name</th>
									<td>${v.firstname}</td>
								</tr>
								<tr>
									<th>CIN</th>
									<td>${v.CIN}</td>
								</tr>
								<tr>
									<th>Phone Number</th>
									<td>${v.phone}</td>
								</tr>
								<tr>
									<th>Email</th>
									<td>${v.email}</td>
								</tr>
								<tr>
									<th>Gender</th>
									<td>${v.gender}</td>
								</tr>
								<tr>
									<th>DOB</th>
									<td>${v.DOB}</td>
								</tr>
								<tr>
									<th>Citizenship</th>
									<td>${v.citizenship}</td>
								</tr>
							</c:forEach>
						</table>

						<h3 align="center" style="color: sienna;">Degree</h3>
						<div class="panel-body">
							<table border="1" id="t01">
								<tr>
									<th>University Name</th>
									<th>Time Period</th>
									<th>Degree</th>
									<th>Major</th>
								</tr>
								<c:forEach items="${a2}" var="a22">
									<tr>
										<td>${a22.univ_name}</td>
										<td>${a22.time_period_attended}</td>
										<td>${a22.degree_earned}</td>
										<td>${a22.major}</td>
									</tr>
								</c:forEach>
							</table>
						</div>

						<h3 align="center" style="color: sienna;">Record</h3>
						<div class="panel-body">
							<table border="1" id="t01">
								<tr>
									<th>TOEFL</th>
									<th>GRE</th>
									<th>GPA</th>
									<th>Transcript</th>
								</tr>
								<tr>
									<td>${a1.TOEFL}</td>
									<td>${a1.GRE}</td>
									<td>${a1.GPA}</td>
									<%-- <td>${a1.transcript}</td> --%>
									<td><a href="download.html?uid=${a1.user.id}&aid=${a1.id}">View</a></td>
								</tr>
							</table>
						</div>

						<h3 align="center" style="color: sienna;">Additional Info</h3>
						<div class="panel-body">
							<table border="1" id="t01">
								<tr>
									<th>Name</th>
									<th>Type</th>
									<th>Value</th>
									<th>Required</th>
								</tr>
								<c:forEach items="${a3}" var="a33">
									<tr>
										<td>${a33.fname}</td>
										<td>${a33.ftype}</td>
										<td>${a33.fvalue}</td>
										<td>${a33.fstatus}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>