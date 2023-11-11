<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div>
		<form action="regForm" method="post" id="regForm">
			ID: <input type="text" id="t_loginid" name="t_loginid">
			<input type="button" class="btn btn-primary btn-user btn-block" value="중복체크" onclick="IdCheck()"><br>
			NAME: <input type="text" id="t_name" name="t_name"><br>
			PW: <input type="password" id="t_pw" name="t_pw"><br>
			PW-CHECK: <input type="password" id="pwCheck" name="pwCheck"><br>
			SUBJECT: <input type="text" id="t_subject" name="t_subject"><br>
			CLASS: <input type="text" id="t_class" name="t_class"><br>
			PHONE: <input type="text" id="t_phone" name="t_phone"><br>
			E-MAIL: <input type="text" id="t_email" name="t_email"><br>
			<input type="button" class="btn btn-primary btn-user btn-user btn-block" value="회원가입" onclick="joinCheck()">
		</form>
	</div>
	
	<script type="text/javascript">
	function IdCheck() {
		var id = $("#t_loginid").val(); //id태그 value에 접근
		var userId = {"t_loginid" : id}; //전송할 데이터의 key값 : value설정
			
		if(id.length < 4) {
			alert("아이디는 4글자 이상 입력하세요");
		} else {
		  	$.ajax({
		  		type : "post",     //요청 형식
		  		url : "/member/idCheck",   //요청할 주소
		  		data : userId,//서버에 전송할 데이터  json형식 {key:value}
		  		dataType : "json", //서버의 요청후 리턴해 주는 타입 
		  		error : function(request, error) {
		  			alert(error + "\n" + request.status);		
		  		},
		  		success : function(result) { 
					console.log("성공실패여부:" + result);
		  				
		  			if(result == 1) { //중복되는 아이디가 존재함
		  				alert("이미 존재하는 아이디 입니다");
		  			} else {
		  				alert("사용가능한 아이디 입니다");
		  				$("#t_loginid").attr("readonly", true);
		  			}
				}
		  	});
		} //end else
		//console.log(userId);
	} 
  
  	//회원 가입 체크(joinCheck())
  	function joinCheck() {
		if(!$("#t_loginid").attr("readonly")) {
			alert("아이디 중복체크를 해야 합니다.");
		}else if($("#t_name").val().length < 1){
			alert("이름을 입력하세요!");
		}else if($("#t_pw").val().length < 1){
			alert("비밀번호를 입력하세요!");
		}else if($("#t_pw").val() !== $("#pwCheck").val()){
			alert("비밀번호 확인란을 확인해주세요!")
			$("#t_pwCheck").focus();
		}else if(confirm("회원 가입을 하시겠습니까?")){
			$("#regForm").submit();
		}
	}
  </script> 

  <%@include file="/WEB-INF/views/include/footer.jsp"%>