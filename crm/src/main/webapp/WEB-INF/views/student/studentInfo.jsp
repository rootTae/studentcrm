<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:partials/_header.html -->
<%@include file="/WEB-INF/views/include/_header.jsp" %>
  <style>
  	.img_box {overflow:hidden;height:253px;margin-bottom:10px;border-radius:2px;}
  	.s_ico.mdi-account-box::before {position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);font-size:20rem;color:#2A3038}
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
          
          
          <!-- 여기에 내용 코드 입력 - 이 페이지를 복사해서 사용하세요 -->
          	<div class="page-header">
              <h3 class="page-title">학생 정보 관리</h3>
            </div>
            
          	<div class="row">
          	
              <div class="col-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">학생 정보 검색</h4>
                    <p class="card-description">학생의 이름 혹은 학번을 입력해 주세요.</p>
                    <form class="form-inline">
                      <input type="text" class="form-control mb-2 mr-sm-2" name="s_search" id="sSearch" maxlength="10" placeholder="학생명 or 학번">
                      <button type="submit" class="btn btn-primary mb-2" id="searchBtn">검색</button>
                    </form>
                  </div>
                </div>
              </div>
              
              <div class="col-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">검색 결과</h4>
                    <p class="card-description">클릭 시 상세 정보 보기</p>
                    
					<ul class="search_list" style='padding:0;list-style:none'></ul>
					
                  </div>
                </div>
              </div>
              
	        </div>
	        
	        
	        <!-- ============== 신상 정보 =============== -->
	        <div class="row"> 
	              <div id="studentForm" class="col-12 grid-margin">
	                <div class="card">
	                  <div class="card-body">
	                    <h4 class="card-title">학생 상세 정보</h4>
	                    <div class="row">
	                    	<div class="col-md-6">
	                    		<p class="card-description">학생 정보를 추가, 수정, 삭제 할 수 있습니다.</p>
	                    	</div>
	                    	<div class="col-md-4 ml-auto text-right">
	                    		<button class="s_add_Btn btn btn-primary mr-2" style="display:none">추가</button>
						  		<button class="s_modify_Btn btn btn-secondary mr-2" style="display:none">수정</button>
						  		<button class="s_del_Btn btn btn-dark" style="display:none">삭제</button>
						  	
						  		<button class="s_save_Btn btn btn-primary mr-2" >저장</button>
						  		<button class="s_cancel_Btn btn btn-dark">취소</button>
	                    	</div>
	                    </div>
	                    <form class="form-sample">
	                      <div class="row">
	                      <!-- ============== 학생 사진 업로드 =============== -->
	                        <div class="col-md-4">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">학생 사진</label>
	                            <div class="col-sm-12">
	                              <div class="col-sm-12 img_box">
	                              	<i class="s_ico mdi mdi-account-box"></i>
	                              </div>
	                              
	                              <div id="studentImg" class="form-group">
			                        <input type="file" name='s_filename' id='s_filename' class="file-upload-default">
			                        <div class="input-group col-xs-12">
			                          <input type="text" class="form-control file-upload-info" placeholder="Upload Image" readonly>
			                          <span class="input-group-append">
		                         	 	<label for="s_filename" id="imgBtn"  class="file-upload-browse btn btn-primary mb-0 d-flex align-items-center"> Upload </label>
			                          </span>
			                        </div>
			                      </div>
			                      
			                      <div class="uploadResult">
				      				<ul></ul>
				      			</div>
	                              
	                            </div>
	                          </div>
	                        </div>
	                      <!-- ============== /학생 사진 업로드 =============== -->
	                        
	                        <div class="col-md-4">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">이름</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_name' id='s_name'>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">학교</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_school' id='s_school'>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">생년월일</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_birth' id='s_birth' placeholder='yyyy-mm-dd'>
	                            </div>
	                          </div>
	                          
	                          <!-- <div class="form-group">
	                            <label class="col-sm-12 col-form-label">생년월일</label>
	                            
	                            <div class="row col-12">
		                            <div class="col pr-0">
		                              <input type='text' class="form-control" name='s_birth' id='s_birth' placeholder='yyyy-mm-dd'>
		                            </div>
		                            
		                            <div class="calendar_btn">
			                            <div class="col-auto pr-0 d-flex align-items-center h-100">
			                              <label for="s_birth" class="mb-0">
			                              	<button type="button" class="btn btn-primary">
		                 						 <i class="mdi mdi-calendar mr-0"></i>
		                 					</button>
		                 				  </label>
			                            </div>
		                            </div>
		                            
	                            </div>
	                            
	                          </div> -->
	                          
	                          
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">전화번호</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_phone' id='s_phone'>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="col-md-4">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">학번 <code style="font-size:12px">입력, 수정불가</code></label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_id' id='s_id' readonly>
	                            </div>
	                          </div>
	                          
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">학년</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_grade' id='s_grade'>
	                            </div>
	                          </div>
	                          
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">성별</label>	   
	                            
	                            <div class="row col-sm-12">
		                            <div class="col-sm-6">
		                              <div class="form-check">
		                                <label class="form-check-label">
		                                  <input type="radio" class="form-check-input" name="s_gender" id="s_gender_m"> 남자 <i class="input-helper"></i></label>
		                              </div>
		                            </div>
		                            
		                            <div class="col-sm-6">
		                              <div class="form-check">
		                                <label class="form-check-label">
		                                  <input type="radio" class="form-check-input" name="s_gender" id="s_gender_f"> 여자 <i class="input-helper"></i></label>
		                              </div>
		                          	</div>
		                          	
	                            </div>                       
	                          </div>
	                          
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">추가 연락처</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_family_phone2' id='s_family_phone2'>
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                      
	                      <div class="row">
	                        <div class="col-md-4">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">보호자 이름</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_family' id='s_family'>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">형제 정보</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_sibling' id='s_sibling'>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="col-md-4">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">학생과의 관계</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_relation' id='s_relation'>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">최초 등록일</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='reg_date' id='reg_date'>
	                            </div>
	                          </div>
	                        </div>
	                        
	                        <div class="col-md-4">
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">보호자 연락처</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='s_family_phone1' id='s_family_phone1'>
	                            </div>
	                          </div>
	                          <div class="form-group">
	                            <label class="col-sm-12 col-form-label">최초 수업일</label>
	                            <div class="col-sm-12">
	                              <input type='text' class="form-control" name='first_date' id='first_date'>
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                      
	                    </form>
	                    
	                    <hr class="my-4">
	                    
	              		<!-- ============== 통학 정보 =============== -->
			              <form class="form-sample" id="commuteInfo">
				              <div class="row">
			                     <div class="col-md-6">
			                       <div class="form-group">
			                       	<label class="col-sm-12 col-form-label" for="zip_code">우편번호</label>
			                         <div class="col-sm-12">
			                       		<input type='text' class="form-control" name='zip_code' id='zip_code'>
			                         </div>
			                       </div>
			                       <div class="form-group">
			                         <label class="col-sm-12 col-form-label" for="address1">주소</label>
			                         <div class="col-sm-12">
			                           <input type='text' class="form-control" name='address1' id='address1'>
			                         </div>
			                       </div>
			                       <div class="form-group">
			                         <label class="col-sm-12 col-form-label" for="address2">상세 주소</label>
			                         <div class="col-sm-12">
			                           <input type='text' class="form-control" name='address2' id='address2'>
			                         </div>
			                       </div>
			                     </div>
			                     
			                     <div class="col-md-6">
			                       <div class="form-group">
			                         <label class="col-sm-12 col-form-label" for="location">승차 위치</label>
			                         <div class="col-sm-12">
			                           <input type='text' class="form-control" name='location' id='location'>
			                         </div>
			                       </div>
			                       <div class="form-group">
			                         <div class="col-md-12 ml-auto text-right">
			                      		<button class="btn btn-primary mr-2" style="display:none">승차위치 선택</button>
									   	<button class="btn btn-secondary mr-2" style="display:none">승차위치 삭제</button>
			                      	</div>
			                       </div>
			                     </div>
			                   </div>
		                   </form>
		                   
		                   <hr class="my-4">
	                    
	              		<!-- ============== 학생 메모 =============== -->
			              <form class="form-sample" id="studentMemo">
				              <div class="row">
			                     <div class="col-md-12">
			                     
			                       <div class="form-group">
			                       	<label class="col-sm-12 col-form-label" for="zip_code">학생 기타 정보</label>
			                         <div class="col-sm-12">
			                       		<textarea class="form-control" id="s_memo" name='s_memo' rows="4"></textarea>
			                         </div>
			                       </div>
			                      
			                     </div>
			                   </div>
		                   </form>
	                  </div>
	                </div>
	              </div>
	              
          	   </div><!-- /.row -->
           
          
         	 <div><!-- /content-wrapper -->
			    
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
    
    <script type="text/javascript" src="/js/studentInfo.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			//============== 학생 정보 검색 ===============
			let searchList = $(".search_list");
			let studentForm = $("#studentForm");
			let studentImg = $("#studentImg");
			
			//취소 버든 클릭시 데이터를 되돌리기 위한 s_id, 통학 정보 수정을 위함
			let nowSid = "";
			let studentId = ""; //현재 검색한 학생 s_id
			//어떤 버튼을 눌렀는지 확인 후 수정, 취소 기능 구별용
			let nowBtn = "";
			
			//검색 버튼
			$("#searchBtn").on("click", function(e) {
				e.preventDefault();
				let searchVal = $("#sSearch").val();
				if(searchList.hide()) {
					searchList.show();
				}
				searchList.children().remove(); //새로 검색 했을 때 이전 검색 결과 지우기
				
				if(searchVal === "") { //검색어 비었을 때
					alert("검색어를 입력해 주세요");
					
				}else if(/^\d+$/.test(searchVal)) { //학번 검색 했을 때
					//console.log("입력한 값은 정수입니다.");
					getInfo(searchVal);
					
				}else { //이름 검색했을 때
					//console.log("입력한 값은 문자열입니다.");
					srchName(searchVal);
				}
			});
			
			//id로 학생 정보 가져오기
			function getInfo(searchVal) {
				StudentService.getSearchList({s_id:searchVal},
					function(data) {
						let currentHTML = searchList.html();
						let str = "";
						//학번으로 검색했을 때
						//일치하는 정보가 없음
						if(data == null){
							//searchList.html("");
							$("#sSearch").val("");
							alert("일치하는 정보가 없습니다.");
							return;
						}
						str += "<li>";
			            str += "<a href='#' data-s_id='"+data.s_id+"'>"+data.s_name+" - "+data.s_id+"</a></li>";
							
						searchList.html(currentHTML + str);
					}
				);
			}
			//이름으로 학생 id 가져오기
			function srchName(searchVal) {
				StudentService.getName({s_name:searchVal},
					function(data){
						if(data == null || data.length == 0){
							//searchList.html("");
							$("#sSearch").val("");
							alert("일치하는 정보가 없습니다.");
							return;
						}
						//이름으로 해당하는 id 값 가져오고 각 id 값으로 학생 정보 가져오기
						data.forEach(function(s_id){
							getInfo(s_id);
						})
					}
				);
			}
			
			//검색한 학생정보 선택해서 DB 상세정보 form에 출력하기
			searchList.on("click", "li a", function(e) {
				e.preventDefault();
				searchList.hide();
				//버튼 토글
				btnShow3();
				//처음엔 저장, 초기화 버튼만 보이다가 검색한 데이터를 클릭하면 수정, 삭제, 추가 버튼으로 변경
				
				studentId = $(this).data("s_id");
				getStudent(studentId); //해당 학생 정보
				getCommute(studentId);//해당 학생의 통학 정보
				//getClass(studentId);//해당 학생의 학급 정보
				//getImage(studentId);//해당 학생의 이미지 첨부 파일
				getImage(studentId, function(){ 
					console.log("버튼 가리기");
					$(".imgCloseBtn").hide();//검색해서 나온 첨부파일은 삭제 버튼 가리기
				});
				
				
				studentDisable();//수정 버튼을 눌렀을 때만 수정 가능하게 입력 막기
			});
			
			//학생 정보 출력
			function getStudent(studentId){
				StudentService.getSearchList({s_id : studentId},
					function(data){
						$("#s_name").val(data.s_name);
						$("#s_id").val(data.s_id);
						$("#s_school").val(data.s_school);
						$("#s_grade").val(data.s_grade);
						$("#s_birth").val(data.s_birth);
						$("#s_phone").val(data.s_phone);
						$("#s_family").val(data.s_family);
						$("#s_relation").val(data.s_relation);
						$("#s_family_phone1").val(data.s_family_phone1);
						$("#s_family_phone2").val(data.s_family_phone2);
						$("#s_sibling").val(data.s_sibling);
						$("#reg_date").val(data.reg_date);
						$("#first_date").val(data.first_date);
						$("#s_memo").val(data.s_memo);
						//getImage(s_id);//첨부파일
						//$("#s_filename").val(data.s_filename);
						
						if(data.s_gender == "남자") {
							//console.log(data.s_gender);
							$("#s_gender_m").prop('disabled', false).prop('checked', true);
							$("#s_gender_f").prop('disabled', true);
						} else if(data.s_gender == "여자") {
							//console.log(data.s_gender);
							$("#s_gender_f").prop('disabled', false).prop('checked', true);
							$("#s_gender_m").prop('disabled', true);
						}
						
						//nowSid = data.s_id;//취소 버튼 되돌리기, 삭제, 수정용 s_id, 통학정보 수정용
						//studentId = data.s_id;//취소 버튼 되돌리기, 삭제, 수정용 s_id, 통학정보 수정용
				});
				//학생 정보 출력 후 수정 막기 - 출력된 학생 정보를 수정하려면 수정 버튼을 눌러야 함
				studentForm.find("input").prop('readonly', true);
			}
			
			
				
			//============== 학생 정보 수정 ===============
			let addBtn = $(".s_add_Btn");
			let modifyBtn = $(".s_modify_Btn");
			let delBtn = $(".s_del_Btn");
			let saveBtn = $(".s_save_Btn");
			let cancelBtn = $(".s_cancel_Btn");
			//let initBtn = $(".s_init_Btn");
			//취소 버튼이랑 초기화 버튼 통합
			
			//추가 버튼
			//- 추가 버튼을 누르면 보던 학생 정보가 사라지면서 입력 할 수 있도록 변경
			//- 내용 작성중 취소 버튼을 누르면 보던 학생 정보 다시 보여줌
			addBtn.on("click", function() {
				//초기화 - 입력 할 수 있도록 보던 정보 비우고 readonly 제거
				studentInit();
				studentEdit();
				
				//버튼
				btnShow2();
				
				//DB에 저장은 여기가 아니라 입력 후 저장 버튼을 누르면 한다.
				nowBtn = addBtn;
				//console.log("nowBtn : "+ nowBtn.html());
			});
			
			//학생 정보 등록
			function setStudent(callback){ 
				//callback : 이 작업이 끝나고 성공 판단 후 다른 메서드(버튼 토글)를 실행하기 위해 넣음
				
				//console.log(clickBtn);
				//필수 입력 정보 확인
				if($("#s_name").val() == ""){
					alert("이름은 필수 입력 항목입니다.");
					return;
				}			
				
				//입력할 데이터
				let student = {
					s_name : $("#s_name").val(),
					s_school : $("#s_school").val(),
					s_grade : $("#s_grade").val(),
					s_birth : $("#s_birth").val(),
					s_gender : $("input[name='s_gender']:checked").next().text(),
					s_phone : $("#s_phone").val(),
					s_family : $("#s_family").val(),
					s_relation : $("#s_relation").val(),
					s_family_phone1 : $("#s_family_phone1").val(),
					s_family_phone2 : $("#s_family_phone2").val(),
					s_sibling : $("#s_sibling").val(),
					reg_date : $("#reg_date").val(),
					first_date : $("#first_date").val(),
					s_memo : $("#s_memo").val(),
					attachImg : sendImgData()
				}
				
				StudentService.insertStudent(student, function(result){
					//if(result == "success") {
					if(result > 0) {
						alert("success");
						//console.log("jsp : "+result);
						callback(result);
					}
				});
			}
	
			//수정 버튼
			modifyBtn.on("click", function() {
				//저장을 누르면 nowSid로 추가, 수정, 삭제 버튼 보임
				btnShow2();
				
				//수정 버튼을 누르면 보고있던 데이터가 수정가능하게 바뀌어야함
				studentEdit();
				nowBtn = modifyBtn;
			});
			//학생 정보 수정 - 어떻게 위에거랑 합치지?? 못합치나...?
			function upStudent(callback){ 
				
				//필수 입력 정보 확인
				if($("#s_name").val() == ""){
					alert("이름은 필수 입력 항목입니다.");
					return;
				}			
				
				//입력할 데이터
				let student = {
					s_id : $("#s_id").val(),
					s_name : $("#s_name").val(),
					s_school : $("#s_school").val(),
					s_grade : $("#s_grade").val(),
					s_birth : $("#s_birth").val(),
					s_gender : $("input[name='s_gender']:checked").next().text(),
					s_phone : $("#s_phone").val(),
					s_family : $("#s_family").val(),
					s_relation : $("#s_relation").val(),
					s_family_phone1 : $("#s_family_phone1").val(),
					s_family_phone2 : $("#s_family_phone2").val(),
					s_sibling : $("#s_sibling").val(),
					reg_date : $("#reg_date").val(),
					first_date : $("#first_date").val(),
					s_memo : $("#s_memo").val(),
					attachImg : sendImgData()
				}
				StudentService.updateStudent(student, function(result){
					if(result == "success") {
						alert(result);
						callback();
					}
				});
			}
			
			
			//삭제 버튼
			delBtn.on("click", function() {
				
				//학생 정보 삭제
				if(studentId == "") {
					alert("삭제할 데이터가 없습니다.");
					return;
				}else {
					delStudent(studentId, function() {
						studentInit();
						btnShow3();
						studentId == "";
					});
					delCommute(studentId);//통학 정보 삭제
				}
				
			});
			
			//학생 정보 삭제
			function delStudent(studentId, callback){
					console.log("삭제할 번호 : "+studentId);
				StudentService.deleteStudent(studentId, function(result) {
					if(result == "success"){
						alert("학생 정보 삭제 성공");
						callback();
					}
				});
			}
			
			//저장 버튼
			saveBtn.on("click", function() {
				//초기 -> 저장, 추가 -> 저장 = 새 데이터 추가
				if((studentId == "" && nowBtn == "") || nowBtn == addBtn) {
					//btnTogle($(this));
					btnShow2();
					//학생 정보 저장
					setStudent(function(callback) {
						setCommute(callback); //통학
						//저장하고 지워줘야 계속 입력할 수 있다.
						studentInit();
						studentEdit();
						//추가 후 저장하고 나서 또 다른 추가 없이 취소를 누르면 이전 정보가 보이면 안된다.
						studentId = "";
						
					});
				}else if(nowBtn == modifyBtn) {
					//수정 -> 저장
					//수정 버튼을 누른 다음 저장을 누르면 추가, 수정, 삭제 버튼이 보임 
					btnShow3();
					
					//학생 정보 수정
					upCommute(studentId); //통학
					upStudent(function() {
						//수정한 데이터 불러와서 보여주기
						//getStudent(nowSid);
						getStudent(studentId);
						//다시 수정 불가능하게 수정
						studentDisable();
						$(".imgCloseBtn").hide();
					});
				}
				
				
			});
			
			//취소 버튼
			cancelBtn.on("click", function() {			
				//첫 화면일땐 그냥 지우기만 해야 한다.
				//if(nowSid == "") {
				if(studentId == "") {
					//console.log("이전에 보던 데이터 없음");
					studentInit();
					studentEdit();
				}else {
					//취소하면 보던걸 다시 보여줘야 함
					getStudent(studentId);
					getCommute(studentId);
					btnShow3();
					studentDisable();
					getImage(studentId, function(){ 
						$(".imgCloseBtn").hide();
					});
				}
				
			});
			
			//버튼 show, hide	
			function btnShow2(){
				saveBtn.show();
				cancelBtn.show();
				
				addBtn.hide();
				modifyBtn.hide();
				delBtn.hide();
			}
			function btnShow3(){
				saveBtn.hide();
				cancelBtn.hide();
				
				addBtn.show();
				modifyBtn.show();
				delBtn.show();
			}
			
			//데이터 비우기
			function studentInit() {
				//입력 취소시 입력했던 파일 정보 비우기
				studentImg.find("#s_filename").val('');
				
				//input - readonly 제거, value 값 삭제
				studentForm.find("input").val(''); //학생 정보 비우기
				studentForm.find("input[type='radio']").prop('checked', false);
				$("#s_memo").val(''); 
				
				$("#commuteInfo").find("input").val(''); //통학 정보 비우기
				showNoImage();//첨부파일 초기화
			}
			
			//입력 가능 변경 - 학생 정보 입력창 데이터 삭제 후 입력 가능하게 변경
			function studentEdit() {
				studentImg.show();	
				//$(".imgCloseBtn").show();
				
				studentForm.find("input:not('#s_id, .file-upload-info')").prop('readonly', false);
				studentForm.find("input[type='radio']").prop('disabled', false);
				$("#s_memo").prop('readonly', false); 
				
				$("#commuteInfo").find("input").prop('readonly', false);
				
			}
			
			//입력 불가 변경 - 저장, 취소 완료 후 원래 데이터가 보여질 때 입력 불가능하게 변경
			function studentDisable() {
				//이미지 첨부 가려서 첨부 못하게 하기
				studentImg.hide();
				
				studentForm.find("input:not('#s_id')").prop('readonly', true);
				studentForm.find("input[type='radio']").prop('disabled', true);
				$("#s_memo").prop('readonly', true); 
				
				$("#commuteInfo").find("input").prop('readonly', true);
				
			}
			
			//============== 학생 사진 업로드 ===============
			function sendImgData() { //저장 버튼을 눌렀을 때 실행할 함수
				
				let upImgData = $(".upload_img");
			
				if(upImgData.length > 0){//= 첨부할 파일이 있으면
					let formData = {				
					    fileName:upImgData.data("filename"),
					    uuid:upImgData.data("uuid"),
					    uploadPath:upImgData.data("path"),
					    fileType:upImgData.data("type")
					}
					console.log("첨부파일 등록");
				    return formData;
				}
					console.log("첨부파일 없음");
			}
			
			let regex = new RegExp("(.*?)\.(jpg|jpeg|gif|png)$");
			let maxSize = 5242880; //5MB
			let uploadResult = $(".uploadResult ul");
			
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
				//파일 업로드 전 제약 조건 확인
				if(!checkExtenstion(files[0].name, files[0].size)) {
					return false;
				}else {
					$(".file-upload-info").val(files[0].name);
					formData.append("uploadFile", files[0]);
				}
				
				//데이터 전송을 위한 Ajax 설정
				$.ajax({
					url:'/uploadAjaxAction',
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
				$(".s_ico").hide();
				let uploadBox = $(".img_box");
				console.log("data-type : "+$(".upload_img").data("image"));
				$(".upload_img").remove();//하나만 첨부 가능하니까 새로 첨부하면 삭제
				//showNoImage();
				
				let str = "";
				
				let fileCallPath = encodeURIComponent(result.uploadPath+"/s_"+result.uuid+"_"+result.fileName);														
				console.log("첨부한 파일의 image : ");
				console.log(result.image);
				str += "<div class='upload_img' data-path='"+result.uploadPath+"' data-uuid='"+result.uuid+"' ";
				str += "data-filename='"+result.fileName+"' data-type='"+result.image+"'>";
				str += "<button type='button' class='imgCloseBtn' data-file='"+fileCallPath+"' data-type='image' ";
				str += "class='btn btn-warning btn-circle'>";
				str += "<i class='mdi mdi-close-box'></i></button><br>";
				str += "<img class='img-fluid' src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";

				$(".s_ico").hide();//이미지 없음 아이콘 숨기기
				uploadBox.append(str);
			};
			
			//첨부파일 변경 처리를 위한 버튼 이벤트
			$(".img_box").on("click","button",function(e){
				let targetFile = $(this).data("file");
				let type = $(this).data("type");
			console.log("딜리트 파일 실행");
				$.ajax({
					url: '/deleteFile',
					data: {fileName: targetFile, type: type},
					dataType: 'text',
					type: 'POST',
					success: function(result){
						alert(result);
						showNoImage();
					}
				});
				
			});
			
			//첨부된 파일 보여주기
			//첨부파일 작업
			function getImage(s_id, callback) {
				$.getJSON('/studentRest/getAttachImg', {s_id:s_id}, function(result){
					/* //출력할 내용이 없으면 더이상 진행하지 않음
					if(result == null){
						console.log("가져온 첨부파일 있는지 확인");					
						console.log(result);					
						showNoImage();//출력할 내용이 없으면 기본이미지를 보여줘야함 
						return;
					} */
					//console.log("돌려받은 결과");
					//console.log(result);
					$(".s_ico").hide();
					let uploadBox = $(".img_box");
					//console.log("기존 정보를 보고 있다가 다른 정보 검색해서 봄");
					$(".upload_img").remove();//다른 정보를 보고 있다가 새 데이터를 가져오면 기존거 삭제
					let str = "";
										
					let fileCallPath = encodeURIComponent(result.uploadPath+"/s_"+result.uuid+"_"+result.fileName);														
					//console.log("수상한 콘솔");
					//console.log(result.fileType);
					str += "<div class='upload_img' data-path='"+result.uploadPath+"' data-uuid='"+result.uuid+"' ";
					//str += "data-filename='"+result.fileName+"' data-type='"+result.image+"'>"; ImageAttachFileDTO가 아니라 ImageAttachVO를 반환하기 때문에 result.image가 없다.
					str += "data-filename='"+result.fileName+"' data-type='"+(result.fileType == 'image'? true:result.fileType)+"'>";
					str += "<button type='button' class='imgCloseBtn' data-file='"+fileCallPath+"' data-type='image' ";
					str += "class='btn btn-warning btn-circle'>";
					str += "<i class='mdi mdi-close-box'></i></button><br>";
					str += "<img class='img-fluid' src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";

					uploadBox.append(str);
					callback();
				}).fail(function(xhr, status, err){
					if(callback){ 
						//callback(null);
						//출력할 내용이 없으면 더이상 진행하지 않음
						//console.log("가져온 첨부파일 없음!");					
						showNoImage();//출력할 내용이 없으면 기본이미지를 보여줘야함 
					}
				});
			};
			
			
			//삭제 버튼 처리 - 화면에서 삭제. 실제 파일 삭제는 아님
			$(".uploadResult").on("click", "button", function(e) {
				if(confirm("remove this file?")) {
					showNoImage();
				}
			});
			
			function showNoImage(){
				$(".s_ico").show();
				$(".upload_img").remove();
				$(".file-upload-info").val("");
			}
					
			
			
			
			
			
			
			//============== 학생 통학 정보 ===============
			//통학 정보 출력
			function getCommute(studentId){
				StudentService.getCommute({s_id : studentId},
					function(data){
						if(data == null) {
							$("#commuteInfo").find("input").val('');
							//return;
						}else {
							$("#zip_code").val(data.zip_code);
							$("#address1").val(data.address1);
							$("#address2").val(data.address2);
							$("#location").val(data.location);
						}
					}
				);
			};
			
			//통학 정보 추가
			function setCommute(studentId){ 
				//console.log('studentId : '+studentId);
				let commute = {
					s_id :studentId,
					zip_code : $("#zip_code").val(),
					address1 : $("#address1").val(),
					address2 : $("#address2").val(),
					location : $("#location").val()
				}

				console.log("다 비어있음");
				//s_id 외에 모두 비어 있으면 DB에 저장하지 않고 값이 하나라도 있을 때 저장
				if(!(zip_code == null && address1 == null && address2 == null && location == null)) {
					console.log("다 비어있음");
					StudentService.insertCommute(commute, function(result){
						if(result == "success") {
							alert("통학정보 추가 성공");
						}
					});
				}
				
			}
			
			//통학 정보 수정
			//function upCommute(nowSid){ //nowSid : 수정할 c_id
			function upCommute(studentId){ //nowSid : 수정할 c_id
				console.log("studentId : "+studentId);
				//입력할 데이터
				let student = {
					//s_id : nowSid, //update 위치 파악용
					s_id : studentId, //update 위치 파악용
					zip_code : $("#zip_code").val(),
					address1 : $("#address1").val(),
					address2 : $("#address2").val(),
					location : $("#location").val()
				}
				if(!(zip_code == null && address1 == null && address2 == null && location == null)) {
					StudentService.updateCommute(student, function(result){
						if(result == "success") {
							alert("통학 정보 수정 성공");
						}
					});
				}
			}
			
			//통학 정보 삭제
			//function delCommute(nowSid){
				//StudentService.deleteCommute(nowSid, function(result) {
			function delCommute(studentId){
				console.log("삭제할 아이디 : "+studentId);	
				
				let commute = {
					s_id :studentId,
					zip_code : $("#zip_code").val(),
					address1 : $("#address1").val(),
					address2 : $("#address2").val(),
					location : $("#location").val()
				}

				if(!(zip_code == null && address1 == null && address2 == null && location == null)) {
					StudentService.deleteCommute(studentId, function(result) {
						if(result == "success"){
							alert("통학 정보 삭제 성공");
						}
					});
				}
				
				
				
			}
			
			
			<!-- ============== 학급 정보 =============== -->	
			//학생 검색시 현재 월 학급 정보 출력
			//학생 id로 학급 정보를 모두 가져오고 처음 보여줄 때는 현재 년도, 월의 정보만 보여주기
			//다른 년도, 월을 조회하면 그 때 그에 해당하는 정보로 교체
			
			//일단 검색한 학생 id에 해당하는 모든 학급 정보 가져오기
			//let classInfo;
			/* function getClass(studentId){
				StudentService.getClassInfoList(studentId,function(classInfoList){
					$("#classInfo tbody").children().remove(); //비우고 넣기				
	
					classInfoList.forEach(function(item){
						//console.log(item);
						showClass(item);
					});
					
				});
			};
			//가져온 학급 정보를 화면에 출력
			function showClass(classInfo){
				let str;
				str += "<tr>";
				str += "<td>";
				str += "<input type='checkbox' class='checkThis'>";
				str += "</td>";
				str += "<td>"+classInfo.c_class+"</td>";
				str += "<td>"+classInfo.s_list+"</td>";
				str += "<td>"+classInfo.t_name+"</td>";
				str += "<td>"+classInfo.classroom+"</td>";
				str += "<td>"+classInfo.c_startdate+"</td>";
				str += "<td>"+classInfo.c_enddate+"</td>";
				str += "<td>"+classInfo.s_status+"</td>";
				str += "</tr>";
				
				$("#classInfo").append(str);
			}
	
			//학급 정보 데이터 추가 버튼
			//추가 버튼을 누르면 이미 있는 학급 정보에서 골라서 선택하면 해당 학생이 그 학급 정보에 추가된다.
			
			
			
			//학급 정보 월별 조회 출력
			let today = new Date();
			let year = today.getFullYear();
			let month = today.getMonth()+1;
			let day = today.getDate();
			console.log(year+"-"+month+"-"+day);
			
			//셀렉트 선택시 첫번째 꺼 선택 해제	
			//document.getElementById("monthSelect").options[0].removeAttribute("selected");	
			 */
	
				
		});
		
	</script>
    
    
  </body>
</html>