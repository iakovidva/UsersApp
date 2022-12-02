<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>My Users App</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<header>
		<nav class="navbar navbar-expand-md navbar-dark bg-secondary" style="padding:10px 10px">
			<div>
			<form method="post">
		<button class="btn btn-primary btn-lg btn-block" onclick="self.close()">Close Window</button>
		
		</form>
			</div>
		</nav>
	</header> 
<body class="bg-light">
<div style="padding:60px">
	<br>

	<div class="row">

		<div class="container">
		
			<h2 class="text-center">Details for User: </h2>
			<h3 class="text-center">${userDetails.name} ${userDetails.surname}</h3>
			<hr>

			<br>
			<table class="table table-bordered text-center">
				<thead>
					<tr>
						<th>Name</th>
						<th>Surname</th>
						<th>Gender</th>
						<th>Birth date</th>
						<th>Work Address</th>
						<th>Home Address</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

						<tr>
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

		</div>
	</div>
</div>
</body>
</html>