<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Cookie[] arr =request.getCookies();
	String t_loginid = null;
	
	if(arr != null) {
		for(int i=0; i<arr.length; i++) {
			if(arr[i].getName().equals("t_loginid")) {
			t_loginid = arr[i].getValue();
			System.out.println("login.jsp");
			System.out.println(t_loginid);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login.jsp</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/assets/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Login</h3>
                <form id="logform" action="loginForm" method="post">
                  <div class="form-group">
                    <label>ID*</label>
                 	 <input type="text" class="form-control p_input" id="t_loginid" name="t_loginid"
   						 value="<%= t_loginid%>"></div>
                  <div class="form-group">
                    <label>PASSWORD*</label>
                    <input type="password" class="form-control p_input" id="t_pw" name="t_pw">
                  </div>
                  <div class="form-group d-flex align-items-center justify-content-between">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input type="checkbox" name="idCheck" class="form-check-input" value="y">Remember me</label>
                    </div>
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-block enter-btn" onclick="location.href='mypage'">Login</button>
                  </div>
                  <p class="sign-up">Don't have an Account?<a href="register" onclick="location.href='register'"> Sign Up</a></p>
                </form>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/assets/js/off-canvas.js"></script>
    <script src="/assets/js/hoverable-collapse.js"></script>
    <script src="/assets/js/misc.js"></script>
    <script src="/assets/js/settings.js"></script>
    <script src="/assets/js/todolist.js"></script>
    <!-- endinject -->
    <c:if test="${not empty msg}">

    <script type="text/javascript">
   		 alert('${msg}');
  
        // Function to get cookie by name
        function getCookie(cookieName) {
        	Cookie[] idCheck = request.getCookies();
        	String id = null;
        	if(idCheck != null) {
        		for(int i=0; i<idCheck.length; i++) {
        			if(idCheck[i].getName().equals("idCheck")) {
        				id = idCheck[i].getValue();
        			}
        		}
        	}
        }
        
         $(document).ready(function () {
        	 console.log(<%= t_loginid %>);
             var check = '${param.check}';
             if (check !== '') {
                 alert("You should log in to use this service!");
             }
         }); 

    </script>
</c:if>
  </body>
</html>