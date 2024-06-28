<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    
    <%
    int i=0;
    String name=request.getParameter("name");
    String pass=request.getParameter("pass");
    String mail=request.getParameter("mail");
    String phone=request.getParameter("phone");
    String add=request.getParameter("add");
    String gender=request.getParameter("gender");
    String city=request.getParameter("city");
    String date=request.getParameter("date");
    String course[]=request.getParameterValues("course");

    %>
    
    <div class="container">
     <h1 class="text-success text-center">Candidate details</h1>
      <div class="col-lg-12 m-auto d-block">
        <form>
        <div class="form-group">
         <b><label>Full Name</label></b>
          <input type="text" class="form-control" value="<%=name%>">
        </div>
        
        <div class="form-group">
         <b><label>Password</label></b>
          <input type="text" class="form-control" value="<%=pass%>">
        </div>
        
        <div class="form-group">
         <b><label>Email</label></b>
          <input type="text" class="form-control" value="<%=mail%>">
        </div>
        
        <div class="form-group">
         <b><label>Phone</label></b>
          <input type="text" class="form-control" value="<%=phone%>">
        </div>
        
        <div class="form-group">
         <b><label>Address</label></b>
          <input type="text" class="form-control" value="<%=add%>">
        </div>
        
        <select name="city">
        <option <% if(city.equalsIgnoreCase("Nagpur")){
        	out.println("selected");
        }%>>Nagpur</option>
        
        <option <% if(city.equalsIgnoreCase("Mumbai")){
        	out.println("selected");
        }%>>Mumbai</option>
        
        <option <% if(city.equalsIgnoreCase("Pune")){
        	out.println("selected");
        }%>>Pune</option>
        
        <option <% if(city.equalsIgnoreCase("Akola")){
        	out.println("selected");
        }%>>Akola</option>
        
        <option <% if(city.equalsIgnoreCase("Nashik")){
        	out.println("selected");
        }%>>Nashik</option>
        
        </select><br>
        
        
        
        <label><b>Gender:</b></label>
          <div  class="form-check">
           <input class="form-check-input" type="radio" name="gender" value="male"  <% if(gender.equalsIgnoreCase("male"))
        		out.print("checked"); %>>
            <label>Male</label><br>
            <input class="form-check-input" type="radio" name="gender" value="female"  <% if(gender.equalsIgnoreCase("female"))
        		out.print("checked"); %>>
            <label>Female</label>
          </div>
        
        
        <div><label><b>Choosen langauge</b></label>
          <div class="form-check"><input class="form-check-input" type="checkbox" value="java" name="course" 
          <% for( i=0; i<course.length; i++){
        	  if(course[i].equalsIgnoreCase("java")){
        		  out.println("checked");
        	  }
          }
         %>>         
           <label>JAVA</label>
          </div>
          
          <div class="form-check"><input class="form-check-input" type="checkbox" value="cpp"name="course"
          <% for( i=0; i<course.length; i++){
        	  if(course[i].equalsIgnoreCase("cpp")){
        		  out.println("checked");
        	  }
          }
         %>>  >
          <label>CPP</label>
          </div>
          
          <div class="form-check"><input class="form-check-input" type="checkbox" value="angular"name="course"
          <% for( i=0; i<course.length; i++){
        	  if(course[i].equalsIgnoreCase("angular")){
        		  out.println("checked");
        	  }
          }
         %>>  >
          <label>Angular</label>
          </div>
          
          <div class="form-check"><input class="form-check-input" type="checkbox" value="spring"name="course"
          <% for( i=0; i<course.length; i++){
        	  if(course[i].equalsIgnoreCase("spring")){
        		  out.println("checked");
        	  }
          }
         %>>  >
          <label>Spring</label>
          </div>
          <span class="text-danger font-weight-bold" id="chkcourse"></span>
          </div><br>
        
        <div class="form-group">
         <b><label>Date of birth</label></b>
          <input type="text" class="form-control" value="<%=date%>">
        </div>
        
       </form>
      </div>
    </div>
    


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>