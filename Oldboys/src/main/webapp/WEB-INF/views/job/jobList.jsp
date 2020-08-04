<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

<title>Insert title here</title>

</head>

<body id="page-top">


  <!-- Page Wrapper -->
  <div id="wrapper">
	
   	<!-- header -->
	<c:import url="../common/header.jsp"/>	
	<!-- End of header -->
			
 	<!-- Content Wrapper -->
  	<div id="content-wrapper" class="d-flex flex-column">
  	
		  <!-- Main Content -->
	      <div id="content">
	      
			<!-- Begin Page Content -->
			<div class="container-fluid">
	
	          <!-- Page Heading -->
	          <h1 class="h3 mb-2 text-gray-800">직급관리</h1>
	          <p class="mb-4">직급 관리를 할 수 있습니다.</p>
	
	          <!-- DataTales Example -->
	          <div class="card shadow mb-4">
	            <div class="card-header py-3">
	              <h6 class="m-0 font-weight-bold text-primary" style="display: inline;" >직급 관리</h6>
                     <div class="text-center" style="display: inline; float: right;">
                    	   <input class="btn btn-primary btn-sm" type="button" value="추가하기"
                           	       data-toggle="modal" data-target="#modalInsertForm" />
                           <input class="btn btn-secondary btn-sm" type="button" onclick="updateJob();" value="수정하기"/>
                           <input class="btn btn-danger btn-sm" type="button" onclick="deleteJob();" value="삭제하기"/>
                     </div>
	            </div>

	                     
					<% // 추가하기 모달창 시작  %>
                	<form action="${pageContext.request.contextPath}/job/insertJob.do?userNo=${member.userNo}" id="jobFrm" method="post">
	                     <div class="modal fade" id="modalInsertForm" tabindex="-1"
	                          role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                        <div class="modal-dialog" role="document">
	                           <div class="modal-content">
	                              <div class="modal-header text-center">
	                                 <h4 class="modal-title w-100 font-weight-bold">테이블을 작성하세요.</h4>
	                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                    <span aria-hidden="true">&times;</span>
	                                 </button>
	                              </div>
	                              <div class="modal-body mx-3">
		                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="jobCode">직급코드</label>
	                                    <input type="text" name="jobCode" id="jobCode" class="form-control validate">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="jobName">직책</label>
	                                    <input type="text" name="jobName" id="jobName" class="form-control validate">
	                                 </div>
				                                              
	                              </div>

	                              <div class="modal-footer d-flex justify-content-center">
	                                <button class="btn btn-unique">추가하기</button>	                                 
	                              </div>	                              
	                           </div>
	                        </div>
	                     </div>
                	</form>
                	<% // 추가하기 모달창 끝  %>
                	
                	<% // 삭제하기 2번째 방법 %>
					<form action="${pageContext.request.contextPath}/attendance/deleteAttend.do?userNo=${member.userNo}" method="Post" id="modalDeleteForm">
						<input type="hidden" name="jobCode"/>
					</form>
                	
					<% // 수정하기 모달창 시작  %>
					<form action="${pageContext.request.contextPath}/attendance/updateAttend.do?userNo=${member.userNo}" method="post">
	                     <div class="modal fade" id="modalUpdateForm" tabindex="-1"
	                          role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                        <div class="modal-dialog" role="document">
	                           <div class="modal-content">
	                              <div class="modal-header text-center">
	                                 <h4 class="modal-title w-100 font-weight-bold">테이블을 수정하세요.</h4>
	                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                    <span aria-hidden="true">&times;</span>
	                                 </button>
	                              </div>
	                              <div class="modal-body mx-3">
									 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="jobCode">직급코드</label>
	                                    <input type="text" name="jobCode" id="uJobCode" class="form-control validate">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="jobName">직책</label>
	                                    <input type="text" name="jobName" id="uJobName" class="form-control validate" >
	                                 </div>
	                              	                              
	                           	  </div>
	                        </div>
	                     </div>
                	</form>
					<% // 수정하기 모달창 끝 %>	
		
		
	          <div class="card-body">  
	            <div class="table-responsive">
	              <table class="table table-bordered display" id="dataTable" width="100%" cellspacing="0">
	                <thead>
	                  <tr>
	                  	<!-- <td><input type="checkbox"></td> -->
						<!-- <th>사용자 번호</th> -->
						<th>직급코드</th>
						<th>직책</th>	
	                  </tr>
	                </thead>
					<tbody>
					  <c:forEach var="job" items="${list}">
			  	  	  	<tr id="${job.jobCode}">
							<%-- <td>${tax.userNo}</td> --%>
							<td>${job.jobCode}</td>
							<td>${job.jobName}</td>
			  	  	  	</tr>
					  </c:forEach>
	                </tbody>
	              </table>
	            </div>
              </div>
              
	          </div>
	          

	        </div>
			<!-- /.container-fluid -->
			
	      </div>
	      <!-- End of Main Content -->

		<!-- Footer -->
		<c:import url="../common/footer.jsp"/>
		<!-- End of Footer -->
	
    </div>
    <!-- End of Content Wrapper -->
    
  </div>
  <!-- End of Page Wrapper -->
  
	
	<script>
	// 선택하기 기능 구현부
	$(document).ready(function() {
	    var table = $('#dataTable').DataTable();
	    
	    $('#dataTable tbody').on( 'click', 'tr', function () {
	        $(this).toggleClass('selected');
	    } );

	} );
	
	// taxNo 컬럼 숨기기
	/*  $(document).ready(function() {
	    $('#dataTable').DataTable( {
	        "columnDefs": [
	            {
	                "targets": [ 0 ],
	                "visible": true,
	                "searchable": false
	            },
	        ]
	    } );
	} ); */
	
	// taxNo(순번) 내림차순으로 고정
	/*  $(document).ready(function() {
 	    $('#example').DataTable( {
 	        "order": [[ 0, "desc" ]]
 	    } );
 	} ); */

	/* 	// 행 추가 
 	$(document).ready(function() {
    	var t = $('#dataTable').DataTable();
	    var counter = 1;
	 
	    $('#addRow').on( 'click', function () {
	        t.row.add( [
	            counter +'.1',
	            counter +'.2',
	            counter +'.3',
	            counter +'.4',
	            counter +'.56265651'
	        ] ).draw( false );
	 
	        counter++;
	    } );
	 
	    // Automatically add a first row of data
	    $('#addRow').click();
	} ); 
	*/
	
	// 삭제하기 기능 구현부
	function deleteJob(){
		var table = $('#dataTable').DataTable();
		var length = table.rows('.selected').data().length;
 	  	  

		if(length >= 1){
			alert(length + "개 선택하셨습니다.");
		} else if(length == 0){
			alert("삭제할 목록을 선택해주세요.");
			return;
		}
	  
		/* //1.첫번째방식
		var frm = document.createElement("form"); // <form></form>
		frm.setAttribute("method", "Post");  //Post 방식  -- <form method="Post">
		   frm.setAttribute("action", "deleteInventory.do"); //요청 보낼 주소    -- <form method="Post" action="deleteInventory.do" >
		
		   var hiddenField = document.createElemodalContactFormmodalContactFormmodalContactFormment("input");
		   hiddenField.setAttribute("type", "hidden");
		   hiddenField.setAttribute("name", "productNo");
		   hiddenField.setAttribute("value", table.rows('.selected').data()[0][0]);
		   form.appendChild(hiddenField);
		     
		   <form method="Post" action="deleteInventory.do" >
		   	<input type="hidden" name="productNo" value=""/>
		   </form>
		 */
		
		// 2번째 방식 
		$("#modalDeleteForm input[name=empNo]").val(table.rows('.selected').data()[0][0]);		  
		$("#modalDeleteForm").submit();
				  
		}

	// 수정하기 기능 구현부
	function updateJob(){
			 
		var table = $('#dataTable').DataTable();
		var length = table.rows('.selected').data().length;
		
		/* console.log("선택한 행 수 == " + table.rows('.selected').data().length);
		console.log("전체행 수 == " + table.data().length); */

 
		if(length > 1){
			alert("수정은 하나씩만 가능합니다.");
			return;
		} else if(length == 0) {
			alert("수정할 목록을 선택해주세요.");
			return;
		}
 
		/* DB값 가져와서 수정하기 창에 띄우기 */
		/* $("#modalUpdateForm #userNo").val(table.rows('.selected').data()[0][1]); */
		$("#ujobCode").val(table.rows('.selected').data()[0][0]);
		$("#ujobName").val(table.rows('.selected').data()[0][1]);
		
		/* 창 띄우기 */
		$("#modalUpdateForm").modal();
	}
    </script>

</body>

</html>