<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div>
		<form action="/member/updateForm" method="post" id="updateForm">
			ID: <input type="text" id="t_loginid" name="t_loginid" value="${teacher.t_loginid }" readonly><br><!-- 수정불가 -->
			NAME: <input type="text" id="t_name" name="t_name" value="${teacher.t_name }"><br>
			<!-- PW: <input type="password" id="t_pw" name="t_pw"><br> --><!-- 따로 페이지 필요 -->
			SUBJECT: <input type="text" id="t_subject" name="t_subject" value="${teacher.t_subject}"><br>
			CLASS: <input type="text" id="t_class" name="t_class" value="${teacher.t_class }"><br>
			PHONE: <input type="text" id="t_phone" name="t_phone" value="${teacher.t_phone }"><br>
			E-MAIL: <input type="text" id="t_email" name="t_email" value="${teacher.t_email }"><br>
			<input type="button" class="btn btn-primary btn-user btn-user btn-block" value="수정" onclick="updateCheck()">
			<input type="button" class="btn btn-primary btn-user btn-user btn-block" value="탈퇴" onclick="teacherDelete()">
		</form>
	</div>
	
	<script type="text/javascript">
	  
  	function updateCheck() {
		if($("#t_name").val().length < 1){
			alert("이름은 필수 입력 항목입니다.");
		}else if(confirm("수정 하시겠습니까?")){
			$("#updateForm").submit();
		}
	}
  	
  	function teacherDelete() {
  		if(confirm('탈퇴 하시겠습니까?')){
	  		location.href='/member/delete';
  		};
  	}
  </script> 

  <%@include file="/WEB-INF/views/include/footer.jsp"%>