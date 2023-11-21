attendanceView.jsp
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
  /*  int daybefore = date.getDayOfMonth();
   int dayNow = (daybefore<10) ? '0' + daybefore : daybefore; */
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
       /*  table {
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
            cursor: pointer;
        }
        
        td {
           background-color: #fffcf2;
        }

        th {
            background-color: #f2f2f2;
        } */

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
        
        /* .memoBtn {
          display: none; 
         }

         .memoBtn.show {
          display: block; 
         } */
        
         .memo > div {display:none; width:100px; padding: 10px; padding-bottom: 0px; box-sizing: border-box;} /* 안됨 */
         .memo div p {line-height: 10px; font-weight:normal;}
         .memo {font-weight: bold;}
    
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
               <div class="col-7 grid-margin stretch-card">
                   <div class="card">
                     <div class="card-body">
                       <h4 class="card-title">classes</h4>
                       <p class="card-description">choose the class for which you want to check the attendance</p>
                       <table class="form-inline table">
                         <tr class="classList">

                          </tr>
                         <!-- <button type="submit" class="btn btn-primary mb-2" id="searchBtn">검색</button> -->
                       </table>
                     </div>
                   </div>
                 </div>
              <div class="col-lg-5 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Student Attendance chart</h4>
                    <canvas id="doughnutChart" style="height: 222px; display: block; width: 445px;" width="445" height="222" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
               <div class="col-md-12 grid-margin stretch-card">
                   <div class="card">
                     <div class="card-body">
                       <h4 class="card-title">Attendance Sheet</h4>
                       
                       <button id="yearDropdownBtn">Select Year</button>
                  <!-- 드롭다운 메뉴 -->
                  <select id="yearDropdown" style="display: none;">
                      <!-- 1부터 12까지의 옵션 추가 -->
                      <option value="2021">2021</option>
                      <option value="2022">2022</option>
                      <option value="2023">2023</option>
                      <option value="2024">2024</option>
                      <option value="2025">2025</option>
                      <option value="2026">2026</option>
                  </select>
                       
                       <button id="monthDropdownBtn">Select Month</button>
                  <!-- 드롭다운 메뉴 -->
                  <select id="monthDropdown" style="display: none;">
                      <!-- 1부터 12까지의 옵션 추가 -->
                      <option value="1">January</option>
                      <option value="2">February</option>
                      <option value="3">March</option>
                      <option value="4">April</option>
                      <option value="5">May</option>
                      <option value="6">June</option>
                      <option value="7">July</option>
                      <option value="8">August</option>
                      <option value="9">September</option>
                      <option value="10">October</option>
                      <option value="11">November</option>
                      <option value="12">December</option>
                  </select>
                  <button type="button" class="btn btn-outline-primary btn-icon-text submitBtn">
                            <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>   
                       <p class="card-description">attend/late/absent/leave early</p>  
                        <form>
                            <table class="table">
                                <tr>
                                   <th>ID</th>
                                    <th>Name</th>
                                    <c:forEach var="day" begin="1" end="<%=daysInMonth %>">
                                        <th>${day}</th>
                                    </c:forEach>
                                </tr>
                                
                                <tbody class="studentsList">
                                </tbody>
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
 <!-- container-scroller -->
 <!-- plugins:js -->
 <script src="/assets/vendors/js/vendor.bundle.base.js"></script>
 <!-- endinject -->
 <!-- Plugin js for this page -->
 <!-- End plugin js for this page -->
 <!-- inject:js -->
 <script src="/assets/js/chart.js"></script>
 <script src="/assets/js/off-canvas.js"></script>
 <script src="/assets/js/hoverable-collapse.js"></script>
 <script src="/assets/js/misc.js"></script>
 <script src="/assets/js/settings.js"></script>
 <script src="/assets/js/todolist.js"></script>
 <!-- endinject -->
 <!-- Custom js for this page -->
 <!-- End custom js for this page -->
 
 <!-- 여기에 스크립트 입력 -->
<!-- <script src="https://code.jquery.com/jquery.js"></script> -->
<script type="text/javascript" src="/js/classListsByLogin.js"></script>
<script type="text/javascript">

