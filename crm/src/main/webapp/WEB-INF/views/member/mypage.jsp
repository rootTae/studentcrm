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
			
			<div class="page-header col-6">
              <h3 class="page-title">사용자 정보</h3>
            </div>
          	<div class="card col-6 m-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">사용자 정보</h3>
                <form action="/pages/updateForm" method="post" id="updateForm">
                  <div class="row">
	                  <div class="form-group col">
	                    <label>아이디</label>
	                    <input type="text" class="form-control p_input" id="t_loginid" name="t_loginid" value="${teacher.t_loginid }" readonly>
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>이름</label>
	                    <input type="text" class="form-control p_input" id="t_name" name="t_name" value="${teacher.t_name }" readonly>
	                  </div>
	                  <div class="form-group col">
	                    <label>지도 과목</label>
	                    <input type="text" class="form-control p_input" id="t_subject" name="t_subject" value="${teacher.t_subject}" readonly>
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>담당 학급</label>
	                    <input type="text" class="form-control p_input" id="t_class" name="t_class" value="${teacher.t_class }" readonly>
	                  </div>
	                  <div class="form-group col">
	                    <label>전화번호</label>
	                    <input type="text" class="form-control p_input" id="t_phone" name="t_phone" value="${teacher.t_phone }" readonly>
	                  </div>
                  </div>
                  <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control p_input" id="t_email" name="t_email" value="${teacher.t_email }" readonly>
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary mr-2" id="updateBtn" onclick="updateBtn()">Update</button>
                    <button class="btn btn-dark" id="logoutBtn" onclick="logoutBtn()">Logout</button>
                  </div>
                </form>
              </div>
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
    <%-- <c:if test="${not empty msg}"> --%>
    <script type="text/javascript">
    	if(!(${not empty msg} == "")) {
	    	console.log("msg 있음");
	        alert('${msg}');
    	}
    	console.log("msg 없음");
    	
    	function updateBtn(){
    		let t_id = ${sessionScope.t_id };
    		location.href = "/member/updatePage/"+t_id;
    	}
    
        //버튼 온클릭으로 변경하기
        function logoutBtn(){
        	if(confirm("로그아웃 하시겠습니까?")){
        		location.href = "/member/logout";
        	}
        } 
    </script>
    <%-- </c:if> --%>
  </body>
</html>