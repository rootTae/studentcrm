<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@include file="/WEB-INF/views/include/_header.jsp" %>
    <style>
	  	.img_box {overflow:hidden;height:140px;margin-bottom:10px;border-radius:2px;}
	  	.t_ico.mdi-account-box::before {position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);font-size:11rem;color:#2A3038}
	  	.img-fluid {display:block;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);width:100%;height:auto;}
	  	.imgCloseBtn {position:absolute;top:0;right:0;z-index:100;background-color:transparent;border:none;}
	  	.imgCloseBtn .mdi-close-box::before {font-size:25px;}
	</style>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                
                <h3 class="card-title text-left mb-3">Register</h3>
                
                <form action="regForm" role="form" method="post" id="regForm">
                  <div class="row">
                  	<!-- ============== 사용자 사진 업로드 =============== -->
                        <div class="col-12">
                          <div class="form-group">
                            <label class="col-form-label">사용자 사진</label>
                            <div class="col-sm-10 mx-auto">
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
                  </div>
                  <div class="row">
	                  <div class="form-group col d-flex">
		                  <div style="width: 100%;">
		                    <label>아이디*</label>
		                    <input type="text" class="form-control p_input" id="t_loginid" name="t_loginid">
		                  </div>
	                  </div>
	                  <div class="form-group col-3 d-flex pl-0">
	                    <input type="button" class="form-control p_input align-self-end" value="중복체크" onclick="CheckId()"><br>
					</div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>비밀번호*</label>
	                    <input type="password" class="form-control p_input" id="t_pw" name="t_pw">
	                  </div>
	                  <div class="form-group col">
	                    <label>비밀번호 확인*</label>
	                    <input type="password" class="form-control p_input" id="pwCheck" name="pwCheck">
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>이름*</label>
	                    <input type="text" class="form-control p_input" id="t_name" name="t_name">
	                  </div>
	                  <div class="form-group col">
	                    <label>강의 과목*</label>
	                    <input type="text" class="form-control p_input" id="t_subject" name="t_subject">
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>담당 학급</label>
	                    <input type="text" class="form-control p_input" id="t_class" name="t_class">
	                  </div>
	                  <div class="form-group col">
	                    <label>전화번호</label>
	                    <input type="text" class="form-control p_input" id="t_phone" name="t_phone">
	                  </div>
                  </div>
                  <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control p_input" id="t_email" name="t_email">
                  </div>
                  <div class="text-center">
                    <button type="button" class="btn btn-primary btn-block enter-btn">Join</button>
                  </div>
                  <p class="sign-up text-center">이미 등록 된 정보가 있습니까?<a href="login"> Sign In</a></p>
                </form>
                
                <div class="upload_img">
                </div>
                
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
    <script type="text/javascript">
    
		function CheckId() {
			var id = $("#t_loginid").val(); //id태그 value에 접근
			var userId = {"t_loginid" : id}; //전송할 데이터의 key값 : value설정
				
			if(id.length < 4) {
				alert("아이디는 4글자 이상 입력하세요");
			} else {
			  	$.ajax({
			  		type : "post",     //요청 형식
			  		url : "/member/checkId",   //요청할 주소
			  		data : userId,//서버에 전송할 데이터  json형식 {key:value}
			  		dataType : "json", //서버의 요청후 리턴해 주는 타입 
			  		error : function(request, error) {
			  			alert(error + "\n" + request.status);		
			  		},
			  		success : function(result) { 
						console.log("성공실패여부:" + result);
			  				
			  			if(result == 1) { //중복되는 아이디가 존재함
			  				alert("이미 존재하는 아이디 입니다");
			  			} else {
			  				alert("사용가능한 아이디 입니다");
			  				$("#t_loginid").attr("readonly", true);
			  			}
					}
			  	});
			} //end else
			//console.log(userId);
		} 
	  
	  	//회원 가입 체크(joinCheck())
	  	function joinCheck() {
			if(!$("#t_loginid").attr("readonly")) {
				alert("아이디 중복체크를 해야 합니다.");
			}else if($("#t_pw").val().length < 1){
				alert("비밀번호를 입력하세요");
			}else if($("#t_pw").val() !== $("#pwCheck").val()){
				alert("비밀번호 확인란을 확인해주세요")
				$("#t_pwCheck").focus();
			}else if($("#t_name").val().length < 1){
				alert("이름은 필수 입력 항목입니다.");
			}else if($("#t_subject").val().length < 1){
				alert("강의 과목은 필수 입력 항목입니다.");
			}else if(confirm("회원 가입을 하시겠습니까?")){
				//sendImgData();
				$("#regForm").submit();
			}
		}
  	
  //============== 사용자 사진 업로드 ===============
	//첨부파일 추가 작업
	$(document).ready(function(e) {
		//console.log($(".upload_img").length);
		//console.log($(".upload_img").children().eq(0).html());
		//function sendImgData() { //저장 버튼을 눌렀을 때 실행할 함수
			let formObj = $("form[role='form']"); //role의 값이 form 태그 선택
			
			$("button[type='button']").on("click", function(e) {
				e.preventDefault();
				let str = "";
				let upImgData = $(".upload_img");
				//console.log("filetype : "+upImgData.data("type"));
				//if(upImgData.length > 0){
				if(upImgData.children().length){
					//console.log(upImgData.children().length);
					//업로드할 파일을 선택한 후 만들어진 정보를 담아서 넘겨주는 것
					str += "<input type='hidden' name='attachImg.fileName' value='"+upImgData.data("filename")+"'>";
					str += "<input type='hidden' name='attachImg.uuid' value='"+upImgData.data("uuid")+"'>";
					str += "<input type='hidden' name='attachImg.uploadPath' value='"+upImgData.data("path")+"'>";
					str += "<input type='hidden' name='attachImg.fileType' value='"+upImgData.data("type")+"'>";
					
					formObj.append(str);
				}
				//console.log(formObj);
				joinCheck();//최종 데이터 넘김
			});
		//}
		
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
			//console.log("data-type : "+$(".upload_img").data("image"));
			$(".upload_img").remove();//하나만 첨부 가능하니까 새로 첨부하면 삭제
			//showNoImage();
			
			let str = "";
			
			let fileCallPath = encodeURIComponent(result.uploadPath+"/s_"+result.uuid+"_"+result.fileName);														
			//console.log("첨부한 파일의 image : ");
			//console.log(result.image);
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
		$(".img_box").on("click","button",function(e){
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
			
		});
		
		function showNoImage(){
			$(".t_ico").show();
			$(".upload_img").remove();
			$(".file-upload-info").val("");
		}
		
		
	});
  </script> 
  </body>
</html>