document.getElementById('monthDropdownBtn').addEventListener('click', function() {

    var dropdown = document.getElementById('monthDropdown');
    dropdown.style.display = (dropdown.style.display === 'none' || dropdown.style.display === '') ? 'block' : 'none';
});

// 옵션을 선택했을 때의 이벤트 처리
document.getElementById('monthDropdown').addEventListener('change', function() {
    var selectedMonth = this.value;
    alert('Selected Month: ' + selectedMonth);
    // 여기서 선택된 월에 대한 작업을 수행할 수 있습니다.
});

document.getElementById('yearDropdownBtn').addEventListener('click', function() {

    var dropdown = document.getElementById('yearDropdown');
    dropdown.style.display = (dropdown.style.display === 'none' || dropdown.style.display === '') ? 'block' : 'none';
});

// 옵션을 선택했을 때의 이벤트 처리
document.getElementById('yearDropdown').addEventListener('change', function() {
    var selectedYear = this.value;
    alert('Selected Year: ' + selectedYear);
    // 여기서 선택된 월에 대한 작업을 수행할 수 있습니다.
});

function statusChange(cell) {
   var cellParts = cell.id.split("_");
   var s_id = cellParts[0];
   var year = cellParts[1];
   var month = cellParts[2];
   var date = cellParts[3];
   
   /* var isoDateString = new Date(year, month - 1, date).toISOString(); */
   var isoDateString = year+"-"+month+"-"+date;
   
/*    var requested = { 
          s_id: s_id,
           a_date: isoDateString, 
           a_status: a_status}; */
   
   console.log("check"+a_status);
   
   /* updateStat({
        s_id: studentName,
        a_date: isoDateString, 
        a_status: cell.className
    }, function(response) {
         alert('successfully updated');
        console.log(a_date.toLocaleDateString());
    }, function() {
       alert('update failed');
        console.error('Error updating status');
    }); */
   let prevStat = $(cell).children('span').text();
    console.log("prevStat");
    console.log(prevStat);
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
            cell.className = 'blue';
            $(cell).children('span').text('Attend');
            break;
        default:
            break;
    }
   var a_status = $(cell).children('span').text();
   console.log("a_status:"+a_status);
   var requested = { 
          s_id: s_id,
           a_date: isoDateString, 
           a_status: a_status};
    
   if(a_status == 'Attend' && prevStat == ''){
      console.log('인서트 실행');
      console.log($(cell).find(".stat").text());
         attendanceService.insertStat(requested);
         //return;
   } else {
      console.log('업데이트 실행');
         attendanceService.updateStat(requested);
         //return;
   } 
       
      //console.log("needed");
      //attendanceService.updateStat(requested)
      //console.log(a_status);
}

