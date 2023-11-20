<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:partials/_header.html -->
<%@include file="/WEB-INF/views/include/_header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String t_loginid = request.getParameter("t_loginid");
	String t_pw = request.getParameter("t_pw");
	
	//아이디를 기억하기 위한 idCheck 값 받기
	String idCheck = request.getParameter("idCheck");
	
	//선생님 ver
	if(t_loginid.equals("chris") && t_pw.equals("1234")) {
		Cookie userId = new Cookie("t_loginid", t_loginid);
		userId.setMaxAge(30);
		response.addCookie(userId);
		
		//idCheck가 있는 경우 - 쿠키 생성
		if(idCheck != null) {
			Cookie check = new Cookie("idCheck", t_loginid);
			check.setMaxAge(30);
			response.addCookie(check);		
		}
		
		response.sendRedirect("mypage.jsp");
	}else {
		response.sendRedirect("login.jsp");
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
    <c:if test="${not empty msg}">
    <script>
        alert('${msg}');
    </script>
    </c:if>
  </body>
</html>