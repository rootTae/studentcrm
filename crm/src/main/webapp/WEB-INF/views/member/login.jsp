<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
		<form id="logform" action="/join/login" method="post">
			ID: <input type ="text" id = "id" name= "id"/><br>
			PASSWORD: <input type ="password" id = "pw" name ="pw"/><br>
			<input type="submit" value="login">
			<input type="button" value="register" onclick="location.href='regist'">
		</form>
	</div>
</body>
</html>