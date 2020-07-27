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

  <title>회원 수정</title>

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
                <h1 class="h4 text-gray-900 mb-4">프로필 수정</h1>
                <hr />
              </div>
              <form id="updateForm" method="post">
                  <div class="form-group">
                  	<input type="text" class="form-control form-control-user" id="userId" name="userId" placeholder="${member.userId}" disabled>
                  </div>
                  <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="${member.name}" disabled>
                  </div>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="phone" name="phone" value="${member.phone}">
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="password2" placeholder="비밀번호확인">
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="regNo" name="regNo" placeholder="${member.regNo}" disabled>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="businessName" name="businessName" placeholder="${member.businessName}" disabled>
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="email" name="email" value="${member.email}">
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
					<span>성별 &nbsp; : &nbsp;</span> 
					<select id="gender" name="gender"> 
						<option value="--">성별을 선택해주세요.</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
                  </div>
                  <div class="col-sm-6">
                    <span>나이 &nbsp; : &nbsp;</span> 
                    <select id="age" name="age">
                    	<option value="--">나이를 선택해주세요.</option>
                    	<c:forEach var="index" begin="20" end="80">
                    	<option value="${index}">${index}</option>
                    	</c:forEach>
                    </select>
                  </div>
                </div>
                
                <div class="form-group">
                	<input type="text" class="form-control form-control-user" id="address1" name="address1" placeholder="${member.address1}" style="display:inline-block; width:100%;" disabled required>
                </div>
                <div class="form-group row">
                  <div class="col-sm-9 mb-3 mb-sm-0" >
                	  <input type="text" class="form-control form-control-user" id="address2" name="address2" value="${member.address2}" style="display:inline-block; width:100%;" required>
                  </div>
                  <div class="col-sm-3 mb-3 mb-sm-0">
                    <input type="button" class="btn btn-secondary btn-user" id="address_btn" onclick="daum_PostcodeOpen();" style="float:right; width:100%;" value="주소 검색" required>
                  </div>
                </div>
                
                <hr />
                <div class="row">
                <a onclick="updateForm();" class="btn btn-primary btn-user" style="display:inline; color:white;">회원정보 수정</a>
                &nbsp; &nbsp;
                <a href="${pageContext.request.contextPath}/member/memberDelete.do" class="btn btn-google btn-user" style="display:inline">탈퇴하기</a>
                &nbsp; &nbsp;
                <a href="${pageContext.request.contextPath}/index.do" class="btn btn-user" style="display:inline; background-color:green; color:white;">돌아가기</a>
               </div>
              </form>
              <div class="text-center">
              </div>
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
		
		function updateForm(){
			$("#updateForm").attr("action","${pageContext.request.contextPath}/member/memberUpdate.do");
			$("#updateForm").attr("method","post");
			$("#updateForm").submit();
		}
		
		function daum_PostcodeOpen() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	
		        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		        var extraRoadAddr = ''; // 도로명 조합형 주소 변수

		        // 법정동명이 있을 경우 추가한다. (법정리는 제외 ?)
		        // 법정동의 경우 마지막 문자가 "동/로/가" 종료
		        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		            extraRoadAddr += data.bname;
		        }
		            
		        // 건물명이 있고, 공동주택일 경우 추가
		        if(data.buildingName !== '' && data.apartment === 'Y'){
		            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		        }
		            
		        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 생성
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
		
	</script>
	
</body>

</html>
