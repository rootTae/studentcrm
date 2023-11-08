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
    <form>
   	 <input type="text" name="s_search" id="sSearch" maxlength="10" placeholder="학생명 혹은 학번을 입력하세요.">
   	 <button type="submit" id="searchBtn">검색</button>
    </form>
    <ul class="search_list"></ul>
    
   	<button class="s_add_Btn" style="display:none">추가</button>
   	<button class="s_modify_Btn" style="display:none">수정</button>
   	<button class="s_del_Btn" style="display:none">삭제</button>
   	
   	<button class="s_save_Btn" >저장</button>
   	<button class="s_init_Btn" >초기화</button>
   	<button class="s_cancel_Btn" style="display:none">취소</button>
   	
    <div class="form_box">
	    <form action="" method="POST">
	    	<label for="s_name">이름</label><input type='text' name='s_name' id='s_name'><br>
	    	<label for="s_id">학번</label><input type='text' name='s_id' id='s_id' readonly><br><!-- 자동으로 정해지는거라 입력할 수 없다는 안내하기 -->
	    	<label for="s_school">학교</label><input type='text' name='s_school' id='s_school'><br>
	    	<label for="s_grade">학년</label><input type='text' name='s_grade' id='s_grade'><br>
	    	<label for="s_birth">생일</label><input type='text' name='s_birth' id='s_birth'><br>
	    	성별<input type='radio' name='s_gender' id='s_gender_m'><label for="s_gender_m">남</label>
	    	<input type='radio' name='s_gender' id='s_gender_f'><label for="s_gender_f">여</label><br>
	    	<label for="s_phone">전화번호</label><input type='text' name='s_phone' id='s_phone'><br>
	    	<label for="s_family">보호자 명</label><input type='text' name='s_family' id='s_family'><br>
	    	<label for="s_relation">학생과의 관계</label><input type='text' name='s_relation' id='s_relation'><br>
	    	<label for="s_family_phone1">보호자 연락처</label><input type='text' name='s_family_phone1' id='s_family_phone1'><br>
	    	<label for="s_family_phone2">추가 연락처</label><input type='text' name='s_family_phone2' id='s_family_phone2'><br>
	    	<label for="s_sibling">형제 정보</label><input type='text' name='s_sibling' id='s_sibling'><br>
	    	<label for="reg_date">최초 등록일</label><input type='text' name='reg_date' id='reg_date'><br>
	    	<label for="first_date">첫 수업일</label><input type='text' name='first_date' id='first_date'><br>
	    	<label for="s_filename">학생 사진</label><input type='text' name='s_filename' id='s_filename'><br>
	    </form>
    </div>
    
