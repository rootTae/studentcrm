<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	Calendar calendar = Calendar.getInstance();
	int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
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
    </style>
    
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var cells = document.querySelectorAll('td');
            
            cells.forEach(function(cell) {
                cell.addEventListener('click', function() {
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
        });
    </script>
</head>
<body>
		
		
	<div>
    	<ul class="classList">

		</ul>
    </div>
		
		
	 <table>
       <tr>
            <th>Name</th>
            <c:forEach var="day" begin="1" end="<%=daysInMonth %>">
                <th>${day}</th>
            </c:forEach>
        </tr>
       <tr class="studentsList">
           <%-- <c:forEach var="student" items="${studentsList }">
           	   
           </c:forEach> --%>
           <td>${student.s_name}</td>
           <c:forEach var="cellForEachDate" begin="1" end="<%=daysInMonth %>"> 
	           <td class="white"></td>
	       </c:forEach>
       </tr>
   </table>
		
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="/js/classListsByLogin.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    var classListUL = $(".classList");
    var t_id = 1;
    console.log(t_id);

    //attendanceService.getList({t_id: 't_id'},
    attendanceService.getList({t_id: t_id },
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
                        if (studentList && studentList.length > 0) {
                            var str = "";
                            for (var i = 0, len = studentList.length; i < len; i++) {
                                str += "<tr><td>" + studentList[i].s_name + "</td>";
                                for (var j = 1; j <= daysInMonth; j++) {
                                    str += "<td class='white'></td>";
                                }
                                str += "</tr>";
                            }
                            $(".studentsList").html(str);
                        } else {
                            console.log("Empty student list");
                          
                        }
                    },
                    error: function () {
                        console.log("Error fetching student list:");
                    }
                });
            });
        },
        function () {
            console.log("Error fetching class list:");
        }
    );
});


</script>



		
	</body>
</html>


