/**
 * 학생 정보 검색 및 출력을 위한 javascript
 */
 
 
 let StudentService = (function() { //서비스 이름이랑 같게 했더니 오류가 안남
 
 	//============== 학생 정보 검색 ===============
 	
	//학생 학번으로 검색(1개만 출력)
	function getSearchList(srch, callback, error) {
		let s_id = srch.s_id;
		//console.log("검색한 학번 : "+s_id);
		$.getJSON("/studentRest/id/"+s_id, 
			function(data){
				if(callback){
					callback(data);
					//console.log("검색한 정보 : "+data);
				}		
			}).fail(function(xhr, status, err){
				if(error){
					error(); 
				}
			});
	}
	//학생 이름으로 검색(리스트로 출력) - 이름으로 학번 검색해서 해당 학번 학생 데이터 가져오기
	function getName(srch, callback, error) {
		let s_name = srch.s_name;
		//console.log("검색한 정보 : "+s_name);
		$.getJSON("/studentRest/name/"+s_name,
			function(data){
				if(callback){
					let s_idArray = [];
					$.each(data, function(index, item) {
						//console.log("출력할 id : "+item.s_id);
						s_idArray.push(item.s_id);
					});
						
					callback(s_idArray);
					//console.log("출력할 data id : "+s_idArray);
				}
			}).fail(function(xhr, status, err) {
				if(error){
					error();
				}
			});
	}
	
	
	//============== 학생 정보 수정 ===============
	
	//학생 정보 추가
	function insertStudent(student, callback) {
		//console.log("js 실행");
		$.ajax({
			type:'POST',
			url:'/studentRest/insert',
			data:JSON.stringify(student),
			contentType:'application/json;charset=utf-8',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr, status, er) {
				if(error){
					error(er);
				}
			}	
		});
	}
	
	//학생 정보 삭제
	function deleteStudent(s_id, callback, error){
		$.ajax({
			type:'delete',
			url:'/studentRest/'+s_id,
			success : function(delResult, status, xhr){
				if(callback){
					callback(delResult);
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			} 
		});
	}
	
	//학생 정보 수정
	function updateStudent(student, callback){
		$.ajax({
			type:'POST',
			url:'/studentRest/update/'+student.s_id,
			data:JSON.stringify(student),
			contentType:'application/json;charset=utf-8',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	return{
		getSearchList:getSearchList,
		getName:getName,
		insertStudent:insertStudent,
		deleteStudent:deleteStudent,
		updateStudent:updateStudent
	}
	
})();
 
 
 
 
 
 
 
 
 