</div>
<script type="text/javascript" src="/js/studentInfo.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//============== 학생 정보 검색 ===============
		let searchList = $(".search_list");
		let studentForm = $(".form_box > form");
		
		//취소 버든 클릭시 데이터를 되돌리기 위한 s_id
		let beforeSId = "";
		
		//검색 버튼
		$("#searchBtn").on("click", function(e) {
			e.preventDefault();
			let searchVal = $("#sSearch").val();
			searchList.children().remove(); //새로 검색 했을 때 이전 검색 결과 지우기
			
			if(searchVal === "") { //검색어 비었을 때
				alert("검색어를 입력해 주세요");
				
			}else if(/^\d+$/.test(searchVal)) { //학번 검색 했을 때
				//console.log("입력한 값은 정수입니다.");
				getInfo(searchVal);
				
			}else { //이름 검색했을 때
				//console.log("입력한 값은 문자열입니다.");
				srchName(searchVal);
			}
		});
		
		//id로 학생 정보 가져오기
		function getInfo(searchVal) {
			StudentService.getSearchList({s_id:searchVal},
			function(data) {
				let currentHTML = searchList.html();
				let str = "";
				//학번으로 검색했을 때
				//일치하는 정보가 없음
				if(data == null || data.length == 0){
					//searchList.html("");
					$("#sSearch").val("");
					alert("일치하는 정보가 없습니다.");
					return;
				}
				str += "<li>";
	            str += "<a href='#' data-s_id='"+data.s_id+"'>"+data.s_name+"</a></li>";
					
				searchList.html(currentHTML + str);
			});
		}
		//이름으로 학생 id 가져오기
		function srchName(searchVal) {
			StudentService.getName({s_name:searchVal},
				function(data){
					if(data == null || data.length == 0){
						//searchList.html("");
						$("#sSearch").val("");
						alert("일치하는 정보가 없습니다.");
						return;
					}
					//이름으로 해당하는 id 값 가져오고 각 id 값으로 학생 정보 가져오기
					data.forEach(function(s_id){
						getInfo(s_id);
					})
			});
		}
		
		//검색한 학생정보 선택해서 DB 상세정보 form에 출력하기
		searchList.on("click", "li a", function(e) {
			e.preventDefault();
			//console.log($(this).data("s_id"));
			
			//버튼 토글
			btnTogle($(this));
			//처음엔 저장, 초기화 버튼만 보이다가 검색한 데이터를 클릭하면 수정, 삭제, 추가 버튼으로 변경
			
			beforeSId = $(this).data("s_id");//취소 버튼 되돌리기용인데 이렇게 따로 안해도 될거 같은데? 헷갈리니까 걍 냅두기
			
			let studentId = $(this).data("s_id");
			getStudent(studentId);
		});
		
		//학생 정보 출력
		function getStudent(studentId){
			StudentService.getSearchList({s_id : studentId},
				function(data){
					$("#s_name").val(data.s_name);
					$("#s_id").val(data.s_id);
					$("#s_school").val(data.s_chool);
					$("#s_grade").val(data.s_grade);
					$("#s_birth").val(data.s_birth);
					$("#s_phone").val(data.s_phone);
					$("#s_family").val(data.s_family);
					$("#s_relation").val(data.s_relation);
					$("#s_family_phone1").val(data.s_family_phone1);
					$("#s_family_phone2").val(data.s_family_phone2);
					$("#s_sibling").val(data.s_sibling);
					$("#reg_date").val(data.reg_date);
					$("#first_date").val(data.first_date);
					$("#s_filename").val(data.s_filename);
					if(data.s_gender == "남") {
						$("#s_gender_m").prop('disabled', false).prop('checked', true);
						$("#s_gender_f").prop('disabled', true);
					} else {
						$("#s_gender_f").prop('disabled', false).prop('checked', true);
						$("#s_gender_m").prop('disabled', true);
					}
			});
			//학생 정보 출력 후 수정 막기 - 출력된 학생 정보를 수정하려면 수정 버튼을 눌러야 함
			studentForm.find("input").prop('readonly', true);
		}
			
		//============== 학생 정보 수정 ===============
		let addBtn = $(".s_add_Btn");
		let modifyBtn = $(".s_modify_Btn");
		let delBtn = $(".s_del_Btn");
		let saveBtn = $(".s_save_Btn");
		let cancelBtn = $(".s_cancel_Btn");
		let initBtn = $(".s_init_Btn");
		
		//추가 버튼
		//- 추가 버튼을 누르면 보던 학생 정보가 사라지면서 입력 할 수 있도록 변경
		//- 내용 작성중 취소 버튼을 누르면 보던 학생 정보 다시 보여줌
		addBtn.on("click", function(e) {
			btnTogle($(this));
			
			//초기화 - 입력 할 수 있도록 보던 정보 비우고 readonly 제거
			studentInit();			
		});
		
		//학생 정보 등록
		function setStudent(e){			
			//console.log($("input[name='s_gender']:checked").next().text());
			
			//필수 입력 정보 확인
			//이름
			if($("#s_name").val() == ""){
				alert("이름은 필수 입력 항목입니다.");
				return;
			}
			
			
			//입력할 데이터
			let student = {
				s_name : $("#s_name").val(),
				s_school : $("#s_school").val(),
				s_grade : $("#s_grade").val(),
				s_birth : $("#s_birth").val(),
				s_gender : $("input[name='s_gender']:checked").next().text(),
				s_phone : $("#s_phone").val(),
				s_family : $("#s_family").val(),
				s_relation : $("#s_relation").val(),
				s_family_phone1 : $("#s_family_phone1").val(),
				s_family_phone2 : $("#s_family_phone2").val(),
				s_sibling : $("#s_sibling").val(),
				reg_date : $("#reg_date").val(),
				first_date : $("#first_date").val(),
				s_filename : $("#s_filename").val()
			}
			
			StudentService.insertStudent(student, function(result){
				console.log("정보 추가 결과 :"+result);
				console.log(e.target);
				btnTogle(e);
			});
			
		}
		
		
		
		//수정 버튼
		modifyBtn.on("click", function(e) {
			btnTogle($(this));
			
			
		});
		
		//삭제 버튼
		delBtn.on("click", function(e) {
			btnTogle($(this));
		});
		
		//저장 버튼
		saveBtn.on("click", function(e) {
			//btnTogle($(this));
			
			//학생 정보 등록
			/* setStudent().then(() => {
				console.log("");
				btnTogle($(this));//화살표 함수를 사용하면 이 함수 외부의 this를 가리킬 수 있다.
			}); */
			/* setStudent().then(function() {
				btnTogle($(this));//화살표 함수를 사용하면 이 함수 외부의 this를 가리킬 수 있다.
				
			}); */
			setStudent();
		});
		
		//취소 버튼
		cancelBtn.on("click", function() {
			btnTogle($(this));
			
			//기존에 보던 학생정보 페이지 보여주기
			console.log("이전에 보던 번호 : "+beforeSId);
			getStudent(beforeSId);
		});
		
		//버튼 show, hide
		function btnTogle(clickBtn) {
			//처음 화면에 들어왔을 때 : 저장, 초기화 버튼만 보임
			
			//검색 결과로 나온 학생을 클릭 : 저장, (취소), 초기화 버튼 숨김 / 수정, 삭제, 추가 버튼 보임
			//취소 버튼을 클릭 : 저장, 취소, (초기화) 버튼 숨김 / 수정, 삭제, 추가 버튼 보임
			//저장 버튼을 클릭 : 저장, 취소, 초기화 버튼 숨김 / 수정, 삭제, 추가 버튼 보임
			if(clickBtn.is(searchList.find("li a")) || clickBtn.is(cancelBtn) || clickBtn.is(saveBtn)) {
				saveBtn.hide();
				cancelBtn.hide();
				initBtn.hide();
				
				addBtn.show();
				modifyBtn.show();
				delBtn.show();
			
			//추가 버튼을 클릭 : 수정, 삭제, 추가 버튼 숨김 / 저장, 취소 버튼 보임
			}else if(clickBtn.is(addBtn)) {
				addBtn.hide();
				modifyBtn.hide();
				delBtn.hide();
				
				saveBtn.show();
				cancelBtn.show();
			} 
			/* else if(clickBtn.is(cancelBtn) || clickBtn.is(saveBtn)) {
				addBtn.show();
				modifyBtn.show();
				delBtn.show();
				
				cancelBtn.hide();
				saveBtn.hide();
				
			} */
		}
		
		//학생 정보 초기화
		function studentInit() {
			//input - readonly 제거, value 값 삭제
			studentForm.find("input:not('#s_id')").prop('readonly', false).val('');
			$("#s_id").val('');
			//radio - disabled, checked 제거
			studentForm.find("input[type='radio']").prop('disabled', false).prop('checked', false);
		}
			
			
	});
	
</script>
	
<%@include file="/WEB-INF/views/include/footer.jsp"%>