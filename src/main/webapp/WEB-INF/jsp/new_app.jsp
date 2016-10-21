<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:url var="findProductForCat" value="/products_ajax.do" /> --%>
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
<title>New Application</title>
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
}

table tr {
	background-color: #cccccc;
}

table th {
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
		var counter = 2;
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
	<div class="container" style="margin: 140px">
		<div class="col-sm-10">
			<div class="jumbotron" style="margin: 5px">
				<div class="col-sm-15">
					<div class="panel-heading">
						<h2 class="panel-title">
							<nav>
							<ul class="pager">
								<li>
									<%-- <a href="student.html?id=${ap.user.id}"
									style="float: right;">Back</a> --%>
									<h2 style="color: sienna;">Add New Application</h2>
								</li>
							</ul>
							</nav>
						</h2>
					</div>

					<div class="panel-body">
						<form action="new_app.html?id=" ${param.id} method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="id" value="${param.id}" />
							<h5 style="color: white">Note: * indicates required field</h5>
							<br>
							<div>
								<label style="color: darkgreen;"><font size="3">*Department</font></label>&nbsp;
								<select name="dept_name" class="panel panel-primary"
									id="selectDepartment" required>
									<option>Select Department</option>
									<c:forEach items="${d}" var="d1">
										<option value="${d1.id}">${d1.dept_name}</option>
									</c:forEach>
								</select>
							</div>

							<div>
								<label style="color: darkgreen;"><font size="3">*
										Program</font></label>&nbsp; <select name="name" class="panel panel-primary"
									id="pgm" required>
									<option value="">Select Program</option>
								</select>
							</div>

							<div>
								<label style="color: darkgreen;"><font size="3">Term</font></label>
								<input class="panel panel-primary" size="20" type="text"
									name="term" />
							</div>

							<h3 align="center" style="color: sienna;">Basic Info</h3>
							<table align="center">
								<tr>
									<th>* Last Name</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="lastname" required /></td>
								</tr>
								<tr>
									<th>* First Name</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="firstname" required /></td>
								</tr>
								<tr>
									<th>* Email</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="email" required /></td>
								</tr>
								<tr>
									<th>* CIN</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="CIN" required /></td>
								</tr>
								<tr>
									<th>Phone</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="phone" /></td>
								</tr>
								<tr>
									<th>Gender</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="gender" /></td>
								</tr>
								<tr>
									<th>DOB</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="DOB" /></td>
								</tr>
								<tr>
									<th>Citizenship</th>
									<td><input class="panel panel-primary" size="25"
										type="text" name="citizenship" /></td>
								</tr>
							</table>
							<br>

							<h3 align="center" style="color: sienna;">Records</h3>
							<table>
								<tr>
									<th>TOEFL</th>
									<th>GRE</th>
									<th>* GPA</th>
									<th>* Transcript</th>
								</tr>
								<tr>
									<td><input class="panel panel-primary" size="20"
										type="text" name="TOEFL" /></td>
									<td><input class="panel panel-primary" size="20"
										type="text" name="GRE" /></td>
									<td><input class="panel panel-primary" size="20"
										type="text" name="GPA" required /></td>
									<td><input type="file" name="file" required /></td>
								</tr>
							</table>
							<br>

							<h3 align="center" style="color: sienna;">Degree Details</h3>
							<table id="t">
								<tr>
									<th>* Univ name</th>
									<th>* Period</th>
									<th>* Degree</th>
									<th>* Major</th>
									<th></th>
								</tr>
								<tr>
									<td><input type="text" name="univ_name"
										class="panel panel-primary" size="20" required /></td>
									<td><input type="text" name="time_period_attended"
										class="panel panel-primary" size="20" required /></td>
									<td><input type="text" name="degree_earned"
										class="panel panel-primary" size="20" required /></td>
									<td><input type="text" name="major"
										class="panel panel-primary" size="20" required /></td>
									<td><input type="button"
										class="btn btn-primary btn-md active col-md-offset-0"
										onClick="myFunction();" value="Add More" /></td>
								</tr>
							</table>
							<br> <input type="hidden" name="counter1" id="counter1"
								value="0" /> <input type="submit"
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