function showStudentList(class_nameValue) {
    console.log("showStudentList");
    var daysInMonth = <%= daysInMonth %>;
    var yearNow = <%= yearNow %>;
    var monthNow = <%= monthNow %>;
    
    attendanceService.getStudentList({class_name: class_nameValue}, function(students){
        var studentsList = $('.studentsList');
        /* studentsList.empty(); */
      studentsList.empty();
        var str = '';
      console.log(students);
        students.forEach(function(student){
            str += '<tr>';
            str += '<td class="' + student.s_id + '"><button class="showStat" style="width: 1px; height: 8px; border-radius: 50%; border: 1px solid #000; display: inline-block; vertical-align: middle;">&#8226;</button>' + student.s_id + '</td>';
                   
            //str += '<td class="' + student.s_id + '">'+student.s_id+'<div id="a_chart"></div></td>';
            str += '<td class="memo">' + student.s_name+'<div></div></td>';

            for (var i = 1; i <= daysInMonth; i++){
                var cellId = student.s_id + "_" + yearNow + "_" + monthNow + "_" + ((i<10) ? '0' + i : i);
                str += '<td id="' + cellId + '" class="white" onclick="statusChange(this)"><span class="stat"></span></td>';   
            }
            str += '</tr>';
        });
        studentsList.append(str);
        memo();
       // existedAttendanceSheet(); 
    });
    
    $('.submitBtn').on('click', function(e){
       var firstDayInMonth = "01";
        var daysInMonth = <%= daysInMonth %>;
        var year = $('#yearDropdown').val();
        var months = $('#monthDropdown').val();
        console.log('Selected Year:', year);
        var month = ((months < 10) ? '0' + months : months);
        console.log('Revised Month:', month);

        attendanceService.getStudentList({ class_name: class_nameValue }, function (students) {
            var studentsList = $('.studentsList');
            studentsList.empty();
            var str = '';
            console.log(students);

            students.forEach(function (student) {
                str += '<tr>';
                str += '<td class="' + student.s_id + '"><button class="showStat" style="width: 1px; height: 8px; border-radius: 50%; border: 1px solid #000; display: inline-block; vertical-align: middle;">&#8226;</button>' + student.s_id + '</td>';
                str += '<td class="memo">' + student.s_name + '<div></div></td>';

                for (var i = 1; i <= daysInMonth; i++) {
                    var cellId = student.s_id + "_" + year + "_" + month + "_" + ((i < 10) ? '0' + i : i);
                    str += '<td id="' + cellId + '" class="white" onclick="statusChange(this)"><span class="stat"></span></td>';
                    
                    (function (s_id, a_date) {
                        attendanceService.insertStat({ s_id: s_id, a_date: a_date }, function (dailyStatus) {
                            console.log('Daily Status:', dailyStatus); 
                        });
                    })(student.s_id, year + "-" + month + "-" + ((i < 10) ? '0' + i : i));
                }

                str += '</tr>';
            });

            studentsList.append(str);
            memo();
        });
    })
    
    $(document).ready(function () {
        // 학생 목록에 대한 이벤트 등록
        $('.studentsList').on('click', '.showStat', function(e){
            e.stopPropagation();
            var cellId = $(this).next().attr('id');
            console.log(cellId);
            var parts = cellId.split("_");

            var s_id = parts[0];
            var year = parts[1];
            var month = parts[2];
            var lastDay = new Date(year, month, 0);

            console.log("마지막 날짜: "+lastDay);

            var firstDayOfMonth = year+"-"+month+"-"+"01";
            var lastDayOfMonth = year+"-"+month+"-"+ lastDay;
            attendanceService.getMonthlyAttendance({
                s_id:s_id, 
                firstDayOfMonth:firstDayOfMonth, 
                lastDayOfMonth:lastDayOfMonth
            }, function(statusList){
                console.log(s_id);
                console.log(firstDayOfMonth);
                console.log(statusList);
                
            });
        });

        // 초기 학생 목록 로드 및 이벤트 등록
        showStudentList();
    });

    // 학생 목록을 업데이트할 때마다 호출되는 함수
    function showStudentList() {
        var daysInMonth = <%= daysInMonth %>;
        var yearNow = <%= yearNow %>;
        var monthNow = <%= monthNow %>;

        // 새로운 학생 목록에 대한 이벤트 등록
        $('.studentsList').on('click', '.showStat', function(e){
            e.stopPropagation();
            var cellId = $(this).next().attr('id');
            console.log(cellId);
            var parts = cellId.split("_");

            var s_id = parts[0];
            var year = parts[1];
            var month = parts[2];
            var lastDay = new Date(year, month, 0);

            console.log("마지막 날짜: "+lastDay);

            var firstDayOfMonth = year+"-"+month+"-"+"01";
            var lastDayOfMonth = year+"-"+month+"-"+ lastDay;
            attendanceService.getMonthlyAttendance({
                s_id:s_id, 
                firstDayOfMonth:firstDayOfMonth, 
                lastDayOfMonth:lastDayOfMonth
            }, function(statusList){
                console.log(s_id);
                console.log(firstDayOfMonth);
                console.log(statusList);
            });
        });
    }
   function memo() {
       
       $('.memo').on('click', function(e){
           console.log("readable clicked");
           e.stopPropagation();
           var s_id = $(this).prev().attr('class');
           
           $(this).find("div").toggle('hidden');

           var sInfoList = $(this).find("div");
           sInfoList.empty(); 
   
           attendanceService.readInfo({s_id: s_id}, function(student){
              console.log(student.s_school);
              console.log(student.s_phone);
                var str = '<div>'+
                    '<p>' + student.s_school + '</p>'+
                    '<p>' + student.s_phone + '</p></div>';
              console.log(str);
                    
                sInfoList.append(str);
           });
       });
    }
}

