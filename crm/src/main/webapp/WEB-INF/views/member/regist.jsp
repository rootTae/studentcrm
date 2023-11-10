<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>regist.jsp</title>
	</head>
	<body>
	<div>
		<form action="regForm" method="post" id="regForm">
			ID: <input type="text" id="loginID" name="loginID">
			<input type="button" class="btn btn-primary btn-user btn-block" value="중복체크" onclick="IdCheck()"><br>
			PW: <input type="password" id="pw" name="pw"><br>
			NAME: <input type="text" id="name" name="name"><br>
			SUBJECT: <input type="text" id="subject" name="subject"><br>
			CLASS: <input type="text" id="class" name="class"><br>
			PHONE: <input type="text" id="phone" name="phone"><br>
			E-MAIL: <input type="text" id="email" name="email"><br>
			<input type="button" class="btn btn-primary btn-user btn-user btn-block" value="회원가입" onclick="joinCheck()">
		</form>
	</div>
	
	<script type="text/javascript">
	function IdCheck() {
		console.log($("#loginID").val());	
		var id = $("#loginID").val(); //id태그 value에 접근
		var userId = {"id" : id}; //전송할 데이터의 key값 : value설정
			
		if(id.length < 4) {
			alert("아이디는 4글자 이상 입력하세요");
		} else {
		  	//먼저 ajax에서 지원하는 json(데이터포맷)을 사용하기위해 json라이브러리를 최우선으로 받습니다.
		  	//json은 {키:값} 을 구조로하는 데이터묶음 입니다.
			//ajax문법
		  	$.ajax({
		  		type : "post",     //요청 형식
		  		url : "/checkId",   //요청할 주소
		  		data : userId,//서버에 전송할 데이터  json형식 {key:value}
		  		dataType : "json", //서버의 요청후 리턴해 주는 타입 
		  		error : function(request, error) {
		  			alert(error + "\n" + request.status);		
		  		},
		  		success : function(result) { //ajax통신에 성공했을 때 호출될 자바스크립트 함수,
		  									 //결과 여부가 result매개변수로 전달됨
					console.log("성공실패여부:" + result);
		  				
		  			if(result == 1) { //중복되는 아이디가 존재함
		  				alert("이미 존재하는 아이디 입니다");
		  			} else {
		  				alert("사용가능한 아이디 입니다");
		  				$("#loginID").attr("readonly", true);
		  				//attr(속성, 변경할값) 함수는 태그의 내부속성을 변경하는 함수 입니다.
		  			}
				}
		  	});
		} //end else
		//console.log(userId);
	}
  
  
  
  	//회원 가입 체크(joinCheck())
  	function joinCheck() {
		//attr(속성, 변경할 값) : 함수는 해당 id태그의 내부 속성을 변경하는 함수
		//attr(속성) : 함수의 매개값이 하나라면 해당 속성 여부를 확인
		//val() : 해당 id태그의 값을 참조합니다.
		//focus() : 해당 id태그의 마우스 커서를 위치시킵니다.
		//submit() : 해당 id태그의 form을 서브밋 시킴
		if(!$("#loginID").attr("readonly")) {
			alert("아이디 중복체크를 해야 합니다.");
		}else if($("#name").val().length < 1){
			alert("이름을 입력하세요!");
		}else if($("#pw").val().length < 1){
			alert("비밀번호를 입력하세요!");
		}else if($("#pw").val() !== $("#pwCheck").val()){
			alert("비밀번호 확인란을 확인해주세요!")
			$("#pwCheck").focus();
		}else if(confirm("회원 가입을 하시겠습니까?")){
			$("#regForm").submit();
		}
	}
  </script> 
	
	</body>
</html>