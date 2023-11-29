<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:partials/_header.html -->
<%@include file="/WEB-INF/views/include/_header.jsp" %>

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
              <h3 class="page-title">결제 내역 관리</h3>
            </div>          
           
       		<div class="row">
         		<div class="col-5 grid-margin stretch-card ">
            		<div class="card">
           				<div class="card-body">
           					<h4 class="card-title">학생 정보 검색</h4>
			                  <p class="card-description">학생명을 입력해 주세요.</p>
			                  <form id="searchForm" method="post" class="form-inline">
				                  <input type="text" class="form-control mb-2 mr-sm-2" name="searchS_name" id="searchS_name" required placeholder="학생명">
				                  <button type="submit" class="btn btn-primary mb-2" >검색</button>
                  			  </form>
                		</div>
              		</div>
            	</div>
	          
	          
              <div class="col-7 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">학생 검색 결과</h4>
                    <div class="table-responsive">
                      <table class="table" id="studentTable">
                        <thead>
                          <tr>
                            <th>학생 번호</th>
		                    <th>학생명</th>
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
		 <div class="col-md-5 grid-margin stretch-card">
		  <div class="card">
		    <div class="card-body">
		      <h4 class="card-title">결제 정보 검색</h4>
		      <div class="form-group row">
		      <div class="col-md-6">
		       <div class="input-daterange input-group" id="datepicker">
                 <input type="text" class="form-control" name="startDate" id="startDate" placeholder="시작일">
                 <span style="display:inline-block;padding:0 10px;">~</span>
                 <input type="text" class="form-control" name="endDate"  id="endDate" placeholder="종료일">
                 <div class="calendar_btn">
                     <div class="col-auto pr-0 pl-0 d-flex align-items-center h-100">
                       <label for="startDate" class="btn btn-primary mb-0 h-100 d-flex align-items-center">
                   <i class="mdi mdi-calendar mr-0"></i>
                 </label>
                     </div>
                  </div>
                </div>

		      </div>	        
		        <div class="col-md-3">
		          <input type="text" class="form-control" id="studentId" name="studentId" required placeholder="학생번호">
				</div>
		        <div style="display: flex; align-items: center;">
  				  <button type="button" class="btn btn-primary" id="search" >검색</button>
				</div>
		      </div>
		    </div>
		  </div>
		</div>
	  </div>

			<div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">결제 정보 검색 결과</h4>
                    <div class="table-responsive">
                     <div class="col-md-4 ml-auto text-right">
	                    <button type="button" class="insertbtn btn btn-primary" style="display: none">추가</button>
			        	<button type="button" class="updatebtn btn btn-secondary" style="display: none">수정</button>
			        	<button type="button" class="deletebtn btn btn-info" style="display: none">삭제</button>
			        	<button type="button" class="savebtn btn btn-primary" style="display: none">저장</button>
				        <button type="button" class="cancelbtn btn btn-info" style="display: none">취소</button>
				        </div>
                      <table class="table" id="">
                        <thead>
                          <tr>
                            <th>              
                            </th>
                            <th hidden>결제 관리 번호</th>
                            <th hidden>등록 관리 번호</th>
                            <th>학생번호</th>
                            <th>학생명</th>
		                    <th>금액</th>
		                    <th>결제상태</th>
		                    <th>납부형태</th>
		                    <th>납부 일</th>
		                    <th>수업명</th>
		                    <th>수강시작일</th>
		                    <th>수강종료일</th>                    
                          </tr>
                        </thead>
                        <tbody class="PaymentList">
                          
                        </tbody>
                      </table>
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
    
    <script src="/assets/js/bootstrap-datepicker.js"></script>
    <!-- <script src="/assets/js/formpickers.js"></script> 
     <script src="/assets/js/editorDemo.js"></script>
    <script src="/assets/js/x-editable.js"></script>  -->
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page --> 
    <script type="text/javascript" src="/js/demo/grades.js"></script>
    <script type="text/javascript" src="/js/register.js"></script> 
    <script type="text/javascript" src="/js/payment.js"></script>
    <script type="text/javascript">
    //기간 설정(datapicker)
