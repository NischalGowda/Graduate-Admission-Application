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
<script src="/wp-includes/js/addInput.js" language="Javascript"
	type="text/javascript"></script>
<script src="/wp-includes/js/addInput2.js" language="Javascript"
	type="text/javascript"></script>

<title>Add</title>
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
	//Add Program
	var counter2 = 0;
	function myFunction1() {
		var table = document.getElementById("t1");
		var counter = 1;
		var row = table.insertRow(counter);
		var cell1 = row.insertCell(0);
		counter2++;
		cell1.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=20 name='name"+counter2+"' />";
		document.getElementById("counter2").value = counter2;
		counter++;
	}
	
	//Add Additional Field
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
		cell1.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=17 name='ftype"+counter1+"' />";
		cell2.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=17 name='fname"+counter1+"' />";
		cell3.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=17 name='fstatus"+counter1+"' />";
		cell4.innerHTML = "<input type='text' class='panel panel-primary col-md-offset-0' size=17 name='fvalue"+counter1+"' /> ";
		document.getElementById("counter1").value = counter1;
		counter++;
	}
</script>

</head>
<body background="image3.jpg">
	<div class="container" style="margin: 70px">
		<div class="col-sm-9">
			<div class="jumbotron" style="margin: 10px">
				<div class="col-sm-15">
					<div class="panel-heading">
						<h2 class="panel-title">
							<nav>
							<ul class="pager">
								<li><a href="admin.html" style="float: right;">Back</a><br>
									<h2 style="color: crimson;">Add New Department</h2></li>
							</ul>
							</nav>
						</h2>
					</div>
					<div class="panel-body">
						<form action="add.html" method="post">
							<div>
								<label>Department Name</label>&nbsp; <input type="text"
									class="panel panel-primary" placeholder="Enter Department Name"
									size=30 name="dept_name" required />
							</div>

							<!-- <div id="more_field">
								<label>Program Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" class="panel panel-primary"
									placeholder="Enter Program Name" size=30 name="name" />&nbsp;&nbsp;
								<input type="button" onClick="addInput('more_field');"
									value="More" class="btn btn-sm btn-primary" />
							</div> -->

							<!-- <div id="more_field2">
								<label>Additional Info</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" class="panel panel-primary"
									placeholder="Enter Additional Info" size=30 name="fname" />&nbsp;&nbsp;
								<input type="button" onClick="addInput2('more_field2');"
									value="More" class="btn btn-sm btn-primary" />
							</div> -->

							<h3 align="center" style="color: sienna;">Add Program</h3>
							<table id="t1" align="center">
								<tr>
									<th>Name</th>
									<th></th>
								</tr>
								<tr>
									<td><input type="text" name="name"
										class="panel panel-primary" size="20" /></td>
									<td><input type="button"
										class="btn btn-primary btn-md active col-md-offset-0"
										onClick="myFunction1();" value="Add More" /></td>
								</tr>
							</table>
							<br>

							<h3 align="center" style="color: sienna;">Add Additional
								Field</h3>
							<table id="t" align="center">
								<tr>
									<th>Type</th>
									<th>Name</th>
									<th>Status</th>
									<th>Value</th>
									<th></th>
								</tr>
								<tr>
									<td><input type="text" name="ftype"
										class="panel panel-primary" size="17" /></td>
									<td><input type="text" name="fname"
										class="panel panel-primary" size="17" /></td>
									<td><input type="text" name="fstatus"
										class="panel panel-primary" size="17" /></td>
									<td><input type="text" name="fvalue"
										class="panel panel-primary" size="17" /></td>
									<td><input type="button"
										class="btn btn-primary btn-md active col-md-offset-0"
										onClick="myFunction();" value="Add More" /></td>
								</tr>
							</table>
							<br> 
							<input type="hidden" name="counter1" id="counter1" value="0" />
							<input type="hidden" name="counter2" id="counter2" value="0" />
							<input type="submit"
								class="btn btn-primary btn-md active col-lg-offset-6" name="add"
								value="Add" /><br />

						</form>
						<!-- <script>
							var counter = 1;
							function addInput(divName) {
								var newdiv = document.createElement('div');
								newdiv.innerHTML = "<strong>Additional Field</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='panel panel-primary col-md-offset-0' size=30 name='name' />";
								document.getElementById(divName).appendChild(
										newdiv);
								counter++;
							}
						</script> -->
						<!-- <script>
							var counter = 1;
							function addInput2(divName) {
								var newdiv = document.createElement('div');
								newdiv.innerHTML = "<strong>Additional Field</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='panel panel-primary col-md-offset-0' size=30 name='fname'>";
								document.getElementById(divName).appendChild(
										newdiv);
								counter++;
							}
						</script> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>