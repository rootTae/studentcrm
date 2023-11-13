<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information</title>
</head>
<body>
    <h3>학생 검색</h3>
    <form id="searchForm" method="post">
        <label for="s_name">이름:</label>
        <input type="text" id="s_name" name="s_name" required>
        <button type="submit">Search</button>
    </form>
    
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
			<tbody class="studentList">

			
			</tbody>
        </table>   
    </div>
    
    <div>
        <h3>Student Exam List</h3>
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

			
			</tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/demo/grades.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
        	
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
                        studentList.append(str);//ul태그는 li을 여러개 받기때문에 사용
        			});
                    
                });
            });
            
        });

       
            $(".studentList").on('click', 'td', function(e) {
				
            var s_id = ($(this).parent().find('td:first-child').text());
            var s_name = ($(this).parent().find('td:nth-child(2)').text());
            	
           
            	
              GradesService.getScoreList({s_name: s_name, s_id: s_id}, function(score) {
            	 // console.log(score);
            	  
            	  score.forEach(function(score){     	
					 
            	  score.avgScore=((score.korScore+ score.engScore+score.mathScore)/3).toFixed(1);
                 
            	  GradesService.SubjectsTotalAvg({grades : score},function(e){
            		  //console.log(grades);
            	  });
            	  
                });
            	  var scoreList = $('.scoreList');
            	  scoreList.empty();
            	  
            	  score.forEach(function (score) {
                      var str = '<tr>' +
                          '<td>' + score.s_id + '</td>' +
                          '<td>' + score.s_name + '</td>' +
                          '<td>' + score.e_name+ '</td>' +
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
            
            $(".scoreList").on('click', 'tr', function(e) {
            
            	var score = $(this)
            	
            	 var clickedScore = {
            		        s_id: score.find('td:first-child').text(),
            		        s_name: score.find('td:nth-child(2)').text(),
            		        e_name: score.find('td:nth-child(3)').text(),
            		        e_date: score.find('td:nth-child(4)').text(),
            		        korScore: score.find('td:nth-child(5)').text(),
            		        engScore: score.find('td:nth-child(6)').text(),
            		        mathScore: score.find('td:nth-child(7)').text(),
            		        avgScore: score.find('td:nth-child(8)').text()
            		    };
            	
            	
            	
            });
    </script>
</body>
</html>
