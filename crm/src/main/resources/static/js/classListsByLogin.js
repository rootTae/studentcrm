/**
 * after logged in, get all the class-lists by teacher ID value
 */
 var attendanceService = (function(){
	 function getList(param, callback, error){
		var t_id = param.t_id;
		console.log(t_id);
		$.getJSON("/attendance/classlist/"+t_id,
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
		getList: getList
		
	};	
})();