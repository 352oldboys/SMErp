<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	 uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원가입</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/member/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/member/sb-admin-2min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">회  원  가  입</h1>
                <hr />
              </div>
              <form id="insertForm" method="post">
              <div class="form-group row">
                  <div class="col-sm-8 mb-3 mb-sm-0">
                  	<input type="text" class="form-control form-control-user" id="userId" name="userId" style="display: inline-block;" required/> 
                  </div>
                  <div class="col-sm-4 mb-3 mb-sm-0">
                  	<input type="button" class="btn btn-secondary btn-user" id="idCheckBtn" style="width:100%" value="아이디 중복확인" required/>
				  </div>
                  	<span id="userIdCheck" class="col-12"></span>
                </div>
                  <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름 : 홍길동">
                  </div>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="phone" name="phone" placeholder="핸드폰번호 : 01012345678" onchange="phoneCheck(this)" required />
                  	<span id="phoneText" style="color:red; font-size:16px; text-align:center; display:none;">핸드폰방식이 일치하지 않습니다.</span>
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호 : password">
                    <span id="passwordText" style="color:red; font-size:16px; display:none;">패스워드가 일치하지 않습니다.</span>
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="repassword" name="repassword" placeholder="비밀번호확인 : repassword">
                  	<span id="pwdCheck" style="color:red; font-size:16px; display:none;"></span>
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="regNo" name="regNo" placeholder="사업자 번호 10자리를 입력해주세요." onchange="regNoCheck(this)" required />
                    <span id="regNoText" style="color:red; font-size:16px; display:none;">사업자번호가 일치하지 않습니다.</span>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="businessName" name="businessName" placeholder="기업명 : 홍길동" required>
                  </div>
                </div>
                
                <div class="form-group row">
                 <div class="col-sm-9 mb-3 mb-sm-0">
                    <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="이메일 : SMERP@해당주소.com" onchange="emailCheck(this)" style="display:inline-block;" required /> 
                    <span id="emailText" style="color:red; font-size:16px; display:none;"><b>이메일 방식이 맞지 않습니다.</b></span>
                 </div>
                 <div class="col-sm-3 mb-3 mb-sm-0">
                 	<input type="button" class="btn btn-secondary btn-user" style="width:100%" value="이메일 인증" onclick="showEmail();" required/>
	


                 </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
					<span>성별 &nbsp; : &nbsp;</span> 
					<select id="gender" name="gender" required> 
						<option value="--">성별을 선택해주세요.</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
                  </div>
                  <div class="col-sm-6">
                    <span>나이 &nbsp; : &nbsp;</span> 
                    <select  id="age" name="age" required>
                    	<option value="--">나이를 선택해주세요.</option>
                    	<c:forEach var="index" begin="20" end="80">
                    	<option value="${index}">${index}</option>
                    	</c:forEach>
                    </select>
                  </div>
                </div>
                
              	  
              	<div class="form-group">
                	<input type="text" class="form-control form-control-user" id="address1" name="address1" value="주소" style="display:inline-block; width:100%;" readonly />
                </div>
                <div class="form-group row">
                  <div class="col-sm-9 mb-3 mb-sm-0" >
                	  <input type="text" class="form-control form-control-user" id="address2" name="address2" placeholder="상세주소" style="display:inline-block; width:100%;" required />
                  </div>
                  <div class="col-sm-3 mb-3 mb-sm-0">
                    <input type="button" class="btn btn-secondary btn-user" id="address_btn" onclick="daum_PostcodeOpen();" style="float:right; width:100%;" value="주소 검색" required />
                  </div>
                </div>
                
                <hr />
                <div class="row" style="float:right;">
                <a type="submit" id="button" onclick="insertForm();" class="btn btn-primary btn-user" style="display:inline; color:white; " >회원가입</a>
                &nbsp; &nbsp;
                <a href="${pageContext.request.contextPath}/member/backlogin.do" class="btn btn-google btn-user" style="display:inline">돌아가기</a>
               </div>
              </form>
              
	<div id="emailModal" class="modal">
      		<div class="modal-content" style="width:400px; text-align: center;">
                <b><span style="font-size: 24pt;">인증번호 확인창</span></b>
                <br /><p style="margin-top:0px;">(아래에 해당 인증 번호를 입력하세요)</p>
                <div class="row" style="margin:auto;">
	                <input type="text" class="col-7 mb-sm-3" name="email_injeung" style="display: inline-block; width:100%;"/> 
	                &nbsp; &nbsp; 
	                <input type="button" class="col-4 mb-sm-3" style="display: inline-block; width:100%;" onclick="sendDice()" value="확인"/>
                </div>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
            
      </div>
 
    </div>
              
          <br />
          <span style="float:center; font-size:14px;"><b>아이디는 있는데 아이디를 모르신다구요?</b></sapn>&nbsp; &nbsp;<a class="small" href="forgot-password.html">여기를 클릭하세요.</a>
             
            </div>
          </div>
        </div>
      </div>
    </div>

   </div>
  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/js/member/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/member/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/js/member/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/resources/js/member/sb-admin-2.js"></script>

  <!-- daum address API -->
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script>
		$("select option[value*='--']").prop('disabled',true);
	
		function daum_PostcodeOpen() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	
		        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		        var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		        
		        // 법정동명이 있을 경우 추가한다. (법정리는 제외?)
		        // 법정동의 경우 마지막 문자가 "동/로/가" 종료
		        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		            extraRoadAddr += data.bname;
		        } 
		        // 건물명이 있고, 공동주택일 경우 추가
		        if(data.buildingName !== '' && data.apartment === 'Y'){
		            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		        }   
		        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열 생성
		        if(extraRoadAddr !== ''){
		            extraRoadAddr = ' (' + extraRoadAddr + ')';
		        }
		        if(fullRoadAddr !== ''){
		            fullRoadAddr += extraRoadAddr;
		        }   
		        document.getElementById('address1').value = fullRoadAddr;
		        document.getElementById('address2').focus();
		        }
		    }).open();
		}
		
		function insertForm(){
			$("#insertForm").attr("action","${pageContext.request.contextPath}/member/insertMember.do");
			$("#insertForm").attr("method","post");
			$("#insertForm").submit();
		}
		
		// 이메일을 인증하지 않으면 보내지 못하는 기능
		$('#insertForm').submit(function(event){
			if(!emailAuth) {
				event.preventDefault();
				alert("이메일 인증을 해주셔야합니다.");
			} else {
				return;
			}
		});
		
		console.log($("#userId").val());
		
		$("#idCheckBtn").on("click", function (){
			if($('#userId').val().length != 0) {
				var regExp = /^[a-z0-9_]{4,20}$/;
				
				$.ajax({
					url : '${pageContext.request.contextPath}/member/idCheck.do',
					type : 'post',
					data : {
						userId : $("#userId").val()
					},
					success :function(data){
					console.log("값이 들어오는가? : " + data);
					
			if(data.result == 1){
				console.log("if에서받는 값 : "+ data);
				$('#userIdCheck').text("사용중인 아이디 입니다");
				$('#userIdCheck').css("color", "red");
				 
			}else if(data.result == 0){
				console.log("else if에서 받는 값 : " + data);
				$('#userIdCheck').text("사용이 가능한 아이디입니다.");
				$('#userIdCheck').css("color", "blue");

			}else if(data.result != 1 && 0){
				console.log("else에서 받는 값 : " + data);
				$('#userIdCheck').text("아이디 내용 값이 없습니다 아이디를 입력하세요");
				$('#userIdCheck').css("color","green");
				
			}
				
				}, error : function (){	// 계속된 error 확인 문구만 실행됨
					console.log("실패");
					alert("error 관리자에게 문의하세요.");
					$("#userIdCheck").css("color", "green");
					console.log($("#userId").val());
					//$('#userIdCheck').
					
				}
			
			});
			} else {
				alert("Plz input userId first!");
			}
			
		});
				
		
		var emailchk = false; // email false과 ture확인할 것
		var emailAuth = false;
		function emailCheck(obj) {
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var email = obj.value;

			if(regExp.test(email) != true){
				$("#emailText").show(3000);
				$("#emailText").hide(3000);
				return false;
			}
			
			emailchk = true;
			return true;
		}
		
		function phoneCheck(obj){
			var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
			var phone = obj.value;

			if(regExp.test(phone) != true){
				$("#phoneText").show(3000);
				$("#phoneText").hide(3000);
			}
			return true;
		}
		
		function regNoCheck(obj){
			var regExp = /^([0-9]{10})$/;
			var regNo = obj.value;
			
			if(regExp.test(regNo) != true){
				$("#regNoText").show(3000);
				$("#regNoText").hide(3000);
			}
			return true; 
		}
		
		function passwordValidate(){
			var pw = $('#password').val();
			var repw = $('#repassword').val();
			
			if(pw != '' && repw == ''){
			}else if(pw != '' && repw != ''){
				if(pw == repw) {
					alert("두개의 비밀번호가 일치합니다");
				}else {
					alert("두개의 비밀번호가 일치하지 않습니다. \n다시한번 확인해주세요.");
					$("#password").val('');
					$("#repassword").val('');
				}
			}
		};
		$('input:password[name=password]').on('change',function(){
			passwordValidate();
		});
		$('input:password[name=repassword]').on('change',function(){
			passwordValidate();
		});
		
	  function showEmail() {
		  if(emailchk == true){	
				$.ajax({
					url : '${pageContext.request.contextPath}/member/auth.do',
					type: 'POST',
					data: {
						email : $("#email").val()
					}, success : function(data){
						if(data == "mv") {	
							alert("해당 이메일로 인증코드가 발송되었습니다.");
							$('#emailModal').show();
						}
					}, error : function(error, code, msg){
						console.log(error);
					}			
				});			
		  } else {
			alert("회원님의 이메일을 적어주세요");	  			  
		  }
	  }
	  
	  function sendDice(){
		  $.ajax({
			 url : "${pageContext.request.contextPath}/member/join_injeung.do",
			 type : "post",
			 data : {
				 email_injeung : $('[name=email_injeung]').val(),
				 email : $("#email").val()
			 }, success : function(data) {
				 console.log(data);
				 if(data.succ == true){
					 alert("인증번호가 일치하였습니다. 회원가입창으로 이동합니다.");
					 $('#emailModal').hide();
					 emailAuth = true;
				 }else{
					 alert("인증번호가 일치하지 않습니다. 결과를 다시 확인해 보세요.");
					 $('[name=email_injeung]').val('');
				 }
				 
			 }, error : function(error, code , msg){
				 console.log(error);
			 }
		  });
	  }
	  
      function close_pop(flag) {
           $('#emailModal').hide();
      };

	</script>
	
</body>

</html>