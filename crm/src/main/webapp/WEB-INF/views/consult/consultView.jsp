<%@page import="org.studentcrm.crm.command.TeacherVO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/_header.jsp" %>
<%
	LocalDate date = LocalDate.now();
	int dateNow = date.getDayOfMonth();
	int monthNow = date.getMonthValue();
	int yearNow = date.getYear();
	String tday = yearNow + "-" + monthNow + "-" + dateNow;
	

	
	HttpSession session1 = request.getSession();
	TeacherVO teacher = (TeacherVO)session.getAttribute("teacher");  
	Integer t_id = (Integer)teacher.getT_id();


%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
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
          <div class="page-header">
              <h3 class="page-title">상담 정보 관리</h3>
            </div>
         <div class="row">
               <div class="col-5 grid-margin stretch-card">
                  <div class="card">
                       <div class="card-body">
                          <h4 class="card-title">학생 정보 검색</h4>
                           <p class="card-description">학생의 이름 입력해 주세요.</p>
                           <form id="searchForm" method="post" class="form-inline">
                              <input type="text" class="form-control mb-2 mr-sm-2" name="searchS_name" id="searchS_name" required placeholder="학생이름">
                              <button type="submit" class="btn btn-primary mb-2 input-btn" >검색</button>
                             </form>
                      </div>
                    </div>
               </div>
       
              <div class="col-7 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">학생 검색 결과</h4>
                    <div class="table-responsive">
                      <table class="table" id="studentList">
                        <thead>
                          <tr>
                            <th>                         
                            </th>
                          <th hidden>상담 번호</th>
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
                  </div>
                </div>
              </div>
            </div>
            
                        
             <div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">상담 목록</h4>
                    <div class="table-responsive">
                    <div class=text-right>
                    <button type="button" class="btn btn-primary insertbtn" >추가</button>
                    <button type="button" class="btn btn-secondary updatebtn" >수정</button>
                    <button type="button" class="btn btn-info deletebtn" >삭제</button>
                    <button type="button" class="btn btn-primary savebtn" style="display: none">저장</button>
                    <button type="button" class="btn btn-info cancelbtn" style="display: none">취소</button>
                </div>
                      <table class="table" id="consultTable">
                        <thead>
                          <tr>
                            <th>                            
                            </th>
                            <th hidden>상담 번호</th>
                            <th>학생 id</th>
                          <th>학생 이름</th>
                          <th>상담자</th>
                          <th>제목</th>
                          <th>상담 내용</th>
                          <th>상담일</th>
                          </tr>
                        </thead>
                        <tbody class="consultList" id="consultList">
                          
                        </tbody>
                      </table>
                      <!--  Modal -->
					<div class="modal fade" id="consultModal" tabindex="-1" role="dialog" aria-labelledby="consultModalLabel" aria-hidden="true">
					    <div class="modal-dialog" role="document">
					        <div class="modal-content">
					            <div class="modal-header">
					                <h5 class="modal-title" id="consultModalLabel">상담 내용</h5>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                    <span aria-hidden="true">&times;</span>
					                </button>
					            </div>
					            <div class="modal-body" id="modalContent">
					                
					            </div>
					        </div>
					    </div>
					</div>
                    </div>
                  </div>
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


