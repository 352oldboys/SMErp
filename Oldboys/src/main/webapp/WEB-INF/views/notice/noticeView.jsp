<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세보기</title>
	<style>
		div#board-container{width:1000px; margin:0 auto; text-align:center; height:500px;}
		div#board-container input,div#board-container button{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		hr.two{
		width:1000px;
		border:1px solid ;
		color:#4e73df;
		}
	</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
	<script>
		function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/notice/fileDownload.do?oName="+oName+"&rName="+rName;
		}
	</script>
</head>
<body>
	<div id="container">
	<div id="wrapper">
      <c:import url="../common/header.jsp"/>
		<div id="board-container" style="">
			<input type="text" class="Titleform-control" placeholder="제목" name="nTitle" id="nTitle" value="${notice.nTitle }"readonly required style="width: 1004px; font-weight:bolder; ">
			<br />
			
			<%-- <input type="text" class="Dateform-control" placeholder="날짜" name="nDate" id="nDate" value="작성일 : ${notice.nDate }" style="font-size: large;";>
			<input type="text" class="Writerform-control" name="nWriter" value="작성자 : ${notice.nWriter}" readonly required> --%>
			
			<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<button  style="display: inline-block; width:300px; border:0; hight:80px" type="button" 
						class="button" 
						onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">첨부파일${vs.count} - ${a.originalFileName }		
				</button>
			<!-- 	<button class="button"  style="border:0; float:right;  margin-bottom:10px;" onclick="fn_goNoticeForm();"><b>글쓰기</b></button> -->
			</c:forEach>
			<hr class="two">
			<br />
		    <div  style="color: #2E2E2E;' " class="Contentform-control" name="nContent" placeholder="내용" readonly required >${notice.nContent }</div>
		    <hr class="two">
		    <br>
		    <button style=" border:0;"class="button" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'">리스트로</button>
		    <c:if test="${member.userId eq notice.nWriter}">
			<button style="border:0;" class="button" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdateView.do?nNo=${notice.nNo}'">수정 페이지</button>
			</c:if>
		</div>
		<c:import url="../common/footer.jsp"/>
		    <!-- End of Content Wrapper -->
        </div>
	</div>
</body>
</html>