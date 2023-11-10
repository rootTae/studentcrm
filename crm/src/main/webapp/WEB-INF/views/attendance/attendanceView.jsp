<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!--  include/header.jsp -->
		<%@include file = "/include/header.jsp" %>
		<div id="studentList"></div>
		
		
<script src="/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/js/reply.js"></script>
<script type="text/javascript">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    $(document).ready(function(){
        var clickedClassName = "${param.class_name}";

        $.ajax({
            url: '/attendance/studentlist/' + clickedClassName,
            method: "GET",
            success: function(studentList){
                var str = "";
                for(var i = 0, len = studentList.length || 0; i < len; i++){
                    str += "<li>" + studentList[i].student_name + "</li>";
                }
                $("#studentList").html("<ul>" + str + "</ul>");
            },
            error: function(){
                console.log("Error fetching student list:");
            }
        });
    });
</script>



		
	</body>
</html>


