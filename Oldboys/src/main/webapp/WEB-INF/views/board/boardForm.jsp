<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
	<style>
		div#board-container{width:1000px; margin:0 auto; text-align:center; height:500px;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}	
	</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=bContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	/*부트스트랩 : file 변경시 파일명 보이기 */
	/* $(function(){
		$('[name=upFile]').on('change',function(){
		    //var fileName = $(this).val();//C:\fakepath\파일명
		    //var fileName = this.files[0].name;//파일명(javascript)
		    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
		    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
			//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
		    console.log($(this).val()); 
		    $(this).next('.custom-file-label').html(fileName);
		})
	}); */
	</script>
</head>
<body>
	<div id="container">
	 <div id="wrapper">
      <c:import url="../common/header.jsp"/>
		<div id="board-container">
		<img src="${pageContext.request.contextPath}/resources/img/smerp2.png" />
			<form name="boardFrm" action="${pageContext.request.contextPath}/board/boardFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
				<input type="text" class="form-control" placeholder="제목" name="bTitle" id="bTitle" required>
				<input type="text" class="form-control" name="bWriter" value="${member.userId}" readonly required>
				<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
				<!-- style.css에서 div의  padding:10px을 제거함 -->
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일1</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
				    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
				  </div>
				</div>
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일2</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
				    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
				  </div>
				</div>
			    <textarea class="form-control" name="bContent" placeholder="내용" required "></textarea>
				<br />
				<input style= "border:0;"  type="submit" class="button" value="작성완료"  >
			</form>
		</div>
		<br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br />
		<c:import url="../common/footer.jsp"/>
		        </div>
    <!-- End of Content Wrapper -->
	</div>
		<script>
	$(function(){
		$('[name=upFile]').on('change',function(){
		    //var fileName = $(this).val();//C:\fakepath\파일명
		    //var fileName = this.files[0].name;//파일명(javascript)
		    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
		    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
			//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
		    console.log($(this).val()); 
		    $(this).next('.custom-file-label').html(fileName);
		})
	});
	</script>
</body>
</html>