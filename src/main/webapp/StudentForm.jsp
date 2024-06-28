<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
 <script src="https://code.jquery.com/jquery-3.1.1.min.js">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<script>
		$(document).ready(function(){
			
			$("#stuform").submit(function(event){
				event.preventDefault();
				ajaxPost();
			});
			
			function ajaxPost()
				{
				
						var formData = {	
						name : $("#name").val(),
						email: $("#email").val(),
						password:$("#password").val()
				}
						
				//Do Post
				$.ajax({
					type: "post",
					contentType:"application/json" ,
					url:"http://localhost:8080/SpringMvcWebProjectNew2/savestudent" ,
					data:JSON.stringify(formData),
					datatype:"json",
					success:function(data)
					{
						if(data.status=="success")
							{
								alert('Data Saved Success');
								$('#stuform').reset();
								
							}
						else
							{
								alert('Data Saved Success');
								//$("#stuform").reset();
							}
						console.log(data);
					},
					
				});
			}
		});
	</script>
	
	<div class="container-fluid">
		<div class="jumbotron">
			<h2 style="text-align: center;">Fill The Form</h2>
		</div>
		<form id="stuform">
			<div class="form-group">
				<label>Name :</label>
				<input type="text" name="name" id="name" class="form-control">
			</div>
			<div class="form-group">
				<label>Email :</label>
				<input type="email" name="email" id="email" class="form-control">
			</div>
			<div class="form-group">
				<label>Password :</label>
				<input type="text" name="password" id="password" class="form-control">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary form-control">Submit</button>
			</div>
		</form>
	</div>
</body>
</html>