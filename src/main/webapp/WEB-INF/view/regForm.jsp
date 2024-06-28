<!doctype html>
<html lang="en">
  <head>
 
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Login Page</title>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
    *{
       padding: 0;
       margin: 0;
       box-sizing: border-box;
    }
    body{
        background: rgb(219,226,226);
    }
    .row{
        background: white;
        border-radius: 30px; 
    }
    img{
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
    }
    .btn1{
        border: none;
        outline: none;
        height: 50px;
        width: 100%;
        background-color: black;
        color: white;
        border-radius: 4px;
        font-weight: bold;
    }
    .btn1:hover{
       background: white;
       border: 1px solid;
       color: black;
    }

    
    </style>
  </head>
  <body>
  
  <c:set var="sesdelete" value="${sesuserexist }"></c:set>
<c:choose>
  <c:when test="${sesuserexist == 'check'}">
    <script>
      Swal.fire({
    	  icon: 'error',
    	  title: 'Warning!!!',
    	  text: 'Email already exist! Please use another email'
      }).then(function() {
        // Remove the session variable after the pop-up is closed
        <c:remove scope="session" var="sesuserexist" />;
      });
    </script>
  </c:when>
</c:choose>

    <section class="form my-4 mx-5">
      <div class="container">
        <div class="row no-gutters">
          <div class="col-lg-5">
            <img alt="" src="img/wp9401938.jpg" class="img-fluid">
          </div>
            <div class="col-lg-7 px-5 pt-5">
            <h1 class="font-weight-bold py-3">Being Fit</h1>
            <h3>Sign Up to your account</h3>
            
            
              <form action="save" method="post">

                <div class="form-row">
                  <div class="col-lg-7">
                    <input type="text" class ="form-control my-3 p-4" placeholder="Name" name="name">
                  </div>
                </div>
                <div class="form-row">
                  <div class="col-lg-7">
                    <input type="text" class ="form-control my-3 p-4" placeholder="Email-ID" name="email">
                  </div>
                </div>
                <div class="form-row">
                  <div class="col-lg-7">
                    <input type="password" class ="form-control my-3 p-4" placeholder="Password" name="password">
                  </div>
                </div>
                <div class="form-row">
                  <div class="col-lg-7">
                  	<label><b>Gender</b></label><br>
                    <input type="radio" class ="form-check-input" name="gender" value="male">
                    <label>Male</label><br>
                    <input type="radio" class ="form-check-input " name="gender" value="female">
                    <label>Female</label><br>
                  </div>
                </div>
                
                <label><b>Choose the Following langaunge</b></label>
                <div class="form-row">
                  <div class="col-lg-7">
                     <div class="form-check"><input class="form-check-input" type="checkbox" value="java" name="course"><label>JAVA</label></div>
         			 <div class="form-check"><input class="form-check-input" type="checkbox" value="cpp"name="course"><label>CPP</label></div>
          			 <div class="form-check"><input class="form-check-input" type="checkbox" value="angular"name="course"><label>Angular</label></div>
          			 <div class="form-check"><input class="form-check-input" type="checkbox" value="spring"name="course"><label>Spring</label></div>
                  </div>
                </div><br>
                
                <label><b>Select Your City</b></label>
                <div class="form-row">
                  <div class="col-lg-7">
                    <select id="city" name="city">
        			 <option value="">Select City</option>
        			 <option value="Mumbai">Mumbai</option>
         			 <option value="Pune">Pune</option>
        			 <option value="Nagpur">Nagpur</option>
        			 <option value="Akola">Akola</option>
        			 <option value="Amravati">Amravati</option>
       				 <option value="Nashik">Nashik</option>
         			</select>
                  </div>
                </div>
                
                <div class="form-row">
                  <div class="col-lg-7">
                    <button type="submit" class="btn1 mt-3 mb-5">Sign Up</button>
                  </div>
                </div>
                
                <p>Already Have an Account? <a href="login">Login Here</a></p>
              </form>
            </div>
        </div>
      </div>
    </section>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>