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
		div#board-container{width:850px; margin:0 auto; text-align:center; height:500px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		hr.two{
		width:600px;
		background:#255ff4;
		border:2.5px solid ;
		color:#255ff4;
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
		<div id="board-container" >	
		<img src="${pageContext.request.contextPath}/resources/img/smerp1.png"  style=" width:180px; height: 180px; "/>
		<%-- <img src="${pageContext.request.contextPath}/resources/img/smerp1.png" /> --%>
			<div style="float:right;">
			<input type="text" class="Titleform-control" placeholder="제목" name="nTitle" id="nTitle" value="제목 : ${notice.nTitle }"
			readonly required style="width: 650px; font-weight:bolder; float:right; text-align:left; padding-left:22px;">
			<br /><br />
			<hr class="two">
			<%-- <div style="text-align:right;">
			작성자 : ${notice.nWriter } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			작성일 : ${notice.nDate }
			</div> --%>
			<%-- <input type="text" class="Dateform-control" placeholder="날짜" name="nDate" id="nDate" value="작성일 : ${notice.nDate }" style="font-size: large;";>
			<input type="text" class="Writerform-control" name="nWriter" value="작성자 : ${notice.nWriter}" readonly required> --%>
		
			<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<%--  원래꺼<button  style="display: inline-block; width:300px; border:0; hight:80px" type="button" 
						class="button" 
						onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">첨부파일${vs.count} - ${a.originalFileName }		
				</button> --%>
				
				<!-- downbtn css 먹은 버튼  -->
				
				<button type="button" id="downbtn" data-dl style="display: inline-block; width:300px;" onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">첨부파일${vs.count} - ${a.originalFileName }>
					<span class="dl-icon"></span>
					<span>&#x44;&#x6F;&#x77;&#x6E;&#x6C;&#x6F;&#x61;&#x64;</span>
				</button>
			
			
			<!-- 	<button class="button"  style="border:0; float:right;  margin-bottom:10px;" onclick="fn_goNoticeForm();"><b>글쓰기</b></button> -->
			</c:forEach>
				</div>	
			<c:if test="${ !empty attachmentList }" >
			<!-- <hr class="two"> -->
			</c:if>
			<br />
			
		
			<!-- <div style="  font-size:25px; "class="card-block"> -->
			<textarea style ="padding: 10px; font-size:25px; border:1px solid black; background: #fcfeff; color: #2E2E2E; margin-top:8px;  width:900px;" name="nContent"  class="Contentform-control" cols="10" rows="25" placeholder="내용" readonly required >${notice.nContent }
		    <%-- <div  style="color: #2E2E2E;' " class="Contentform-control" name="nContent" placeholder="내용" readonly required >${notice.nContent }</div> --%>
		    </textarea>
		    
		    <!-- </div> -->
		    <br>
		    <button style=" border:0;"class="button" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'">리스트로</button>
		    <c:if test="${member.userId eq notice.nWriter}">
			<button style="border:0;" class="button" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdateView.do?nNo=${notice.nNo}'">수정 페이지</button>
			</c:if>
		</div>
		<br /><br /><br /><br />
		<br /><br /><br /><br />
		<c:import url= "../common/footer.jsp"  />
		    <!-- End of Content Wrapper -->
        </div>
	</div>
</body>
<script>
			document.addEventListener("DOMContentLoaded",function(){
				this.addEventListener("click",e => {
					let tar = e.target;
					if (tar.hasAttribute("data-dl")) {
						let dlClass = "dl-working";
						if (!tar.classList.contains(dlClass)) {
							let lastSpan = tar.querySelector("span:last-child"),
								lastSpanText = lastSpan.textContent,
								timeout = getMSFromProperty("--dur",":root");
			
							tar.classList.add(dlClass);
							lastSpan.textContent = "Downloading…";
							tar.disabled = true;
			
							setTimeout(() => {
								lastSpan.textContent = "Completed!";
							},timeout * 0.9);
			
							setTimeout(() => {
								tar.classList.remove(dlClass);
								lastSpan.textContent = lastSpanText;
								tar.disabled = false;
							},timeout + 1e3);
						}
					}
				});
			});
			
			function getMSFromProperty(property,selector) {
				let cs = window.getComputedStyle(document.querySelector(selector)),
					transDur = cs.getPropertyValue(property),
					msLabelPos = transDur.indexOf("ms"),
					sLabelPos = transDur.indexOf("s");
			
				if (msLabelPos > -1)
					return transDur.substr(0,msLabelPos);
				else if (sLabelPos > -1)
					return transDur.substr(0,sLabelPos) * 1e3;
			}
</script>
</html>