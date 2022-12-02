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
		<button type="submit" class="btn btn-primary btn-lg btn-block" formaction="homepage.jsp">Back to Home</button>
		<button type="submit" class="btn btn-light btn-lg btn-block" formaction="registerUser.jsp">Add new User</button>
		</form>
			</div>
		</nav>
	</header> 
<body class="bg-light">
<div style="padding:60px">
	 
	<br>

	<div class="row">

		<div class="container">
		
			<h3 class="text-center">Display Users</h3>
			<hr>
			<br>
			<table class="table table-bordered text-center">
				<thead>
					<tr>
						<th>Name</th>
						<th>Surname</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.surname}" /></td>
							<td><a href="user_details?id=<c:out value='${user.id}' /> " target="_blank">User details</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
	</div>
</body>
</html>