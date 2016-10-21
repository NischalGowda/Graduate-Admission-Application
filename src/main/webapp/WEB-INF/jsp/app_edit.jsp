<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Edit Application</title>
<style>
table {
	width: 75%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: center;
	background-color: #cccccc;
}

table th {
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

label {
	border: none;
	width: 100px;
	margin: 0px auto;
}
</style>
<script>
	$(document).ready(function() {
		$("#selectDepartment").change(function() {

			$.ajax({
				type : "GET",
				url : "/gapp/get-program.html",
				async : "false",
				data : {
					department : $("#selectDepartment").val()
				},
				success : function(data) {
					$("#pgm").html(data);
				}
			});
		});
	});

	//Add Degree
	var counter1 = 0;
	function myFunction() {
		var table = document.getElementById("t");
		var counter = 1;
		var row = table.insertRow(counter);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		counter1++;
		cell1.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=20 name='univ_name"+counter1+"' />";
		cell2.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=20 name='time_period_attended"+counter1+"' />";
		cell3.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=20 name='degree_earned"+counter1+"' />";
		cell4.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=20 name='major"+counter1+"' /> ";
		document.getElementById("counter1").value = counter1;
		counter++;
	}
</script>
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
								<li><a href="student.html?id=${t.user.id}"
									style="float: right;">Back</a>
									<h2 style="color: sienna;">Edit Application</h2></li>
							</ul>
							</nav>
						</h2>
					</div>

					<div class="panel-body">
						<form action="app_edit.html" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="id" value="${e.id}" />
							<div>
								<label style="color: darkgreen;"><font size="3">*Department</font></label>&nbsp;
								<select name="dept_name" class="panel panel-primary"
									id="selectDepartment">
									<option value="${t.dept.id}">${t.dept.dept_name}</option>
								</select>
							</div>

							<div>
								<input type="hidden" name="pgmid" id="pgmid"
									value="${t.program.id}" /> <label style="color: darkgreen;"><font
									size="3">* Program</font></label>&nbsp; <select name="name"
									class="panel panel-primary" id="pgm">
									<option value="${t.program.id}">${t.program.name}</option>
									<c:forEach items="${r.program}" var="t1">
										<c:if test="${t1.name ne t.program.name }">
											<option value="${t1.id}">${t1.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>

							<div>
								<label style="color: darkgreen;"><font size="3">Term
								</font></label> <input type="text" class="panel panel-primary" size=20
									name="term" value="${e.term}" />
							</div>

							<h3 align="center" style="color: sienna;">Basic Info</h3>
							<table align="center">
								<tr>
									<th>* Last Name</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="lastname" value="${e.info.lastname}" /></td>
								</tr>
								<tr>
									<th>* First Name</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="firstname" value="${e.info.firstname}" /></td>
								</tr>
								<tr>
									<th>* Email</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="email" value="${e.info.email}" /></td>
								</tr>
								<tr>
									<th>* CIN</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="CIN" value="${e.info.CIN}" /></td>
								</tr>
								<tr>
									<th>Phone</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="phone" value="${e.info.phone}" /></td>
								</tr>
								<tr>
									<th>Gender</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="gender" value="${e.info.gender}" /></td>
								</tr>
								<tr>
									<th>DOB</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="DOB" value="${e.info.DOB}" /></td>
								</tr>
								<tr>
									<th>Citizenship</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="citizenship" value="${e.info.citizenship}" /></td>
								</tr>
							</table>
							<br>

							<h3 align="center" style="color: sienna;">Records</h3>
							<table>
								<tr>
									<th>TOEFL</th>
									<th>GRE</th>
									<th>GPA</th>
									<th>Transcript</th>
								</tr>
								<tr>
									<td><input class="panel panel-primary" size="15"
										value="${e.TOEFL}" type="text" name="TOEFL" /></td>
									<td><input class="panel panel-primary" size="15"
										value="${e.GRE}" type="text" name="GRE" /></td>
									<td><input class="panel panel-primary" size="15"
										value="${e.GPA}" type="text" name="GPA" /></td>
									<td><input type="file" name="file" /></td>
								</tr>
							</table>

							<h3 align="center" style="color: sienna;">Degree</h3>
							<table id="t" align="center">
								<tr>
									<th>Univ name</th>
									<th>Period</th>
									<th>Degree</th>
									<th>Major</th>
									<th></th>
								</tr>
								<c:forEach items="${degree}" var="e">
									<tr>
										<td>${e.univ_name}</td>
										<td>${e.time_period_attended}</td>
										<td>${e.degree_earned}</td>
										<td>${e.major}</td>
										<td><a href="deg_del.html?aid=${t.id}&did=${e.id}"
											class="btn btn-primary btn-md active col-md-offset-0">Remove</a></td>
									</tr>
								</c:forEach>

								<tr>
									<td colspan="5"><input type="button"
										class="btn btn-primary btn-md active col-md-offset-10"
										onClick="myFunction();" value="Add" /></td>
								</tr>
							</table>

							<br> <input type="hidden" name="counter1" id="counter1"
								value="0" /> <br> <input type="submit"
								class="btn btn-primary btn-md active col-md-offset-4"
								name="submit" value="Submit" /> <input type="submit"
								class="btn btn-primary btn-md active col-md-offset-0"
								name="save" value="Save" /> <br />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>