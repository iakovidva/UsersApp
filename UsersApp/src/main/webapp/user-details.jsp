<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet" href="css/bootstrap.css"></link>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<!-- <header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> User
					Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header> -->
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
		
			<h3 class="text-center">Display Users</h3>
			<hr>
			<!--<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New User</a>
			</div>-->
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Surname</th>
						<th>Gender</th>
						<th>Birth date</th>
						<th>Work Address</th>
						<th>Home Address</th>
						
					</tr>
				</thead>
				<tbody>

						<tr>
							<td><c:out value="${userDetails.id}" /></td>
							<td><c:out value="${userDetails.name}" /></td>
							<td><c:out value="${userDetails.surname}" /></td>
							<td><c:out value="${userDetails.gender}" /></td>
							<td><c:out value="${userDetails.birthdate}" /></td>
							<td><c:out value="${userDetails.workAddress}" /></td>
							<td><c:out value="${userDetails.homeAddress}" /></td>
							<td><a href="delete?id=<c:out value='${userDetails.id}' />">Delete</a></td>
						</tr>
					<!-- } -->
				</tbody>

			</table>
			<form method="post">
		<button type="submit" class="btn btn-primary btn-lg btn-block" formaction="homepage.jsp">Back to Home</button>
		</form>
		</div>
	</div>
</body>
</html>