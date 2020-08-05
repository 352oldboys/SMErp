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
	<title>자유게시판 상세보기</title>
	<style>
		div#board-container{width:1000px; margin:0 auto; text-align:center; height:500px;}
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
			location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
		}
	</script>
</head>
<body>
	<div id="container">
	<div id="wrapper">
      <c:import url="../common/header.jsp"/>
      <br /><br />
		<div id="board-container">
			<input type="text" class="Titleform-control" placeholder="제목" name="bTitle" id="bTitle" value="제목 : ${board.bTitle }"readonly required style="width: 1000px;font-weight:bolder; ">
					<hr class="two">	
			<%-- <input type="text" class="Dateform-control" placeholder="날짜" name="bDate" id="bDate" value="작성일 : ${board.bDate }"readonly required>
			<input type="text" class="form-control" name="bWriter" value="${board.bWriter}" readonly required> --%>
		
			<c:forEach items="${boardfileList}" var="a" varStatus="vs">
				<%-- <button  style="display: inline-block; width:300px; border:0; hight:80px" type="button" 
						class="button" 
						onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">첨부파일${vs.count} - ${a.originalFileName }		
				</button> --%>
			<!-- 	<button class="button"  style="border:0; float:right;  margin-bottom:10px;" onclick="fn_goNoticeForm();"><b>글쓰기</b></button> -->
			<button type="button" id="downbtn" data-dl style="display: inline-block; width:300px;" onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">첨부파일${vs.count} - ${a.originalFileName }>
					<span class="dl-icon"></span>
					<span>&#x44;&#x6F;&#x77;&#x6E;&#x6C;&#x6F;&#x61;&#x64;</span>
				</button>	
			</c:forEach>
			<br />
			<c:if test="${ !empty boardfileList }" >
