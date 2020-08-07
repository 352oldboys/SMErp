<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	 uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 & 비밀번호 찾기</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"/></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/></script>

    <style>
        body{
           	margin:auto;
           	margin-top:3%;
            background: url(${pageContext.request.contextPath}/resources/img/member/banner.jpg);
            padding:5%;
        }
        
        .btn{
            display: block;
            margin: auto;
        }
        
        .box_org{
            font-size: 100%;
            border: 1px black solid;
            border-radius: 1rem;
            letter-spacing: .1rem;
            font-weight: bold;
            padding: 1rem;
            color: black;
        }

        .text{
            display: inline-block;
            font-size: small;
        }

    </style> 
</head>

<body>

   <div class="row box_org" id="idMove_1" style="vertical-align: middle; margin: auto;">
        <div class="col" style="text-align: center;">
            <H3>아이디 찾기</H3>
        </div>
    <form>
        <div class="col mb-sm-3" style="text-align: center;">
            <p class="text"> 사용자님의 이메일로 인증번호를 보냈습니다. <br /> 확인 후에 하단에 입력하세요. </p> <br />
            <input type="hidden" name="dice" id="dice" value="${dice}" />
			<input type="text"  name="email_injeung" id="email_injeung">
			<input type="hidden" id="email" value="${member.email}" />  <!-- 값이 들어가면 ajax에서 무한 루프 -->
			<input type="hidden" id="userId" value="${member.userId}" />
        </div>

        <div class="col">
            <input type="button" class="btn col-sm-3 mb-sm-3" style="float:right;" onclick="sendDice();"  value="전송하기" >
        </div>
        
    </form>
    </div>

<input type="hidden" name="member" value="${member}" />
	<div class="row box_org" id="body1" style="display: none">
        <div class="col" style="text-align: center;">
            <H3>아이디 찾기</H3>
		</div>
    <form action="${pageContext.request.contextPath}/member/popup_idCheck.do">
        <div class="col mb-sm-3" style="text-align: center;">
            <p class="text"> 사용자님의 아이디는 <b>${member.userId}</b> 입니다.</p>
			<input type="hidden" name="email">
        </div>
        
        <div class="col mb-sm-3">
            <input type="submit" class="btn col-sm-3 mb-sm-3" style="float:right;" value="전송하기">
        </div>
    </form>
    </div>

<script>
function sendDice(){
	if($('#email_injeung').val() == $('#dice').val()){
		alert('인증번호가 일치합니다.');
	$('#body1').css('display', 'block');
	$('#idMove_1').css('display', 'none');
	}
}
</script>
        
</body>
</html>