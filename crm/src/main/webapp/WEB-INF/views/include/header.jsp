<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%	
	//231110 - 21:02 - ssy 테스트를 위해 임시 주석 처리함
	//int t_id = 2;
	//System.out.println(t_id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ACA2023 CRM</title>
		<!-- jquery -->
		<script src="https://code.jquery.com/jquery.js"></script>
		<script type="text/javascript" src="/js/classListsByLogin.js"></script>
		<%-- <script type="text/javascript">
            var t_id = '<%= session.getAttribute("t_id") %>';
            var t_id = 2;
            console.log(t_id);
        </script> --%>
	</head>
	<body>
	<div>
		
		<ul class="classList">

		
		</ul>
	</div>
    <!-- t_id 값을 data-t-id 속성에 설정 -->
   		 
    <!-- 나머지 내용 -->

<script type="text/javascript">
	//231110 - 21:02 - ssy 테스트를 위해 임시 주석 처리함
    /* $(document).ready(function(){
        var classListUL = $(".classList");
        var t_id = 1;
		//var t_id = $('#t_id').val( );
		console.log(t_id);
        
      		//attendanceService.getList({t_id: 't_id'},
    		attendanceService.getList({t_id: t_id },
            function(list){       
                var str = "";
                for(var i = 0, len = list.length || 0; i < len; i++){
                    str += "<li data-list='"+list[i].class_name+"'>" + list[i].class_name + "</li>";
                }
                classListUL.html(str);
                
                $(".classList").on("click", "li", function(){
                	var clickedClassName = $(this).data("list");
                	console.log(clickedClassName);
                	window.location.href = 'attendance/attendanceView.jsp?class_name=' + clickedClassName;
                })   
            },
            function(){
                console.log("Error fetching class list:");
            }
        );
    }); */
</script>
</body>

</html>