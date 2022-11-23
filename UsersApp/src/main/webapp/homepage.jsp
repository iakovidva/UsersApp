<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 class="text-center">Home page</h1>
<div class="container square-box d-flex align-items-center justify-content-center ">

<a href="<%=request.getContextPath()%>/displayUsers" class="btn btn-primary btn-lg btn-block">Display Users</a>
<a href="<%=request.getContextPath()%>/registerUser.jsp" class="btn btn-primary btn-lg btn-block">Register New User</a>

</div>
</body>
</html>