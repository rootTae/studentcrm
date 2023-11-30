<%@page import="org.studentcrm.crm.command.TeacherVO"%>
<%@page import="java.util.Arrays"%>
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
   HttpSession session1 = request.getSession();
   TeacherVO teacher = (TeacherVO)session.getAttribute("teacher");  
   Integer t_id = (Integer)teacher.getT_id();
   
   
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
 
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
        
         .memo > div {display:none; width:100px; padding: 10px; padding-bottom: 0px; box-sizing: border-box;} /* 안됨 */
         .memo div p {line-height: 10px; font-weight:normal;}
         .memo {font-weight: bold;}
         
         select {margin-right:10px;border-radius:2px;background-color:transparent;color:#fff;font-size:0.9rem;}
         select option {color:#000}
		.custom-swal-popup {
		    border-radius: 20px;
		}
		
		.custom-swal-title {
		    color: #ff006e;
		    font-size: 24px;
		    font-weight: bold;
		}
    </style>
    
    <script>
        
    </script>
</head>
<!-- partial -->
  <body>
  <audio id="musicPlayer" style="position: absolute" controls >
    <source src="/music/carol.mp3" type="audio/mp3">   
</audio>
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
              <h3 class="page-title">출결 정보 관리</h3>
              <button class="mdi mdi-file-music" id="playButton"></button>
            </div>
            
             <div class="row">
               <div class="col-7 grid-margin stretch-card">
                   <div class="card">
                     <div class="card-body">
                       <h4 class="card-title">담당 반 명</h4>
                       <p class="card-description">출결체크 할 반을 아래에서 선택하세요.</p>
                       <!-- choose the class for which you want to check the attendance -->
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
                    <h4 class="card-title">학생 출결 차트</h4>
                    <canvas id="doughnutChart" style="display: block; width: 445px;" width="445" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
               <div class="col-md-12 grid-margin stretch-card">
                   <div class="card">
                     <div class="card-body table-responsive">
                       <h4 class="card-title">출석부</h4>
                       <div class="row">
                       <button class="btn btn-primary btn-fw" id="yearDropdownBtn"  style="height:38px; margin-right:10px">년도 선택</button>
                  <!-- 드롭다운 메뉴 -->
		                  <select id="yearDropdown" class="" style="height:38px; display: none;">
		                      <!-- 1부터 12까지의 옵션 추가 -->
		                      <option value="2021">2021</option>
		                      <option value="2022">2022</option>
		                      <option value="2023">2023</option>
		                      <option value="2024">2024</option>
		                      <option value="2025">2025</option>
		                      <option value="2026">2026</option>
		                  </select>
		                       
                     	  <button class="btn btn-primary btn-fw " id="monthDropdownBtn" style="height:38px; margin-right:10px">월 선택</button>
                  <!-- 드롭다운 메뉴 -->
		                  <select id="monthDropdown" style="height:38px; display: none;">
		                      <!-- 1부터 12까지의 옵션 추가 -->
		                      <option value="1">1월</option>
		                      <option value="2">2월</option>
		                      <option value="3">3월</option>
		                      <option value="4">4월</option>
		                      <option value="5">5월</option>
		                      <option value="6">6월</option>
		                      <option value="7">7월</option>
		                      <option value="8">8월</option>
		                      <option value="9">9월</option>
		                      <option value="10">10월</option>
		                      <option value="11">11월</option>
		                      <option value="12">12월</option>
		                  </select>
		                 <button type="submit" class="submitBtn btn btn-primary mb-2 input-btn">검색</button>
                             
                       </div>
                	       <p class="card-description mt-3">출석 : attend/ 지각 : late/ 결석 : absent/ 조퇴 : leave early</p>  
                        <!-- <form>  -->
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
                       <!-- </form>  -->
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
 <!-- inject:js -->
<script src="/assets/vendors/chart.js/Chart.min.js"></script>
<script src="/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- <script src="/assets/js/chartc.js"></script> -->
<script src="/assets/js/off-canvas.js"></script>
<script src="/assets/js/hoverable-collapse.js"></script>
<script src="/assets/js/misc.js"></script>
<script src="/assets/js/settings.js"></script>
<script src="/assets/js/todolist.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

 <!-- endinject -->
 <!-- Custom js for this page -->
 <!-- End custom js for this page -->
 
 <!-- 여기에 스크립트 입력 -->
<!-- <script src="https://code.jquery.com/jquery.js"></script> -->
<script type="text/javascript" src="/js/attendance.js"></script>
<script type="text/javascript">

document.getElementById('monthDropdownBtn').addEventListener('click', function() {

    var dropdown = document.getElementById('monthDropdown');
    dropdown.style.display = (dropdown.style.display === 'none' || dropdown.style.display === '') ? 'block' : 'none';
});


document.getElementById('monthDropdown').addEventListener('change', function() {
    var selectedMonth = this.value;

});

document.getElementById('yearDropdownBtn').addEventListener('click', function() {

    var dropdown = document.getElementById('yearDropdown');
    dropdown.style.display = (dropdown.style.display === 'none' || dropdown.style.display === '') ? 'block' : 'none';
});


document.getElementById('yearDropdown').addEventListener('change', function() {
    var selectedYear = this.value;

});

function statusChange(cell) {
   var cellParts = cell.id.split("_");
   var s_id = cellParts[0];
   var year = cellParts[1];
   var month = cellParts[2];
   var date = cellParts[3];
   
   /* var isoDateString = new Date(year, month - 1, date).toISOString(); */
   var isoDateString = year+"-"+month+"-"+date;
   
   console.log("check"+a_status);
           
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
         attendanceService.insertStat(requested,function(result){
        	 console.log(result);
         });
   } else {
      console.log('업데이트 실행');
         attendanceService.updateStat(requested, function(result){
        	 console.log(result);
         });
   } 
   console.log($(this).find(".stat").text());    
}

function showStudentList(class_nameValue) {
    console.log("showStudentList");
    var daysInMonth = <%= daysInMonth %>;
    var yearNow = <%= yearNow %>;
    var monthNow = <%= monthNow %>;
    
    attendanceService.getStudentList({class_name: class_nameValue}, function(students){
        var studentsList = $('.studentsList');
      studentsList.empty();
        var str = '';
      console.log(students);
        students.forEach(function(student){
            str += '<tr>';
            str += '<td class="' + student.s_id + '"><button class="showStat" style="width: 1px; height: 8px; border-radius: 50%; border: 1px solid #000; display: inline-block; vertical-align: middle;">&#8226;</button>' + student.s_id + '</td>';
            
            str += '<td class="memo">' + student.s_name+'<div></div></td>';

            for (var i = 1; i <= daysInMonth; i++){
                var cellId = student.s_id + "_" + yearNow + "_" + monthNow + "_" + ((i<10) ? '0' + i : i);
                str += '<td id="' + cellId + '" class="white" onclick="statusChange(this)"><span class="stat"></span></td>';   
            }
            str += '</tr>';
        });
        studentsList.append(str);
        memo(); 
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
                str += '<td><button class="showStat" style="width: 1px; height: 8px; border-radius: 50%; border: 1px solid #000; display: inline-block; vertical-align: middle;">&#8226;</button>' + student.s_id + '</td>';
                str += '<td class="memo">' + student.s_name + '<div></div></td>';

                for (var i = 1; i <= daysInMonth; i++) {
                    var cellId = student.s_id + "_" + year + "_" + month + "_" + ((i < 10) ? '0' + i : i);
                    str += '<td id="' + cellId + '" class="white" onclick="statusChange(this)"><span class="stat"></span></td>';
					
                    //console.log(s_id);
                   (function (s_id, a_date, a_status) {
                    	var requested = {
                    		s_id: s_id, 
                    		a_date: a_date,
                    		a_status: a_status
                        }
                    	console.log("희한");
                        console.log(s_id);	
                    	attendanceService.readForUpdate(requested , function (dailyStatus) {
                            console.log('Daily Status:', dailyStatus.a_status);
                            setDailyStatus(dailyStatus);
                            
                        });
                    })(student.s_id, year + "-" + month + "-" + ((i < 10) ? '0' + i : i)); 
					//console.log(student.a_date);
                }
                str += '</tr>';
            });
            //getCntForOtherMonth(dailyStatus);
            studentsList.append(str);
            
            memo();
        });
        
    });
    
    $(document).ready(function () {
    	  	
        $('.studentsList').on('click', '.showStat', function(e){
            e.stopPropagation();
     
            var cellId = $(this).parent().next().next().attr('id');
            console.log(cellId);
            var parts = cellId.split("_");
            console.log("parts : "+parts);

            var s_id = parts[0];
            var year = parts[1];
            var month = parts[2];
            var lastDayIng = new Date(year, month, 0);
            var lastDay = lastDayIng.getDate();
            
            console.log("마지막 날짜: "+lastDay);
            var firstDayOfMonth = year+"-"+month+"-"+"01";
            var lastDayOfMonth = year+"-"+month+"-"+ lastDay;
            
            let data={
                s_id: s_id, 
                firstDayOfMonth: firstDayOfMonth, 
                lastDayOfMonth: lastDayOfMonth
            }
            
            console.log(data); 
            
            attendanceService.getMonthlyAttendance(data, function(statusList){
           
                console.log("attendanceView: GMD");
                console.log(lastDayOfMonth);
                getCntForEachStatus(statusList);
                
            });    
        });
    });
    
    function setDailyStatus(dailyStatus){
    	var a_date = dailyStatus.a_date.replace(/-/g, '_');
   		var cellId = $('#'+dailyStatus.s_id + '_' + a_date); 	
   		var status = dailyStatus.a_status;
   		console.log("setDailyStatus");
   		
   		console.log(cellId);
   		console.log(status);
   		console.log(cellId.html());
   		if(status =='Attend'){
   			$(cellId).removeClass('white').addClass('blue').find('span').text('Attend');	
   		} else if(status ==='Late'){
   			$(cellId).removeClass('white').addClass('orange').find('span').text('Late');
   		} else if(status ==='Absent'){
   			$(cellId).removeClass('white').addClass('red').find('span').text('Absent');
   		} else if(status ==='Leave early'){
   			$(cellId).removeClass('white').addClass('purple').find('span').text('Leave Early');
   		}
    }
    
    function getCntForEachStatus(statusList) {

    	console.log("인자값")
    	console.log(statusList);
    	console.log(statusList[0].a_status);
    	
    	console.log(chartdata);
    	var chartdata = [0, 0, 0, 0];
    	for (let i = 0; i < statusList.length;i++){
    		if(statusList[i].a_status === 'Attend'){
    			chartdata[0] = statusList[i].count;
    		}else if(statusList[i].a_status === 'Late') {
    			chartdata[1] = statusList[i].count;
    		}else if(statusList[i].a_status === 'Absent') {
    			chartdata[2] = statusList[i].count;
    		}else if(statusList[i].a_status === 'Leave early') {
    			chartdata[3] = statusList[i].count;
    		}
    	}
    	
    	if (chartdata[0] < (chartdata[1] + chartdata[2] + chartdata[3])) {
    		Swal.fire({
    	        icon: 'warning',
    	        title: '학생 관리 필요',
    	        html: '현재 출석 상태: 위험! 관리가 필요한 학생입니다.<br><br>',
    	        showCloseButton: true,
    	        showConfirmButton: false,
    	        customClass: {
    	            popup: 'custom-swal-popup',
    	            title: 'custom-swal-title',
    	        }
            }).then((result) => {
                window.location.href = "/consult/consultView";
            });
        }
	    	
    	 var doughnutPieData = {
		    datasets: [{
		        data: chartdata,
		        backgroundColor: [
		         'rgba(155, 246, 255, 0.5)',
		          'rgba(255, 214, 165, 0.5)',
		          'rgba(255, 173, 173, 0.5)',
		          'rgba(189, 178, 255, 0.5)',
		          'rgba(153, 102, 255, 0.5)',
		          'rgba(255, 159, 64, 0.5)'
		        ],
		        borderColor: [
		        'rgba(155, 246, 255, 1)',
		          'rgba(255, 214, 165,1)',
		          'rgba(255, 173, 173, 1)',
		          'rgba(189, 178, 255, 1)',
		          'rgba(153, 102, 255, 1)',
		          'rgba(255, 159, 64, 1)'
		        ],
		      }],

		      labels: [
		        'Attend',
		        'Late',
		        'Absent',
		        'Leave Early'
		      ]
		    }; 
    	
    	 var doughnutPieOptions = {
		    responsive: true,
		    animation: {
		      animateScale: true,
		      animateRotate: true
		    }
		  };

    	 if ($("#doughnutChart").length) {
   		    var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
   		    var doughnutChart = new Chart(doughnutChartCanvas, {
   		      type: 'doughnut',
   		      data: doughnutPieData,
   		      options: doughnutPieOptions
   		    });
   		  }
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
    var t_id = <%= t_id%>;
    document.getElementById('playButton').addEventListener('click', function() {
        musicPlayer.play();
    });
    document.getElementById('playButton').addEventListener('dblclick', function() {
        musicPlayer.pause();
    });
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
   
    
});
</script>
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