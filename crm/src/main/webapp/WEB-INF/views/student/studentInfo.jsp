<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/include/header.jsp"%>

<div>
	<h2>신상정보 페이지</h2>
	
	<form action="student">
		<input type="text" maxlength="10" placeholder="검색어를 입력하세요.">
		<input type="submit" value="검색">
		
	</form>
</div>
	
<%@include file="/include/footer.jsp"%>
