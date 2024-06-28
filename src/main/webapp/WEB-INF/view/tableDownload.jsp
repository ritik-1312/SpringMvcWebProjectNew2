  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

   <style>

.footer {

  position: fixed;

  left: 0;

  bottom: 0;

  width: 100%;

  background-color: red;

  color: white;

  text-align: center;

}

</style>

</head>

<body>



<div class="container-fluid">

	<div class="row">

		<div class="col col-lg-2">

		</div>

		<div class="col col-lg-8">

			<h2>Download File From Server</h2>

					<table class="table table-bordered">

						<tr><th>ID</th><th>Username</th><th>Password</th><th>Email</th><th>Phone</th><th>Download</th><th>Filename</th></tr>

						<c:forEach var="upload" items="${upload}">

							<tr><td>${upload.id}</td><td>${upload.username}</td><td>${upload.password}</td><td>${upload.email}</td><td>${upload.phone}</td><td>${upload.filename}</td><td><a href="downloadFile/${upload.filename}">download</a></td></tr>

						</c:forEach>

					</table>

		</div>

		<div class="col col-lg-2">

		</div>

	</div>

</div><br>

	<div class="footer">

		<h3>Welcome to HS Group Online Education</h3>

	</div>

</body>

</html>