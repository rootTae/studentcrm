<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    					    value="<c:out value='${session.getAttribute("rememberedId")}'  />">
                  </div>
                  <div class="form-group">
                    <label>PASSWORD*</label>
                    <input type="password" class="form-control p_input" id="t_pw" name="t_pw">
                  </div>
                  <div class="form-group d-flex align-items-center justify-content-between">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input type="checkbox" id="rememberMe" class="form-check-input">Remember me</label>
                    </div>
                    <a href="#" class="forgot-pass">Forgot password?</a>
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
<<<<<<< HEAD
    <script type="text/javascript">
   		 alert('${msg}');
         document.getElementById('logform').addEventListener('submit', function (e) {
        	 e.preventDefault();
            if (document.getElementById('rememberMe').checked) {
                var rememberedId = document.getElementById('t_loginid').value;
                // 서버에 rememberedId 값을 전송하는 Ajax 요청을 보낼 수 있음
                console.log("reID");
                console.log(rememberedId);
            }
        }); 

         $(document).ready(function () {
             var check = '${param.check}';
             if (check !== '') {
                 alert("You should log in to use this service!");
             }
         }); 
=======
    <script>
        alert('${msg}');
        
        $(document).ready(function () {
            var check = '${param.check}';
            if (check !== '') {
                alert("You should log in to use this service!");
            }
        }); 


>>>>>>> branch 'develop' of https://github.com/rootTae/studentcrm.git
    </script>
</c:if>
  </body>
</html>