<!-- 			<hr class="two">-->			
			</c:if>
			<br />
		<%-- 	<div style="text-align:right;">
			작성자 : ${board.bWriter } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			작성일 : ${board.bDate }
			</div> --%>
			<div  class="card">
			<div style="  font-size:25px; "class="card-block">
		   <textarea style ="background: #fcfeff; color: #2E2E2E; margin-top:8px;  width:980px;" name="bContent"  class="Contentform-control" cols="10" rows="25" placeholder="내용" readonly required >${board.bContent }
		    <%-- <div  style="color: #2E2E2E;' " class="Contentform-control" name="nContent" placeholder="내용" readonly required >${notice.nContent }</div> --%>
		    </textarea>
			</div>
			</div>
			<br />
		    <button style=" border:0;"class="button" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">리스트로</button>
		    <c:if test="${member.userId eq board.bWriter}">
		    &nbsp;
			<button style="border:0;" class="button" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?bNo=${board.bNo}'">수정 페이지</button>
			</c:if>
		</div>
		<br /><br /><br /><br /><br /> 
		<br /><br /><br /><br /><br />
       <%--         <c:forEach items="${bclist}" var="bc">
               <tbody>
  				<tr>
               <td><b>${bc.userNo}</b></td>
               			<td>${bc.bcdate}</td>
               			<td>dd</td>
               			</tr>
               			</tbody>
               		
               		  </c:forEach>  --%>
               		<br /><br /><br /><br /><br /> 
		<br /><br /><br /><br /><br />		  
		     <div class="replyArea">
          <div class="row">
            <div class="col-md-8 mx-auto" id="replySelectArea"> <!-- 게시글의 댓글 목록 구현부 -->
              <div style="border-bottom:1px solid gray;">
                <div style="height:5px;"></div>
                <table id="replySelectTable" class="text-left"
                style="margin-left : 0px; width : 100.0%;" class="replyList1">
                <c:forEach items="${bclist}" var="bc">
                  <tr>
                    <td style="width:80px;"><b>&nbsp;&nbsp;${member.userId} </b></td>
                    <td>${bc.bcdate}</td>
                    <td align="center">
                    <c:if test="${member.userNo == bc.userNo }">
                      <div class="text-right">
                        <input type="hidden" name="cno" value="11"/>                
                        <button type="button" class="deleteBtn btn btn-md btn-info"
                          onclick="location.href='${pageContext.request.contextPath}/boardComment/boardCommentDelete.do?bNo=${bc.bNo}&cno=${bc.cno}'" style="border-radius: 10px;">삭제하기</button> &nbsp;        
                      </div>
                      </c:if>
                    </td>
                  </tr>
                  <tr class="comment replyList1">
                    <td colspan="3" style="background : transparent;">
                    <textarea class="reply-content" cols="105" rows="2" style="background:none;border:none; width:100%; resize:none; outline: none;"
                    readonly="readonly">&nbsp;&nbsp;${bc.ccontent}
                    </textarea>
                    </td>
                  </tr>
                  </c:forEach>
                </table>
              </div>
            </div>   
          </div>
        </div>
    
        <br>
    

    
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="replyWriteArea" style="border: 1px solid gray; border-radius: 10px;">
              <form action="${pageContext.request.contextPath}/boardComment/insertBoardComment.do"method="post">
                <div class="text-left" style="padding-left: 15px;">
                  <div style="height : 10px"></div>
                  <a style="font-weight: 900; color: black;">${ member.userId }</a>
                </div>
                <div class="comment_form mx-auto" style="text-align: center;">
                  <input type="hidden" name="userNo" value="${ member.userNo }"/>
                  <input type="hidden" name="bNo" value="${ board.bNo }"  />
                  <input type="hidden" name="refcno" value="0" />
                  <input type="hidden" name="clevel" value="1" />
           
                  <textArea rows="3" cols="80" id="replyContent" name="ccontent" style="background:none ;border:none; width:97%; resize:none; outline: 0;" placeholder="댓글을 입력해보세요!">${ boardComment.ccontent }</textArea>
                </div>
                <div class="text-right">
                  <button type="submit" class="btn btn-md btn-info" id="addReply" style="border-radius: 10px;" >댓글 등록</button>&nbsp;&nbsp;&nbsp;
                <div style="height : 10px"></div>
                </div>
              </form>
            </div>
          </div>
        </div>
        
      </div>
 


    <br>
    <br>
    <br>
    <script>

  
   function updateReply(obj) {
      // 현재 위치와 가장 근접한 textarea 접근하기
      $(obj).parent().parent().parent().next().find('textarea')
      .removeAttr('readonly');
      
      // 수정 완료 버튼을 화면 보이게 하기
      $(obj).siblings('.updateConfirm').css('display','inline');
      
      // 수정하기 버튼 숨기기
      $(obj).css('display', 'none');
   }
   
   function updateConfirm(obj) {
      // 댓글의 내용 가져오기
      var content
        = $(obj).parent().parent().parent().next().find('textarea').val();
      
      // 댓글의 번호 가져오기
      var cno = $(obj).siblings('input').val();
      
      // 게시글 번호 가져오기
      var bNo = '${board.bNo}';
      
      location.href="/codingPanda/updateComment.bo?"
             +"cno="+cno+"&bno="+bno+"&content="+content;
   }
   
   function reComment(obj){
      // 추가 완료 버튼을 화면 보이게 하기
      $(obj).siblings('.insertConfirm').css('display','inline');
      
      // 클릭한 버튼 숨기기
      $(obj).css('display', 'none');
      
      // 내용 입력 공간 만들기
      var htmlForm = 
         '<tr class="comment"><td></td>'
            +'<td colspan="3" style="background : transparent;">'
               + '<textarea class="reply-content" style="background : white; resize:none;" cols="105" rows="2"></textarea>'
            + '</td>'
         + '</tr>';
      
      $(obj).parents('table').append(htmlForm);
      

   
   
   }
   
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

   <c:import url="../common/footer.jsp"/>
		    <!-- End of Content Wrapper -->
        </div>
       
</body>
</html>