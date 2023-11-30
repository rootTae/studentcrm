 var consultService = (function(){
	function insertConsult(param, callback, error){
		/*let s_id = param.s_id;
		let consult_date = param.consult_date;
		console.log("js:insertC");
		console.log(s_id);
		console.log(consult_date);*/
		console.log("js:insertC");
		console.log(param);
		var s_id = param.s_id;
		var consult_date = param.consult_date;
		$.ajax({
			type:'post',
			url:'/consult/new/' + s_id+'/'+ consult_date,
			data: JSON.stringify(param),
			contentType: 'application/json;charset=UTF-8',
			success: function(response){
				if(response){
					callback(response);
				}
			},
			error:function(xhr, status, err){
				if(error){
					error(error);
					console.log(status);
				}
			}
		});
	}
	
	function updateConsult(data, callback, error){
		console.log("js:updateC");
		console.log(data.consult_id);
		var consult_id = data.consult_id;
		$.ajax({
			type: 'put',
			url: '/consult/update/'+consult_id,
			contentType: 'application/JSON;charset=UTF-8',
			data: JSON.stringify(data),
			
			success: function(response){
				if(response){
					callback(response)
				}
			},
			error: function(xhr, status, err){
				if(err){
					error(err);
				}
				console.log(status);
			}
			
		});
	}
	
	function deleteConsult(consult_id, callback, error){
		console.log("js:deleteC");
		console.log(consult_id);
		$.ajax({
			type: 'delete',
			url: '/consult/delete/' + consult_id,
			
			success: function(response){
				if(response){
					callback(response)
				}
			},
			error: function(xhr, status, err){
				if(err){
					error(err);
				}
				console.log(status);
			}
			
		});
	}
	
	function showConsultByDateAndS_id(data, callback, error){
		console.log("js:showByDateAndS_id");
		console.log(data);
		$.ajax({
        type: 'GET',
        url: "/consult/show",
        contentType: 'application/json;charset=UTF-8',
        data: data,
        success: function (result) {
            if (result) {
                callback(result);
            }
        },
        error: function (xhr, status, err) {
            if (error) {
                error();
            }
            console.log(status);
        }
    	});
	}
	
	function showConsultByT_id(data, callback, error){
		console.log("js: showByT_id");
		console.log(data.t_id);
		$.ajax({
			type:'get',
			url:'/consult/show/'+data.t_id,
			contentType: 'application/json;charset=UTF-8',
			success: function (result) {
            if (result) {
                callback(result);
            }
        },
        error: function (xhr, status, err) {
            if (error) {
                error();
            }
        }
    	});
	}
	
	function getContent(data, callback, error){
		console.log("js: getContent");
		console.log(data);
		console.log(data.s_id);
		
		$.ajax({
			type: 'get',
			url: '/consult/show/content/'+data.s_id,
			contentType: 'application/json;charset=UTF-8',
			success: function (result) {
            if (result) {
                callback(result);
                console.log(result);
            }
        },
        error: function (xhr, status, err) {
            if (error) {
                error();
            }
            console.log(status);
        }
    	});
	}
	
	function getStudentList(data, callback, error){
		console.log("js: getStudentList");
		console.log(data.s_name);
		var s_name = data.s_name;
		$.ajax({
			type:'GET',
			url:'/consult/show/list/'+s_name,
			contentType: 'application/JSON;charset=UTF-8',
			success: function(result){
				if(result){
					callback(result);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error();
				}
				console.log(status);
			}
		});
	}
	
	return{
		insertConsult: insertConsult,
		updateConsult: updateConsult,
		deleteConsult: deleteConsult,
		showConsultByDateAndS_id: showConsultByDateAndS_id,
		showConsultByT_id: showConsultByT_id,
		getContent: getContent,
		getStudentList: getStudentList
	};
})();