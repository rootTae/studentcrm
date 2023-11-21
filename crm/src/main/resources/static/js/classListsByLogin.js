 var attendanceService = (function(){
   
   function readInfo(param, callback, error){
      let s_id = param.s_id;
      console.log(s_id);
      $.getJSON("/attendance/"+s_id,
         function(data){
            if(data){
               callback(data)
            }
         }).fail(function(xhr, status,err){
            if(error){
               error();
            }
         })
   }
   
    function getClassList(param, callback, error){
      let t_id = param.t_id;
      console.log(t_id);
      $.getJSON("/attendance/classlist/" + t_id,
         function(data){
            if(data){
               callback(data);
            }
         }).fail(function(xhr, status, err){
            if(error){
               error();
            }
         });
    }
    
    function getStudentList(param, callback, error){
      let class_name = param.class_name;
      console.log("getStudentList");
      console.log(class_name);
      $.getJSON("/attendance/studentlist/" + class_name,
         function(data){
         console.log(data);
            if(data){
            callback(data);
               /*let s_idArray = [];
               let s_nameArray = [];
               console.log(data.s_id);
               console.log(data.s_name);
               
               $.each(data, function(index, item){
                  s_idArray.push(item.s_id);
               })
               $.each(data, function(index, item){
                  s_nameArray.push(item.s_name);
               });
               
               callback(s_nameArra);*/
            }
         }).fail(function(xhr, status, err){
         console.log("errors")
            if(error){
               error();
            }
         });
      }
    
   function insertStat(data, callback, error){
   
   console.log("insertStat");
    console.log(data);
   $.ajax({
      type:'POST',
      url:'/attendance/initial/' + data.s_id+'/'+data.a_date,
        contentType: 'application/JSON;charset=UTF-8',
        data: JSON.stringify(data),
        
        success:function(response){
         if(response){
            callback(response);
         }
      },
      error:function(xhr, status, error){
         if(error){
            error();
         }
         console.log(xhr);
          console.log(status);
          console.log(error);
      }
   });
   
   } 
     
    
   function updateStat(data, callback, error){
      /*let requestData = {
         s_id : data.s_id,
         a_date : data.a_date,
         a_status : data.a_status
      };
      */
      console.log("update.js");
      console.log(data);
      $.ajax({
         type:'PUT',
         url:'/attendance/' + data.s_id+'/'+data.a_date,
         contentType: 'application/JSON;charset=UTF-8',
         data:JSON.stringify(data),
         success:function(result){
            if(result){
               callback(result);
            }
         },
         error:function(xhr, status, error){
            if(error){
               error();
            }
         }
      });
   }
   
   function getMonthlyAttendance(data, callback, error){
      console.log("getMonthlyAttendance");
      console.log(data);
      let s_id = data.s_id;
      console.log("GMTJS");
      console.log(s_id);
      let firstDayOfMonth = data.firstDayOfMonth;
      let lastDayOfMonth = data.lastDayOfMonth;
      console.log("GMTJS: LASTDAY");
      console.log(lastDayOfMonth);
         
     $.ajax({
     type:'GET',
     /*url:"/attendance/" + s_id +"/"+ firstDayOfMonth +"/"+ lastDayOfMonth,*/
     url:"/attendance/" + s_id +"/"+ encodeURIComponent(firstDayOfMonth) + "/" + encodeURIComponent(lastDayOfMonth),
     contentType: 'application/JSON;charset=UTF-8',
     //data:JSON.stringify(data),
     success:function(result){
        if(result){
           callback(result);
        }
     },
     error:function(xhr, status, error){
        if(error){
           error();
          
        }
     }
  });
     
  }
   
   function readForUpdate(data, callback, error){
      console.log("js:readForUpdate");
      console.log(data);
      $.getJSON("attendance/read/" + data.s_id +"/"+ data.a_date,
         function(data){
            if(data){
               callback(data);
            }
      }).fail(function(xhr,status,err){
         if(error){
            error();
            console.log(err);
         }
      })
   }

   return{
      readInfo: readInfo,
      getClassList: getClassList,
      getStudentList: getStudentList,
      insertStat: insertStat,
      updateStat: updateStat,
      getMonthlyAttendance: getMonthlyAttendance,
      readForUpdate: readForUpdate
   };   
})();