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
	<style>
	  	.img_box {overflow:hidden;height:253px;margin-bottom:10px;border-radius:2px;}
	  	.t_ico.mdi-account-box::before {position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);font-size:20rem;color:#2A3038}
	  	.img-fluid {display:block;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);width:100%;height:auto;}
	  	.imgCloseBtn {position:absolute;top:0;right:0;z-index:100;background-color:transparent;border:none;}
	  	.imgCloseBtn .mdi-close-box::before {font-size:25px;}
	</style>

<!-- partial -->
  <body>
  	 <script type="text/javascript">
    	if(!(${not empty msg} == "")) {
	    	//console.log("msg 있음");
	        alert('${msg}');
    	}
    </script>
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
			<div class="page-header col-7 mx-auto">
              <%-- <h3 class="page-title">'${sessionScope.t_name }'님의 마이페이지 입니다.</h3> --%>
              <h3 class="page-title">사용자 정보 관리</h3>
            </div>
            
            <div class="row"> 
	              <div id="teacherForm" class="col-7 grid-margin mx-auto">
	                <div class="card">
	                  <div class="card-body">
	                    <h4 class="card-title">사용자 정보</h4>
	                    <div class="row">
	                    	<div class="col-md-6">
	                    		<p class="card-description">사용자 정보를 조회, 수정, 삭제 할 수 있습니다.</p>
	                    	</div>
	                    </div>
	                    <form class="form-sample">
	                      <div class="row">
	                      <!-- ============== 사용자 사진 업로드 =============== -->
	                        <div class="col-6">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">사용자 사진</label>
	                            <div class="col-sm-12">
	                              <div class="col-sm-12 img_box">
	                              	<i class="t_ico mdi mdi-account-box"></i>
	                              </div>
	                              
	                              <!-- <div id="teacherImg" class="form-group">
			                        <input type="file" name='t_filename' id='t_filename' class="file-upload-default">
			                        <div class="input-group col-xs-12">
			                          <input type="text" class="form-control file-upload-info" placeholder="Upload Image" readonly>
			                          <span class="input-group-append">
		                         	 	<label for="t_filename" id="imgBtn"  class="file-upload-browse btn btn-primary mb-0 d-flex align-items-center"> Upload </label>
			                          </span>
			                        </div>
			                      </div> -->
			                      
			                      <div class="uploadResult">
				      				<ul></ul>
				      			  </div>
	                              
	                            </div>
	                          </div>
	                        </div>
	                      <!-- ============== /학생 사진 업로드 =============== -->
	                        
	                        <div class="col">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">아이디</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_loginid" name="t_loginid" value="${teacher.t_loginid }" readonly>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">이름</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_name" name="t_name" value="${teacher.t_name }" readonly>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">강의 과목</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_subject" name="t_subject" value="${teacher.t_subject}" readonly>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">담당 학급</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_class" name="t_class" value="${teacher.t_class }" readonly>
	                            </div>
	                          </div>
	                          
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">전화번호</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_phone" name="t_phone" value="${teacher.t_phone }" readonly>
	                            </div>
	                          </div>

	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">Email</label>
	                            <div class="col-sm-12">
	                              <input type="email" class="form-control p_input" id="t_email" name="t_email" value="${teacher.t_email }" readonly>
	                            </div>
	                          </div>
	                        
	                        </div>
	                        
	                      </div>
	                      
	                    </form>
	                    
	                    <div class="text-center">
		                  <button type="button" class="btn btn-primary mr-2" id="updateBtn" onclick="location.href='/member/updatePage/${teacher.t_id}'">Update</button>
		                  <button type="button" class="btn btn-dark" id="logoutBtn" onclick="logoutBtn()">Logout</button>
		                </div>
		                
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
    	/* if(!(${not empty msg} == "")) {
	    	//console.log("msg 있음");
	        alert('${msg}');
    	} */
    	//console.log("msg 없음");
    	
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
        
        $(document).ready(function(){
        	
        	//첨부된 파일 보여주기
			//첨부파일 작업
			function getImage(t_id) {
				$.getJSON('/member/getAttachImg', {t_id:t_id}, function(result){
					$(".t_ico").hide();
					let uploadBox = $(".img_box");
					let str = "";
										
					let fileCallPath = encodeURIComponent(result.uploadPath+"/s_"+result.uuid+"_"+result.fileName);														
					str += "<div class='upload_img' data-path='"+result.uploadPath+"' data-uuid='"+result.uuid+"' ";
					str += "data-filename='"+result.fileName+"' data-type='"+(result.fileType == 'image'? true:result.fileType)+"'>";
					str += "<img class='img-fluid' src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";

					uploadBox.append(str);
				}).fail(function(xhr, status, err){
					showNoImage();
				});
			};
			getImage(${teacher.t_id});
			
			function showNoImage(){
				$(".t_ico").show();
				$(".upload_img").remove();
				$(".file-upload-info").val("");
			}
			
        });
        
    </script>
    <%-- </c:if> --%>
  </body>
</html>