$(document).ready(function(){
	var paymentList = $('.PaymentList');
	var nowstartD =  '';
	var nowendD= '';
	
	let addbtn = $(".insertbtn");
    let updatebtn = $(".updatebtn");
    let deletebtn = $(".deletebtn");
    let savebtn = $(".savebtn");
    let cancelbtn = $(".cancelbtn");
    
    let nowbtn='';
	
	
	 // 학생 이름 검색 
    $('#searchForm').submit(function(event){
        event.preventDefault();
        var s_nameValue = $('#searchS_name').val();

        getStudent(s_nameValue);
    });

 	//학생 리스트 
    function getStudent(s_nameValue) {
        GradesService.getStudentList({ s_name: s_nameValue }, function(student) {
            console.log(student);
            var studentList = $('.studentList');
            studentList.empty();

            student.forEach(function(student) {
            	var str = '<tr>' +            
                    '<td><input type="text" class="is_s_id form-control" name="is_s_id" readonly value="'+ student.s_id +'"></td>' +
                    '<td><input type="text" class="is_s_name form-control" name="is_s_name"  readonly value="'+ student.s_name +'"></td>' +
                    '<td><input type="text" class="is_s_gender form-control" name="is_s_gender"  readonly value="'+ student.s_gender +'"></td>' +
                    '<td><input type="text" class="is_s_phone form-control" name="is_s_phone" readonly value="'+ student.s_phone +'"></td>' +
                    '<td><input type="text" class="is_s_school form-control" name="is_s_school" readonly value="'+ student.s_school +'"></td>' +
                    '<td><input type="text" class="is_s_grade form-control" name="is_s_grade" readonly value="'+ student.s_grade + '"></td>' +
                    '</tr>';        
                studentList.append(str);
            });
        });
    } 	
 
    //검색 
	    $('#search').on('click', function(event){      
        	event.preventDefault();
        	
        	let data = {
        			 startDate : $('#startDate').val(),
                	 endDate : $('#endDate').val(),
                	 s_id : $('#studentId').val()		
        	}        	
        
        	getPayment(data);        	
        });
    
	    function getPayment(data) {
    		console.log(data);
    		
        	PaymentService.getPaymentList(data, function(list){
				
            	paymentList.empty();
            	btnShow3();
            	console.log(list);
            	list.forEach(function(payment){
                 	var str = '<tr>' +  
                 	'<td><div class="form-check form-check-muted m-0">' +
                    '<label class="form-check-label"><input type="checkbox" class="form-check-input P_checkbox">' +
                    '<i class="input-helper"></i></label></div></td>' +
                    '<td hidden><input type="text" class="p_id" name="p_id" value="' + payment.p_id  + '" readonly></td>' + // 수정된 부분
                    '<td hidden><input type="text" class="r_id" name="r_id" value="' + payment.r_id  + '" readonly></td>' + 
                    '<td ><input type="text" class="s_id form-control" name="s_id" readonly value="' + payment.s_id  + '"> </td>' +
                    '<td><input type="text" class="s_name form-control" name="s_name" readonly value="' + payment.s_name  + '"></td>' +
                    '<td><input type="text" class="payment form-control" name="payment" readonly value="' + payment.payment  + '"></td>' +
                    '<td><input type="text" class="p_status form-control" name="p_status" readonly value="' + payment.p_status  + '"></td>' +
                    '<td><input type="text" class="p_form form-control" name="p_form" readonly value="' + payment.p_form + '"></td>' +
                    '<td><input type="text" class="p_date form-control" name="p_date" readonly value="' + payment.p_date + '"></td>' +
                    '<td><input type="text" class="class_name form-control" name="class_name" readonly value="' + payment.class_name + '"></td>' +
                    '<td><input type="text" class="c_startdate form-control" name="c_startdate" readonly value="' + payment.c_startdate + '"></td>' +
                    '<td><input type="text" class="c_enddate form-control" name="c_enddate" readonly value="' + payment.c_enddate + '"></td>' +
                    '</tr>';        
                       paymentList.append(str);
                 });
             });
        	}
    
	     //추가 버튼 (추가버튼 클릭)
	  	  $(".insertbtn").on('click', function() {
	  		
	  	  s_id = $('#studentId').val(),
	  	  RegisterService.getRegistertList(s_id, function (registers) {
	  	  
	  	 if(registers != null){
	  	  let payment= {
	  			 r_id: registers[0].r_id,
	  			 s_id:  registers[0].s_id,
	  		     s_name: registers[0].s_name,
	  		     payment : registers[0].payment
	  	  }
	  	        console.log(payment);
	  		 	addPayment(payment)
	  			btnShow2();        
	  	        nowbtn = addbtn;     
	  		 
	  	 }else{
	  		 alret("수강하는 수업이 없습니다.");
	  	 }
	  		  	  			
	   });
     });
    
	  	 // 입력칸 생성.
		     function addPayment(payment) {
		     
		    	 var str = '<tr>' +  
              	'<td><div class="form-check form-check-muted m-0">' +
                 '<label class="form-check-label"><input type="checkbox" class="form-check-input P_checkbox">' +
                 '<i class="input-helper"></i></label></div></td>' +
                 '<td hidden><input type="text" class="add_p_id" name="add_p_id" readonly></td>' + // 수정된 부분
                 '<td hidden><input type="text" class="add_r_id" name="add_r_id" value="' + payment.r_id  + '" readonly></td>' + 
                 '<td ><input type="text" class="add_s_id form-control" name="add_s_id" readonly value="' + payment.s_id  + '"> </td>' +
                 '<td><input type="text" class="add_s_name form-control" name="add_s_name" readonly value="' + payment.s_name  + '"></td>' +
                 '<td><input type="text" class="add_payment form-control" name="add_payment" readonly value="' + payment.payment  + '"> </td>' +
                 '<td><input type="text" class="add_p_status form-control" name="add_p_status" ></td>' +
                 '<td><input type="text" class="add_p_form form-control" name="add_p_form" ></td>' +
                 '<td><input type="text" class="add_p_date form-control" name="add_p_date" ></td>' +
                 '<td hidden><input type="text" class="add_class_name form-control" name="add_class_name" ></td>' +
                 '<td hidden><input type="text" class="add_c_startdate form-control" name="add_c_startdate"></td>' +
                 '<td hidden><input type="text" class="add_c_enddate form-control" name="add_c_enddate"></td>' +
                 '</tr>';    
	              paymentList.append(str);            
		     }
	  	  
		     //결제 정보 입력
		        function setPayment(callback){
		            
		            let data= {               
	            		p_date : $(".add_p_date").val(),
	            		p_form : $(".add_p_form").val(),
	            	 	p_status : $(".add_p_status").val(),
	            	 	r_id : $(".add_r_id").val()        
		            }  
		            
		            console.log(data);
		            
		            PaymentService.insertPayment(data, function(result){                   
		                console.log("jsp : " + result);
		                callback(result);                      
		            }); 	            
		        }
	     	
		     // 저장 버튼
	        savebtn.on("click", function(){
	            // 입력 저장
	        	if(nowbtn == addbtn){	      
	        		setPayment(function (callback) {            	
	              
	        		let data={
	        		startDate :'2023-01-01',
	                endDate :'2055-12-31' ,		
	        		s_id : $(".add_s_id").val()			
	        		}
	        		
	                getPayment(data);
	                btnShow3();    
	                });	               
	            }else if(nowbtn==updatebtn){
	            	upPayment(function () {
	                    btnShow3();
	                    
	                    let data ={
	                    	 startDate : $('#startDate').val(),
	                       	 endDate : $('#endDate').val(),
	                       	 s_id : $('#studentId').val()
	                    }
	                    
	                    getPayment(data);
	                });
	            } 
	            
	        });
		     
	        //수정 버튼 
	 		updatebtn.on("click", function () {
	 			if ($('.P_checkbox:checked').length > 0) {
	 			btnShow2();
	 			paymentEdit();
	            nowbtn = updatebtn; 
	            alert("정보 변경하세요.");	
	 			}else{
	 				alert("체크박스를 선택하세요.");
	 			}
	        });
		     
	        //수정
	 		  function upPayment(callback) {
	 			 var checkedCheckbox = $('.P_checkbox:checked');
	              if (checkedCheckbox.length > 0) {	        	
	            	  
	        	let data ={
		    			p_id : checkedCheckbox.closest("tr").find("input.p_id").val(),  
		            	s_id : checkedCheckbox.closest("tr").find("input.s_id").val(),
		            	p_date : checkedCheckbox.closest("tr").find("input.p_date").val(),
		            	p_form : checkedCheckbox.closest("tr").find("input.p_form").val(),
		            	p_status : checkedCheckbox.closest("tr").find("input.p_status").val(),
		            	r_id : checkedCheckbox.closest("tr").find("input.r_id").val(),
		            	class_name : checkedCheckbox.closest("tr").find("input.class_name").val()
		            }    	   
	        	console.log(data);

		    	   PaymentService.paymentModify(data, function (result) {
		                if (result == "success") {
		                    alert('수정에 성공하셨습니다.');
		                    
		            let data  = { startDate : $('#startDate').val(),
		                            endDate : $('#endDate').val(),
		                            s_id : $('#studentId').val() }
		   	                    
		   	                    getPayment(data);
		                }else{
		                	alert('수정에 실패하셨습니다.');
		                }
		            });
		        }  
	        } 
	 		  
	 			// 취소
	    	cancelbtn.on("click", function () {

	    	    if (nowbtn == addbtn) {
	    	    	paymentList.empty();
	    	    	
    	    	   
  	    	let data  = { startDate : $('#startDate').val(),
                         endDate : $('#endDate').val(),
                         s_id : $('#studentId').val() }
	                    
	                    getPayment(data);
	    	    	                   
	    	        btnShow3();
	    	    } else {
	    	    	let data  = { startDate : $('#startDate').val(),
	                         endDate : $('#endDate').val(),
	                         s_id : $('#studentId').val() }
		                    
		                    getPayment(data);
	    	        btnShow3();
	    	        
	    	    }
	    	});
	 
	 			//삭제
	    	  deletebtn.on('click', function () {
	              var checkedCheckbox = $('.P_checkbox:checked');
	              if (checkedCheckbox.length > 0) {
	                  
            	  var p_id = checkedCheckbox.closest("tr").find("input.p_id").val();
      
            	  PaymentService.paymentRemove(p_id, function () {              	 
           			let data  = { startDate : $('#startDate').val(),
                               endDate : $('#endDate').val(),
                               s_id : $('#studentId').val() }
       	                    
       	                    getPayment(data);
                  });
	              }
	          });
	    	
	 			
	 			
	     
    
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
    
    
	       //체크 박스 클릭 이벤트
        $(document).on('click', '.P_checkbox', function() { 	
        	$(".P_checkbox").prop('checked', false);			
 		   // 현재 클릭한 체크박스만 선택       	
 		  $(this).prop('checked', true);	   
        });	       
	       
        $(document).ready(function() {
    	    if ($("#datepicker").length) {
    	        $('#datepicker').datepicker({
    	            clearBtn: true,
    	            format: 'yyyy-mm-dd',
    	            startDate: '2023-01-01',
    	            endDate: '2055-12-31'	           
    	        });
    	    }
    	});
        
        
        function paymentEdit() {				
        	if($('.P_checkbox:checked')){
        		$('.P_checkbox:checked').closest("tr")
        		.find("input:not('.s_id, .s_name, .payment')").prop('readonly', false);
        		
        		$('.P_checkbox:checked').closest("tr")
        		.find("input:not('.s_id, .s_name, .payment, .p_date, .p_form, .p_status ')").hide();
        	}
        	
        }    
        
});    
	
    </script>
  </body>
</html>