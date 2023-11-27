<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <style>
    	.user_thumb {overflow:hidden;position:relative;width:30px;height:30px;border-radius:15px;}
    	.user_thumb_img {position:absolute;top:50%;left:50%;transform:translate(-50%, -50%);width:150%;height:auto;}
    </style>
<nav class="navbar p-0 fixed-top d-flex flex-row">
  <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
    <a class="navbar-brand brand-logo-mini" href="/main"><img src="/assets/images/logo-mini.svg" alt="logo" /></a>
  </div>
  <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
      <span class="mdi mdi-menu"></span>
    </button>
    
    <ul class="navbar-nav navbar-nav-right">
      <li class="nav-item dropdown">
        <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
          <div class="navbar-profile">
            <p class="mb-0 d-none d-sm-block navbar-profile-name">
            	<i class="mdi mdi-account-circle userNoThumb" style="vertical-align:middle;"></i>
            	${sessionScope.teacher.t_name }님 접속중</p>
            <i class="mdi mdi-menu-down d-none d-sm-block"></i>
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
          <h6 class="p-3 mb-0">Profile</h6>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="/member/mypage/${sessionScope.teacher.t_id }">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-dark rounded-circle">
                <i class="mdi mdi-settings text-success"></i>
              </div>
            </div>
            <div class="preview-item-content">
              <p class="preview-subject mb-1">MyPage</p>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="/member/logout">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-dark rounded-circle">
                <i class="mdi mdi-logout text-danger"></i>
              </div>
            </div>
            <div class="preview-item-content">
              <p class="preview-subject mb-1">Log out</p>
            </div>
          </a>
        </div>
      </li>
    </ul>
    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
      <span class="mdi mdi-format-line-spacing"></span>
    </button>
  </div>
</nav>
<script type="text/javascript">
	$(document).ready(function(){
		//사용자 첨부파일 보여주기
		function userImg(t_id) {
			$.getJSON('/member/getAttachImg', {t_id:t_id}, function(result){
				$(".userNoThumb").hide();
				let userImgBox = $(".navbar-profile");
				let str = "";
									
				let fileCallPath = encodeURIComponent(result.uploadPath+"/s_"+result.uuid+"_"+result.fileName);														
				str += "<div class='user_thumb'>";
				str += "<img class='user_thumb_img' src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
		
				userImgBox.prepend(str);
			}).fail(function(xhr, status, err){
				$(".userNoThumb").show();
				$(".user_thumb").remove();
			});
		};
		userImg(${sessionScope.teacher.t_id});
	});
</script>