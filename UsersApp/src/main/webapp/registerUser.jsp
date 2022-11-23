
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style>
  #frm{
     width:500px;
     margin:auto;
     margin-top:100px;
  }
  marquee{
     margin-top:10px;
  }
</style>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
</head>
<body class="container-fluid">
    <form action="register" method="post" class="form card" id="frm">
        <h2 class="text-center text-primary">Registration Form</h2>
        <table class="table table-hover">
        <tr>
         <td>Name</td>
         <td><input type="text" name="Name" required></td>
        </tr>
        <tr>
         <td>Surname</td>
         <td><input type="text" name="Surname" required></td>
        </tr>
        <tr>
        	<td>
       	 <label for="gender">Gender</label></td>
        	<td><select name="gender" id="gender" required>
        		<option value="male" selected>M</option>
  				<option value="female">F</option>
        	</select></td>
        </tr>
        
        
        <tr>
        <td>
        <form action="showDate.jsp">
            <label for="datepicker">Enter date:</label>
                <td><input type="text" name="selDate" id="datepicker"></td>
            
        </form>
        </td>
       </tr>
       
        <tr>
         <td>Work Address</td>
         <td><input type="text" name="work_address"></td>
        </tr>
        <tr>
         <td>Home Address</td>
         <td><input type="text" name="home_address"></td>
        </tr>
        
        <tr class="card-footer text-center">
        <td><button type="submit" class="btn btn-outline-success">Register</button></td>
        <td><button type="reset" class="btn btn-outline-danger">Clear Values</button></td>
        </tr>
        </table>
    </form>
    <div class="d-flex justify-content-center align-self-center">
    <form method="post">
		<button type="submit" class="btn btn-primary btn-lg btn-block" formaction="homepage.jsp">Back to Home</button>
		</form>
	</div>
</body>
</html>