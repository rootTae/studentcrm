<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
    <!-- <a class="sidebar-brand brand-logo" href="/main"><img src="/assets/images/logo.svg" alt="logo" /></a> -->
    <a class="sidebar-brand brand-logo" href="/main"><img src="/assets/images/logo_hor.png" alt="logo" /></a>
    <a class="sidebar-brand brand-logo-mini" href="/main"><img src="/assets/images/logo-mini.svg" alt="logo" /></a>
  </div>
  <ul class="nav">
    <li class="nav-item profile">
      <div class="profile-desc">
        <div class="profile-pic">
          <!-- <div class="count-indicator">
            <img class="img-xs rounded-circle " src="/assets/images/faces/face15.jpg" alt="">
            <span class="count bg-success"></span>
          </div> -->
          <div class="profile-name ml-0 row" style="text-align: center;">
          	<div class="col-md-4">
          		<button type="button" class="btn btn-outline-primary" style="line-height: 10px; font-size: 12px; margin-bottom: 10px;">${sessionScope.t_subject }</button>
          	</div>
          	<div class="col-md-4" >
            	<h5 class="mb-0 font-weight-normal">${sessionScope.t_name }</h5>
            </div>
            <div class="col-md-12" style="text-align: left;">
            	<span class="classList"></span>
            </div>
           </div>
          </div>
          </div>
        <!-- <a href="#" id="profile-dropdown" data-toggle="dropdown"><i class="mdi mdi-dots-vertical"></i></a>
        <div class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list" aria-labelledby="profile-dropdown">
          <a href="#" class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-dark rounded-circle">
                <i class="mdi mdi-settings text-primary"></i>
              </div>
            </div>
            <div class="preview-item-content">
              <p class="preview-subject ellipsis mb-1 text-small">Account settings</p>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-dark rounded-circle">
                <i class="mdi mdi-onepassword  text-info"></i>
              </div>
            </div>
            <div class="preview-item-content">
              <p class="preview-subject ellipsis mb-1 text-small">Change Password</p>
            </div>
          </a>
      </div> -->
    </li>
    <li class="nav-item nav-category">
      <span class="nav-link">관리 메뉴</span>
    </li>
    
    <li class="nav-item menu-items">
      <a class="nav-link" href="/student/studentInfo">
        <span class="menu-icon">
          <i class="mdi mdi-account-multiple"></i>
        </span>
        <span class="menu-title">학생 정보 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="/grades/gradesView">
        <span class="menu-icon">
          <i class="mdi mdi-book-open-page-variant"></i>
        </span>
        <span class="menu-title">성적 정보 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="/attendance/attendanceView">
        <span class="menu-icon">
          <i class="mdi mdi-calendar-check"></i>
        </span>
        <span class="menu-title">출결 정보 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="/main">
        <span class="menu-icon">
          <i class="mdi mdi-credit-card"></i>
        </span>
        <span class="menu-title">결제 정보 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="/member/mypage">
        <span class="menu-icon">
          <i class="mdi mdi-account-card-details"></i>
        </span>
        <span class="menu-title">사용자 정보 관리</span>
      </a>
    </li>
       
  </ul>
</nav>

<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="/js/classListsByLogin.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    var classListSpan = $(".classList");
    var t_id = ${sessionScope.t_id};
    //console.log("classlist");
    //console.log("classlist on the sidebar");
	//console.log(t_id);
    attendanceService.getClassList({ t_id: t_id },
        function (list) {
            var str = "";
            
            //console.log(daysInMonth);
         
            for (var i = 0, len = list.length || 0; i < len; i++) {
                str += "<div data-list='" + list[i].class_name + "'>'" + list[i].class_name + "'</div>";
            }
            classListSpan.html(str);
        });
	
});
</script>