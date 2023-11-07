<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<div>
	<h2>신상정보 페이지</h2>
	<label for="s_search">학생 정보 검색</label>
    <input type="text" id="s_search" name="s_search" maxlength="15" placeholder="학생명 혹은 학번을 입력하세요." required>
    <button onclick="s_search()">전송</button>
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
    </script>
</div>


	
<%@include file="/WEB-INF/views/include/footer.jsp"%>
