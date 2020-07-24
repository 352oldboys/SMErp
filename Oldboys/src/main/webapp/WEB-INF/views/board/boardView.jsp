<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 상세보기</title>
	<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input,div#board-container button{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
	</style>
	<script>
		function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
		}
	</script>
</head>
<body>
	<div id="container">
	<div id="wrapper">
      <c:import url="../common/header.jsp"/>
		<div id="board-container">
			<input type="text" class="form-control" placeholder="제목" name="bTitle" id="bTitle" value="${board.bTitle }" required>
						<br />
			<input type="text" class="Dateform-control" placeholder="날짜" name="bDate" id="bDate" value="작성일 : ${board.bDate }"readonly required>
			<input type="text" class="form-control" name="bWriter" value="${board.bWriter}" readonly required>
		
			<c:forEach items="${boardfileList}" var="a" varStatus="vs">
				<button type="button" 
						class="btn btn-outline-success btn-block"
						onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">
					첨부파일${vs.count} - ${a.originalFileName }
				</button>
			</c:forEach>
		    <textarea class="form-control" name="bContent" placeholder="내용" required>${board.bContent }</textarea>
		    <br>
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">리스트로</button>
		    <c:if test="${member.userId eq board.bWriter}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?bNo=${board.bNo}'">수정 페이지</button>
			</c:if>
		</div>
		<c:import url="../common/footer.jsp"/>
		    <!-- End of Content Wrapper -->
        </div>
	</div>
</body>
</html>