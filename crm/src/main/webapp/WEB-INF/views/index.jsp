<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- partial:partials/_header.html -->
<%@include file="include/_header.jsp" %>
<!-- partial -->
	<style>
		.aca_func .card {text-align:center}
		.aca_func .mdi {font-size:5em;}
		.mdi-account-multiple {color:#8f5fe8}
		.mdi-book-open-page-variant {color:#ffab00}
		.mdi-calendar-check {color:#fc424a}
		.mdi-lead-pencil {color:#0090e7}
	</style>
    <div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
      <%@include file="include/_sidebar.jsp" %>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        <%@include file="include/_navbar.jsp" %>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="row">
				<div class="col-12 grid-margin stretch-card">
	                <div class="card">
	                  <div class="card-body">
	                    <h4 class="card-title">ACA 2023</h4>
	                    <div class="owl-carousel owl-theme full-width owl-carousel-dash portfolio-carousel" id="owl-carousel-basic">
	                      <div class="item">
	                        <img src="assets/images/dashboard/slide1.png" alt="ACA 2023에서 만나는 1:1 학생 관리 10년간 쌓아온 빅데이터로 완성하는 관리형 CRM">
	                      </div>
	                      <div class="item">
	                        <img src="assets/images/dashboard/slide2.png" alt="성공한 원장님이 선택한 ACA 2023의 노하우 ACA 2023은 신뢰와 상생을 위해 노력합니다.">
	                      </div>
	                    </div>
	                    
	                  </div>
	                </div>
	              </div>
				</div>
            
              
            <div class="row">
              <div class="col-12 aca_func">
                   <h4 class="card-title">ACA2023 주요 기능</h4>
                   <div class="row">
                   
                    <div class="col-md-3 grid-margin stretch-card">
		                <div class="card">
		                  <div class="card-body">
		                    <div class="form-group row">
		                    
		                      <div class="col">
		                        <span class="menu-icon">
						          <i class="mdi mdi-account-multiple"></i>
						        </span>
		                      </div>
		                      
		                    </div>
		                    <h4 class="card-title">학생 정보</h4>
		                    <p class="card-description">학생의 상세 정보를 조회, 수정, 삭제 할 수 있습니다.</p>
		                  </div>
		                </div>
		              </div>
	              
		              <div class="col-md-3 grid-margin stretch-card">
		                <div class="card">
		                  <div class="card-body">
		                  
		                    <div class="form-group row">	                    
		                      <div class="col">
		                        <span class="menu-icon">
						          <i class="mdi mdi-book-open-page-variant"></i>
						        </span>
		                      </div>	                      
		                    </div>
		                    
		                    <h4 class="card-title">성적 정보</h4>
		                    <p class="card-description">학생의 성적 정보를 그래프로 표시하여 한 눈에 파악할 수 있습니다.</p>
		                  </div>
		                </div>
		              </div>
		              
		              <div class="col-md-3 grid-margin stretch-card">
		                <div class="card">
		                  <div class="card-body">
		                  
		                    <div class="form-group row">	                    
		                     <div class="col">
		                        <span class="menu-icon">
						          <i class="mdi mdi-calendar-check"></i>
						        </span>
		                      </div>	                      
		                    </div>
		                    
		                    <h4 class="card-title">출결 정보</h4>
		                    <p class="card-description">각 학급 별 학생의 출결 정보를 입력, 수정하여 월별 출결 상황을 파악할 수 있습니다.</p>
		                  </div>
		                </div>
		              </div>
		              
		              <div class="col-md-3 grid-margin stretch-card">
		                <div class="card">
		                  <div class="card-body">
		                  
		                    <div class="form-group row">	                    
		                      <div class="col">
		                        <span class="menu-icon">
						          <i class="mdi mdi-lead-pencil" ></i>
						        </span>
		                      </div>	                      
		                    </div>
		                    
		                    <h4 class="card-title">수강 신청</h4>
		                    <p class="card-description">학생 수강 신청 관리 기능</p>
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
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/vendors/progressbar.js/progressbar.min.js"></script>
    <script src="assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
    <script src="assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <script src="assets/js/settings.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <!-- End custom js for this page -->