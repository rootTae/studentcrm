<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Corona Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/assets/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Register</h3>
                <form action="regForm" method="post" id="regForm">
                  <div class="row">
	                  <div class="form-group col d-flex">
		                  <div style="width: 100%;">
		                    <label>ID</label>
		                    <input type="text" class="form-control p_input" id="t_loginid" name="t_loginid">
		                  </div>
	                  </div>
	                  <div class="form-group col-2 d-flex">
	                    <input type="button" class="form-control p_input align-self-end" value="중복체크" onclick="CheckId()"><br>
					</div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>PASSWORD</label>
	                    <input type="password" class="form-control p_input" id="t_pw" name="t_pw">
	                  </div>
	                  <div class="form-group col">
	                    <label>Confirm the password</label>
	                    <input type="password" class="form-control p_input" id="pwCheck" name="pwCheck">
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>Name</label>
	                    <input type="text" class="form-control p_input" id="t_name" name="t_name">
	                  </div>
	                  <div class="form-group col">
	                    <label>Subjects</label>
	                    <input type="text" class="form-control p_input" id="t_subject" name="t_subject">
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="form-group col">
	                    <label>Teaching classes</label>
	                    <input type="text" class="form-control p_input" id="t_class" name="t_class">
	                  </div>
	                  <div class="form-group col">
	                    <label>Phone #</label>
	                    <input type="text" class="form-control p_input" id="t_phone" name="t_phone">
	                  </div>
                  </div>
                  <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control p_input" id="t_email" name="t_email">
                  </div>
                  <div class="form-group d-flex align-items-center justify-content-between">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input type="checkbox" class="form-check-input"> Remember me </label>
                    </div>
                    <a href="#" class="forgot-pass">Forgot password</a>
                  </div>
                  <div class="text-center">
                    <button type="button" class="btn btn-primary btn-block enter-btn" onclick="joinCheck()">Join</button>
                  </div>
                  <p class="sign-up text-center">Already have an Account?<a href="login"> Sign In</a></p>
                </form>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/assets/js/off-canvas.js"></script>
    <script src="/assets/js/hoverable-collapse.js"></script>
    <script src="/assets/js/misc.js"></script>
    <script src="/assets/js/settings.js"></script>
    <script src="/assets/js/todolist.js"></script>
    <!-- endinject -->
    <script type="text/javascript">
	function CheckId() {
		var id = $("#t_loginid").val(); //id태그 value에 접근
		var userId = {"t_loginid" : id}; //전송할 데이터의 key값 : value설정
			
		if(id.length < 4) {
			alert("아이디는 4글자 이상 입력하세요");
		} else {
		  	$.ajax({
		  		type : "post",     //요청 형식
		  		url : "/member/checkId",   //요청할 주소
		  		data : userId,//서버에 전송할 데이터  json형식 {key:value}
		  		dataType : "json", //서버의 요청후 리턴해 주는 타입 
		  		error : function(request, error) {
		  			alert(error + "\n" + request.status);		
		  		},
		  		success : function(result) { 
					console.log("성공실패여부:" + result);
		  				
		  			if(result == 1) { //중복되는 아이디가 존재함
		  				alert("이미 존재하는 아이디 입니다");
		  			} else {
		  				alert("사용가능한 아이디 입니다");
		  				$("#t_loginid").attr("readonly", true);
		  			}
				}
		  	});
		} //end else
		//console.log(userId);
	} 
  
  	//회원 가입 체크(joinCheck())
  	function joinCheck() {
		if(!$("#t_loginid").attr("readonly")) {
			alert("아이디 중복체크를 해야 합니다.");
		}else if($("#t_pw").val().length < 1){
			alert("비밀번호를 입력하세요!");
		}else if($("#t_pw").val() !== $("#pwCheck").val()){
			alert("비밀번호 확인란을 확인해주세요!")
			$("#t_pwCheck").focus();
		}else if($("#t_name").val().length < 1){
			alert("이름을 입력하세요!");
		}else if(confirm("회원 가입을 하시겠습니까?")){
			$("#regForm").submit();
		}
	}
  </script> 
  </body>
</html>