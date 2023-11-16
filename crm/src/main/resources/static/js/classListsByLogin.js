/**
 * after logged in, get all the class-lists by teacher ID value
 */
 var attendanceService = (function(){
   
   function readInfo(param, callback, error){
      let s_id = param.s_id;
      $.getJSON("/attendance/"+s_id,
         function(data){
            if(callback){
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
      let class_name = param.class_name;
      console.log(class_name);
      $.getJSON("attendance/studentlist/" + class_name,
         function(data){
            if(callback){
               let s_idArray = [];
               let s_nameArray = [];
               
               $.each(data.s_id, function(index, item){
                  s_idArray.push(item.s_id);
               })
               $.each(data.s_name, function(index, item){
                  s_nameArray.push(item.s_name);
               });
               
               callback(s_nameArray);
            }
         }).fail(function(xhr, status, err){
            if(error){
               error();
            }
         });
      }
    
    function updateStat(data, callback, error){
      let requestData = {
         s_id : data.s_id,
         a_date : data.a_date,
         a_status : data.a_status
      };
      
      $.ajax({
         type:'PUT',
         url:'/attendance/' + data.s_id+'/'+data.a_date,
         contentType: 'application.JSON;charset=UTF-8',
         data:JSON.stringify(requestData),
         success:function(response){
            if(callback){
               callback(response)
            }
         },
         error:function(xhr, status, error){
            if(error){
               error();
            }
         }
      });
   }

   return{
      readInfo: readInfo,
      getClassList: getClassList,
      getStudentList: getStudentList,
      updateStat: updateStat
   };   
})();