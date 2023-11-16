<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   Calendar calendar = Calendar.getInstance();
   int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
   LocalDate date = LocalDate.now(); 
   int monthNow = date.getMonthValue();
   int yearNow = date.getYear();
   /* LocalDate date = new LocalDate();
   date. */
%>
<!-- partial:partials/_header.html -->
<%@include file="/WEB-INF/views/include/_header.jsp" %>
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
        
        .memoBtn {
          display: none; 
      }

      .memoBtn.show {
          display: block; 
      }
        
        /* #cell_student1_12 {position:relative} */
        /* .memo {display:none;position:absolute;right:-101px;top:-101px;width:100px;height:100px;border:1px solid #aaa;background-color:#fff;} */
        /* .memoTextarea {display:none;position:absolute;right:-101px;top:-108px;width:100px;height:100px;border:2px solid #aaa;background-color:#f1faee;}
        .memoBtn{display:block;position:absolute;top:0;right:0;width:3px;height:3px;z-index:100} */
    </style>
    
    <script>
        
    </script>
</head>
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
              <h3 class="page-title">Attendance management</h3>
            </div>
            
             <div class="row">
               <div class="col-12 grid-margin stretch-card">
                   <div class="card">
                     <div class="card-body">
                       <h4 class="card-title">classes</h4>
                       <p class="card-description">choose the class of which you want to check the attendance</p>
                       <table class="form-inline">
                         <tr class="classList">

                    </tr>
                         <!-- <button type="submit" class="btn btn-primary mb-2" id="searchBtn">검색</button> -->
                       </table>
                     </div>
                   </div>
                 </div>
                 
               <div class="col-md-6 grid-margin stretch-card">
                   <div class="card">
                     <div class="card-body">
                       <h4 class="card-title">Attendance Sheet</h4>
                       <p class="card-description">attend/late/absent/leave early</p>  
                  <form class="studentsList">
                      <table>
                          <tr>
                             <th>ID</th>
                              <th>Name</th>
                              <c:forEach var="day" begin="1" end="<%=daysInMonth %>">
                                  <th>${day}</th>
                              </c:forEach>
                          </tr>
                          <tr >                              
                          </tr>
                      </table>
                  </form>
                     </div>
                   </div>
                 </div>
                </div>
             </div>
          </div>
       </div>
     </div>
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
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="/js/classListsByLogin.js"></script>
<script type="text/javascript">

function statusChange(cell) {
   var cellParts = cell.id.split("_");
   var s_id = cellParts[0];
   var year = cellParts[1];
   var month = cellParts[2];
   var date = cellParts[3];
   
   var isoDateString = new Date(year, month - 1, day).toISOString();
    
   var a_status = $(cell).children('span').text();
   
   updateStat({
        s_id: studentName,
        a_date: isoDateString, 
        a_status: cell.className
    }, function(response) {
         alert('successfully updated');
        console.log(a_date.toLocaleDateString());
    }, function() {
       alert('update failed');
        console.error('Error updating status');
    });

    switch (cell.className) {
        case 'white':
            cell.className = 'blue';
            $(cell).children('span').text('Attend');
            console.log(cell); //test
            break;
        case 'blue':
            cell.className = 'orange';
            $(cell).children('span').text('Late');
            break;
        case 'orange':
            cell.className = 'red';
            $(cell).children('span').text('Absent');
            break;
        case 'red':
            cell.className = 'purple';
            $(cell).children('span').text('Leave early');
            break;
        case 'purple':
            cell.className = 'white';
            $(cell).children('span').text('');
            break;
        default:
            break;
    }
}

$(document).ready(function () {
    var classListTR = $(".classList");
    var t_id = 1;
    console.log(t_id);

    attendanceService.getClassList({ t_id: t_id },
        function (list) {
            var str = "";
            var daysInMonth = <%= daysInMonth %>;
         var monthNow = <%= monthNow %>;
         var yearNow = <%= yearNow %>;
            for (var i = 0, len = list.length || 0; i < len; i++) {
                str += "<td data-list='" + list[i].class_name + "' onclick='showStudentList(\"" + list[i].class_name + "\")'>" + list[i].class_name + "</td>";
            }
            classListTR.html(str);
        });

    function showStudentList(class_nameValue) {
        console.log(class_nameValue);
        attendanceService.getStudentList({class_name: class_nameValue}, function(students){
            var studentsList = $('.studentsList');
            studentsList.empty();

            var str = '';

            students.forEach(function(student){
                str += '<tr class="' + student.s_id + '">';
                str += '<td class="readable">' + student.s_name;
                str += "<button class='memoBtn'></button></td>";

                for (var i = 1; i <= daysInMonth; i++){
                    var cellId = student.s_id + "_" + yearNow + "_" + monthNow + "_" +i;
                    str += '<td id="' + cellId + '" class="white" onclick="statusChange(this)"></td>';
                    
                }
                str += '</tr>';
            });
            studentsList.append(str);
        });

        $('.readable').on('click', function(e){
            console.log("readable clicked");
            e.stopPropagation();
            var s_id = $(this).closest('tr').attr('class');
            $(this).find(".memoBtn").toggle();
            var sInfoList = $(this).next().find(".memoBtn");
            sInfoList.empty();

            attendanceService.readInfo({s_id: s_id}, function(student){
                student.forEach(function(student){
                    var str = '<div>'+
                        '<div>' + student.s_school + '</div>' +
                        '<div>' + student.s_phone + '</div></div>';
                    sInfoList.append(str);
                });
            });
        });
    }
});
</script>
      
   </body>
</html>

<%-- <table class="studentsList">
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
           <td></td>
           <c:forEach var="cellForEachDate" begin="1" end="<%=daysInMonth %>"> 
              <td></td>
          </c:forEach>
        </tr> 
   </table>
 --%>