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
                  <div class="form-group">
                  	<input type="text" class="form-control form-control-user" id="userId" name="userId" placeholder="아이디 : SMERP">
                  </div>
                  <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름 : 홍길동">
                  </div>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="phone" name="phone" placeholder="핸드폰번호 : 010-1234-5678">
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호 : password">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="password2" placeholder="비밀번호확인 : repassword">
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="regNo" name="regNo" placeholder="사업자 번호 : 123-45-67890">
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" id="businessName" name="businessName" placeholder="기업명 : 홍길동">
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="이메일 : SMERP@해당주소.com">
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
                    <select  id="age" name="age">
                    	<option value="--">나이를 선택해주세요.</option>
                    	<c:forEach var="index" begin="20" end="80">
                    	<option value="${index}">${index}</option>
                    	</c:forEach>
                    </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="address" name="address" placeholder="주소 : 서울시특별시">
                </div>
                <hr />
                <div class="row">
                <a onclick="insertForm();" class="btn btn-primary btn-user" style="display:inline; color:white;">회원가입</a>
                &nbsp; &nbsp;
                <a href="${pageContext.request.contextPath}/member/backlogin.do" class="btn btn-google btn-user" style="display:inline">돌아가기</a>
               </div>
              </form>
              <div class="text-center">
              <br />
               <span style="float:left; font-size:14px;"><b>아이디는 있는데 아이디를 모르신다구요?</b></sapn>&nbsp; &nbsp;<a class="small" href="forgot-password.html">여기를 클릭하세요.</a>
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

	<script>
		$("select option[value*='--']").prop('disabled',true);
		
		function insertForm(){
			$("#insertForm").attr("action","${pageContext.request.contextPath}/member/insertMember.do");
			$("#insertForm").attr("method","post");
			$("#insertForm").submit();
		}
				
			
		
	</script>
	
</body>

</html>
    