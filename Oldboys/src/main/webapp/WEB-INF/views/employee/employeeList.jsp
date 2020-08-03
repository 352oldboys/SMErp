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

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous"> -->

<title>Insert title here</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
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
	          <h1 class="h3 mb-2 text-gray-800">인사관리</h1>
	          <p class="mb-4">인사 업무를 전산화하면, 언제든 원하는 조건으로 조회할 수 있어 효율적인 인사 업무를 수행할 수 있습니다.</p>
	
	          <!-- DataTales Example -->
	          <div class="card shadow mb-4">
	            <div class="card-header py-3">
	              <h6 class="m-0 font-weight-bold text-primary">인사관리</h6>
	            </div>
	            <div class="card-body">
	                     <div class="text-center" style="display: inline; float: right;">
                       		<input class="btn btn-primary btn-sm" type="button" value="추가하기"
	                           	   data-toggle="modal" data-target="#modalInsertForm" />
                            <input class="btn btn-secondary btn-sm" type="button" onclick="updateEmployee();" value="수정하기"/>
                            <input class="btn btn-danger btn-sm" type="button" onclick="deleteEmployee();" value="삭제하기"/>
	                     </div>
	                     
					<% // 추가하기 모달창 시작  %>
                	<form action="insertEmployee.do" id="empFrm" method="post">
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
	                                    <i class="fas fa-user prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="empNo">사원 번호</label>
	                                    <input type="text" name="empNo" id="empNo" class="form-control validate" value="${ empNo }">
	                                 </div>
	                              
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
	                                    <input type="text" name="userNo" id="userNo" class="form-control validate" value="${ userNo }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="jobCode">직급 코드</label>
	                                    <input type="text" name="jobCode" id="jobCode" class="form-control validate" value="${ jobCode }">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>   
	                                    <label data-error="wrong" data-success="right" for="name">이름</label>
	                                    <input type="text" name="name" id="name" class="form-control validate" value="${ name }">
	                                 </div>
	
	                                 <div class="md-form">
	                                    <i class="fas fa-tag prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="phone">연락처</label>
	                                    <input type="text" name="phone" id="phone" class="form-control validate" value="${ phone }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="age">나이</label>
	                                    <input type="text" name="age" id="age" class="form-control validate" value="${ age }">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag  grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="email">이메일</label>
	                                    <input type="email" name="email" id="email" class="form-control validate" value="${ email }"> 
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="gender">성별</label>
	                                    <input type="text" name="gender" id="gender" class="form-control validate" value="${ gender }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="salary">월급</label>
	                                    <input type="text" name="salary" id="salary" class="form-control validate" value="${ salary }">
	                                 </div>  
	                                   
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="status">재직여부</label>
	                                    <input type="text" name="status" id="status" class="form-control validate" value="${ status }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="hireDate">입사일</label>
	                                    <input type="date" name="hireDate" id="hireDate" class="form-control validate" value="${ hireDate }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="leaveDate">퇴사일</label>
	                                    <input type="date" name="leaveDate" id="leaveDate" class="form-control validate" value="${ leaveDate }">
	                                 </div>
	                                 
	                                 <div class="md-form">
	                                    <i class="fas fa-pencil prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="accountNo">계좌번호</label>
	                                    <textarea type="text" name="accountNo" id="accountNo" class="md-textarea form-control" value="${ accountNo }" rows="4"></textarea>
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
					<form method="Post" action="deleteEmployee.do" id="modalDeleteForm">
						<input type="hidden" name="empNo"/>
					</form>
                	
					<% // 수정하기 모달창 시작  %>
					<form action="updateEmployee.do" method="post">
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
	                                    <i class="fas fa-user prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="empNo">사원 번호</label>
	                                    <input type="text" name="empNo" id="empNo" class="form-control validate" value="${ empNo }">
	                                 </div>
	                              
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
	                                    <input type="text" name="userNo" id="userNo" class="form-control validate" value="${ userNo }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="jobCode">직급 코드</label>
	                                    <input type="text" name="jobCode" id="jobCode" class="form-control validate" value="${ jobCode }">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>   
	                                    <label data-error="wrong" data-success="right" for="name">이름</label>
	                                    <input type="text" name="name" id="name" class="form-control validate" value="${ name }">
	                                 </div>
	
	                                 <div class="md-form">
	                                    <i class="fas fa-tag prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="phone">연락처</label>
	                                    <input type="text" name="phone" id="phone" class="form-control validate" value="${ age }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i> 
	                                    <label data-error="wrong" data-success="right" for="age">나이</label>
	                                    <input type="text" name="age" id="age" class="form-control validate" value="${ age }">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag  grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="email">이메일</label>
	                                    <input type="email" name="email" id="email" class="form-control validate" value="${ email }"> 
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="gender">성별</label>
	                                    <input type="text" name="gender" id="gender" class="form-control validate" value="${ gender }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="salary">월급</label>
	                                    <input type="text" name="salary" id="salary" class="form-control validate" value="${ salary }">
	                                 </div>  
	                                   
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="status">재직여부</label>
	                                    <input type="text" name="status" id="status" class="form-control validate" value="${ status }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="hireDate">입사일</label>
	                                    <input type="date" name="hireDate" id="hireDate" class="form-control validate" value="${ hireDate }">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="leaveDate">퇴사일</label>
	                                    <input type="date" name="leaveDate" id="leaveDate" class="form-control validate" value="${ leaveDate }">
	                                 </div>
	                                 
	                                 <div class="md-form">
	                                    <i class="fas fa-pencil prefix grey-text"></i>
	                                    <label data-error="wrong" data-success="right" for="accountNo">계좌번호</label>
	                                    <textarea type="text" name="accountNo" id="accountNo" class="md-textarea form-control" value="${ accountNo }" rows="4"></textarea>
	                                 </div>
	 								
	                              </div>
	                              
	                              <div class="modal-footer d-flex justify-content-center">
	                                 <%-- <button class="btn btn-unique" style="text-align: center;" onclick="location.href=${pageContext.request.contextPath}/employee/insertEmployee.do">
	                                 Send<i class="fas fa-paper-plane-o ml-1"></i>
	                                 </button> --%>
	                                <button class="btn btn-unique">수정하기</button>	                                 
	                              </div>	                              
	                           </div>
	                        </div>
	                     </div>
                	</form>
					<% // 수정하기 모달창 끝 %>	
		
		
                </div>
	            
	            
	            <div class="table-responsive">
	              <table class="table table-bordered display" id="dataTable" width="100%" cellspacing="0">
	                <thead>
	                  <tr>
						<!-- <td><input type="checkbox"></td> -->
	                    <th>사원번호</th>
	                    <th>사용자 번호</th>
	                    <th>직급코드</th>
	                    <th>이름</th>
	                    <th>연락처</th>
	                    <th>나이</th>
	                    <th>이메일</th>
	                    <th>성별</th>
	                    <th>월급</th>
	                    <th>재직여부</th>
	                    <th>입사일</th>
	                    <th>퇴사일</th>
	                    <th>계좌번호</th>   
	                  </tr>
	                </thead>
	                <tfoot>
	                  <tr>
	                    <th>사원번호</th>
	                    <th>사용자 번호</th>
	                    <th>직급코드</th>
	                    <th>이름</th>
	                    <th>연락처</th>
	                    <th>나이</th>
	                    <th>이메일</th>
	                    <th>성별</th>
	                    <th>월급</th>
	                    <th>재직여부</th>
	                    <th>입사일</th>
	                    <th>퇴사일</th>
	                    <th>계좌번호</th>
	                  </tr>
	                </tfoot>
					<tbody>
					  <c:forEach var="emp" items="${list}">
			  	  	  	<tr id="${emp.empNo}">
							<td>${emp.empNo}</td>
							<td>${emp.userNo}</td>
							<td>${emp.jobCode}</td>
							<td>${emp.name}</td>
							<td>${emp.phone}</td>
							<td>${emp.age}</td>
							<td>${emp.email}</td>
							<td>${emp.gender}</td>
							<td>${emp.salary}</td>
							<td>${emp.status}</td>
							<td>${emp.hireDate}</td>
							<td>${emp.leaveDate}</td>
							<td>${emp.accountNo}</td>
			  	  	  	</tr>
					  </c:forEach>
	                </tbody>
	              </table>
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
	
	//
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
	
	// 삭제하기 기능 구현
	function deleteEmployee(){
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

	// 수정하기 기능 구현
	function updateEmployee(){
			 
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
		$("#modalUpdateForm #empNo").val(table.rows('.selected').data()[0][0]);		  
		$("#modalUpdateForm #userNo").val(table.rows('.selected').data()[0][1]);		  
		$("#modalUpdateForm #jobCode").val(table.rows('.selected').data()[0][2]);		  
		$("#modalUpdateForm #name").val(table.rows('.selected').data()[0][3]);		  
		$("#modalUpdateForm #phone").val(table.rows('.selected').data()[0][4]);		  
		$("#modalUpdateForm #age").val(table.rows('.selected').data()[0][5]);		  
		$("#modalUpdateForm #email").val(table.rows('.selected').data()[0][6]);		  
		$("#modalUpdateForm #gender").val(table.rows('.selected').data()[0][7]);		  
		$("#modalUpdateForm #salary").val(table.rows('.selected').data()[0][8]);
		$("#modalUpdateForm #status").val(table.rows('.selected').data()[0][9]);		  
		$("#modalUpdateForm #hireDate").val(table.rows('.selected').data()[0][10]);
		$("#modalUpdateForm #leaveDate").val(table.rows('.selected').data()[0][11]);		  
		$("#modalUpdateForm #accountNo").val(table.rows('.selected').data()[0][12]);

		/* 창 띄우기 */
		$("#modalUpdateForm").modal();
	 
	}	

	</script>
		
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
	        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	      </div>
	      <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
	      <div class="modal-footer">
	        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	        <a class="btn btn-primary" href="login.html">Logout</a>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>

</html>