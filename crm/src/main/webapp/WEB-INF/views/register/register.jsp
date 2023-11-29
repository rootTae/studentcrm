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
          
          
          <!-- 여기에 내용 코드 입력 - 이 페이지를 복사해서 사용하세요 -->
          <div class="page-header">
              <h3 class="page-title">수강 신청</h3>
            </div>
            
	        <div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">수업 검색</h4>
                    <div class="table-responsive">
                     <div class="col-md-4 ml-auto text-right">
				    <button type="button" class="btn btn-primary mb-2" id="search">검색</button>
				    <button type="button" class="btn btn-info mb-2" id="cancel">취소</button>
				    </div>                	
                      <table class="table" id="ClassTable">
                        <thead>
                          <tr>
                            <th>수업 명</th>
                            <th>강사 이름</th>
		                    <th>강의실</th>
		                    <th>수업 시간</th>
		                    <th>수업 시작일</th>
		                    <th>수업 종료일</th> 
                          </tr>
                        </thead>
                        <tbody class="class_List">
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            
       		<div class="row">
         		<div class="col-5 grid-margin stretch-card">
            		<div class="card">
           				<div class="card-body">
           					<h4 class="card-title">학생 정보 검색</h4>
			                  <p class="card-description">학생의 이름 입력해 주세요.</p>
			                  <form id="searchForm" method="post" class="form-inline">
				                  <input type="text" class="form-control mb-2 mr-sm-2" name="searchS_name" id="searchS_nam" required placeholder="학생이름">
				                  <button type="submit" class="btn btn-primary mb-2" >검색</button>
                  			  </form>
                		</div>
              		</div>
            	</div>
	          
	          
              <div class="col-7 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">학생 검색 결과</h4>
                    <div class="table-responsive">
                      <table class="table" id="studentTable">
                        <thead>
                          <tr>
                            <th>                         
                            </th>
                            <th>학생 번호</th>
		                    <th>학생 이름</th>
		                    <th>성별</th>
		                    <th>전화번호</th>
		                    <th>학교</th>
		                    <th>학년</th>
                          </tr>
                        </thead>
                        <tbody class="studentList">
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
                        
             <div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">수강 신청 리스트</h4>
                    <div class="table-responsive">
                     <div class="col-md-4 ml-auto text-right">
	                    <button type="button" class="insertbtn btn btn-primary" style="display: none">추가</button>
				        <button type="button" class="updatebtn btn btn-secondary" style="display: none">수정</button>
				        <button type="button" class="deletebtn btn btn-info" style="display: none">삭제</button>
				        <button type="button" class="savebtn btn btn-primary" style="display: none">저장</button>
				        <button type="button" class="cancelbtn btn btn-info" style="display: none">취소</button>
				    </div>
                      <table class="table" id="registerTable">
                        <thead>
                          <tr>
                            <th> 
                                                      
                            </th>
                            <th hidden>수강신청 관리 번호</th>
                            <th>학생 번호</th>
		                    <th>학생 이름</th>
		                    <th>수업 명</th>
		                    <th>담당 강사</th>
		                    <th>강의실</th>
		                    <th>수업 시간</th>
		                    <th>수업 시작일</th>
		                    <th>수업 종료일</th>
                          </tr>
                        </thead>
                        <tbody class="RegisterList" id="RegisterList">
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
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
    
    
    <!-- 여기에 스크립트 입력 -->
    <script type="text/javascript" src="/js/demo/grades.js"></script>
    <script type="text/javascript" src="/js/register.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
        //지금 데이터 저장
        let nowsid="";
        let nowsname="";

        var registerList = $('.RegisterList');
        // 버튼 설정
        let addbtn = $(".insertbtn");
        let updatebtn = $(".updatebtn");
        let deletebtn = $(".deletebtn");
        let savebtn = $(".savebtn");
        let cancelbtn = $(".cancelbtn");
       
        nowbtn='';
       //수업 검색  
        $('#search').on('click', function(event){      
        	event.preventDefault();
        	
            RegisterService.getClassList(function(list){
            	
            	var class_List = $('.class_List');
            	class_List.empty();
            		
            	list.forEach(function(class_){
                 	var str = '<tr>' +  
                         '<td><input type="text" class="class_name form-control" name="class_name" readonly value="'+ class_.class_name +'"></td>' +
                         '<td><input type="text" class="t_name form-control" name="t_name" readonly value="'+ class_.t_name +'"></td>' +
                         '<td><input type="text" class="classroom form-control" name="classroom"  readonly value="'+ class_.classroom +'"></td>' +
                         '<td><input type="text" class="c_period form-control" name="c_period" readonly value="'+ class_.c_period +'"></td>' +
                         '<td><input type="text" class="c_startdate form-control" name="c_startdate" readonly value="'+ class_.c_startdate +'"></td>' +
                         '<td><input type="text" class="c_enddate form-control" name="c_enddate" readonly value="'+ class_.c_enddate + '"></td>' +
                         '</tr>';        
                      class_List.append(str);
                 });
            });
        });
		
       	// 반 검색 취소 
        $('#cancel').on('click',function(event){
        	var class_List = $('.class_List');
        	class_List.empty();				
        });

     // 학생 이름 검색 
        $('#searchForm').submit(function(event){
            event.preventDefault();
            var s_nameValue = $('#searchS_nam').val();

            getStudent(s_nameValue);
        });

     	//학생 리스트 
        function getStudent(s_nameValue) {
            GradesService.getStudentList({ s_name: s_nameValue }, function(student) {
                var studentList = $('.studentList');
                studentList.empty();

                student.forEach(function(student) {
                	var str = '<tr>' +
                    '<td><div class="form-check form-check-muted m-0">'+
                    '<label class="form-check-label"><input type="checkbox" class="form-check-input s_checkbox">'+
                    '<i class="input-helper"></i></label></div></td>'+  
                        '<td><input type="text" class="is_s_id form-control" name="is_s_id" readonly value="'+ student.s_id +'"></td>' +
                        '<td><input type="text" class="is_s_name form-control" name="is_s_name"  readonly value="'+ student.s_name +'"></td>' +
                        '<td><input type="text" class="is_s_gender form-control" name="is_s_gender"  readonly value="'+ student.s_gender +'"></td>' +
                        '<td><input type="text" class="is_s_phone form-control" name="is_s_phone" readonly value="'+ student.s_phone +'"></td>' +
                        '<td><input type="text" class="is_s_school form-control" name="is_s_school" readonly value="'+ student.s_school +'"></td>' +
                        '<td><input type="text" class="is_s_grade form-control" name="is_s_grade" readonly value="'+ student.s_grade + '"></td>' +
                        '</tr>';        
                    studentList.append(str);
                });
            });
        } 	
       	

      //학생정보 체크박스 체크  (학생점수 리스트)
        $(document).on('click', '.s_checkbox', function() {
        		$(".s_checkbox").prop('checked', false);			
    		   // 현재 클릭한 체크박스만 선택       	
    		 	 $(this).prop('checked', true);
    		   
    		 	var registerList = $('.RegisterList');
    		 	registerList.empty();
                
                let checkedCheckbox = $('.s_checkbox:checked');
    		  
                if (checkedCheckbox) {                	
                    var s_id = checkedCheckbox.closest("tr").find("input.is_s_id").val();
                    var s_name = checkedCheckbox.closest("tr").find("input.is_s_name").val();
                    getRegister(s_id);
                    
                    nowsid=s_id;
                    nowsname=s_name;
                    
                    btnShow3();                    	                   
                }               
        });

      
      /// 수강신청 리스트 가져오기
        function getRegister(s_id) {
            registerList.empty();
            
            // s_id가 어디서 왔는지 확인해야 합니다.
            RegisterService.getRegistertList(s_id, function (registers) {
                // 데이터를 받아오는데 성공한 경우에만 아래 코드 실행
                if (registers && registers.length > 0) {
                    registers.forEach(function (register) {
                        var str = '<tr>' +
                            '<td><div class="form-check form-check-muted m-0">' +
                            '<label class="form-check-label"><input type="checkbox" class="form-check-input R_checkbox">' +
                            '<i class="input-helper"></i></label></div></td>' +
                            '<td hidden><input type="text" class="R_r_id" name="R_r_id" value="' + register.r_id + '" readonly></td>' + // 수정된 부분
                            '<td ><input type="text" class="R_s_id form-control" name="R_s_id" readonly value="' + register.s_id + '"> </td>' +
                            '<td><input type="text" class="R_s_name form-control" name="R_s_name" readonly value="' + register.s_name + '"></td>' +
                            '<td><input type="text" class="R_class_name form-control" name="R_class_name" readonly value="' + register.class_name + '"></td>' +
                            '<td><input type="text" class="R_t_name form-control" name="R_t_name" readonly value="' + register.t_name + '"></td>' +
                            '<td><input type="text" class="R_classroom form-control" name="R_classroom" readonly value="' + register.classroom + '"></td>' +
                            '<td><input type="text" class="R_c_period form-control" name="R_c_period" readonly value="' + register.c_period + '"></td>' +
                            '<td><input type="text" class="R_c_startdate form-control" name="R_c_startdate" readonly value="' + register.c_startdate + '"></td>' +
                            '<td><input type="text" class="R_c_enddate form-control" name="R_c_enddate" readonly value="' + register.c_enddate + '"></td>' +
                            '</tr>';
                        registerList.append(str);
                    });
                } else {
                    // 데이터가 없을 경우 처리 (에러 메시지 출력 등)
                    console.log("No score data available");
                    alert("데이터가 없습니다.");
                }
            });
        }

        //수강신청 버튼 (추가버튼 클릭)
  	  $(".insertbtn").on('click', function() {
    		if ($('.s_checkbox:checked').length > 0) {
  	    
  		   let register ={
  				s_id : nowsid,
  				s_name : nowsname			   
  		   }
    		addRegister(register);
  			btnShow2();        
  	        nowbtn = addbtn;     
  		 }  
       });
  
      
  	  // 입력칸 생성.
	     function addRegister(register) {
	     
	    	  var str = '<tr>' +
              '<td><div class="form-check form-check-muted m-0">' +
              '<label class="form-check-label"><input type="checkbox" class="form-check-input R_checkbox">' +
              '<i class="input-helper"></i></label></div></td>' +
              '<td hidden><input type="text" class="add_r_id" name="add_r_id" id="add_r_id" readonly></td>' + // 수정된 부분
              '<td><input type="text" class="add_s_id form-control" name="add_s_id" id="add_s_id" readonly value="' + register.s_id + '"> </td>' +
              '<td><input type="text" class="add_s_name form-control" name="add_s_name" id="add_s_name" readonly value="' + register.s_name + '"></td>' +
              '<td><input type="text" class="add_class_name form-control" name="add_class_name" id="add_class_name" placeholder="수업을 입력하세요."></td>' +
              '<td hidden><input type="text" class="add_t_name form-control" name="add_t_name" id="add_t_name" readonly></td>' +
              '<td hidden><input type="text" class="add_classroom form-control" name="add_classroom" id="add_classroom" readonly></td>' +
              '<td hidden><input type="text" class="add_c_period form-control" name="add_c_period" id="add_c_period" readonly ></td>' +
              '<td hidden><input type="text" class="add_c_startdate form-control" name="add_c_startdate" id="add_c_startdate" readonly"></td>' +
              '<td hidden><input type="text" class="add_c_enddate form-control" name="add_c_enddate"  id="add_c_enddate" readonly></td>' +
              '</tr>';
          	  registerList.append(str);            
	     }
  	  
	        //수강신청 반 입력
	        function setRegister(callback){
	            
	            let data= {               
	                s_id : $("#add_s_id").val(),
	                class_name : $("#add_class_name").val()                
	            }  
	            
	            RegisterService.Rregister(data, function(result){                   
	                console.log("jsp : " + result);
	                callback(result);                      
	            }); 	            
	        }
  	  
  	  
	     // 점수리스트저장 버튼
	        savebtn.on("click", function(){
	            //성적 입력 저장
	        	if(nowbtn == addbtn){	      
	        		setRegister(function (callback) {            	
	                s_id = $("#add_s_id").val();
	                getRegister(s_id);
	                btnShow3();    
	                });	               
	            } else if (nowbtn == updatebtn) {
	                upRegister(function () {
	                    btnShow3();
	                    s_id = $(".R_s_id").val();
	                    getRegister(s_id);
	                });
	            }
	            
	        });
	     	     
	 		   //수정 버튼 
	 		updatebtn.on("click", function () {
	 			if ($('.R_checkbox:checked').length > 0) {
	 			btnShow2();
	 			registerEdit();
	            nowbtn = updatebtn; 
	            alert("수업을 변경하세요.");	
	 			}else{
	 				alert("체크박스를 선택하세요.");
	 			}
	        });
  	  
  	   	  
	        //성적 수정    
	        function upRegister(callback) {
	        	
	    	   let data = {
	            	r_id : $(".R_r_id").val(),
	            	s_id : $(".R_s_id").val(),
		            class_name : $(".R_class_name").val() 	          	
	            }    	   
	    	   
	    	   RegisterService.registerModify(data, function (result) {
	                if (result == "success") {
	                    alert(result);
	                    callback();
	                }
	            });
	        }  
	        
	        
	    	// 시험 취소
	    	cancelbtn.on("click", function () {

	    	    if (nowbtn == addbtn) {
	    	    	registerList.empty();	    	       
	    	    	var s_id = nowsid;
	    	    	
                    getRegister(s_id);
	    	        btnShow3();
	    	    } else {
					var s_id = nowsid;	    	
                    getRegister(s_id);
	    	        btnShow3();
	    	    }
	    	});
 
	    	  deletebtn.on('click', function () {
	              var checkedCheckbox = $('.R_checkbox:checked');
	              if (checkedCheckbox.length > 0) {
	                  
	            	  var r_id = checkedCheckbox.closest("tr").find("input.R_r_id").val();
	                  var s_id = checkedCheckbox.closest("tr").find("input.R_s_id").val();
	                  
	                  RegisterService.registerRemove(r_id, function () {              	 
	                	  	getRegister(s_id);
	                  });
	              }
	          });
	    	

      
        // 버튼 show, hide
        function btnShow2(){
            savebtn.show();
            cancelbtn.show();
            
            addbtn.hide();
            updatebtn.hide();
            deletebtn.hide();
        }
        
        function btnShow3(){
            savebtn.hide();
            cancelbtn.hide();
            
            addbtn.show();
            updatebtn.show();
            deletebtn.show();
        }
        
        
        function registerEdit() {
        	if($('.R_checkbox:checked')){
        		$('.R_checkbox:checked').closest("tr").find("input:not('.R_s_id, .R_s_name')").prop('readonly', false);
        		$('.R_checkbox:checked').closest("tr").find("input:not('.R_s_id, .R_s_name, .R_class_name')").hide();
        	}
        	
        }    
      
        //체크 박스 클릭 이벤트
        $(document).on('click', '.R_checkbox', function() { 	
        	$(".R_checkbox").prop('checked', false);			
 		   // 현재 클릭한 체크박스만 선택       	
 		  $(this).prop('checked', true);	   
        });
        
    }); 
    </script>
  </body>
</html>