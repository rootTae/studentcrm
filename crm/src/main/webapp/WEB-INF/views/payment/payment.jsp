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
		 <div class="col-md-6 grid-margin stretch-card">
		  <div class="card">
		    <div class="card-body">
		      <h4 class="card-title">결제정보 검색</h4>
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
		          <input type="text" class="form-control" id="studentName" name="studentName" required placeholder="학생명">
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
	                    <button type="button" class="insertbtn btn btn-primary" >추가</button>
			        	<button type="button" class="updatebtn btn btn-primary" >수정</button>
			        	<button type="button" class="deletebtn btn btn-primary" >삭제</button>
                      <table class="table" id="">
                        <thead>
                          <tr>
                            <th>              
                            </th>
                            <th hidden>결제 관리 번호</th>
                            <th>학번</th>
                            <th>학생명</th>
		                    <th>금액</th>
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
    <script src="/assets/js/formpickers.js"></script>
    <script src="/assets/js/editorDemo.js"></script>
    <script src="/assets/js/x-editable.js"></script>
    
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="/js/payment.js"></script>
    <script type="text/javascript">
    //기간 설정(datapicker)
//기간 설정(datapicker)
    $(document).ready(function() {
         if ($("#datepicker").length) {
           $('#datepicker').datepicker({
             format: 'yyyy-mm-dd', // 선택한 날짜 형식 설정
             clearBtn: true,      // 선택한 날짜를 지우는 버튼 활성화
             startDate: '2023-01-01', // 시작 날짜 설정
             endDate: '2055-12-31',   // 종료 날짜 설정
             monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
             dayNames: ['일', '월', '화', '수', '목', '금', '토']
           });
         }
       });
    
	    /* //검색 
	    $('#search').on('click', function(event){      
        	event.preventDefault();
        	
        	let data = {
        			startValue : $('#startDate').val(),
                	 endValue : $('#endDate').val(),
                	 studentValue : $('#studentName').val()		
        	}        	
        	
        	PaymentService.getPaymentList(data, function(list){
            	console.log(list);
            	
            	var paymentList = $('.PaymentList');
            	paymentList.empty();
            		
            	list.forEach(function(payment){
                 	var str = '<tr>' +  
                 	'<td><div class="form-check form-check-muted m-0">' +
                    '<label class="form-check-label"><input type="checkbox" class="form-check-input P_checkbox">' +
                    '<i class="input-helper"></i></label></div></td>' +
                    '<td hidden><input type="text" class=p_id"" name="p_id" value="' + payment.p_id  + '" readonly></td>' + // 수정된 부분
                    '<td ><input type="text" class="s_id" name="s_id" readonly value="' + payment.s_id  + '"> </td>' +
                    '<td><input type="text" class="s_name" name="s_name" readonly value="' + payment.s_name  + '"></td>' +
                    '<td><input type="text" class="payment" name="payment" readonly value="' + payment.payment  + '"></td>' +
                    '<td><input type="text" class="p_form" name="p_form" readonly value="' + payment.p_form + '"></td>' +
                    '<td><input type="text" class="p_date" name="p_date" readonly value="' + payment.p_date + '"></td>' +
                    '<td><input type="text" class="class_name" name="class_name" readonly value="' + payment.class_name + '"></td>' +
                    '<td><input type="text" class="c_startdate" name="c_startdate" readonly value="' + payment.c_startdate + '"></td>' +
                    '<td><input type="text" class="c_enddate" name="c_enddate" readonly value="' + payment.c_enddate + '"></td>' +
                    '</tr>';        
                       paymentList.append(str);
                 });
            });
        });
	        */
	    
	    
	
    </script>
  </body>
</html>