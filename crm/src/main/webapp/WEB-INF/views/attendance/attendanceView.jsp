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
            background-color: #fffcf2;
        }

        .blue {
            background-color: #9bf6ff;
            color: #ffffff;
        }

        .orange {
            background-color: #ffd6a5;
            color: #ffffff;
        }

        .red {
            background-color: #ffadad;
            color: #ffffff;
        }

        .purple {
            background-color: #bdb2ff;
            color: #ffffff;
        }
        /* #cell_student1_12 {position:relative} */
        /* .memo {display:none;position:absolute;right:-101px;top:-101px;width:100px;height:100px;border:1px solid #aaa;background-color:#fff;} */
        /* .memoTextarea {display:none;position:absolute;right:-101px;top:-108px;width:100px;height:100px;border:2px solid #aaa;background-color:#f1faee;}
        .memoBtn{display:block;position:absolute;top:0;right:0;width:3px;height:3px;z-index:100} */
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
           <%-- <c:forEach var="student" items="${studentsList }">
           	   
           </c:forEach> --%> 
           <%-- <td>${student.s_name}</td> --%>
           <td></td>
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
	        $(cell).children('span').text('Attend');
	        console.log(cell);
	        sendStatusToServer(cell, 'Attend');
	        break;
	    case 'blue':
	        cell.className = 'orange';
	        $(cell).children('span').text('Late');
	        sendStatusToServer(cell, 'Late');
	        break;
	    case 'orange':
	        cell.className = 'red';
	        $(cell).children('span').text('Absent');
	        sendStatusToServer(cell, 'Absent');
	        break;
	    case 'red':
	        cell.className = 'purple';
	        $(cell).children('span').text('Leave early');
	        sendStatusToServer(cell, 'Leave early');
	        break;
	    case 'purple':
	        cell.className = 'white';
	        $(cell).children('span').text('');
	        sendStatusToServer(cell, ''); 
	        break;
	    default:
	        break;
  }
};

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
                                    /* str += "<td id='" + cellId + "' class='white'>"; */
                                    /* str += "<button class='memoBtn'></button> ";*/
                                   /*  str += "<div><textarea class='memoTextarea' placeholder='텍스트 넣을 곳'></textarea>"; */
                                    /* str += "</div>"; */
                                    //str += "<button class='memoBtn'></button><div class='memo'>텍스트 넣을곳</div>";
                                    str += "<span></span>";
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
						
                        for (var i = 0; i < studentList.length; i++) {
                            for (var j = 1; j <= daysInMonth; j++) {
                                var cellId = "cell_" + studentList[i].s_name + "_" + j;
                                str += "<style>#" + cellId + "{position:relative;}</style>";
                            }
                        }

                        $(".studentsList").html(str); // show result
                        /* $(".memoBtn").on("click", function(e){
                        	console.log("클릭");
                        	e.stopPropagation(); // 부모인 <div>태그(child를 감싸고 있는)의 action을 자식인 memobtn이 상속받지 않고 독립적으로 행동하게 함.
                            $(this).next().find(".memoTextarea").toggle();
                        	
                            $(".memoTextarea").on("click", function(e) {
                                e.stopPropagation(); // .memoTextarea에서의 클릭 이벤트가 전파되지 않도록 함.
                            });
                         }); */
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


