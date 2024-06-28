<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filwe Upload</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<h2>Upload File Example</h2>
<div class="container-fluid">
${msg}
	<form action="upload" method="post" enctype="multipart/form-data">
		<div class="form-group">
		<label>Attach File</label>
			<input type="file" class="form-control" name="file">
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-info">Upload</button>
		</div>
	</form>
</div>
</body>
</html>