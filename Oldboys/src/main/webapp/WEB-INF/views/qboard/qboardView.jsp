<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			location.href="${pageContext.request.contextPath}/qboard/fileDownload.do?oName="+oName+"&rName="+rName;
		}
	</script>
</head>
<body>
<div id="container">
	<div id="wrapper">
      <c:import url="../common/header.jsp"/>
      
		<div id="board-container">
			<input type="text" class="form-control" placeholder="제목" name="qTitle" id="qTitle" value="${qboard.qTitle }" required>
						<br />
			<input type="text" class="Dateform-control" placeholder="날짜" name="qDate" id="qDate" value="작성일 : ${qboard.qDate }"readonly required>
			<input type="text" class="form-control" name="qWriter" value="${qboard.qWriter}" readonly required>
		
			<c:forEach items="${qboardfileList}" var="q" varStatus="vs">
				<button type="button" 
						class="btn btn-outline-success btn-block"
						onclick="fileDownload('${q.originalFileName}','${q.renamedFileName }');">
					첨부파일${vs.count} - ${q.originalFileName }
				</button>
			</c:forEach>
		    <textarea class="form-control" name="qContent" placeholder="내용" required>${qboard.qContent }</textarea>
		    <br>
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/qboard/qboardList.do'">리스트로</button>
		    <c:if test="${member.userId eq qboard.qWriter}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/qboard/qboardUpdateView.do?qNo=${qboard.qNo}'">수정 페이지</button>
			</c:if>
		</div>
		
       <%--         <c:forEach items="${bclist}" var="bc">
               <tbody>
  				<tr>
               <td><b>${bc.userNo}</b></td>
               			<td>${bc.bcdate}</td>
               			<td>dd</td>
               			</tr>
               			</tbody>
               		
               		  </c:forEach>  --%>
               		  
		     <div class="replyArea">
          <div class="row">
            <div class="col-md-8 mx-auto" id="replySelectArea"> <!-- 게시글의 댓글 목록 구현부 -->
              <div style="border-bottom:1px solid gray;">
                <div style="height:5px;"></div>
                <table id="replySelectTable" class="text-left"
                style="margin-left : 0px; width : 100.0%;" class="replyList1">
                <c:forEach items="${qclist}" var="qc">
                  <tr>
                    <td style="width:80px;"><b>&nbsp;&nbsp;${qc.userNo} </b></td>
                    <td>${qc.qdate}</td>
                    <td align="center">
                      <div class="text-right">
                        <input type="hidden" name="qcno" value="11"/>                
                        <button type="button" class="updateBtn btn btn-md btn-info" 
                          onclick="goUpdate();" style="border-radius: 10px;">수정하기</button>
                        <button type="button" class="deleteBtn btn btn-md btn-info"
                          onclick="location.href='${pageContext.request.contextPath}/qboardComment/qboardCommentDelete.do?qNo=${qc.qNo}&qcno=${qc.qcno}'" style="border-radius: 10px;">삭제하기</button> &nbsp;        
                      </div>
                    </td>
                  </tr>
                  <tr class="comment replyList1"> 
                    <td colspan="3" style="background : transparent;">
                    <textarea class="reply-content" cols="105" rows="2" style="border:none; width:100%; resize:none; outline: none;"
                    readonly="readonly">&nbsp;&nbsp;${qc.qcontent}
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
              <form action="${pageContext.request.contextPath}/qboardComment/insertQBoardComment.do"method="post">
                <div class="text-left" style="padding-left: 15px;">
                  <div style="height : 10px"></div>
                  <a style="font-weight: 900; color: black;">${ member.userId }</a>
                </div>
                <div class="comment_form mx-auto" style="text-align: center;">
                  <input type="hidden" name="userNo" value="${ member.userNo }"/>
                  <input type="hidden" name="qNo" value="${ qboard.qNo }"  />
                  <input type="hidden" name="refcno" value="0" />
                  <input type="hidden" name="clevel" value="1" />
           
                  <textArea rows="3" cols="80" id="replyContent" name="qcontent" style="border:none; width:97%; resize:none; outline: 0;" placeholder="댓글을 입력해보세요!">${ qboardComment.qcontent }</textArea>
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
   function goDelete(){

	    var qcno = $(obj).siblings('input').val();
	      
	      
	    var qNo = '${qboard.qNo}';

	   
        location.href="${pageContext.request.contextPath}/hotspotBoard/hotspotDelete.ho?hNo=${hotspotBoard.HNo}"
    }; 
    
    function goUpdate(){
       location.href="${pageContext.request.contextPath}/hotspotBoard/hotspotUpdateView.ho?no=${hotspotBoard.HNo}"
    };

  
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
   
   function deleteReply(obj) {
      // 댓글의 번호 가져오기
      var cno = $(obj).siblings('input').val();
      
      // 게시글 번호 가져오기
      var bNo = '${board.bNo}';
      
      location.href="/codingPanda/deleteComment.bo"
      +"?cno="+cno+"&bno="+bno;
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
   
   function reConfirm(obj) {
      // 댓글의 내용 가져오기
      
      // 참조할 댓글의 번호 가져오기
      var refcno = $(obj).siblings('input[name="refcno"]').val();
      var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
      
      // console.log(refcno + " : " + level);
      
      // 게시글 번호 가져오기
      var bno = '${board.bNo}';
      
      var parent = $(obj).parent().parent();
      var grandparent = parent.parent();
      var siblingsTR = grandparent.siblings().last();
      
      var content = siblingsTR.find('textarea').val();
      
      
      location.href='/codingPanda/insertComment.bo'
                 + '?writer=${member.userId}'
                 + '&replyContent=' + ccontent
                 + '&bNo=' + bNo
                 + '&refcno=' + refcno
                 + '&clevel=' + level;
   }
   
   
   }
   
   </script>

   <c:import url="../common/footer.jsp"/>
		    <!-- End of Content Wrapper -->
        </div>
       
</body>
</html>