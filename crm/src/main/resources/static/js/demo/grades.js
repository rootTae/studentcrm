/**
 * 
 */
 
 console.log("grades Module ........")
 
 var GradesService = (function () {
	
	//등록 처리
    function add(grades, callback, error) {
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
    	//학생 리스트 목록보기 
      function getStudentList(param, callback, error) {
        var s_name = param.s_name;

        $.getJSON("/gradesF/" + s_name, function(list) {
            if (callback) {
                callback(list);
            }
        }).fail(function(xhr, status, err) {
            if (error) {
                error(err);
            }
        });
    }
    
    //학생아이디로 검색 점수리스트 가져오기
    function getScoreList(param, callback, error) {
    var s_name = param.s_name;
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
    
    // 댓글 삭제와 갱신 처리... 
  function remove(rno, callback, error){
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
   // 수정 
   function update(grades,callback,error){
   console.log("scoreid" +grades.score_id);
      
   $.ajax({
      type : 'put',
      url : '../gradesF/'+grades.score_id,
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
      	
	    var e_id = grades.grades.e_id;
    	var e_grade = grades.grades.e_grade;
		console.log(e_id);
		console.log(e_grade);

       $.ajax({
		    type: 'POST',
		    url: '../gradesF/subAvg/' + e_id + '/' + e_grade,
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
        add: add,
        getStudentList : getStudentList,
        getScoreList : getScoreList,
        remove : remove,
        update : update,
        AvgScore :AvgScore,
        SubjectsTotalAvg:SubjectsTotalAvg
        
    };
})();

	

