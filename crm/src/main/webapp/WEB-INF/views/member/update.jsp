<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:partials/_header.html -->
<%@include file="/WEB-INF/views/include/_header.jsp" %>
	<style>
	  	.img_box {overflow:hidden;height:253px;margin-bottom:10px;border-radius:2px;}
	  	.t_ico.mdi-account-box::before {position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);font-size:20rem;color:#2A3038}
	  	.img-fluid {display:block;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);width:100%;height:auto;}
	  	.imgCloseBtn {position:absolute;top:0;right:0;z-index:100;background-color:transparent;border:none;}
	  	.imgCloseBtn .mdi-close-box::before {font-size:25px;}
	</style>
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
          	<div class="page-header col-6 mx-auto">
              <h3 class="page-title">사용자 정보 수정</h3>
            </div>
            
            <div class="row"> 
	              <div id="teacherForm" class="col-7 grid-margin mx-auto">
	                <div class="card">
	                  <div class="card-body">
	                    <h4 class="card-title">사용자 정보</h4>
	                    <div class="row">
	                    	<div class="col-md-6">
	                    		<p class="card-description">사용자 정보를 수정, 삭제 할 수 있습니다.</p>
	                    	</div>
	                    </div>
	                    
	                    <form class="form-sample" action="/member/updateForm" role="form" id="updateForm" method="POST">
	                      <div class="row">
	                      <!-- ============== 사용자 사진 업로드 =============== -->
	                        <div class="col-6">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">사용자 사진</label>
	                            <div class="col-sm-12">
	                              <div class="col-sm-12 img_box">
	                              	<i class="t_ico mdi mdi-account-box"></i>
	                              </div>
	                              
	                              <div id="teacherImg" class="form-group">
			                        <input type="file" name='t_filename' id='t_filename' class="file-upload-default">
			                        <div class="input-group col-xs-12">
			                          <input type="text" class="form-control file-upload-info" placeholder="Upload Image" readonly>
			                          <span class="input-group-append">
		                         	 	<label for="t_filename" id="imgBtn"  class="file-upload-browse btn btn-primary mb-0 d-flex align-items-center"> Upload </label>
			                          </span>
			                        </div>
			                      </div>
			                      
			                      <div class="uploadResult">
				      				<ul></ul>
				      			  </div>
	                              
	                            </div>
	                          </div>
	                        </div>
	                      <!-- ============== /사용자 사진 업로드 =============== -->
	                        
	                        <div class="col">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">아이디</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_loginid" name="t_loginid" value="${teacher.t_loginid }" readonly>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">이름*</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_name" name="t_name" value="${teacher.t_name }">
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">강의 과목*</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_subject" name="t_subject" value="${teacher.t_subject}">
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">담당 학급</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_class" name="t_class" value="${teacher.t_class }">
	                            </div>
	                          </div>
	                          
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">전화번호</label>
	                            <div class="col-sm-12">
	                              <input type="text" class="form-control p_input" id="t_phone" name="t_phone" value="${teacher.t_phone }">
	                            </div>
	                          </div>

	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">Email</label>
	                            <div class="col-sm-12">
	                              <input type="email" class="form-control p_input" id="t_email" name="t_email" value="${teacher.t_email }">
	                            </div>
	                          </div>
	                        
	                        </div>
	                        
	                      </div>
	                      
		                    <div class="text-center">
			                  	<button type="button" class="btn btn-primary mr-2" id="updateBtn">Update</button>
	                  			<button type="button" class="btn btn-dark" onclick="teacherDelete()">Delete</button>
			                </div>
	                    </form>
	                    
	                    <div class="upload_img">
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
    <script type="text/javascript">
	  	function updateCheck() {
			if($("#t_name").val().length < 1){
				alert("이름은 필수 입력 항목입니다.");
			}else if($("#t_subject").val().length < 1){
				alert("강의 과목은 필수 입력 항목입니다.");
	  			console.log("updateCheck 실행");
			}else if(confirm("수정 하시겠습니까?")){
				$("#updateForm").submit();
			}
		}
	  	
	  	function teacherDelete() {
	  		if(confirm('탈퇴 하시겠습니까?')){
		  		location.href='/member/delete';
	  		};
	  	}
	  	
	  	$(document).ready(function(){	  		 
	  		//첨부된 파일 보여주기
			//첨부파일 작업
			function getImage(t_id) {
	  			console.log("getImage 실행");
				$.getJSON('/member/getAttachImg', {t_id:t_id}, function(result){
	  				console.log("가져올 이미지 있음");
					$(".t_ico").hide();
					let uploadBox = $(".img_box");
					let str = "";
										
					let fileCallPath = encodeURIComponent(result.uploadPath+"/s_"+result.uuid+"_"+result.fileName);														
					str += "<div class='upload_img' data-path='"+result.uploadPath+"' data-uuid='"+result.uuid+"' ";
					str += "data-filename='"+result.fileName+"' data-type='"+(result.fileType == 'image'? true:result.fileType)+"'>";
					str += "<button type='button' class='imgCloseBtn' data-file='"+fileCallPath+"' data-type='image' ";
					str += "class='btn btn-warning btn-circle'>";
					str += "<i class='mdi mdi-close-box'></i></button><br>";
					str += "<img class='img-fluid' src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";

					uploadBox.append(str);
				}).fail(function(xhr, status, err){
					console.log("가져올 이미지 없음");
					//출력할 내용이 없으면 더이상 진행하지 않음
					showNoImage();//출력할 내용이 없으면 기본이미지를 보여줘야함 
				});
			};
			getImage(${teacher.t_id});
	  		 
	  		//파일 첨부
			let formObj = $("form[role='form']"); //role의 값이 form 태그 선택
			
			$("#updateBtn").on("click", function(e) {
				e.preventDefault();
				let str = "";
				let upImgData = $(".upload_img");
				
				if(upImgData.length > 0){//= 첨부할 파일이 있으면
					console.log("첨부할 파일이 있음");
					//업로드할 파일을 선택한 후 만들어진 정보를 담아서 넘겨주는 것
					str += "<input type='hidden' name='attachImg.fileName' value='"+upImgData.data("filename")+"'>";
					str += "<input type='hidden' name='attachImg.uuid' value='"+upImgData.data("uuid")+"'>";
					str += "<input type='hidden' name='attachImg.uploadPath' value='"+upImgData.data("path")+"'>";
					str += "<input type='hidden' name='attachImg.fileType' value='"+upImgData.data("type")+"'>";
					console.log(str);
					formObj.append(str);
				}
				console.log("첨부할 파일이 없음");
				updateCheck();//최종 데이터 넘김
			});

			let regex = new RegExp("(.*?)\.(jpg|jpeg|gif|png)$");
			let maxSize = 5242880; //5MB
			//let uploadResult = $(".uploadResult ul");
			
			//업로드 제한 - 사이즈, 확장자
			function checkExtenstion(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("5MB 이상의 파일은 업로드 할 수 없습니다.");
					return false;
				}
				if(!regex.test(fileName)){
					alert('jpg, jpeg, gif, png 파일만 업로드 할 수 있습니다.');
					return false;
				}
				return true;
			}
			
			//파일 업로드를 위한 별도의 버튼 없이 <input type='file'>의 내용 변경을 감지하는 이벤트를 처리
			$("input[type='file']").change(function(e){
				console.log("input type file change!!!");
				let formData = new FormData();//폼태그 만들어 줌
				let inputFile = $(this);
				let files = inputFile[0].files;//multiple 속성이 없으므로 하나만 선택됨. 그래서 하나뿐임
				
				// 파일이 선택되지 않았을 경우
			    if (!files.length) {
			        console.log("No file selected.");
			        return false;
			    }
				
				//파일 업로드 전 제약 조건 확인
				if(!checkExtenstion(files[0].name, files[0].size)) {
					return false;
				}else {
					$(".file-upload-info").val(files[0].name);
					formData.append("uploadFile", files[0]);
				}
				
				//데이터 전송을 위한 Ajax 설정
				$.ajax({
					url:'/teacherImgupload',
					processData:false,
					contentType:false,
					data:formData,
					type:'POST',
					dataType:'json',
					success:function(result){
						//결과값 출력 함수
						showUploadedResult(result);
					}
				});
			});
			
			//업로드 결과를 보여주기 위한 showUploadedResult();
			function showUploadedResult(result){
				//출력할 내용이 없으면 더이상 진행하지 않음
				if(result == null){
					return;
				}
				$(".t_ico").hide();
				let uploadBox = $(".img_box");
				$(".upload_img").remove();//하나만 첨부 가능하니까 새로 첨부하면 삭제
				//showNoImage();
				
				let str = "";
				
				let fileCallPath = encodeURIComponent(result.uploadPath+"/s_"+result.uuid+"_"+result.fileName);														
				str += "<div class='upload_img' data-path='"+result.uploadPath+"' data-uuid='"+result.uuid+"' ";
				str += "data-filename='"+result.fileName+"' data-type='"+result.image+"'>";
				str += "<button type='button' class='imgCloseBtn' data-file='"+fileCallPath+"' data-type='image' ";
				str += "class='btn btn-warning btn-circle'>";
				str += "<i class='mdi mdi-close-box'></i></button><br>";
				str += "<img class='img-fluid' src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";

				$(".t_ico").hide();//이미지 없음 아이콘 숨기기
				uploadBox.append(str);
			};
			
			//첨부파일 변경 처리를 위한 버튼 이벤트
			/* $(".img_box").on("click","button",function(e){
				let targetFile = $(this).data("file");
				let type = $(this).data("type");

				$.ajax({
					url: '/deleteTecherFile',
					data: {fileName: targetFile, type: type},
					dataType: 'text',
					type: 'POST',
					success: function(result){
						alert(result);
						showNoImage();
					}
				});
				
			}); */
	        	
			//삭제 버튼 처리 - 화면에서 삭제. 실제 파일 삭제는 아님
			$(".img_box").on("click", ".imgCloseBtn", function() {
				console.log("버튼 클릭");
				if(confirm("remove this file?")) {
					
					showNoImage();
				}
			});
        	
			function showNoImage(){
				console.log("화면에서만 삭제");
				$(".t_ico").show();
				$(".upload_img").remove();
				$(".file-upload-info").val("");
			}
			
        });
	  	
	  	
	</script>
  </body>
</html>