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
	          <h1 class="h3 mb-2 text-gray-800">거래처관리</h1>
	          <p class="mb-4">거래처 관리 업무를 전산화하면, 언제든 원하는 조건으로 조회할 수 있어 효율적인 거래처 관리를 할 수 있습니다.</p>
	
	          <!-- DataTales Example -->
	          <div class="card shadow mb-4">
	            <div class="card-header py-3">
	              <h6 class="m-0 font-weight-bold text-primary" style="display: inline;" >거래처관리</h6>
                     <div class="text-center" style="display: inline; float: right;">
                    	   <input class="btn btn-primary btn-sm" type="button" value="추가하기"
                           	       data-toggle="modal" data-target="#modalInsertForm" />
                           <input class="btn btn-secondary btn-sm" type="button" onclick="updateCustomer();" value="수정하기"/>
                           <input class="btn btn-danger btn-sm" type="button" onclick="deleteCustomer();" value="삭제하기"/>
                     </div>
	            </div>

	                     
					<% // 추가하기 모달창 시작  %>
                	<form action="${pageContext.request.contextPath}/customer/insertCustomer.do?userNo=${member.userNo}" id="customerFrm" method="post">
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
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="businessCode">거래처 코드</label>
	                                    <input type="text" name="businessCode" id="businessCode" class="form-control validate">
	                                 </div>
	                              
	                                 <!-- <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
	                                    <input type="text" name="userNo" id="userNo" class="form-control validate">
	                                 </div> -->
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="businessName">기업명</label>
	                                    <input type="text" name="businessName" id="businessName" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>   
	                                    <label data-error="wrong" data-success="right" for="name">연락처</label>
	                                    <input type="text" name="phone" id="phone" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i> 
	                                    <label data-error="wrong" data-success="right" for="email">이메일</label>
	                                    <input type="email" name="email" id="email" class="form-control validate">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i> 
	                                    <label data-error="wrong" data-success="right" for="representative">대표자명</label>
	                                    <input type="text" name="representative" id="representative" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="custRegNo">사업자 번호</label>
	                                    <input type="text" name="custRegNo" id="custRegNo" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="address">주소</label>
	                                    <input type="text" name="address" id="address" class="form-control validate">
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
					<form method="Post" action="${pageContext.request.contextPath}/customer/deleteCustomer.do?userNo=${member.userNo}" id="modalDeleteForm">
						<input type="hidden" name="businessCode"/>
					</form>
                	
					<% // 수정하기 모달창 시작  %>
					<form action="${pageContext.request.contextPath}/customer/updateCustomer.do?userNo=${member.userNo}" method="post">
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
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="businessCode">거래처 코드</label>
	                                    <input type="text" name="businessCode" id="uBusinessCode" class="form-control validate">
	                                 </div>
	                              
	                                 <!-- <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
	                                    <input type="text" name="userNo" id="uUserNo" class="form-control validate">
	                                 </div> -->
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="businessName">기업명</label>
	                                    <input type="text" name="businessName" id="uBusinessName" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>   
	                                    <label data-error="wrong" data-success="right" for="name">연락처</label>
	                                    <input type="text" name="phone" id="uPhone" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3"> <!-- mb : 높이 간격 / md : 너비 간격  -->
	                                    <i class="fas fa-tag"></i> 
	                                    <label data-error="wrong" data-success="right" for="email">이메일</label>
	                                    <input type="email" name="email" id="uEmail" class="form-control validate">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i> 
	                                    <label data-error="wrong" data-success="right" for="representative">대표자명</label>
	                                    <input type="text" name="representative" id="uRepresentative" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="custRegNo">사업자 번호</label>
	                                    <input type="text" name="custRegNo" id="uCustRegNo" class="form-control validate"> 
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="address">주소</label>
	                                    <input type="text" name="address" id="uAddress" class="form-control validate">
	                                 </div>
	 								
	                              </div>
	                              
	                              <div class="modal-footer d-flex justify-content-center">
	                                 <%-- <button class="btn btn-unique" style="text-align: center;" onclick="location.href=${pageContext.request.contextPath}/customer/insertCustomer.do">
	                                 Send<i class="fas fa-paper-plane-o ml-1 <-- 이모티콘 클래스"></i>
	                                 </button> --%>
	                                <button class="btn btn-unique">수정하기</button>	                                 
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
						<th>거래처 코드</th>
						<!-- <th>사용자 번호</th> -->
						<th>기업명</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>대표자명</th>
						<th>사업자 번호</th>
						<th>주소</th>
	                  </tr>
	                </thead>
					<tbody>
					  <c:forEach var="cust" items="${list}">
			  	  	  	<tr id="${cust.businessCode}">
  	  	  		  	  		<td>${cust.businessCode}</td>
							<%-- <td>${cust.userNo}</td> --%>
							<td>${cust.businessName}</td>
							<td>${cust.phone}</td>
							<td>${cust.email}</td>
							<td>${cust.representative}</td>
							<td>${cust.custRegNo}</td>
							<td>${cust.address}</td>
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
	// 선택하기
	$(document).ready(function() {
	    var table = $('#dataTable').DataTable();
	    
	    $('#dataTable tbody').on( 'click', 'tr', function () {
	        $(this).toggleClass('selected');
	    } );
	} );
	
	
	// 삭제하기 기능 구현
	function deleteCustomer(){
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
		$("#modalDeleteForm input[name=businessCode]").val(table.rows('.selected').data()[0][0]);		  
		$("#modalDeleteForm").submit();
				  
		}

	// 수정하기 기능 구현
	function updateCustomer(){
			 
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
 
		/* 값 가져오기 */
		$("#modalUpdateForm #uBusinessCode").val(table.rows('.selected').data()[0][0]);		  
		/* $("#modalUpdateForm #uUserNo").val(table.rows('.selected').data()[0][1]); */
		$("#modalUpdateForm #uBusinessName").val(table.rows('.selected').data()[0][1]);		  
		$("#modalUpdateForm #uPhone").val(table.rows('.selected').data()[0][2]);		  
		$("#modalUpdateForm #uEmail").val(table.rows('.selected').data()[0][3]);		  
		$("#modalUpdateForm #uRepresentative").val(table.rows('.selected').data()[0][4]);		  
		$("#modalUpdateForm #uCustRegNo").val(table.rows('.selected').data()[0][5]);		  
		$("#modalUpdateForm #uAddress").val(table.rows('.selected').data()[0][6]);		  

		/* 창 띄우기 */
		$("#modalUpdateForm").modal();
	 
	}	

	</script>
		

	
</body>

</html>