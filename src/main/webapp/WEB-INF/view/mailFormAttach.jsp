<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	${emailmsg}
	<h2>Send Email</h2>
	<div class="container-fluid">
		<form action="sendEmailAttachment" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label> TO </label>
				<input type="text" name="to" class="form-control">
			</div>
		
			<div class="form-group">
				<label> Subject </label>
				<input type="text" name="subject" class="form-control">
			</div>
		
			<div class="form-group">
				<label> Message </label>
				<textarea rows="3" cols="3" class="form-control" name="message"></textarea>
			</div>
			<div class="form-group">
				<label>Attach File </label>
				<input type="file" name="file" class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-success" type="submit">Send Email</button>
			</div>
		</form>
	</div>
</body>
</html>