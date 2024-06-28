<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <title>Login Page</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background: rgb(219, 226, 226);
        }

        .row {
            background: white;
            border-radius: 30px;
        }

        img {
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
        }

        .btn1 {
            border: none;
            outline: none;
            height: 50px;
            width: 100%;
            background-color: black;
            color: white;
            border-radius: 4px;
            font-weight: bold;
        }

        .btn1:hover {
            background: white;
            border: 1px solid;
            color: black;
        }

    </style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<section class="form my-4 mx-5">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-lg-5">
                <img src="img/wp9401938.jpg" class="img-fluid" alt="">
            </div>
            <div class="col-lg-7 px-5 pt-5">
                <h1 class="font-weight-bold py-3">Traveling World</h1>
                <h3>Update your details</h3>
                
				  <c:forEach var="rm" items="${list}">
				  
                <form action="/SpringMvcWebProjectNew2/update" method="post">
					<div class="form-row">
                        <div class="col-lg-7">
                            <input  type="hidden" class="form-control my-3 p-4" placeholder="id" name="id" id="name" value="${rm.id }"/>
                        </div>
                    </div>
					 <div class="form-row">
                        <div class="col-lg-7">
                            <input  class="form-control my-3 p-4" placeholder="Name" name="name" id="name" value="${rm.name }"/>
                        </div>
                    </div>
                   
                    <div class="form-row">
                        <div class="col-lg-7">
                            <input class="form-control my-3 p-4" placeholder="Email-ID" id="email" name="email"  value="${rm.email }"/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-lg-7">
                            <input type="password" class ="form-control my-3 p-4" placeholder="Password" id="password" name="password" value="${rm.password }">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-lg-7">
                            <label><b>Gender</b></label><br>
								<div class="form-check">
    							<input type="radio" class="form-check-input" name="gender" value="male" id="male"
        						<c:if test="${rm.gender=='male'}">checked</c:if>>
    							<label>Male</label><br>
							</div>

							<div class="form-check">
    							<input type="radio" class="form-check-input" name="gender" value="female" id="female"
        						<c:if test="${rm.gender=='female'}">checked</c:if>>
    							<label>Female</label><br>
							</div>
                        </div>
                    </div>

                    <label><b>Choose the Following language</b></label>
                    <div class="form-row">
                        <div class="col-lg-7">
			               <c:set var="cou" value="${rm.course}"/>
						    <div class="form-check">
						        <input type="checkbox" class="form-check-input" name="course" value="java" id="java" 
						        <c:if test="${fn:contains(cou, 'java')}">  
   									checked
								</c:if>  
						            
						        >
						        <label>Java</label><br>
						    </div>
						    
						
						    <div class="form-check">
						        <input type="checkbox" class="form-check-input" name="course" value="cpp" id="cpp" 
						        <c:if test="${fn:contains(cou, 'cpp')}">  
   									checked
								</c:if>  
						        >
						        <label>CPP</label><br>
						    </div>
						
						    <div class="form-check">
						        <input type="checkbox" class="form-check-input" name="course" value="spring" id="spring" 
						        <c:if test="${fn:contains(cou, 'spring')}">  
   									checked
								</c:if>  
						        >
						        <label>Spring</label><br>
						    </div>
						
						    <div class="form-check">
						        <input type="checkbox" class="form-check-input" name="course" value="angular" id="angular" 
						        <c:if test="${fn:contains(cou, 'angular')}">  
   									checked
								</c:if>  
						        >
						        <label>Angular</label><br>
						    </div>
                        </div>
                    </div><br>

                    <label><b>Select Your City</b></label>
                    <div class="form-row">
                        <div class="col-lg-7">
						 <select id="city" name="city" class="form-select">
						      <option value="Select city">Select City</option>
						      <option value="Mumbai" <c:if test="${rm.city == 'Mumbai'}">selected</c:if>>Mumbai</option>
						      <option value="Pune" <c:if test="${rm.city == 'Pune'}">selected</c:if>>Pune</option>
						      <option value="Nagpur" <c:if test="${rm.city == 'Nagpur'}">selected</c:if> >Nagpur</option>
						      <option value="Akola" <c:if test="${rm.city == 'Akola'}">selected</c:if>>Akola</option>
						      <option value="Amravati" <c:if test="${rm.city == 'Amravati'}">selected</c:if>>Amravati</option>
						      <option value="Nashik" <c:if test="${rm.city == 'Nashik'}">selected</c:if>>Nashik</option>
    				  </select>

                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-lg-7">
                            <button type="submit" class="btn1 mt-3 mb-5">Update</button>
                        </div>
                    </div>
                </form>
                </c:forEach>
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