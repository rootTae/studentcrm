<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:partials/_header.html -->
<%@include file="/WEB-INF/views/include/_header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Cookie[] arr =request.getCookies();
	String t_loginid = null;
	
	if(arr != null) {
		for(int i=0; i<arr.length; i++) {
			if(arr[i].getName().equals("t_loginid")) {
			t_loginid = arr[i].getValue();
			System.out.println("mypage");
			System.out.println(t_loginid);
			}
		}
	}
%>
<!-- partial -->
  <body>
    <div class="container-scroller">
      <!-- partial:/include/_sidebar.html -->
      <%@include file="/WEB-INF/views/include/_sidebar.jsp" %>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:/include/_navbar.html -->
        <%@include file="/WEB-INF/views/include/_navbar.jsp" %>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          	<div>
				<h2>마이페이지입니다.</h2>
				<h3>'${sessionScope.t_loginid }'님 로그인을 환영합니다.</h3>
				
				
				
				<a href="updatePage/${sessionScope.t_id }">회원정보 변경</a>
				<a href="logout">로그아웃</a>
			</div>
			<div class="row">
				<div class="col-md-6 grid-margin stretch-card">
	                <div class="card">
	                  <div class="card-body">
	                    <h4 class="card-title">Default form</h4>
	                    <p class="card-description"> Basic form layout </p>
	                    <form class="forms-sample">
	                      <div class="form-group">
	                        <label for="exampleInputUsername1">Username</label>
	                        <input type="text" class="form-control" id="exampleInputUsername1" placeholder="Username">
	                      </div>
	                      <div class="form-group">
	                        <label for="exampleInputEmail1">Email address</label>
	                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
	                      </div>
	                      <div class="form-group">
	                        <label for="exampleInputPassword1">Password</label>
	                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
	                      </div>
	                      <div class="form-group">
	                        <label for="exampleInputConfirmPassword1">Confirm Password</label>
	                        <input type="password" class="form-control" id="exampleInputConfirmPassword1" placeholder="Password">
	                      </div>
	                      <div class="form-check form-check-flat form-check-primary">
	                        <label class="form-check-label">
	                          <input type="checkbox" class="form-check-input"> Remember me <i class="input-helper"></i></label>
	                      </div>
	                      
	                    </form>
	                      <button type="submit" class="btn btn-primary mr-2" id="updateBtn">Update</button>
	                      <button class="btn btn-dark" id="logoutBtn">Logout</button>
	                  </div>
	                </div>
	              </div>
			</div><!-- /row -->
             
          </div>
          <!-- content-wrapper ends -->
        
        </div>
        <!-- main-panel ends -->
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
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
    <%-- <c:if test="${not empty msg}"> --%>
    <script type="text/javascript">
    	if(!(${not empty msg} == "")) {
	    	console.log("msg 있음");
	        alert('${msg}');
    	}
    	console.log("msg 없음");
    	
        $("#logoutBtn").on("click", function(){
        	console.log("click");
        	alert("hey~");
        });
        //버튼 온클릭으로 변경하기
        /* function logoutBtn(){
        	if(confirm("로그아웃 하시겠습니까?")){
        		location.href = "/logout";
        	}
        } */
    </script>
    <%-- </c:if> --%>
  </body>
</html>