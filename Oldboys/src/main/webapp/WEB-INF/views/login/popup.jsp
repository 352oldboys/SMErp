<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	 uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 & 비밀번호 찾기</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"/></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/></script>

    <style>
        body{
           	margin:auto;
           	margin-top:3%;
            background: url(${pageContext.request.contextPath}/resources/img/member/find.jpg);
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

<body >
    <div class="row box_org" id="body1" style="vertical-align: middle; margin: auto;">
        <div class="col" style="text-align: center;">
            <H3>아이디 & 비밀번호 찾기</H3>
        </div>
        
        <div class="col mb-sm-3" style="margin-left: 30%;">
            <input type="button" class="btn btn-info" style="margin:auto; display:inline-block; margin-top:30px;" id="idFind" value="아이디 찾기"> 
            <input type="button" class="btn btn-info" style="margin:auto; display:inline-block; margin-top:30px;" id="passwordFind" value="비밀번호 찾기">
        </div>
        
    </div>

    <div class="row box_org" id="body2" style="vertical-align: middle; margin: auto; display: none;">
        <div class="col" style="text-align: center;">
            <H3>아이디 찾기</H3>
        </div>

    <form action="${pageContext.request.contextPath}/member/popup_id.do" method="post">
        <div class="col mb-sm-3" style="text-align: center;">
            <p class="text"> 해당 이메일 : </p> &nbsp; <input type="text" id="email" name="email" > <br />
            <p class="text"> 사용자 이름 : </p> &nbsp; <input type="text" id="name" name="name">
        </div>
        
        <div class="col mb-sm-3">
            <input type="submit" class="btn btn-info col-sm-3 mb-sm-3" style="float:right;" value="전송하기">
        </div>
    </form>
    </div>

    <div class="row box_org" id="body3" style="vertical-align: middle; margin: auto; display: none;">
        <div class="col" style="text-align: center;">
            <H3>비밀번호 찾기</H3>
        </div>
    <form action="${pageContext.request.contextPath}/member/popup_password.do" method="post">
        <div class="col mb-sm-3" style="text-align: center;">
            <p class="text"> 사용자 이메일 : </p> &nbsp; <input type="text" name="email"> <br />
            <p class="text"> 사용자 아이디 : </p> &nbsp; <input type="text" name="userId">
            <input type="hidden" name="gender" value="${member.gender}" />
        </div>

        <div class="col">
            <input type="submit" class="btn btn-info col-sm-3 mb-sm-3" style="float:right;"  value="전송하기" >
        </div>
    </form>
    </div>
</body>

    <script>
    
    $(function() {
  	    $("#idFind").on("click", function() {
            $("#body1").hide();
            $("#body2").show("slowly");
  	    });
  	  });

      $(function() {
  	    $("#passwordFind").on("click", function() {
            $("#body1").hide();
            $("#body3").show("slowly");
  	    });
  	  });
      
  	
      function checkIdFind(){	
      	$.ajax({
      		url  : "${pageContext.request.contextPath}/member/popup_id.do",
      		type : "POST",
      		data : {
      			email : $('#email').val(),
      			name  : $('#name').val()
      		}, success : function(data) {
      			console.log(data);
      			if(data == 1){
      				alert("해당 이메일로 사용자님의 아이디가 전송되었습니다.");
      				windows.close;
      			}else{
      				alert("잘못된 이메일입니다. 다시입력해주세요!");
      				$('#email').val("");
      			}
      		
      	},error : function(error, code, msg){
      		console.log(error);
      	}
      		
      	});
      };	      
        
    </script>
    
</html>