$(document).ready(function () {
   var a_status = "";
    var classListTR = $(".classList");
    var t_id = 1;
    //console.log("classlist");
   //console.log(t_id);

    attendanceService.getClassList({ t_id: t_id },
        function (list) {
            var str = "";
            var daysInMonth = <%= daysInMonth %>;
            //console.log(daysInMonth);
         var monthNow = <%= monthNow %>;
         var yearNow = <%= yearNow %>;
            for (var i = 0, len = list.length || 0; i < len; i++) {
                str += "<td data-list='" + list[i].class_name + "' onclick='showStudentList(\"" + list[i].class_name + "\")'>" + list[i].class_name + "</td>";
            }
            classListTR.html(str);
        });
   
    showStudentList
});
</script>
<!-- plugins:js -->
<script src="/assets/vendors/chart.js/Chart.min.js"></script>
<script src="/assets/vendors/js/vendor.bundle.base.js"></script>
<script src="/assets/js/chart.js"></script>
<script src="/assets/js/off-canvas.js"></script>
<script src="/assets/js/hoverable-collapse.js"></script>
<script src="/assets/js/misc.js"></script>
<script src="/assets/js/settings.js"></script>
<script src="/assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<!-- End custom js for this page -->   
   </body>
</html>
<%--> $('.studentList').on('click', 'readable', function(e){
       e.stopPropagation();
       
       $('.memoBtn').hide();
       var memoBtn = $(this).find('.memoBtn');
       memoBtn.show();
       
    }); 
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
           <td></td>
           <c:forEach var="cellForEachDate" begin="1" end="<%=daysInMonth %>"> 
              <td></td>
          </c:forEach>
        </tr> 
   </table>
   
      <%--  function existedAttendanceSheet() {
        var firstDayInMonth = "01";
        var daysInMonth = <%= daysInMonth %>;
        var year = $('#yearDropdown').val();
        var months = $('#monthDropdown').val();
        console.log('Selected Year:', year);
        var month = ((months < 10) ? '0' + months : months);
        console.log('Revised Month:', month);

        attendanceService.getStudentList({ class_name: class_nameValue }, function (students) {
            var studentsList = $('.studentsList');
            studentsList.empty();
            var str = '';
            console.log(students);

            students.forEach(function (student) {
                str += '<tr>';
                str += '<td class="' + student.s_id + '"><button class="showStat" style="width: 1px; height: 8px; border-radius: 50%; border: 1px solid #000; display: inline-block; vertical-align: middle;">&#8226;</button>' + student.s_id + '</td>';
                str += '<td class="memo">' + student.s_name + '<div></div></td>';

                for (var i = 1; i <= daysInMonth; i++) {
                    var cellId = student.s_id + "_" + year + "_" + month + "_" + ((i < 10) ? '0' + i : i);
                    str += '<td id="' + cellId + '" class="white" onclick="statusChange(this)"><span class="stat"></span></td>';
                    
                    (function (s_id, a_date) {
                        attendanceService.insertStat({ s_id: s_id, a_date: a_date }, function (dailyStatus) {
                            console.log('Daily Status:', dailyStatus); 
                        });
                    })(student.s_id, year + "-" + month + "-" + ((i < 10) ? '0' + i : i));
                }

                str += '</tr>';
            });

            studentsList.append(str);
            memo();
        });
    } --%>
    <%-- function existedAttendanceSheet() {
       
       var firstDayInMonth = "01";
       var daysInMonth = <%= daysInMonth %>;
        var year = $('#yearDropdown').val();
        var months = $('#monthDropdown').val();
        console.log('Selected Year:', year);
        var month = ((months<10) ? '0' + months : months);
        console.log('Revised Month:', month);
        
        for(var i = 1; i<=daysInMonth; i++ ){
           var s_id = i;
           var a_date = year + "-" + month + "-" + ((i<10) ? '0' + i : i);
           attendanceService.insertStat({s_id: s_id, a_date:}
           , function(dailyStatus){
              console.log('Daily Status:', dailyStatus);
           });
        }
    } 
     --%>
   
 --%>