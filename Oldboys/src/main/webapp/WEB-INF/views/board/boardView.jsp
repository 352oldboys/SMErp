<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.kh.erp.boardComment.model.vo.*" %>
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
		<div id="commaintext"
					style="margin: 0 auto; width: 248px; padding: 40px 0px;">
					<!-- <button id="upbtn" type="button" class="btn btn-link">
						<i id="upicon" class="fas fa-caret-up"></i> <span
							style="color: darkgrey">21</span>
					</button> -->
					<!----좋아요 누를때 숫자 올라가야합니다.---->

					<!-- <button id="downbtn" type="button" class="btn btn-link">
						<i id="downicon" class="fas fa-caret-down"
							style="margin-right: 10px;"></i>
						비추/싫어요 숫자 올라가야합니다.
						<span style="color: darkgrey">4</span>
					</button> -->
		<div id="comment">
					<ul id="commentul">
						<li
							style="border-bottom: solid 1px #b8b8b8; padding-bottom: 20px;">
							<form style="width: 100%; margin: 0 auto;">
								<div class="input-group mb-3">
									<input type="text"  id="userNo" name="userNo" value= ${member.userNo } >
									<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" id="ccontent" name="ccontent">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button" id="button-addon2">확인</button>
									</div>

								</div>
							</form>
						</li>

						<c:forEach items="${clist}" var="bc">
							<li id="${bc.bNo}" class="commentli">
								<div style="margin-bottom: 10px;">
									<i class="fas fa-paw" style="font-size: 20px;"></i>&nbsp;&nbsp;${bc.userId}&nbsp;&nbsp;
									<span id="commentli_time">&nbsp;&nbsp;${bc.bcdate}
									</span>
									<span>
									<button style="padding: 5px; margin-top: 30px; margin:auto; float: right;" type="button" class="btn btn-light" 
									onclick="location.href='${pageContext.request.contextPath}/boardComment/boardCommentDelete.do?bNo=${bNo}&cno=${bc.cno}'">삭제하기</button>
									</span>
								</div>
								<p>${bc.ccontent}</p>
								<div style="padding-top: 20px;">
									<!-- <a href="#" id="commentp"
										onclick="SirenFunction('SirenDiv'); return false;">답글달기</a> -->
										
								</div>
							</li>
						</c:forEach>
					</ul>
				<script>
						function SirenFunction(idMyDiv) {
							var objDiv = document.getElementById(idMyDiv);
							if (objDiv.style.display == "block") {

							} else {
								objDiv.style.display = "block";
							}
						}
					</script>
				</div>
		<c:import url="../common/footer.jsp"/>
		    <!-- End of Content Wrapper -->
        </div>
	</div>
	<script type="text/javascript">
	 document.getElementById("button-addon2").addEventListener("click", function() {
	    	if(ccontent.value==""||ccontent.value.length==0){
				alert("댓글을 입력해 주세요");
				return false;
			}else{
				location.href='${pageContext.request.contextPath}/boardComment/insertBoardComment.do?bNo=${bNo}&userNo=${member.userNo}&ccontent='+ccontent.value;
			}}, false);
	</script>
</body>
</html>