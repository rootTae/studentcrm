/**
 * 
 */
 
 
 var PaymentService = (function () {
	
	//수강 신청
    function insertPayment(data, callback, error) {
        $.ajax({
            type: 'post',
            url: '/paymentI/newPayment',
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
       
    // 리스트 가져오기
    function getPaymentList(data, callback, error) {
        $.ajax({
            type: 'post',
            url: '/paymentI/getlist',
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
	    
    
	    //삭제
	  function paymentRemove(p_id, callback, error){
	   $.ajax({
	      type : 'delete',
	      url :"/paymentI/" + p_id,
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
	   function paymentModify(data,callback,error){
	      let p_id = data.p_id;
	   $.ajax({
	      type : 'put',
	      url : "/paymentI/"+p_id,
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
       insertPayment : insertPayment,
       getPaymentList : getPaymentList,
       paymentRemove : paymentRemove,
       paymentModify : paymentModify
    };
})();