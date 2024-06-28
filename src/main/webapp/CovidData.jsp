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

		
		$("#livedata").click(function(){
			$.get("https://data.covid19india.org/v2/state_district_wise.json",function(data,status){
				   alert(data.length);
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
</script>

<button id="btn">Click Here for BackEnd Response</button> Active Cases<p id="pid1"></p> Delta Cases <p id="did"></p>

<hr>

<button id="livedata">Click for Covid Response</button>

</body>
</html>