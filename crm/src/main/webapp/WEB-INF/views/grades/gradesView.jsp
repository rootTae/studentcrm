<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information</title>
    <style>
        .scoreList td {
            width: 50px; 
            height: 20px; 
            background-color: #ccc; 
            border: 1px solid #000; 
            text-align: center; 
        }
    </style>
</head>
<body>
    <h3>학생 검색</h3>
    <form id="searchForm" method="post">
        <label for="s_name">이름:</label>
        <input type="text" id="s_name" name="s_name" required>
        <button type="submit">Search</button>
    </form>
    
    <!-- 
    <h3>exam</h3>
    <form id="searchForm" method="post">
        <label for="e_name">시험 명</label>        
        <input type="text" id="e_name" name="e_name" required>
        <label for="e_grade">학년</label>        
        <input type="text" id="e_grade" name="e_grade" required>
        <label for="e_date">시험 날짜</label>        
        <input type="text" id="e_date" name="e_date" required>
        <button type="button" class="insertExambtn">생성</button>
    </form>
    -->
    
    <h3>시험 검색</h3>
    <form id="examsearchForm" method="post">
        <label for="e_name">시험명: </label>
        <input type="text" id="e_name" name="e_name" required>
        <button type="button">Search</button>
    </form>
    
    <div>
        <h3>exam List</h3>
        <table id="examTable" border="1">
            <thead>
                <tr>
            <button type="button" class="inserExamtbtn" >추가</button>
        	<button type="button" class="updateExambtn" >수정</button>
        	<button type="button" class="deleteExambtn" >삭제</button>
        	<button type="button" class="saveExambtn" style="display: none">저장</button>
        	<button type="button" class="cancelExambtn" style="display: none">취소</button>
                    <th>시험명</th>
                    <th>학년</th>
                    <th>시험 날짜</th>  
                </tr>
            </thead>
            <tbody class="exam_List"></tbody>
        </table>
    </div>
    
    <div>
        <h3>Student List</h3>
        <table id="studentTable" border="1">
            <thead>
                <tr>
                    <th>학생 번호</th>
                    <th>학생 이름</th>
                    <th>성별</th>
                    <th>전화번호</th>
                    <th>학교</th>
                    <th>학년</th>                   
                </tr>
            </thead>
            <tbody class="studentList"></tbody>
        </table>
    </div>
    
    <div>
        <h3>Student Exam List</h3>
        <button type="button" class="insertbtn" style="display: none">추가</button>
        <button type="button" class="updatebtn" style="display: none">수정</button>
        <button type="button" class="deletebtn" style="display: none">삭제</button>
        <button type="button" class="savebtn" style="display: none">저장</button>
        <button type="button" class="cancelbtn" style="display: none">취소</button>
        
        <table id="scoreTable" border="1">
            <thead>
                <tr>
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
                <!-- 
                <tr class="escore">
                    <td class="i_s_id"><input type="text" name="s_id"></td>
                    <td class="i_s_name"><input type="text" name="s_name"></td>
                    <td class="i_e_name"><input type="text" name="e_name"></td>
                    <td class="i_e_date"><input type="text" name="e_date"></td>
                    <td class="i_korScore"><input type="text" name="korScore"></td>
                    <td class="i_engScore"><input type="text" name="engScore"></td>
                    <td class="i_mathScore"><input type="text" name="mathScore"></td>
                    <td class="i_avgScore"><input type="text" name="avgScore"></td>
                </tr>
                -->
            </tbody>
        </table>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/demo/grades.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            
            let scoredata = "";
            let escore = $(".escore");
            
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
            
            $('#searchForm').submit(function(event){
                event.preventDefault();
                var s_nameValue = $('#s_name').val();
                console.log(s_nameValue);
                
                GradesService.getStudentList({s_name: s_nameValue}, function(student){
                    console.log(student);
                    var studentList = $('.studentList');
                    studentList.empty();
                    
                    student.forEach(function (student) {
                        var str = '<tr>' +
                            '<td>' + student.s_id + '</td>' +
                            '<td>' + student.s_name + '</td>' +
                            '<td>' + student.s_gender + '</td>' +
                            '<td>' + student.s_phone + '</td>' +
                            '<td>' + student.s_school + '</td>' +
                            '<td>' + student.s_grade + '</td>' +
                            '</tr>';                   
                        studentList.append(str);
                    });
                });
            });
            
            $(".studentList").on('click', 'td', function(e) {
                
                var s_id = ($(this).parent().find('td:first-child').text());
                var s_name = ($(this).parent().find('td:nth-child(2)').text());
                
                btnShow3();
                
                GradesService.getScoreList({s_name: s_name, s_id: s_id}, function(score) {
                    score.forEach(function(score){
                        
                        score.avgScore = ((score.korScore + score.engScore + score.mathScore) / 3).toFixed(1);
                        
                        GradesService.SubjectsTotalAvg(score);
                        
                        scoredata = score;
                    });
                    
                    var scoreList = $('.scoreList');
                    scoreList.empty();
                    scoredata = score;
                    
                    score.forEach(function (score) {
                        var str = '<tr>' +
                            '<td>' + score.s_id + '</td>' +
                            '<td>' + score.s_name + '</td>' +
                            '<td>' + score.e_name + '</td>' +
                            '<td>' + score.e_date + '</td>' +
                            '<td>' + score.korScore + '</td>' +
                            '<td>' + score.engScore + '</td>' +
                            '<td>' + score.mathScore + '</td>' +
                            '<td>' + score.avgScore + '</td>' +
                            '</tr>';                   
                        scoreList.append(str);
                    });
                    
                });
                
            });
         
         
            // 추가 버튼 
            $(".insertbtn").on('click', function(){
                console.log(scoredata);
                console.log(scoredata[0].s_id);
                str = '<tr class="escore">' +
                    '<td class="i_s_id">' + scoredata[0].s_id + '</td>' +
                    '<td class="i_s_name">' + scoredata[0].s_name + '</td>' +
                    '<td class="i_e_name"><input type="text" name="e_name"></td>' +
                    '<td class="i_e_date"><input type="text" name="e_date"></td>' +
                    '<td class="i_korScore"><input type="text" name="korScore"></td>' +
                    '<td class="i_engScore"><input type="text" name="engScore"></td>' +
                    '<td class="i_mathScore"><input type="text" name="mathScore"></td>' +
                    '<td class="i_avgScore"></td>' +
                    '</tr>';
                    
                $('.scoreList').append(str);
                
                btnShow2();
                
                nowbtn = addbtn;                       
            });
            
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
            $('#examsearchForm').on('click',"button", function(e){
                event.preventDefault();
                var e_nameValue = $('#e_name').val();
                console.log(e_nameValue);
                
                GradesService.getexamList({e_name: e_nameValue}, function(exams){
                    console.log(exams);
                    var exam_List = $('.exam_List');
                    exam_List.empty();
                    
                    exams.forEach(function (exams) {
                        var str = '<tr class="addEs">' +
                            '<td class="ie_e_name">' + exams.e_name + '</td>' +
                            '<td class="ie_e_grade">' + exams.e_grade + '</td>' +
                            '<td class="ie_e_date">' + exams.e_date + '</td>' +                     
                            '</tr>';                   
                        exam_List.append(str);
                    });      
                });
            });
            
            // 추가 버튼 
            $(".insertbtn").on('click', function(){

                let scoreList = {               
                    s_id : $(".i_s_id").val(),
                    s_name : $(".i_s_name").val(),
                    e_name : $("i_e_name").val(),
                    e_date : $("i_e_date").val(),
                    koreScore : $("i_korScore").val(),
                    engeScore : $("i_engScore").val(),
                    mathScore : $("i_mathScore").val(),
                    mathScore : $("i_mathScore").val()
                    
                }                                  
            });
            
          //시험 생성
            inserExamtbtn.on('click', function(){
            	
            	str = '<tr class="addEs">' +
                '<td class="ie_e_name"><input type="text" name="ie_e_name" id="ie_e_name"></td>' +
                '<td class="ie_e_grade"><input type="text" name="ie_e_grade" id="ie_e_grade"></td>' +
                '<td class="ie_e_date"><input type="text" name="ie_e_date" id="ie_e_date"></td>' +              
                '</tr>';
                
                $('.exam_List').append(str);
                
                e_btnShow2();
                
                nowbtn=inserExamtbtn;
                
            });
            
				function setExam(callback){
                
					let exam = {                  
							e_name : $("#ie_e_name").val(),
						    e_grade : $("#ie_e_grade").val(),
						    e_date : $("#ie_e_date").val()                   
						}
                
                GradesService.examInsert(exam, function(result){                   
                    console.log("jsp : " + result);
                    callback(result);                      
                }); 
                
            }
				
       
            
            //시험 저장 버튼
   
			saveExambtn.on("click", function(){
			    if(nowbtn == inserExamtbtn) {
			        
			        
			        setExam(function(result){
			        	
			        GradesService.getexamList({e_name: $("#ie_e_name").val()}, function(exams){
	                    var exam_List = $('.exam_List');
	                    exam_List.empty();
	                    
	                    exams.forEach(function (exams) {
	                        var str = '<tr>' +
	                            '<td>' + exams.e_name + '</td>' +
	                            '<td>' + exams.e_grade + '</td>' +
	                            '<td>' + exams.e_date + '</td>' +                     
	                            '</tr>';                   
	                        exam_List.append(str);
	                    });      
			            // 결과 처리 코드 작성			            
			        });
			        
			        	
			        e_btnShow3();
			        });
			    }else if(nowbtn ==updateExambtn ){
			    	e_btnShow3();
			    	
			    }                  
			});
            //시험 수정 버튼
            
            updateExambtn.on("click", function(){
            	scoreEdit();
            	e_btnShow2();
            	
            	
            	nowbtn=updateExambtn;
            	
            });
            function upExam(callback){
            	
            	let exam  ={
            	
            			
            	}
            }
            
        /*  // 수정 버튼 클릭 이벤트
            $('.exam_List').on('click', '.editExamBtn', function() {
                // 선택된 행에서 데이터 가져오기
                var $row = $(this).closest('tr');
                var $cells = $row.find('td');
                // 원하는 형태로 데이터 활용 (여기서는 각 데이터 셀을 수정 가능한 input으로 변경)
                $cells.each(function() {
                    var $cell = $(this);
                    var value = $cell.text();
                    $cell.html('<input type="text" class="editInput" value="' + value + '">');
                });
                // 수정 완료 버튼 추가
                $row.append('<td><button class="saveEditBtn">저장</button></td>');
            });
            // 저장 버튼 클릭 이벤트 (저장 버튼은 동적으로 추가된 버튼이므로 .on() 사용)
            $('.exam_List').on('click', '.saveEditBtn', function() {
                // 수정된 데이터를 가져와서 활용 (여기서는 각 input 값을 다시 해당 td에 넣어줌)
                var $row = $(this).closest('tr');
                var $cells = $row.find('td');
                $cells.each(function() {
                    var $cell = $(this);
                    var value = $cell.find('.editInput').val();
                    $cell.html(value);
                });
                // 저장 완료 버튼 제거
                $row.find('.saveEditBtn').remove();
            }); */
            
            
            
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
            
            function scoreEdit() {
				$(".exam_List").find("input").prop('readonly', false);
				
			}
            
            

            
            
        });
    </script>
</body>
</html>
