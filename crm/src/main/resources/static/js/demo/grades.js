/**
 * 
 */
 
 console.log("grades Module ........")
 
 var GradesService = (function () {
	
	//등록 처리
    function scoreInsert(grades, callback, error) {
        console.log("grades ......... ");

        $.ajax({
            type: 'post',
            url: '../gradesF/new',
            data: JSON.stringify(grades),
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
    //시험 등록 
     function examInsert(grades, callback, error) {
        console.log("grades ......... ");

        $.ajax({
            type: 'post',
            url: '../gradesF/neweaxm',
            data: JSON.stringify(grades),
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
    
    
    
    
    	//학생 리스트 목록보기 
      function getStudentList(param, callback, error) {
        var s_name = param.s_name;
		console.log(s_name);
        $.getJSON("/gradesF/" + s_name, function(list) {
            if (callback) {
                callback(list);
            }
        }).fail(function(xhr, status, err) {
            console.log("0000");
            if (error) {
                error(err);
            }
        });
    }
    
    function getexamList(param, callback, error) {
        console.log(param);
        var e_name = param.e_name;

        $.getJSON({
    url: "/gradesF/elist/" + e_name,
    dataType: "json",
    success: function(list) {
        if (callback) {
            callback(list);
        }
    },
    error: function(xhr, status, err) {
        console.log("111");
        if (error) {
            error(err);
        }
    }
});
    }
    
   
 
    //학생아이디로 검색 점수리스트 가져오기
    function getScoreList(param, callback, error) {
    var s_name =param.s_name;
    var s_id = param.s_id;

    // GET 요청 URL을 수정합니다.
    $.getJSON("/gradesF/" + s_name + "/" + s_id, function(list) {
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
  function scoreRemove(s_id, callback, error){
   $.ajax({
      type : 'delete',
      url : '../gradesF/' + s_id,
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
   //시험 삭제
   function examRemove(e_id, callback, error){
  	console.log(e_id);
   $.ajax({
      type : 'delete',
      url : '../gradesF/elist/' + e_id,
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
   function scoreModify(grades,callback,error){
      
   $.ajax({
      type : 'put',
      url : '../gradesF/'+s_id,
      data : JSON.stringify(grades),
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
   
   //시험 수정
   function examModify(grades,callback,error){   
     console.log(grades);
      var e_id = grades.e_id;
      console.log(e_id);
   $.ajax({
      type : 'put',
      url : '../gradesF/elist/'+e_id,
      data : JSON.stringify(grades),
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
   
   
    function AvgScore(vo, callback, error) {
    console.log("grades ......... ");
	console.log(vo);
    $.ajax({
        type: 'POST',  
        url: '../gradesF/avg',
        data: JSON.stringify(vo),
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

   
   function SubjectsTotalAvg(grades, callback, error) {
        console.log("grades ......... ");
		
		console.log(grades);
      	
	    //var e_id = grades.grades.e_id;
    	//var e_grade = grades.grades.e_grade;
		//console.log(e_id);
		//console.log(e_grade);

       $.ajax({
		    type: 'POST',
		    url: '../gradesF/subAvg',
		    data: JSON.stringify(grades),
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
    

    return {
        scoreInsert: scoreInsert,
        examInsert:examInsert,
        getStudentList : getStudentList,
        getScoreList : getScoreList,
        scoreRemove : scoreRemove,
        examRemove : examRemove,
        scoreModify : scoreModify,
        AvgScore :AvgScore,
        SubjectsTotalAvg:SubjectsTotalAvg,
        examModify : examModify,
        getexamList : getexamList
    };
})();

	

