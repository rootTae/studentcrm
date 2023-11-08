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
                    <th>학교</th>
                    <th>전화번호</th>
                </tr>
            </thead>
            <tbody class="studentsList" id="studentTableBody">
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
            <tbody class="scoreList" id="scoreBody">
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
                
                GradesService.getStudentList({s_name: s_nameValue}, function(list){
                    console.log(list);
                    var tableBody = $('#studentTableBody');
                    tableBody.empty();
                    
                    list.forEach(function(student) {
                        var row = $('<tr>');
                        row.append($('<td>').text(student.s_id));
                        row.append($('<td>').text(student.s_name));
                        row.append($('<td>').text(student.s_gender));
                        row.append($('<td>').text(student.s_school));
                        row.append($('<td>').text(student.s_phone)); 
                        tableBody.append(row);
                    });
                });
            });

            $(document).on('click', '#studentTableBody tr', function() {
                var s_id = $(this).find('td:first').text();
                var s_name = $(this).find('td:nth-child(2)').text();
                console.log(s_id);
                console.log(s_name);

                GradesService.getScoreList({s_id: s_id, s_name: s_name}, function(List) {
                    console.log(List);
                    var examList = $('#scoreBody');
                    examList.empty();
                    
                    

                      
                });
            });
        });
    </script>
</body>
</html>
