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
		 <div class="col-md-12 grid-margin stretch-card">
		  <div class="card">
		    <div class="card-body">
		      <h4 class="card-title">결제정보 검색</h4>
		      <div class="form-group row">
		      <div class="col-md-3">
		        <div class="input-daterange input-group" id="datepicker">
	              <input type="text" class="form-control" name="startDate" placeholder="시작일">
	              <span>  ~  </span>
	              <input type="text" class="form-control" name="endDate" placeholder="종료일">
	              <button type="button" class="btn btn-primary">
                  <i class="mdi mdi-calendar"></i></button>
             	</div>
		      </div>
		        <div class="col-md-2">
		          <select class="js-example-basic-single form-control" style="width:100%;">
		            <option value="AL">결제 수단</option>
		            <option value="WY">Wyoming</option>
		            <option value="AM">America</option>
		            <option value="CA">Canada</option>
		            <option value="RU">Russia</option>
		          </select>
		        </div>
		        <div class="col-md-2">
		          <select class="js-example-basic-single form-control" style="width:100%;">
		            <option value="AL">결제 상태</option>
		            <option value="WY">Wyoming</option>
		            <option value="AM">America</option>
		            <option value="CA">Canada</option>
		            <option value="RU">Russia</option>
		          </select>
		        </div>
		        <div class="col-md-1">
		          <input type="text" class="form-control" id="studentName" name="studentName" required placeholder="학생명">
				</div>
		        <div class="col-md-1">
		          <input type="text" class="form-control" id="className" name="className" required placeholder="학급명">
		        </div>
		        <div class="col-md-1">
		          <input type="text" class="form-control" id="subjectName" name="subjectName" required placeholder="과목명">
		        </div>
		        <div style="display: flex; align-items: center;">
  				  <button type="button" class="btn btn-primary" >검색</button>
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
                            <th>학생명</th>
                            <th>학번</th>
		                    <th>결제상태</th>
		                    <th>수납항목명</th>
		                    <th>금액</th>
                            <th>예정금액</th>
		                    <th>납부금액</th>
		                    <th>학급명</th>
		                    <th>수강시작일</th>
		                    <th>수강종료일</th>
		                    <th>마감일</th> 	                     
                          </tr>
                        </thead>
                        <tbody class="">
                          
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
	
    <script type="text/javascript" src="/js/demo/grades.js"></script>
    <script type="text/javascript">
   
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

    

 
    
    
    </script>
  </body>
</html>