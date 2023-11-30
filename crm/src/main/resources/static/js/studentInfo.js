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
				}		
				//console.log("검색한 정보------ : "+data);
			}).fail(function(xhr, status, err){
				//console.log("에러");
				if(callback){
					callback(null);
				}
			}
		);
	}
	
	//학생 이름으로 검색(리스트로 출력) - 이름으로 학번 검색해서 해당 학번 학생 데이터 가져오기
	function getName(srch, callback, error) {
		let s_name = srch.s_name;
		$.getJSON("/studentRest/name/"+s_name,
			function(data){
				if(callback){
					let s_idArray = [];
					$.each(data, function(index, item) {
						s_idArray.push(item.s_id);
					});
						
					callback(s_idArray);
				}
			}).fail(function(xhr, status, err) {
				if(error){
					error();
				}
			}
		);
	}
	
	
	
	
	//============== 학생 정보 수정 ===============
	
	//학생 정보 추가
	function insertStudent(student, callback) {
		//console.log("폼데이터 확인--------");
		//console.log(student.attachImg);
		
		$.ajax({
			type:'POST',
			url:'/studentRest/insert',
			data:JSON.stringify(student),
			contentType:'application/json;charset=utf-8',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
					//console.log("js : "+result);
				}
			},
			error:function(xhr, status, er) {
				//console.log("aaaa");
				if(er){
					error(er);
				}
			}	
		});
	}
	
	//학생 정보 삭제
	function deleteStudent(s_id, callback, error){
		$.ajax({
			type:'delete',
			url:'/studentRest/delete/'+s_id,
			success : function(delResult, status, xhr){
				if(callback){
					callback(delResult);
				}
			},
			error : function(xhr, status, er) {
				if(er){
					error(er);
				}
			} 
		});
	}
	
	//학생 정보 수정
	function updateStudent(student, callback){
		//console.log(student.attachImg);
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
				if(er){
					error(er);
				}
			}
		});
	}
	
	//============== 학생 통학 정보 ===============
	
	//통학 정보 출력
	function getCommute(srch, callback, error){
		//console.log(srch);
		let s_id = srch.s_id;
		//console.log("srch.s_id"+s_id);
		$.getJSON("/studentRest/commute/"+s_id, 
			function(data){
				if(callback){
					callback(data);
				}		
			}).fail(function(xhr, status, err){
				if(callback){
					callback(null);
				}
			}
		);
	}
	//통학 정보 추가
	function insertCommute(student, callback) {
		$.ajax({
			type:'POST',
			url:'/studentRest/insertC',
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
	//통학 정보 수정
	function updateCommute(student, callback){
		$.ajax({
			type:'POST',
			url:'/studentRest/updateC/'+student.s_id,
			data:JSON.stringify(student),
			contentType:'application/json;charset=utf-8',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr, status, er){
				//console.log("통학 에러");
				if(er){
					error(er);
				}
			}
		});
	}
	
	//통학 정보 삭제
	function deleteCommute(s_id, callback, error){
		$.ajax({
			type:'delete',
			url:'/studentRest/deleteC/'+s_id,
			success : function(delResult, status, xhr){
				if(callback){
					//console.log(delResult);
					callback("통학삭제성공"+delResult);
				}
			},
			error : function(xhr, status, er) {
					//console.log("삭제할 통학 정보가 없음");
				if(er){
					callback(null);
					error(er);
				}
			} 
		});
	}
	
	//============== 학급 정보 ===============
	function getClassInfoList(s_id, callback, error){
		//console.log(s_id);
		$.getJSON(
			"/studentRest/getClassInfo/"+s_id,
			function(data){
				//console.log("data : ");
				//console.log(data);
				if(callback){
					let s_classInfoArray = [];
					$.each(data, function(index, item) {
						s_classInfoArray.push(item);
					});
						
					callback(s_classInfoArray);
				}
			}
			
		).fail(function(xhr, status, err) {
			//console.log(xhr);
			//console.log("학급 정보 에러");
			if(err){
				error(er);
			}
		});
	}


	
	return{
		getSearchList:getSearchList,
		getName:getName,
		insertStudent:insertStudent,
		deleteStudent:deleteStudent,
		updateStudent:updateStudent,
		getCommute:getCommute,
		insertCommute:insertCommute,
		updateCommute:updateCommute,
		deleteCommute:deleteCommute,
		getClassInfoList:getClassInfoList
	}
	
})();
 
 
 
 
 
 
 
 
 