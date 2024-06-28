<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			$.get("http://localhost:8080/springbatch2app/getStudents",function(data,status){
				alert(data.length);
				alert(data[0].sname);
				$("#pid").text(data[0].sname);
				$("#txt").val(data[0].semail);
				var tr;
				$("#t").empty();
				for (var i = 0; i < data.length; i++) {
			        tr = $('<tr/>');
			        tr.append("<td>" + data[i].rno + "</td>");
			        tr.append("<td>" + data[i].sname + "</td>");
			        tr.append("<td>" + data[i].saddress + "</td>");
			        tr.append("<td>" + data[i].semail + "</td>");
			        $('#t').append(tr);
			        }
				
			});   
		});
		
		$("#livedata").click(function(){
			$.get("https://data.covid19india.org/v2/state_district_wise.json",function(data,status){
				   //alert(data.length);
				    var i,j;
				   for(i=0;i<data.length;i++){
					   for(j=0;j<data[i].districtData.length;j++){
						   if(data[i].districtData[j].district=="Mumbai")
							   {
							   	  $("#pid1").text(data[i].districtData[j].active);
							   	  $("#did").text(data[i].districtData[j].delta.confirmed);
							   }
					   }
				   } 
			   });
		});
	});
</script>
<a href="go">Click Here For String Respose</a>
<a href="getStudents">View Record for First API</a><br>
<button id="btn">Click Here for BackEnd Response</button> Active Cases<p id="pid1"></p> Delta Cases <p id="did"></p>

<p id="pid"></p>
<input type="text" id="txt">
<hr>
<table border="1">
	<thead><th>RNO</th><th>NAME</th><th>Address</th><th>Email</th></thead>
	<tbody id="t">
		
	</tbody>
</table>
<button id="livedata">Click for Covid Response</button>

</body>
</html>