<!-- 여기에 스크립트 입력 -->
<script type="text/javascript" src="/js/consult.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	//지금 데이터 저장
	var tday = new Date();
	var year = tday.getFullYear();
	var month = (tday.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자리로 맞춤
	var day = tday.getDate().toString().padStart(2, '0'); // 날짜를 두 자리로 맞춤
	
	var today = year + '-' + month + '-' + day;
	console.log(today);

	
    let nowconsult_id="";
    <%-- var tday = new Date().toLocaleDateString();
    var today = new Date("<%= tday%>");
    console.log(new Date().toLocaleDateString()); --%>
    let nowsname="";

    var registerList = $('.RegisterList');
    // 버튼 설정
    let addbtn = $(".insertbtn");
    let updatebtn = $(".updatebtn");
    let deletebtn = $(".deletebtn");
    let savebtn = $(".savebtn");
    let cancelbtn = $(".cancelbtn");
   
    nowbtn='';

	// 학생 이름 검색
	$('#searchForm').submit(function(e){
		e.preventDefault();
		var s_name = $('#searchS_name').val();
		console.log("jsp:searchname");
		console.log(s_name);
		getStudentList(s_name);
	});
	
	function getStudentList(s_name){
		consultService.getStudentList({s_name: s_name}, function(student){
			console.log("consultView-getStudentList");
			console.log(student);
			var studentList = $('.studentList');
			studentList.empty();
			
			student.forEach(function(student) {
            	var str = '<tr>' +
                '<td><div class="form-check form-check-muted m-0">'+
                '<label class="form-check-label"><input type="checkbox" class="form-check-input s_checkbox">'+
                '<i class="input-helper"></i></label></div></td>'+  
                	'<td hidden><input type="text" class="form-control is_consult_id" name="is_consult_id" readonly value="'+ student.consult_id +'"></td>' +
                	'<td hidden><input type="text" class="form-control is_t_id" name="is_t_id" readonly value="'+ student.t_id +'"></td>' +
                	'<td hidden><input type="text" class="form-control is_t_name" name="is_t_name" readonly value="'+ student.t_name +'"></td>' +
                	'<td><input type="text" class="form-control is_s_id" name="is_s_id" readonly value="'+ student.s_id +'"></td>' +
                    '<td><input type="text" class="form-control is_s_name" name="is_s_name"  readonly value="'+ student.s_name +'"></td>' +
                    '<td><input type="text" class="form-control is_s_gender" name="is_s_gender"  readonly value="'+ student.s_gender +'"></td>' +
                    '<td><input type="text" class="form-control is_s_phone" name="is_s_phone" readonly value="'+ student.s_phone +'"></td>' +
                    '<td><input type="text" class="form-control is_s_school" name="is_s_school" readonly value="'+ student.s_school +'"></td>' +
                    '<td><input type="text" class="form-control is_s_grade" name="is_s_grade" readonly value="'+ student.s_grade + '"></td>' +
                 '</tr>';        
                studentList.append(str);
            });
        });
    
		};
	$(document).on('click', '.s_checkbox', function(){
		$(".s_checkbox").prop('checked', false);
		$(this).prop('checked', true);
		
		var consultList = $('.consultList');
		consultList.empty();
		
		let checkedBox = $('.s_checkbox:checked');
		
		if(checkedBox){
			var s_id = checkedBox.closest("tr").find("input.is_s_id").val();
			var s_name = checkedBox.closest("tr").find("input.is_s_name").val();
			//var consult_id = checkedBox.closest("tr").find("input.is_consult_id").val();
			console.log("jsp:checkbox");
			console.log(s_id);
			getConsultContent(s_id);
			
			
		}
	});
	
	function getConsultContent(s_id){
		var consultList = $('#consultList');
		consultList.empty();
		console.log("jsp:getConsultContent");
		console.log(s_id);
		consultService.getContent({s_id: s_id}, function(consult){
			console.log("jsp:getContent");
			console.log(consult);

				if(consult){
					consult.forEach(function(consult){
					var str = '<tr>' +
	                   '<td><div class="form-check form-check-muted m-0">' +
	                   '<label class="form-check-label"><input type="checkbox" class="form-check-input consult_checkbox">' +
	                   '<i class="input-helper"></i></label></div></td>' +
	                   '<td hidden><input type="text" class="form-control Consult_id" name="Consult_id" value="' + consult.consult_id + '" readonly></td>' + 
	                   '<td hidden><input type="text" class="form-control Consult_t_id" name="Consult_t_id" readonly value="' + consult.t_id + '"> </td>' +
	                   '<td ><input type="text" class="form-control Consult_s_id" name="Consult_s_id" readonly value="' + consult.s_id + '"> </td>' +
	                   '<td ><input type="text" class="form-control Consult_s_name" name="Consult_s_name" readonly value="' + consult.s_name + '"> </td>' +
	                   '<td><input type="text" class="form-control Consult_t_name" name="Consult_t_name" readonly value="' + consult.t_name + '"></td>' +
	                   '<td><input type="text" class="form-control Consult_title" name="Consult_title" readonly value="' + consult.consult_title + '"></td>' +
	                   '<td><input type="text" class="form-control Consult_content content" name="Consult_content" readonly value="' + consult.consult_content + '"></td>' +
	                   '<td><input type="text" class="form-control Consult_date" name="Consult_date" readonly value="' + consult.consult_date + '"></td>' +
	                   '</tr>';
	                   consultList.append(str);
					});
	       		 } else {
		            console.log("No counseling data available");
		            alert("No counseling list available");
	        	 }
		});
	};
	
	$(document).on('dbclick', '.content', function () {
        var consultContent = $(this).closest("tr").find('.content').val();
        $('#modalContent').text(consultContent);
        $('#consultModal').modal('show');
    });
	
	//상담 추가
	$(".insertbtn").on('click', function(){
		
		//console.log($('.s_checkbox:checked').closest("tr").find().prop("class"));
		if($('.s_checkbox:checked').length>0){
			let consult = {
				consult_t_id: $('.s_checkbox:checked').closest("tr").find(".is_t_id").val(),
				consult_t_name: $('.s_checkbox:checked').closest("tr").find(".is_t_name").val(),
				consult_s_id: $('.s_checkbox:checked').closest("tr").find(".is_s_id").val(),
				consult_s_name: $('.s_checkbox:checked').closest("tr").find(".is_s_name").val(),
				consult_id: nowconsult_id,
				consult_date: today
			}
			
			console.log("jsp: insertbtn");
			console.log(consult.consult_t_id);
			console.log(consult.consult_s_id);
			
			addConsult(consult);
			btnShow2();
			nowbtn = addbtn;
		}
	});
	
	function addConsult(consult){
		var consultList = $('#consultList');
		var str = '<tr>' +
	        '<td><div class="form-check form-check-muted m-0">' +
	        '<label class="form-check-label"><input type="checkbox" class="form-check-input consult_checkbox">' +
	        '<i class="input-helper"></i></label></div></td>' +
	        '<td hidden><input type="text" class="addConsult_id" name="addConsult_id" value="' + consult.consult_id + '" readonly></td>' + 
	        '<td><input type="text" class="form-control addConsult_s_id" name="addConsult_s_id" value="' + consult.consult_s_id + '" readonly> </td>' +
	        '<td hidden><input type="text" class="form-control addConsult_t_id" name="addConsult_t_id" value="' + consult.consult_t_id + '" readonly> </td>' +
	        '<td ><input type="text" class="form-control addConsult_s_name" name="addConsult_s_name" value="' + consult.consult_s_name + '"  readonly> </td>' +
	        '<td><input type="text" class="form-control addConsult_t_name" name="addConsult_t_name"  value="' + consult.consult_t_name + '" readonly></td>' +
	        '<td><input type="text" class="form-control addConsult_title" name="addConsult_title"></td>' +
	        '<td><input type="text" class="form-control addConsult_content content" name="addConsult_content"></td>' +
	        '<td><input type="text" class="form-control addConsult_date" name="addConsult_date" readonly value="' + consult.consult_date + '"></td>' +
	        '</tr>';
	        consultList.append(str);
	}
	
	function setConsult(callback){
		let data={
			consult_id: $(".addConsult_id").val(),
			consult_title: $(".addConsult_title").val(),
			consult_content: $(".addConsult_content").val(), 
			consult_date: $(".addConsult_date").val()
		}
		consultService.insertConsult(data, function(result){
			console.log("jsp:insertConsult: " + result);
			callback(result);
		});
	}
	
	savebtn.on("click", function(){
        
    	if(nowbtn == addbtn){	      
    		setConsult(function (callback) {            	
            consult_id = $(".addConsult_id").val();
            getConsultContent(consult_id);
            btnShow3();    
            });	               
        } else if (nowbtn == updatebtn) {
            updateConsult(function () {
                btnShow3();
                consult_id = $(".Consult_id").val();
                getConsultContent(consult_id);
            });
        }
        
    });
	
	updatebtn.on("click", function () {
		if ($('.consult_checkbox:checked').length > 0) {
			btnShow2();
			consultEdit();
	        nowbtn = updatebtn; 
	        alert("상담 사항을 변경하세요.");	
		}else{
			alert("체크박스를 선택하세요.");
		}
    });
	
	function updateConsult(callback) {
 	   let data = {
         	consult_id : $(".Consult_id").val(),
         	consult_content : $(".Consult_content").val()      	          	
         }    	   
 	   
 	   consultService.updateConsult(data, function (result) {
           if (result == "success") {
               alert(result);
               callback();
           }
       });
     }
	 
	cancelbtn.on("click", function () {

	    if (nowbtn == addbtn) {
	    	consultList.empty();	    	       
	    	var consult_id = nowconsultid;

            getConsultContent(consult_id);
	        btnShow3();
	    } else {
	        btnShow3();
	    }
	});

	deletebtn.on('click', function () {
        var checkedbox = $('.consult_checkbox:checked');
        if (checkedbox.length > 0) {
            
      	 var consult_id = checkedbox.closest("tr").find("input.Consult_id").val();
      	 var s_id = checkedbox.closest("tr").find("input.Consult_s_id").val();
      	 
            consultService.deleteConsult(consult_id, function () {              	 
          	  	getConsultContent(s_id);
            });
        }
    });
	
    /* deletebtn.on('click', function () {
         var checkedbox = $('.consult_checkbox:checked');
         if (checkedbox.length > 0) {
             
       	 var consult_id = checkedbox.closest("tr").find("input.Consult_id").val();
         
       	 
             consultService.deleteConsult(consult_id, function () {              	 
           	  	getConsultContent(consult_id);
             });
         }
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
    
    
    function consultEdit() {
    	if($('.consult_checkbox:checked')){
    		$('.consult_checkbox:checked').closest("tr").find("input:not('.Consult_id, .Consult_s_name, Consult_s_id, Consult_t_id, Consult_title, Consult_date')").prop('readonly', false);
    	}
    	
    }    
  
    //체크 박스 클릭 이벤트
    $(document).on('click', '.consult_checkbox', function() { 	
    	$(".consult_checkbox").prop('checked', false);			
		   // 현재 클릭한 체크박스만 선택       	
		  $(this).prop('checked', true);	   
    });
    
}); 

</script>
      
</body>
</html>