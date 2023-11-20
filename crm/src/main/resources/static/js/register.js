/**
 * 
 */
 
 console.log("register Module ........")
 
 var RegisterService = (function () {
	
	//수강 신청
    function Rregister(data, callback, error) {


        $.ajax({
            type: 'post',
            url: '/registerC/newregister',
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }
    
    // 반 리스트 가져오기
      function getClassList(callback, error) {
        $.getJSON("/registerC/class" , function(list) {
            if (callback) {
                callback(list);
            }
        }).fail(function(xhr, status, err) {          
            if (error) {
                error(err);
            }
        });
    }
    
    //수강신청 리스트 가져오기
	 function getRegistertList(s_id, callback, error) {
			console.log(s_id);
	        $.getJSON("/registerC/class/" + s_id, function(list) {
	            if (callback) {
	                callback(list);
	            }
	        }).fail(function(xhr, status, err) {          
	            if (error) {
	                error(err);
	            }
	        });
	    }
    
	    //삭제
	  function registerRemove(r_id, callback, error){
	   console.info(r_id);
	   $.ajax({
	      type : 'delete',
	      url :"/registerC/class/" + r_id,
	      success : function(deleteResult, status, xhr){
	         if(callback){
	            callback(deleteResult);
	         }
	      },
	      error : function(xhr, status, er){
	         if(error){
	            error(er);
	         }
	      }
	   });
	   }  
   
	   // 수정 
	   function registerModify(data,callback,error){
	      let r_id = data.r_id;
	      
	      console.info(s_id);
	   $.ajax({
	      type : 'put',
	      url : "/registerC/class/"+r_id,
	      data : JSON.stringify(data),
	      contentType : "application/json;charset=utf-8",
	      success : function(result, status, xhr){
	         if(callback){
	            callback(result);
	         }
	      },
	      error : function(xhr, status, er){
	         if(error){
	            error(er);
	         }
	      }
	   });
	   }
   
    return {
       Rregister : Rregister,
       registerRemove : registerRemove,
       registerModify : registerModify,
       getClassList : getClassList,
       getRegistertList : getRegistertList
    };
})();