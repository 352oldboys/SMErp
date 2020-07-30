<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>게시판</title>

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
   <script>
   
      function fn_goNoticeForm(){
         location.href = "${pageContext.request.contextPath}/notice/noticeForm.do";
      }
      
    /* 
      $(function(){
          $("tr[id]").on("click", function(){
             var nNo = $(this).attr("id");
             console.log("nNo="+nNo);
             location.href = "${pageContext.request.contextPath}/notice/noticeView.do?no="+nNo;
          });
       });
        */
        
        function a() {
        	$("tr[id]").on("click", function(){
                var nNo = $(this).attr("id");
                console.log("nNo="+nNo);
                location.href = "${pageContext.request.contextPath}/notice/noticeView.do?no="+nNo;
             });    	
			
		}
      
        
        

        document.querySelectorAll('.button').forEach(button => button.innerHTML = '<div><span>' + button.textContent.trim().split('').join('</span><span>') + '</span></div>');


       
   </script>
   
</head>

<body>
   <div id="container">
     <div id="wrapper">
      <c:import url="../common/header.jsp"/>
         <section id="board-container" class="container">
            <h3 style="text-align: center ; color:#4e73df" > <b>총 ${totalContents }건의 게시물이 있습니다.</b></h3>
            <hr />
            
           <!--  <input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goNoticeForm();"/> -->
            <button class="button"  style="border:0; float:right;  margin-bottom:10px;" onclick="fn_goNoticeForm();"><b>글쓰기</b></button>
            
            
            <table style="border:2px solid ; border-color:#4e73df; color:#2E2E2E" class="table table-striped table-hover" >
               <tr style="border:2px solid ; border-color:#4e73df">
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th style="padding-left: 30px;">작성일</th>
                  <th style=" padding-left: 30px; width: 142px;">첨부파일</th>
                  
               </tr>
               <c:forEach items="${list}" var="n"> 
                <tr id="${n.nNo}" onclick=a();>
                  <td>${n.nNo}</td>
                  <td>${n.nTitle}</td>
                  <td>${n.nWriter}</td>
                  <td>${n.nDate}</td>
                  <td align="center">
                     <c:if test="${n.fileCount>0}">
                        <img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
                     </c:if>
                  </td>
               </tr>
               </c:forEach>
            </table>
            <c:out value="${pageBar}" escapeXml="false"/>
         </section> 
      <c:import url="../common/footer.jsp"/>
        </div>
    <!-- End of Content Wrapper -->
        </div>
    <!-- End of Content Wrapper -->
      
</body>
</html>