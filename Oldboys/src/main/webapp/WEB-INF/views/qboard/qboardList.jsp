<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
 <style>
      /*글쓰기버튼*/
      input#btn-add{float:right; margin: 0 0 15px;} 
   </style>
   <script>
      function fn_goQBoardForm(){
         location.href = "${pageContext.request.contextPath}/qboard/qboardForm.do";
      }
      
     
      
   </script>
</head>
<body>
<div id="container">
     <div id="wrapper">
      <c:import url="../common/header.jsp"/>
       <h1 style="text-align:left; margin-left:100px;">Q&A 게시판</h1>
         <section id="board-container" class="container">
           <h3 style="text-align: center ; color:#4e73df" > <b>총 ${totalContents }건의 게시물이 있습니다.</b></h3>
           
            <button class="button"  style="border:0; float:right;  margin-bottom:10px;" onclick="fn_goQBoardForm();"><b>글쓰기</b></button>
            <table style="background: #fcfeff ;border:0 ; color:#2E2E2E" class="table table-striped table-hover" >
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th style="padding-left: 30px;">작성일</th>
                  <th style=" padding-left: 30px; width: 142px;">첨부파일</th>
             
               </tr>
               <c:forEach items="${list}" var="q"> 
                <tr id="${q.qNo}" >
      			  <td>${q.qNo}</td>
                  <td>${q.qTitle}</td>
                  <td>${q.qWriter}</td>
                  <td >${q.qDate}</td>
                  <td align="center">
                     <c:if test="${q.fileCount>0}">
                        <img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
                     </c:if>
                  </td>           
               </tr>
               </c:forEach>
            </table>
            <c:out value="${pageBar}" escapeXml="false"/>
         </section> 
         
             <!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="qTitle">제목</option>
					<option value="qContent">본문</option>
				</select>

			</div>

			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>

			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>

		</div>
         
      <c:import url="../common/footer.jsp"/>
        </div>
    <!-- End of Content Wrapper -->
        </div>
    <!-- End of Content Wrapper -->

</body>
<script>

$(function(){
  	$("tr[id]").on("click", function(){
          var qNo = $(this).attr("id");
          console.log("qNo="+qNo);
          location.href = "${pageContext.request.contextPath}/qboard/qboardView.do?no="+qNo;
       });    	
		
	});

$(document).on('click', '#btnSearch', function(e){

	e.preventDefault();

	var url = "${pageContext.request.contextPath}/qboard/qboardList.do";
	url = url + "?searchType=" + $('#searchType').val() + "&keyword=" + $('#keyword').val();
	location.href = url;
	console.log(url);
});
</script>
</html>