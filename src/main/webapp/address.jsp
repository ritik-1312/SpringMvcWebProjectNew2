<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
</head>
<body>

<select id="country">
<option>select country</option>
</select>

<select id="state">
<option>Select State</option>
</select>

<select id="city">
<option>Select State</option>
</select>

 <script>
$(window).on("load",function(){
	$.get("http://localhost:8080/SpringMvcWebProjectNew2/getcountry",function(data,status){
		
		$("#country").empty();
              	$("#country").append($('<option>select country</option>'));
              	for(var i=0;i<data.length;i++)
              		{
              			
              			$("#country").append($('<option>'+data[i]+'</option>'));
              		}

	});
});
</script>

<script>

	$(document).ready(function(){
		$("#country").change(function(){
			var county = $("#country").val();
			
			$.get("http://localhost:8080/SpringMvcWebProjectNew2/getstate/"+county,function(data,status){
				$("#state").append($('<option>select state</option>'));
				$("#state").empty();
				
              	for(var i=0;i<data.length;i++)
              		{
              			
              			$("#state").append($('<option>'+data[i]+'</option>'));
              		}
			});
		});
		
	});
	
	 setTimeout(function (){
    	 $( ".loader" ).show()
         
         , 5000});	
</script>

<script>

	$(document).ready(function(){
		$("#state").change(function(){
			var state = $("#state").val();
			
			$.get("http://localhost:8080/SpringMvcWebProjectNew2/getcity/"+state,function(data,status){
				$("#city").append($('<option>select state</option>'));
				$("#city").empty();
				
              	for(var i=0;i<data.length;i++)
              		{
              			
              			$("#city").append($('<option>'+data[i]+'</option>'));
              		}
			});
		});
		
	});
	
	 setTimeout(function (){
    	 $( ".loader" ).show()
         
         , 5000});	
</script>

</body>
</html>