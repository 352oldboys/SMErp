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
    <div class="row box_org" id="passwordMove_1" style="vertical-align: middle; margin: auto;">
        <div class="col" style="text-align: center;">
            <H3>비밀번호 찾기</H3>
        </div>
    <form>
        <div class="col mb-sm-3" style="text-align: center;">
            <p class="text"> 사용자님의 이메일로 인증번호를 보냈습니다. <br /> 확인 후에 하단에 입력하세요. </p> <br />
			<input type="text"  name="email_injeung" id="email_injeung">
			<input type="hidden" name="dice" id="dice" value="${dice}"/>
			<input type="hidden" id="email" value="${member.email}" />  <!-- 값이 들어가면 ajax에서 무한 루프 -->
			<input type="hidden" id="userId" value="${member.userId}" />
        </div>

        <div class="col">
            <input type="button" class="btn col-sm-3 mb-sm-3" style="float:right;" onclick="sendDice();"  value="전송하기" >
        </div>
    </form>
    </div>

    
    <div class="row box_org" id="passwordMove_2" style="display: none">
    	<div class="col">
    		<h3>비밀번호 변경</h3>
    	</div>
    	
    	<form action="${pageContext.request.contextPath}/member/checkPasswordFind.do" id="passwordFind">
    		<div class="col mb-sm-3">
    			<p>변경하실 비밀번호를 입력하세요.</p>
    			<input type="password" id="password" name="password" />
    			<input type="password" id="repassword" name="repassword" />
    		</div>
    		<div class="col">
    			<input type="submit"  id="close" value="전송하기"  />
    		</div>
    	</form>
    </div>
 
	
	<script>
	/* function sendDice(){
		
		$.ajax({
			url  : "${pageContext.request.contextPath}/member/popup_password.do",
			type : "POST",
			data : {
				userId : $('#userId').val(), // result로 받게 되면 여기X & 숫자도 동일함 하지만 0,1은 success 후에 else로 빠져 버린다.
				email : $('#email').val()
			}, success : function(data){	
				if(data.dice == 1){	
					
				// ===============   =============== //
				  $.ajax({
						 url : "${pageContext.request.contextPath}/member/join_injeung.do",
						 type : "POST",
						 data : {
							 email_injeung : $('#email_injeung').val(),
							 email : $('#email').val()
						 }, success : function(data) {
							 console.log(data);
							 if(data.succ == true){
								 alert("인증번호가 일치하였습니다. 비밀번호변경 창으로 이동합니다.");
								 $('#passwordMove_1').attr("display","none");
								 $('#passwordMove_2').attr("display","block");
								
							 }else{
								 alert("인증번호가 일치하지 않습니다. 결과를 다시 확인해 보세요.");
								 $('[name=email_injeung]').val('');
							 }
							 
						 }, error : function(error, code , msg){
							 console.log(error);
						 }
					  });
				  
				// ===============   =============== //
			}else{		//--> [숫자 1로 받으면 : ]현재 여기 !? & [숫자 0로 받으면 : ] 여기  
				alert("인증코드가 실패하였습니다. 새로고침을 하세요!");
			}
		}, error : function(error, code, msg){
				 console.log(error);
			// [rseult : ] 여기
			// 지금 result로는 못받고 있다라는 뜻이 될것이다.
			
		}
	});
} */
	
	
function sendDice(){
		
	if($('#email_injeung').val() == $('#dice').val()){
		alert("인증번호 일치");
		
		$('#passwordMove_2').css("display", "block");	
		$('#passwordMove_1').css("display","none");
		
		
	}else{
		 alert("인증번호가 일치하지 않습니다. 결과를 다시 확인해 보세요.");
	}
		

			}
		
/* function close(){
	$("#passwordFind").attr("action","${pageContext.request.contextPath}/member/checkPasswordFind.do");
	$("#passwordFind").attr("method","post");
	$('#passwordFind').submit();
	window.close();
}		 */
		

	</script>
</body>

</html>