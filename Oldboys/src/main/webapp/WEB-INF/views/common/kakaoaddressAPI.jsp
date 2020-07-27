<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	 uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
<!-- 해당 주소는 우편 서비스를 쓸수 있는 주소 -->
	
<span id="address1" ></span>
<span id="guide" style="color:black; display:none"></span>
<input type="text" id="address2" placeholder="상세주소">
<input type="button" onclick="daum_PostcodeOpen();" value="주소찾기"><br>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    function daum_PostcodeOpen() {
    	new daum.Postcode({
        	oncomplete: function(data) {
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        	var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
            	// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            	if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	extraRoadAddr += data.bname;
            	}
            
           		// 건물명이 있고, 공동주택일 경우 추가한다.
            	if(data.buildingName !== '' && data.apartment === 'Y'){
               		extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            	}
            
            	// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            	if(extraRoadAddr !== ''){
                	extraRoadAddr = ' (' + extraRoadAddr + ')';
            	}
            
            	if(fullRoadAddr !== ''){
            	    fullRoadAddr += extraRoadAddr;
          	  	}
            
            	document.getElementById('address1').innerHTML = fullRoadAddr;
            	document.getElementById('address2').focus();
        	}
    	}).open();
    }
</script>
</body>
</html>
