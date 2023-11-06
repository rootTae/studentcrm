<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<div>
	<h2>신상정보 페이지</h2>
	<!-- <label for="s_search">학생 정보 검색</label>
    <input type="text" id="s_search" name="s_search" maxlength="15" placeholder="학생명 혹은 학번을 입력하세요." required>
    <button onclick="s_search()">검색</button>
    <div id="result"></div>

    <script>
    	//학생 이름 검색 ajax
        function s_search() {
            var input = document.getElementById("s_search").value;
            var xhr = new XMLHttpRequest();

            xhr.open("POST", "/studentInfo/s_search?s_search=" + input, true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("result").innerText = xhr.responseText;
                }
            };

            xhr.send();
        }
    </script> -->
    
    <input type="text" name="s_search" id="sSearch" maxlength="10" placeholder="학생명 혹은 학번을 입력하세요.">
    <button id="searchBtn">검색</button>
    
    <input type="text" id="autoComplete">
</div>

<script type="text/javascript">
	$(document).ready(function(){
		//학생 정보 검색
		let searchBtn = document.getElementById("searchBtn");	
		let search = document.getElementById("sSearch");
		
		searchBtn.addEventListener("click", function(e) {
			if(search.value === "") {
				alert("검색어를 입력해 주세요");
			}else if(/^\d+$/.test(search.value)) {
				//console.log("입력한 값은 정수입니다.");
				
			}else {
				//console.log("입력한 값은 문자열입니다.");
				
			}
		})
	});
	
	$('#autoComplete').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "../studentInfo/autocomplete"   
		         , type : "POST"
		         , dataType: "JSON"
		         , data : {value: request.term}	// 검색 키워드
		         , success : function(data){ 	// 성공
		             response(
		                 $.map(data.resultList, function(item) {
		                     return {
		                    	     label : item.s_name + "(학번:"+ item.s_id +")"  	// 목록에 표시되는 값
		                           , value : item.s_name + "(학번:"+ item.s_id +")" 		// 선택 시 input창에 표시되는 값
		                           , idx : item.s_id // index
		                     };
		                 })
		             );    //response
		         }
		         ,error : function(){ //실패
		             alert("오류가 발생했습니다.");
		         }
		     });
		}
		,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
		}
		,minLength: 1// 최소 글자수
		,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
		,delay: 100	//autocomplete 딜레이 시간(ms)
		,select : function(evt, ui) { 
	      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
			console.log(ui.item.label);
			console.log(ui.item.idx);
		 }
	});
</script>
	
<%@include file="/WEB-INF/views/include/footer.jsp"%>
