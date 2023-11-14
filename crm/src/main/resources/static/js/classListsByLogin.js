/**
 * after logged in, get all the class-lists by teacher ID value
 */
 var attendanceService = (function(){
	 function getClassList(param, callback, error){
		var t_id = param.t_id;
		console.log(t_id);
		$.getJSON("/attendance/classlist/" + t_id,
			function(data){
				if(callback){
					callback(data)
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
	 }
	 
	 function getStudentList(param, callback, error){
		var class_name = param.class_name;
		console.log(class_name);
		$.getJSON("attendance/studentlist/" + class_name,
			function(data){
				if(callback){
					callback(data)
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}

	return{
		getClassList: getClassList,
		getStudentList: getStudentList
	};	
})();