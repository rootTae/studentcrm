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
                    <div class="col ml-auto text-right">
	                    <button type="button" class="inserExamtbtn btn btn-primary mb-2" >추가</button>
			        	<button type="button" class="updateExambtn btn btn-secondary mb-2" style="display: none">수정</button>
			        	<button type="button" class="deleteExambtn btn btn-info mb-2" style="display: none">삭제</button>
			        	<button type="button" class="saveExambtn btn btn-primary mb-2" style="display: none">저장</button>
			        	<button type="button" class="cancelExambtn btn btn-info mb-2" style="display: none">취소</button>
			        </div>
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
			                  <p class="card-description">학생명을 입력해 주세요.</p>
			                  <form id="searchForm" method="post" class="form-inline">
				                  <input type="text" class="form-control mb-2 mr-sm-2" name="s_name" id="s_name" required placeholder="학생명">
				                  <button type="submit" class="btn btn-primary mb-2" >검색</button>
                  			  </form>
                		</div>
              		</div>
            	</div>
	          
	          
              <div class="col-7 grid-margin stretch-card">
                <div class="card ">
                  <div class="card-body ">
                    <h4 class="card-title">학생 검색 결과</h4>
                    <div class="table-responsive">
                      <table class="table" id="studentTable">
                        <thead>
                          <tr>
                            <th>                         
                            </th>
                            <th>학생 번호</th>
		                    <th>학생명</th>
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
                     <div class="col-md-4 ml-auto text-right">
	                    <button type="button" class="insertbtn btn btn-primary mb-2" style="display: none">추가</button>
				        <button type="button" class="updatebtn btn btn-secondary mb-2" style="display: none">수정</button>
				        <button type="button" class="deletebtn btn btn-info mb-2" style="display: none">삭제</button>
				        <button type="button" class="savebtn btn btn-primary mb-2" style="display: none">저장</button>
				        <button type="button" class="cancelbtn btn btn-info mb-2" style="display: none">취소</button>
				        <button type="button" class="chartbtn btn btn-primary mb-2" style="display: none">그래프 생성</button>
				     </div>
                      <table class="table" id="scoreTable">
                        <thead>
                          <tr>
                            <th> 
                                                      
                            </th>
                            <th hidden>성적 관리 번호</th>
                            <th>학생 번호</th>
		                    <th>학생 이름</th>
		                    <th>시험 번호</th>
		                    <th>시험 명</th>
		                    <th>시험 날짜</th>
		                    <th>국어</th>
		                    <th>영어</th>
		                    <th>수학</th>
		                    <th>평균</th>
                          </tr>
                        </thead>
                        <tbody class="scoreList" id="scoreList">
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="row">
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body" id="line"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">시험 전체 평균</h4>
                    <canvas id="linechart-multi" style="height: 181px; display: block; width: 363px;" width="363" height="181" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body" id ="bar"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">시험 점수</h4>
                    <canvas id="barChart" style="height: 181px; display: block; width: 363px;" width="363" height="181" class="chartjs-render-monitor"></canvas>
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
     <script src="/assets/vendors/chart.js/Chart.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/assets/js/off-canvas.js"></script>
    <script src="/assets/js/hoverable-collapse.js"></script>
    <script src="/assets/js/misc.js"></script>
    <script src="/assets/js/settings.js"></script>
    <script src="/assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="/assets/js/chart.js"></script>
    <!-- End custom js for this page -->
    <!-- 여기에 스크립트 입력 -->
    <script type="text/javascript" src="/js/demo/grades.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
        var total = "";
        
        let nowbtn='';
        //지금 데이터 저장
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
        //시험 버튼 설정
        let inserExamtbtn = $(".inserExamtbtn");
        let updateExambtn = $(".updateExambtn");
        let deleteExambtn = $(".deleteExambtn");
        let saveExambtn = $(".saveExambtn");
        let cancelExambtn = $(".cancelExambtn");   
        
     	// 학생 이름 검색 
        $('#searchForm').submit(function(event){
            event.preventDefault();
            var s_nameValue = $('#s_name').val();

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
                        '<td><input type="text" class="is_s_id form-control" name="is_s_id" id="is_s_id" readonly value="'+ student.s_id +'"></td>' +
                        '<td><input type="text" class="is_s_name form-control" name="is_s_name"  id="is_s_name"  readonly value="'+ student.s_name +'"></td>' +
                        '<td><input type="text" class="is_s_gender form-control" name="is_s_gender" id="is_s_gender"  readonly value="'+ student.s_gender +'"></td>' +
                        '<td><input type="text" class="is_s_phone form-control" name="is_s_phone"  id="is_s_phone" readonly value="'+ student.s_phone +'"></td>' +
                        '<td><input type="text" class="is_s_school form-control" name="is_s_school" id ="is_s_school" readonly value="'+ student.s_school +'"></td>' +
                        '<td><input type="text" class="is_s_grade form-control" name="is_s_grade" id="is_s_grade" readonly value="'+ student.s_grade + '"></td>' +
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
    		   
    		 	var scoreList = $('.scoreList');
                scoreList.empty();
                
                let checkedCheckbox = $('.s_checkbox:checked');
    		  
                if (checkedCheckbox) {
                	
                    var s_id = checkedCheckbox.closest("tr").find("input#is_s_id").val();
                    var s_name = checkedCheckbox.closest("tr").find("input#is_s_name").val();
					
                    nowsid=s_id;
                    nowsname=s_name;
                                 
                    getscore(s_name, s_id);                    
                    btnShow3();                    	                   
                }
                
        });
     	   	
     	

     // 학생 점수 리스트   
     function getscore(s_name,s_id){	
    	 var scoreList = $('.scoreList');
         scoreList.empty();
        GradesService.getScoreList({s_name: s_name, s_id: s_id}, function(scores) {
            // 성적 데이터를 받아오는데 성공한 경우에만 아래 코드 실행
            if (scores && scores.length > 0) {
               
                scores.forEach(function (score) {
                    // 평균 점수 계산
                    score.avgScore = ((score.korScore + score.engScore + score.mathScore) / 3).toFixed(1);
                    // 과목별 총 평균 갱신
                    GradesService.SubjectsTotalAvg(score, function(result){
                    
                    var str = '<tr>' +
                        '<td><div class="form-check form-check-muted m-0">'+
                        '<label class="form-check-label"><input type="checkbox" class="form-check-input sl_checkbox">'+
                        '<i class="input-helper"></i></label></div></td>'+
                        '<td hidden><input type="text" class="score_id form-control" name="score_id" id="score_id" value="'+score.score_id+'" readonly></td>' +
                        '<td><input type="text" class="s_id form-control" id="s_id" name="s_id" readonly value="' + score.s_id +'"> </td>' +
                        '<td><input type="text" class="s_name form-control" id="s_name" name="s_name" readonly value="'+ score.s_name +'"></td>' +
                        '<td><input type="text" class="e_id form-control" id="e_id" name="e_id" readonly value="'+ score.e_id +'"></td>' +
                        '<td><input type="text" class="e_name form-control" id="e_name" name="e_name" readonly value="'+ score.e_name +'"></td>' +
                        '<td><input type="text" class="e_date form-control" id="e_date" name="e_date" readonly value="'+ score.e_date +'"></td>' +
                        '<td><input type="text" class="korScore form-control" id="korScore" name="korScore" readonly value="'+ score.korScore +'"></td>' +
                        '<td><input type="text" class="engScore form-control" id="engScore" name="engScore" readonly value="'+ score.engScore +'"></td>' +
                        '<td><input type="text" class="mathScore form-control" id="mathScore" name="mathScore" readonly value="' + score.mathScore +'"></td>' +
                        '<td><input type="text" class="avgScore form-control" id="avgScore" name="avgScore" readonly value="'+ score.avgScore + '"></td>' +
                        '<td hidden><input type="text" class="korAvg" name="korAvg" id="korAvg" value="'+result.korAvg+'" readonly></td>' +
                        '<td hidden><input type="text" class="engAvg" name="engAvg" id="engAvg" value="'+result.engAvg+'" readonly></td>' +
                        '<td hidden><input type="text" class="mathAvg" name="mathAvg" id="mathAvg" value="'+result.mathAvg+'" readonly></td>' +
                        '<td hidden><input type="text" class="total" name="total" id="total" value="'+result.totalAvgScore +'" readonly></td>' +
                        '</tr>';                   
                    scoreList.append(str);
                   
                    });
                });
                $('.chartbtn').show();
            } else {
                // 성적 데이터가 없을 경우 처리 (에러 메시지 출력 등)
                console.log("No score data available");
                alert("데이터가 없습니다.");
                $('.chartbtn').hide();
            }
        });  	 
     }
     
     
     function renderScoreList(scores){
     	 var scoreList = $('.scoreList');
         scoreList.empty();
         
    	 scores.forEach(function (score) {
             // 평균 점수 계산
             score.avgScore = ((score.korScore + score.engScore + score.mathScore) / 3).toFixed(1);
             // 과목별 총 평균 갱신
             GradesService.SubjectsTotalAvg(score);
           if($('#add_e_id') == null){
        	   return;
           }else{
             var str = '<tr>' +
                 '<td><div class="form-check form-check-muted m-0">'+
                 '<label class="form-check-label"><input type="checkbox" class="form-check-input sl_checkbox">'+
                 '<i class="input-helper"></i></label></div></td>'+ 
                 '<td hidden><input type="text" class="score_id" name="score_id" id="score_id" value="'+score.score_id+'" readonly></td>' +
                 '<td><input type="text" class="s_id form-control" id="s_id" name="s_id" readonly value="' + score.s_id +'"> </td>' +
                 '<td><input type="text" class="s_name form-control" id="s_name" name="s_name" readonly value="'+ score.s_name +'"></td>' +
                 '<td><input type="text" class="e_id form-control" id="e_id" name="e_id" readonly value="'+ score.e_id +'"></td>' +
                 '<td><input type="text" class="e_name form-control" id="e_name" name="e_name" readonly value="'+ score.e_name +'"></td>' +
                 '<td><input type="text" class="e_date form-control" id="e_date" name="e_date" readonly value="'+ score.e_date +'"></td>' +
                 '<td><input type="text" class="korScore form-control" id="korScore" name="korScore" readonly value="'+ score.korScore +'"></td>' +
                 '<td><input type="text" class="engScore form-control" id="engScore" name="engScore" readonly value="'+ score.engScore +'"></td>' +
                 '<td><input type="text" class="mathScore form-control" id="mathScore" name="mathScore" readonly value="' + score.mathScore +'"></td>' +
                 '<td><input type="text" class="avgScore form-control" id="avgScore" name="avgScore" readonly value="'+ score.avgScore + '"></td>' +
                 '</tr>';                   
             scoreList.append(str);
        	   
           }

         });
     }     
     
  //학생 성적 -----부분시작      
   
     
  // 성적점수 추가 버튼 
	  $(".insertbtn").on('click', function() {
  		if ($('.s_checkbox:checked').length > 0) {
	    
		 let score={s_id : nowsid, s_name :nowsname};
		 
	    	addScore(score);
			btnShow2();        
	        nowbtn = addbtn;     
		 }  
     });

  //점수 추가 
     function addScore(score) {
     
         var str = '<tr class="addscoredata" id="addscoredata" name="addscoredata">' +
             '<td><div class="form-check form-check-muted m-0">' +
             '<label class="form-check-label"><input type="checkbox"  class="form-check-input sl_checkbox">' +
             '<i class="input-helper"></i></label></div></td>' +
             '<td hidden><input type="text" class="score_id" name="score_id" id="score_id" readonly></td>' +
             '<td class="i_s_id"><input type="text" class="form-control" name="add_s_id" id="add_s_id" readonly value="' + score.s_id + '"> </td>' +
             '<td class="i_s_name"><input type="text" class="form-control" name="add_s_name" id="add_s_name" readonly value="' + score.s_name + '"></td>' +
             '<td class="i_e_id"><input type="text" class="form-control" name="add_e_id" id="add_e_id"></td>' +
             '<td class="i_e_name"><input type="text" class="form-control" name="add_e_name" id="add_e_name" readonly></td>' +
             '<td class="i_e_date"><input type="text" class="form-control" name="add_e_date" id="add_e_date" readonly></td>' +
             '<td class="i_korScore"><input type="text" class="form-control" name="add_korScore" id="add_korScore"></td>' +
             '<td class="i_engScore"><input type="text" class="form-control" name="add_engScore" id="add_engScore"></td>' +
             '<td class="i_mathScore"><input type="text" class="form-control" name="add_mathScore" id="add_mathScore" ></td>' +
             '<td class="i_avgScore"></td>' +
             '</tr>';   
         
         $('.scoreList').append(str);               
     }
  


        //성적 입력
        function setScore(callback){
            
            let scoreList = {               
                
                s_id : $("#add_s_id").val(),
                e_id : $("#add_e_id").val(),
                korScore : $("#add_korScore").val(),
                engScore : $("#add_engScore").val(),
                mathScore : $("#add_mathScore").val()
                
            }  
            
            GradesService.scoreInsert(scoreList, function(result){                   
                console.log("jsp : " + result);
                callback(result);                      
            }); 
            
        }
        
        
        // 점수리스트저장 버튼
        savebtn.on("click", function(){
            //성적 입력 저장
        	if(nowbtn == addbtn){
 				      
                setScore(function (callback) {
                         	
                });
                s_name =$("#add_s_name").val();
                s_id = $("#add_s_id").val();
                getscore(s_name, s_id);
                btnShow3();    
            }else if (nowbtn == updatebtn) {
                upScore(function () {
                    btnShow3();
                    s_name =$(".s_name").val();
                    s_id = $(".s_id").val();
                    getscore(s_name, s_id); 
                });
            }
            
        });
          
       //성적 수정 버튼 
 		updatebtn.on("click", function () {
 			if ($('.sl_checkbox:checked').length > 0) {
 			btnShow2();
 			scoreEdit();
            nowbtn = updatebtn; 
            alert("정보 변경하세요.");	
 			}else{
 				alert("체크박스를 선택하세요.");
 			}
        });
       
       
       //성적 수정    
        function upScore(callback) {
        	var checkedCheckbox = $('.sl_checkbox:checked');
            if (checkedCheckbox.length > 0) {	  
    	   let grade = {
            	s_id : checkedCheckbox.closest("tr").find("input.s_id").val(),
            	korScore :checkedCheckbox.closest("tr").find("input.korScore").val(),
            	engScore :checkedCheckbox.closest("tr").find("input.engScore").val(),
            	mathScore :	checkedCheckbox.closest("tr").find("input.mathScore").val(),
            	score_id :checkedCheckbox.closest("tr").find("input.score_id").val(),          	
            }
            GradesService.scoreModify(grade, function (result) {
                if (result == "success") {
                    alert(result);
                    callback();
                }
            });
            }
        }       

     // 점수 삭제 버튼
        deletebtn.on('click', function () {
            var checkedCheckbox = $('.sl_checkbox:checked');

            if (checkedCheckbox.length > 0) {
                var score_id = checkedCheckbox.closest("tr").find("input#score_id").val();

                GradesService.scoreRemove(score_id, function (result) {
                    // 삭제 요청이 성공한 경우에 실행될 코드
                    var scoreList = $('#scoreList');
                    scoreList.empty(); // scoreList를 비워주는 작업
                    getscore(nowsname, nowsid); // 삭제된 정보를 다시 불러오기
                    btnShow3(); // 버튼 상태 조정

                });
            }
        });	
	
	// 시험 취소
	cancelbtn.on("click", function () {

	    if (nowbtn == addbtn) {
	        // "addscoredata" 클래스를 가진 행을 삭제합니다.
	        var scoreList = $('#scoreList');
	        scoreList.empty();

	        // 점수 목록을 다시 불러옵니다.
	        GradesService.getScoreList({ s_name: nowsname, s_id: nowsid }, function (scores) {
	            
	        	renderScoreList(scores);
	        });

	        btnShow3();
	    } else {
	        btnShow3();
	    }
	});

        
     // 시험리스트 검색
        $('#examsearchForm').on('click', "button", function (e) {
            e.preventDefault();
            var e_nameValue = $('#e_name').val();

            e_btnShow3();

            GradesService.getexamList({ e_name: e_nameValue }, function (exams) {
                renderExamList(exams);
            });
        });

     //리스트 가져오는 함수
        function renderExamList(exams) {
            var exam_List = $('.exam_List');
            exam_List.empty();

            exams.forEach(function (exam) {
                var str = '<tr class="addEs" id="' + exam.e_id + '">' +
                    '<td><div class="form-check form-check-muted m-0">' +
                    '<label class="form-check-label"><input type="checkbox" class="form-check-input el_checkbox">' +
                    '<i class="input-helper"></i></label></div></td>' +
                    '<td class="ie_e_id"><input type="text" class="form-control ie_e_id" name="ie_e_id" id="ie_e_id" value="' + exam.e_id + '"readonly></td>' +
                    '<td class="ie_e_name"><input type="text" class="form-control ie_e_name" name="ie_e_name" id="ie_e_name" value="' + exam.e_name + '"readonly></td>' +
                    '<td class="ie_e_grade"><input type="text" class="form-control ie_e_grade" name="ie_e_grade" id="ie_e_grade" value="' + exam.e_grade + '"readonly> </td>' +
                    '<td class="ie_e_date"><input type="text" class="form-control ie_e_date" name="ie_e_date" id="ie_e_date" value="' + exam.e_date + '"readonly>  </td>' +
                    '</tr>';
                exam_List.append(str);
            });
        }

        // 시험 추가 버튼
        inserExamtbtn.on('click', function () {
            
        	appendExamRow();
            
            e_btnShow2();
            
          	nowename=$("#ie_e_name").val();
            nowbtn = inserExamtbtn;
        });     

        function appendExamRow() {
            let str = '<tr class="addEs">' +
                '<td><div class="form-check form-check-muted m-0">' +
                '<label class="form-check-label"><input type="checkbox"  class="form-check-input el_checkbox">' +
                '<i class="input-helper"></i></label></div></td>' +
                '<td class="ie_e_id"><input type="text" class="form-control" name="add_e_id" id="add_e_id" readonly></td>' +
                '<td class="ie_e_name"><input type="text" class="form-control" name="add_e_name" id="add_e_name" ></td>' +
                '<td class="ie_e_grade"><input type="text" class="form-control" name="add_e_grade" id="add_e_grade"  ></td>' +
                '<td class="ie_e_date"><input type="text" class="form-control" name="add_e_date" id="add_e_date" ></td>' +
                '</tr>';
            $('.exam_List').append(str);
        }
		
        //시험 생성.
        function setExam(callback) {	
        	let exam = {
                e_name: $("#add_e_name").val(),
                e_grade: $("#add_e_grade").val(),
                e_date: $("#add_e_date").val()
            }
            
            GradesService.examInsert(exam, function (result) {
                console.log("jsp: " + result);
                callback(result);
            });
        }

        //시험 저장 버튼
        saveExambtn.on("click", function () {
            if (nowbtn == inserExamtbtn) {
                setExam(function (result) {
                	var e_name = $("#add_e_name").val();
                	GradesService.getexamList({ e_name: e_name}, function (exams) {
                        renderExamList(exams);
                    });
                    e_btnShow3();
                });
            } else if (nowbtn == updateExambtn) {
                upExam(function () {
                    e_btnShow3();
                    GradesService.getexamList({ e_name: nowename}, function (exams) {
                        renderExamList(exams);
                    });
                });
            }
        });

        //시험 수정 버튼
        updateExambtn.on("click", function () {
        	if ($('.el_checkbox:checked').length > 0) {
            scoreEdit();
            e_btnShow2();
            nowbtn = updateExambtn;
            nowename=$("#ie_e_name").val();
            alert("정보 변경하세요.");
        	}else{
        	alert("체크박스를 선택하세요.");
        	}
        });

        //시험 삭제 버튼
        deleteExambtn.on('click', function () {
            var checkedCheckbox = $('.el_checkbox:checked');
            if (checkedCheckbox.length > 0) {
                var e_id = checkedCheckbox.closest("tr").find("input#ie_e_id").val();
                var e_nameValue = checkedCheckbox.closest("tr").find("input#ie_e_name").val();
                GradesService.examRemove(e_id, function () {              	 
                	GradesService.getexamList({ e_name: e_nameValue }, function (exams) {
                         renderExamList(exams);
                     });
                });
            }
        });
		
        //시험수정 이벤트
        function upExam(callback) {
        	 var checkedCheckbox = $('.el_checkbox:checked');
             if (checkedCheckbox.length > 0) {	
        	
        	let exam = {
                e_id: checkedCheckbox.closest("tr").find("input.ie_e_id").val(), 
                e_name: checkedCheckbox.closest("tr").find("input.ie_e_name").val(), 
                e_grade: checkedCheckbox.closest("tr").find("input.ie_e_grade").val(), 
                e_date: checkedCheckbox.closest("tr").find("input.ie_e_date").val() 
            }
        	if(exam.e_name==''){
        		alert("시험 명을 입력하세요.");	
        	}else{
            GradesService.examModify(exam, function (result) {
                if (result == "success") {
                    alert(result);
                    callback();
                }
            });  
        	}
        	}         
        }
			
        //시험 취소
        cancelExambtn.on("click", function(){
        	
        	$('#addscoredata').remove();
        	
           if(nowbtn==inserExamtbtn){
        	        	   
        	   var exam_List = $('.exam_List');
        	   exam_List.empty();
        	   
        	   GradesService.getexamList({ e_name: nowename }, function (exams) {
                   renderExamList(exams);
               });
        	   
        	   e_btnShow3();
           }else {
        	   e_btnShow3();  
        	   GradesService.getexamList({ e_name: nowename }, function (exams) {
                   renderExamList(exams);
               });
           }
        });
        
        $('.chartbtn').on('click', function() {
            var selectedRows = $('.sl_checkbox:checked').closest('tr'); 
            
            $('#linechart-multi').remove();
            $('#barChart').remove(); 
           
           var str2 = '<canvas id="barChart" style="height: 181px; display: block; width: 363px;"'
           + 'width="363" height="181" class="chartjs-render-monitor"></canvas>'
           
           var str = '<canvas id="linechart-multi" style="height: 181px; display: block; width: 363px;"'
           +'width="363" height="181" class="chartjs-render-monitor"></canvas>'
           
           $('#line').append(str);
           $('#bar').append(str2);
           
            if (selectedRows.length > 0) {
                var chartData = {
                    korScore: selectedRows.find('.korScore').val(),
                    engScore: selectedRows.find('.engScore').val(),
                    mathScore: selectedRows.find('.mathScore').val(),
                    avgScore: selectedRows.find('.avgScore').val(),
                    korAvg: selectedRows.find('.korAvg').val(),
                    engAvg: selectedRows.find('.engAvg').val(),
                    mathAvg: selectedRows.find('.mathAvg').val(),
                    totalAvgScore: selectedRows.find('.total').val()
                };

                getChart(chartData);
            } else {
                alert("체크 박스를 선택하세요.");
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
        	
        	if($('.sl_checkbox:checked')){
        		$('.sl_checkbox:checked').closest("tr").find("input:not('#score_id, #s_id, #s_name, #e_id, #e_name, #e_date, #avgScore')").prop('readonly', false);
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

    });
    </script>
    
    
  </body>
</html>