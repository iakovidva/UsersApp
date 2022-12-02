<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>My Users App</title>
</head>
<header>
<div class="bg-secondary">
			<p class="fs-1 text-center text-light" style="padding:20px">Home page</p>
</div>
	</header> 
<body class="bg-light">


<div class="container text-center container-fluid" style="padding:2%">
  <div class="col">
    <div class="row" style="padding:0 40%">
      <a href="<%=request.getContextPath()%>/displayUsers" class="btn btn-primary btn-lg btn-block">Display Users</a>
    </div>
    <div class="row" style="padding:1% 40%">
      <a href="<%=request.getContextPath()%>/registerUser.jsp" class="btn btn-primary btn-lg btn-block">Register New User</a>
    </div>
	    <c:if test="${action == 'UserRegistration'}">
			<p class="text-success">User Added Successfully</p>
		</c:if>
		<c:if test="${action == 'UserDelete'}">
			<p class="text-danger">User Deleted Successfully</p>
		</c:if>
		
  </div>
</div>

</body>
</html>