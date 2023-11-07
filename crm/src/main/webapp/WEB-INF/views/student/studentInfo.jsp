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
    <ul class="search_list"></ul>
    
</div>
<script type="text/javascript" src="/js/studentInfo.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//학생 정보 검색
		let searchList = $(".search_list");
		
		$("#searchBtn").on("click", function(e) {
			let searchVal = $("#sSearch").val();
			
			//console.log("검색어"+searchVal);
			
			if(searchVal === "") {
				alert("검색어를 입력해 주세요");
			}else if(/^\d+$/.test(searchVal)) {
				console.log("입력한 값은 정수입니다.");
				getInfo(searchVal);
				
			}else {
				console.log("입력한 값은 문자열입니다.");
				/* srchName("학생이름", function(studentId) {
				    console.log("학번: " + studentId);
				}); */
				srchName(searchVal);
				//console.log("s_id : "+s_id);
				//getInfo(s_id);
				//이름으로 해당하는 id 값 list로 가져오고 클릭하면 id 값으로 학생 정보 가져오기
			}
		});
		
		//id로 학생 정보 가져오기
		function getInfo(searchVal) {
			StudentService.getSearchList({s_id:searchVal},
			function(data) {
				let str = "";
			//console.log("data.s_name : "+data.s_name);
				//학번으로 검색했을 때
				//일치하는 정보가 없음
				if(data == null || data.length == 0){
					searchList.html("");
					return;
				}else if(data.length === 1){//일치하는 정보 있음
					str += "<li data-s_id='"+data.s_id+"'>";
		            str += "<p>"+data.s_name+"</p></li>";
					
				}else { //이름으로 검색한 경우 + 동명이인이 있는 경우
					data.forEach(function(item) {
						str += "<li data-s_id='"+item.s_id+"'>";
			            str += "<p>"+item.s_name+"</p></li>";						
					});				
				}
				searchList.html(str);
			});
		}
		//이름으로 학생 id 가져오기
		function srchName(searchVal) {
			StudentService.getName({s_name:searchVal},
				function(data){
					if(data == null || data.length == 0){
						searchList.html("");
						return;
					}
					console.log("s_ids_ids_ids_ids_id : "+data);
					//searchVal = data;
					data.forEach(function(s_id){
						getInfo(s_id);
					})
			});
		}
		
	});
	
</script>
	
<%@include file="/WEB-INF/views/include/footer.jsp"%>