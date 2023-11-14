<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	Calendar calendar = Calendar.getInstance();
	int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	/* LocalDate date = new LocalDate();
	date. */
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        table {
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
            cursor: pointer;
        }

        th {
            background-color: #f2f2f2;
        }

        .white {
            background-color: #ffffff;
        }

        .blue {
            background-color: #3498db;
            color: #ffffff;
        }

        .orange {
            background-color: #e67e22;
            color: #ffffff;
        }

        .red {
            background-color: #e74c3c;
            color: #ffffff;
        }

        .purple {
            background-color: #9b59b6;
            color: #ffffff;
        }
        #cell_student1_12 {position:relative}
        .aaa {display:none;position:absolute;width:100px;height:100px}
        .memoBtn{position:absolute;top:0;right:0;width:3px;height:3px;}
        .memoBtn:hover .aaa {display:block}
    </style>
    
    <script>
        
    </script>
</head>
<body>
		
		
	<div>
    	<ul class="classList">

		</ul>
    </div>
		
		
	 <table class="studentsList">
       <tr> 
           <th>Name</th>
            <c:forEach var="day" begin="1" end="<%=daysInMonth %>">
                <th>${day}</th>
            </c:forEach> 
       </tr>
       <tr class="studentsList">
           <c:forEach var="student" items="${studentsList }">
           	   
           </c:forEach> 
           <td>${student.s_name}</td>
           <c:forEach var="cellForEachDate" begin="1" end="<%=daysInMonth %>"> 
	           <td></td>
	       </c:forEach>
        </tr> 
   </table>
		
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="/js/classListsByLogin.js"></script>
<script type="text/javascript">

function statusChange(cell) {
	
    switch(cell.className) {
	    case 'white':
	        cell.className = 'blue';
	        cell.textContent = 'Attend';
	        sendStatusToServer(cell, 'Attend');
	        break;
	    case 'blue':
	        cell.className = 'orange';
	        cell.textContent = 'Late';
	        sendStatusToServer(cell, 'Late');
	        break;
	    case 'orange':
	        cell.className = 'red';
	        cell.textContent = 'Absent';
	        sendStatusToServer(cell, 'Absent');
	        break;
	    case 'red':
	        cell.className = 'purple';
	        cell.textContent = 'Early Dismissal';
	        sendStatusToServer(cell, 'Early Dismissal');
	        break;
	    case 'purple':
	        cell.className = 'white';
	        cell.textContent = '';
	        sendStatusToServer(cell, ''); 
	        break;
	    default:
	        break;
  }
};
    
function sendStatusToServer(cell, status) {
    // Get necessary data from the cell, e.g., student id, date, etc.
    var cellId = cell.id; // Assuming the cell id is in the format "cell_{studentId}_{date}"
    var studentId = cellId.split('_')[1];
    var date = cellId.split('_')[2];

    // Prepare the data to be sent to the server
    var data = {
        s_id: studentId,
        a_date: date,
        a_status: status
    };

    // Use Ajax to send the data to the server
    $.ajax({
        url: '/attendance/' + s_id +'/' + a_date,
        method: 'PUT', // Assuming you are using a PUT request
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
            console.log('Status sent to server successfully');
            // Handle the response if needed
        },
        error: function(error) {
            console.error('Error sending status to server:', error);
            // Handle the error if needed
        }
    });
}

$(document).ready(function () {
    var classListUL = $(".classList");
    var t_id = 1;
    console.log(t_id);

    
    attendanceService.getClassList({ t_id: t_id },
        function (list) {
            var str = "";
            var daysInMonth = <%= daysInMonth %>

            for (var i = 0, len = list.length || 0; i < len; i++) {
                str += "<li data-list='" + list[i].class_name + "'>" + list[i].class_name + "</li>";
            }
            classListUL.html(str);

            $(".classList").on("click", "li", function () {
                var clickedClassName = $(this).data("list");
                console.log(clickedClassName);

                $.ajax({
                    url: '/attendance/studentlist/' + clickedClassName,
                    method: "GET",
                    success: function (studentList) {
                        var str = "<tr><th>Name</th>"; // name column

                        for (var i = 1; i <= daysInMonth; i++) {
                            str += "<th>" + i + "</th>";
                        }
                        str += "</tr>";

                        if (studentList && studentList.length > 0) {
                            for (var i = 0, len = studentList.length; i < len; i++) {
                                str += "<tr class='students'><td>" + studentList[i].s_name + "</td>";
                                for (var j = 1; j <= daysInMonth; j++) {
                                	var cellId = "cell_" + studentList[i].s_name + "_" + j;
                                	//console.log(cellId);
                                    str += "<td id='" + cellId + "' class='white' onclick='statusChange(this)'>";
                                    str += "<button class='memoBtn'></button><div class='aaa'>텍스트 넣을곳</div></td>";
                                }
                                str += "<td><input type='submit' value='submit'></td></tr>";
                            }
                        } else {
                            console.log("Empty student list");
                            str += "<tr><td></td>";
                            for (var j = 1; j <= daysInMonth; j++) {
                                str += "<td></td>";
                            }
                            str += "</tr>";
                        }

                        $(".studentsList").html(str); // show result
                    },
                    error: function () {
                        console.log("Error fetching student list:");
                    }
                });
                /* let cells = $(".studentsList");
                console.log(cells); */    
            });
        },
        function () {
            console.log("Error fetching class list:");
        }
    );
    $(".studentsList td").on("click", function () {
        statusChange(this);
    });
    /* $(".studentsList").on("click", "td", function () {
        var clickedCell = $(this);
        
        statusChange(clickedCell[0]); // 첫 번째 요소를 전달 (JavaScript 객체로 변환)
    }); */
   
});


/* document.addEventListener("DOMContentLoaded", function () {
    var cells = document.querySelectorAll('td');
    
    cells.forEach(function(cell) {
        cell.addEventListener('click', function() {
        	console.log("Clicked cell: ", cell.id);
            switch(cell.className) {
                case 'white':
                    cell.className = 'blue';
                    cell.textContent = 'Attend';
                    break;
                case 'blue':
                    cell.className = 'orange';
                    cell.textContent = 'Late';
                    break;
                case 'orange':
                    cell.className = 'red';
                    cell.textContent = 'Absent';
                    break;
                case 'red':
                    cell.className = 'purple';
                    cell.textContent = 'Early Dismissal';
                    break;
                case 'purple':
                    cell.className = 'white';
                    cell.textContent = '';
                    break;
                default:
                    break;
            }
        });
    });
}); */
</script>
		
	</body>
</html>


