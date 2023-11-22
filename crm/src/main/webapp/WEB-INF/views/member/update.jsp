<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:partials/_header.html -->
<%@include file="/WEB-INF/views/include/_header.jsp" %>
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
          	<div class="page-header col-6">
              <h3 class="page-title">사용자 정보 수정</h3>
            </div>
          	<div class="card col-6 m-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Update</h3>
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
	                    <input type="text" class="form-control p_input" id="t_name" name="t_name" value="${teacher.t_name }">
	                  </div>
	                  <div class="form-group col">
	                    <label>지도 과목</label>
	                    <input type="text" class="form-control p_input" id="t_subject" name="t_subject" value="${teacher.t_subject}">
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>담당 학급</label>
	                    <input type="text" class="form-control p_input" id="t_class" name="t_class" value="${teacher.t_class }">
	                  </div>
	                  <div class="form-group col">
	                    <label>전화번호</label>
	                    <input type="text" class="form-control p_input" id="t_phone" name="t_phone" value="${teacher.t_phone }">
	                  </div>
                  </div>
                  <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control p_input" id="t_email" name="t_email" value="${teacher.t_email }">
                  </div>
                  <div class="form-group d-flex align-items-center justify-content-between">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input type="checkbox" class="form-check-input"> Remember me </label>
                    </div>
                    <a href="#" class="forgot-pass">Forgot password</a>
                  </div>
                  <div class="text-center">
                    <button type="button" class="btn btn-primary mr-2" onclick="updateCheck()">Update</button>
                    <button type="button" class="btn btn-dark" onclick="teacherDelete()">Delete</button>
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
    <script type="text/javascript">
	  
	  	function updateCheck() {
			if($("#t_name").val().length < 1){
				alert("이름은 필수 입력 항목입니다.");
			}else if(confirm("수정 하시겠습니까?")){
				$("#updateForm").submit();
			}
		}
	  	
	  	function teacherDelete() {
	  		if(confirm('탈퇴 하시겠습니까?')){
		  		location.href='/pages/delete';
	  		};
	  	}
	</script>
  </body>
</html>