<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css"></link>
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