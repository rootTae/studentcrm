<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div>
		<form id="logform" action="loginForm" method="post">
			ID: <input type ="text" id = "t_loginid" name= "t_loginid"/><br>
			PASSWORD: <input type ="password" id = "t_pw" name ="t_pw"/><br>
			<input type="submit" value="login">
			<input type="button" value="register" onclick="location.href='regist'">
		</form>
	</div>
	
	<c:if test="${not empty msg}">
    <script>
        alert('${msg}');
    </script>
	</c:if>
<%@include file="/WEB-INF/views/include/footer.jsp"%>