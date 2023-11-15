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
              <h3 class="page-title">학생 성적 관리</h3>
            </div>
            
	          <div class="row">
         		<div class="col-5 grid-margin stretch-card">
            		<div class="card">
           				<div class="card-body">
           					<h4 class="card-title">시험 정보 검색</h4>
			                  <p class="card-description">시험명을 입력해 주세요.</p>
			                  <form id="examsearchForm" method="post" class="form-inline">
				                  <input type="text" class="form-control mb-2 mr-sm-2" id="e_name" name="e_name" required placeholder="시험명">
				                  <button type="button" class="btn btn-primary mb-2" >검색</button>
                  			  </form>
                		</div>
              		</div>
            	</div>


              <div class="col-7 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">시험 검색 결과</h4>
                    <div class="table-responsive">
	                    <button type="button" class="inserExamtbtn" >추가</button>
			        	<button type="button" class="updateExambtn" style="display: none">수정</button>
			        	<button type="button" class="deleteExambtn" style="display: none">삭제</button>
			        	<button type="button" class="saveExambtn" style="display: none">저장</button>
			        	<button type="button" class="cancelExambtn" style="display: none">취소</button>
                      <table class="table" id="examTable">
                        <thead>
                          <tr>
                            <th>
              
                            </th>
                            <th>시험 번호</th>
                            <th>시험명</th>
		                    <th>학년</th>
		                    <th>시험 날짜</th> 
                          </tr>
                        </thead>
                        <tbody class="exam_List">
                          
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
				                  <input type="text" class="form-control mb-2 mr-sm-2" name="s_name" id="s_name" required placeholder="학생이름">
				                  <button type="submit" class="btn btn-primary mb-2" >검색</button>
                  			  </form>
                		</div>
              		</div>
            	</div>
	          
	          
              <div class="col-7 grid-margin">
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
            
            
             <div class="row ">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">시험 점수 결과</h4>
                    <div class="table-responsive">
	                    <button type="button" class="insertbtn" style="display: none">추가</button>
				        <button type="button" class="updatebtn" style="display: none">수정</button>
				        <button type="button" class="deletebtn" style="display: none">삭제</button>
				        <button type="button" class="savebtn" style="display: none">저장</button>
				        <button type="button" class="cancelbtn" style="display: none">취소</button>
                      <table class="table" id="scoreTable">
                        <thead>
                          <tr>
                            <th> 
                                                      
                            </th>
                            <th>학생 번호</th>
		                    <th>학생 이름</th>
		                    <th>시험 명</th>
		                    <th>시험 날짜</th>
		                    <th>국어</th>
		                    <th>영어</th>
		                    <th>수학</th>
		                    <th>평균</th>
                          </tr>
                        </thead>
                        <tbody class="scoreList">
                          
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
    <script type="text/javascript">
    $(document).ready(function(){
    	let e_idvalue="";
        let scoredata = "";
        let escore = $(".escore");
        let exams = "";
        
        let nowename="";
        let noweid="";
        let nowsid="";
        let nowsname="";
        
        // 버튼 설정
        let addbtn = $(".insertbtn");
        let updatebtn = $(".updatebtn");
        let deletebtn = $(".deletebtn");
        let savebtn = $(".savebtn");
        let cancelbtn = $(".cancelbtn");
        
        let inserExamtbtn = $(".inserExamtbtn");
        let updateExambtn = $(".updateExambtn");
        let deleteExambtn = $(".deleteExambtn");
        let saveExambtn = $(".saveExambtn");
        let cancelExambtn = $(".cancelExambtn");   
        
     // 학생 이름 검색 
        $('#searchForm').submit(function(event){
            event.preventDefault();
            var s_nameValue = $('#s_name').val();
            console.log(s_nameValue);

            getStudent(s_nameValue);
        });

     	//학생 리스트 
        function getStudent(s_nameValue) {
            GradesService.getStudentList({ s_name: s_nameValue }, function(student) {
                console.log(student);
                var studentList = $('.studentList');
                studentList.empty();

                student.forEach(function(student) {
                	var str = '<tr>' +
                    '<td><div class="form-check form-check-muted m-0">'+
                    '<label class="form-check-label"><input type="checkbox" class="form-check-input s_checkbox">'+
                    '<i class="input-helper"></i></label></div></td>'+  
                        '<td><input type="text" name="s_id" id="s_id" readonly value="'+ student.s_id +'"></td>' +
                        '<td><input type="text" name="s_name"  id="s_name"  readonly value="'+ student.s_name +'"></td>' +
                        '<td><input type="text" name="s_gender" id="s_gender"  readonly value="'+ student.s_gender +'"></td>' +
                        '<td><input type="text" name="s_phone"  id="s_phone" readonly value="'+ student.s_phone +'"></td>' +
                        '<td><input type="text" name="s_school" id ="s_school" readonly value="'+ student.s_school +'"></td>' +
                        '<td><input type="text" name="s_grade" readonly value="'+ student.s_grade + '"></td>' +
                        '</tr>';        
                    studentList.append(str);
                });
            });
        }


        
        //학생정보 체크박스 체크 시 
        $(".studentList").on('click', '.s_checkbox', function(e) {
            let checkedCheckbox = $('.s_checkbox:checked');

            if (checkedCheckbox.length > 0) {
                var s_id = checkedCheckbox.closest("tr").find("input#s_id").val();
                var s_name = checkedCheckbox.closest("tr").find("input#s_name").val();

                console.log(s_id);
                console.log(s_name);
                btnShow3();

                getscore(s_name, s_id);
            }
        });

     // 학생 점수 리스트   
     function getscore(s_name,s_id){	 
        GradesService.getScoreList({s_name: s_name, s_id: s_id}, function(score) {
            // 성적 데이터를 받아오는데 성공한 경우에만 아래 코드 실행
            var scoreList = $('.scoreList');
                scoreList.empty();
            
            if (score && score.length > 0) {
               
                score.forEach(function (score) {
                    // 평균 점수 계산
                    score.avgScore = ((score.korScore + score.engScore + score.mathScore) / 3).toFixed(1);
                    // 과목별 총 평균 갱신
                    GradesService.SubjectsTotalAvg(score);
                    
                    var str = '<tr>' +
                        '<td><div class="form-check form-check-muted m-0">'+
                        '<label class="form-check-label"><input type="checkbox" class="form-check-input sl_checkbox">'+
                        '<i class="input-helper"></i></label></div></td>'+ 
                        '<td><input type="text" name="s_id" readonly value="' + score.s_id +'"> </td>' +
                        '<td><input type="text" name="s_name" readonly value="'+ score.s_name +'"></td>' +
                        '<td><input type="text" name="e_name" readonly value="'+ score.e_name +'"></td>' +
                        '<td><input type="text" name="e_date" readonly value="'+ score.e_date +'"></td>' +
                        '<td><input type="text" name="korScore" readonly value="'+ score.korScore +'"></td>' +
                        '<td><input type="text" name="engScore" readonly value="'+ score.engScore +'"></td>' +
                        '<td><input type="text" name="mathScore" readonly value="' + score.mathScore +'"></td>' +
                        '<td><input type="text" name="avgScore" readonly value="'+ score.avgScore + '"></td>' +
                        '</tr>';                   
                    scoreList.append(str);
                });
            } else {
                // 성적 데이터가 없을 경우 처리 (에러 메시지 출력 등)
                console.log("No score data available");
                alert("데이터가 없습니다.");
            }
        });  	 
     }
     
        
   
     
  // 추가 버튼 
     $(".insertbtn").on('click', function(){
         addScore(scoredata[0]);
     });

  //점수 추가 
     function addScore(studentData) {
         console.log(scoredata);
         console.log(studentData.s_id);
         
         var str = '<tr class="escore">' +
             '<td><div class="form-check form-check-muted m-0">' +
             '<label class="form-check-label"><input type="checkbox"  class="form-check-input sl_checkbox">' +
             '<i class="input-helper"></i></label></div></td>' +
             '<td class="i_s_id"><input type="text" name="s_id" readonly value="' + studentData.s_id + '"> </td>' +
             '<td class="i_s_name"><input type="text" name="s_name" readonly value="' + studentData.s_name + '"></td>' +
             '<td class="i_e_name"><input type="text" name="e_name" readonly></td>' +
             '<td class="i_e_date"><input type="text" name="e_date" readonly></td>' +
             '<td class="i_korScore"><input type="text" name="korScore" readonly></td>' +
             '<td class="i_engScore"><input type="text" name="engScore" readonly></td>' +
             '<td class="i_mathScore"><input type="text" name="mathScore" readonly></td>' +
             '<td class="i_avgScore"></td>' +
             '</tr>';
         
         $('.scoreList').append(str);
         
         btnShow2();
         
         nowbtn = addbtn;                       
     }

        
        function setScore(callback){
            
            let scoreList = {               
                
                s_id : $(".i_s_id").text(),
                s_name : $(".i_s_name").text(),
                e_name : $("i_e_name").val(),
                e_date : $("i_e_date").val(),
                koreScore : $("i_korScore").val(),
                engeScore : $("i_engScore").val(),
                mathScore : $("i_mathScore").val(),
                
            }  
            
            GradesService.scoreInsert(scoreList, function(result){                   
                console.log("jsp : " + result);
                callback(result);                      
            }); 
            
        }
        
        
        // 저장 버튼
        savebtn.on("click", function(){
            if(nowbtn == addbtn){
                btnShow2();                    
            }                  
        });
        
        
        
        
     // 시험리스트 
        $('#examsearchForm').on('click', "button", function (e) {
            e.preventDefault();
            var e_nameValue = $('#e_name').val();
            console.log(e_nameValue);

            e_btnShow3();

            GradesService.getexamList({ e_name: e_nameValue }, function (exams) {
                renderExamList(exams);
            });
        });

        function renderExamList(exams) {
            var exam_List = $('.exam_List');
            exam_List.empty();

            exams.forEach(function (exam) {
                var str = '<tr class="addEs" id="' + exam.e_id + '">' +
                    '<td><div class="form-check form-check-muted m-0">' +
                    '<label class="form-check-label"><input type="checkbox" class="form-check-input el_checkbox">' +
                    '<i class="input-helper"></i></label></div></td>' +
                    '<td class="ie_e_id"><input type="text" name="ie_e_id" id="ie_e_id" value="' + exam.e_id + '"readonly></td>' +
                    '<td class="ie_e_name"><input type="text" name="ie_e_name" id="ie_e_name" value="' + exam.e_name + '"readonly></td>' +
                    '<td class="ie_e_grade"><input type="text" name="ie_e_grade" id="ie_e_grade" value="' + exam.e_grade + '"readonly> </td>' +
                    '<td class="ie_e_date"><input type="text" name="ie_e_date" id="ie_e_date" value="' + exam.e_date + '"readonly>  </td>' +
                    '</tr>';
                exam_List.append(str);

                console.log(exam.e_id);
            });
        }

        
     // 추가 버튼 
        $(".insertbtn").on('click', function () {
            let scoreList = {
                s_id: $(".i_s_id").val(),
                s_name: $(".i_s_name").val(),
                e_name: $("#i_e_name").val(),
                e_date: $("#i_e_date").val(),
                koreScore: $("#i_korScore").val(),
                engeScore: $("#i_engScore").val(),
                mathScore: $("#i_mathScore").val(),
            }
        });

        // 시험 생성
        inserExamtbtn.on('click', function () {
            appendExamRow();
            e_btnShow2();
            nowbtn = inserExamtbtn;
        });

        function appendExamRow() {
            let str = '<tr class="addEs">' +
                '<td><div class="form-check form-check-muted m-0">' +
                '<label class="form-check-label"><input type="checkbox"  class="form-check-input el_checkbox">' +
                '<i class="input-helper"></i></label></div></td>' +
                '<td class="ie_e_id"><input type="text" name="ie_e_id" id="ie_e_id" readonly></td>' +
                '<td class="ie_e_name"><input type="text" name="ie_e_name" id="ie_e_name" ></td>' +
                '<td class="ie_e_grade"><input type="text" name="ie_e_grade" id="ie_e_grade"  ></td>' +
                '<td class="ie_e_date"><input type="text" name="ie_e_date" id="ie_e_date" ></td>' +
                '</tr>';
            $('.exam_List').append(str);
        }

        function setExam(callback) {
            let exam = {
                e_name: $("#ie_e_name").val(),
                e_grade: $("#ie_e_grade").val(),
                e_date: $("#ie_e_date").val()
            }
            GradesService.examInsert(exam, function (result) {
                console.log("jsp: " + result);
                callback(result);
            });
        }

        // 시험 저장 버튼
        saveExambtn.on("click", function () {
            if (nowbtn == inserExamtbtn) {
                setExam(function (result) {
                    renderExamList(result);
                    e_btnShow3();
                });
            } else if (nowbtn == updateExambtn) {
                upExam(function () {
                    e_btnShow3();
                });
            }
        });

        // 시험 수정 버튼
        updateExambtn.on("click", function () {
            scoreEdit();
            e_btnShow2();
            nowbtn = updateExambtn;
        });

        // 삭제 버튼
        deleteExambtn.on('click', function () {
            var checkedCheckbox = $('.el_checkbox:checked');
            if (checkedCheckbox.length > 0) {
                var e_id = checkedCheckbox.closest("tr").find("input#ie_e_id").val();
                GradesService.examRemove(e_id, function () {
                    renderExamList([]);
                });
            }
        });

        function upExam(callback) {
            let exam = {
                e_id: $("#ie_e_id").val(),
                e_name: $("#ie_e_name").val(),
                e_grade: $("#ie_e_grade").val(),
                e_date: $("#ie_e_date").val()
            }
            GradesService.examModify(exam, function (result) {
                if (result == "success") {
                    alert(result);
                    callback();
                }
            });
        }


        //취소
        cancelExambtn.on("click", function(){
        	
        	e_btnShow3();
        	
        	 GradesService.getexamList({ e_name: e_nameValue }, function (exams) {
                 renderExamList(exams);
             });
        	 
        	
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
        
        function e_btnShow2(){
        	saveExambtn.show();
            cancelExambtn.show();
            
            inserExamtbtn.hide();
            updateExambtn.hide();
            deleteExambtn.hide();
        }
        
        function e_btnShow3(){
        	saveExambtn.hide();
        	cancelExambtn.hide();
            
            inserExamtbtn.show();
            updateExambtn.show();
            deleteExambtn.show();
        }
        
        function e_btnShow1(){
        	saveExambtn.hide();
        	cancelExambtn.hide();
            
            inserExamtbtn.show();
            updateExambtn.hide();
            deleteExambtn.hide();
        }
        
        
        function scoreEdit() {
        	
        	if($('.el_checkbox:checked')){
        		$('.el_checkbox:checked').closest("tr").find("input:not('#ie_e_id')").prop('readonly', false);		
        	}
        }
        
        
      //체크 박스 클릭 이벤트
        $(document).on('click', '.el_checkbox', function() {
        	
        	$(".el_checkbox").prop('checked', false);			
 		   // 현재 클릭한 체크박스만 선택       	
 		  $(this).prop('checked', true);
 		   
        });
        
      
  	$(document).on('click', '.sl_checkbox', function() {
        	
        	$(".sl_checkbox").prop('checked', false);			
 		   // 현재 클릭한 체크박스만 선택       	
 		 	 $(this).prop('checked', true);
 		   
        });
         
  	
	$(document).on('click', '.s_checkbox', function() {
    	
    		$(".s_checkbox").prop('checked', false);			
		   // 현재 클릭한 체크박스만 선택       	
		 	 $(this).prop('checked', true);
		   
    });
     
      
        
    });
    
    
    </script>
    
  </body>
</html>