<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div>
		<h2>마이페이지입니다.</h2>
		<h3>'${sessionScope.t_loginid }'님 로그인을 환영합니다.</h3>
		<a href="updatePage/${sessionScope.t_id }">회원정보 변경</a>
		<a href="logout">로그아웃</a>
	</div>
	
	<c:if test="${not empty msg}">
    <script>
        alert('${msg}');
    </script>
	</c:if>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
