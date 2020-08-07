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
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous"> -->
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
	
   	<!-- header -->
	<c:import url="../common/header.jsp"/>	
	<!-- End of header -->

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">재고관리</h1>
          <p class="mb-4">재고에 대한 정보를 입력하는 페이지입니다. 반드시 먼저 품목등록을 하시고 이용하세요 <a target="_blank" href="https://datatables.net"></a>.</p>
           <div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"
								style="display: inline;">매입</h6>
							<div class="text-center" style="display: inline; float: right;">
								<input class="btn btn-primary btn-sm" type="button" value="추가하기"
								
									data-toggle="modal" data-target="#modalContactForm" />
									<input class="btn btn-primary btn-sm" type="button" value="수정하기" onclick="javascript:fn_inventoryUpdate();"/>
									<input class="btn btn-primary btn-sm" type="button" value="삭제하기" onclick="javascript:fn_inventoryDelete();"/>
									
							</div>
						<form action="${pageContext.request.contextPath}/inventory/insertInventory.do?userNo=${member.userNo}" method="post">
							<div class="modal fade" id="modalContactForm" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header text-center">
											<h4 class="modal-title w-100 font-weight-bold">테이블을 작성하세요.</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body mx-3">
											<%-- <div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="productNo" >제품 번호</label>
												<input type="text" id="productNo" name="productNo" class="form-control validate" value="${ purchase.productNo }">
											</div> --%>
										<!--  사용자 번호 (화면에는 출력 x) -->
											<%-- <div class="md-form mb-3">
												<!-- <i class="fas fa-user prefix grey-text"></i>  -->
												<label data-error="wrong" data-success="right" for="userNo"></label>
												<input type="hidden" id="userNo" name="userNo" class="form-control validate" value="${member.userNo}" inputtype="hidden">
											</div> --%>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="itemcode">품목</label>
												<%-- <input type="text" id="itemcode" name="itemcode" class="form-control validate" value="${ businessCode }"> --%>
												<select class="form-control" name="itemcode"   required>
													<option value="C02045">생선</option>
				                                    <option value="A02045">육류</option>
				                                    <option value="B02045">채소</option>
				                                    <option value="C02047">의류</option>
				                                    <option value="D02045">화장품</option>
			                                    </select>
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>   
												<label data-error="wrong" data-success="right" for="product">제품</label>
												<input type="text" id="product" name="product" class="form-control validate" placeholder="등록된 품목중 원하는 품목 입력" required >
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="quantity" >수량</label>
												<input type="number" id="quantity" name="quantity" class="form-control validate" value="" placeholder="숫자만 입력" required>
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="unitprice" >단가</label>
												<input type="number" id="unitprice" name="unitprice" class="form-control validate" placeholder="숫자만 입력" required>
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag  grey-text"></i>
												<label data-error="wrong" data-success="right" for="origin" >원산지</label>
												<input type="text" id="origin" name="origin"class="form-control validate" placeholder="문자만 입력" required> 
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>
												<label data-error="wrong" data-success="right" for="expirationdate" >유통기한</label>
												<input type="date" id="expirationdate" name="expirationdate" class="form-control validate" required>
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>
												<label data-error="wrong" data-success="right" for="note" >비고</label>
												<input type="text" id="note" name="note" class="form-control validate" placeholder="문자만 입력" required>
											</div>
<!-- 
											 <div class="md-form">
												<i class="fas fa-pencil prefix grey-text"></i>
												<textarea type="text" id="form8"
													class="md-textarea form-control" rows="4"></textarea>
												<label data-error="wrong" data-success="right" for="form8">원산지</label>
											</div> —>
 -->
										</div>
										<div class="modal-footer d-flex justify-content-center">
											<button class="btn btn-unique" style="text-align: center;">
												Send 
											</button>
										</div>
									</div>
								</div>
							</div>
</form>

<%//수정하기 모달창 시작 %>
<form action="${pageContext.request.contextPath}/inventory/updateInventory.do?userNo=${member.userNo}" method="post">
							<div class="modal fade" id="modalUpdateForm" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header text-center">
											<h4 class="modal-title w-100 font-weight-bold">테이블을 수정하세요.</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body mx-3">
										<input type="hidden" id="inventoryNo2" name="inventoryNo" />
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="productNo" >제품 번호</label>
												<input type="text" id="productNo" name="productNo" class="form-control validate" value="" readonly>
											</div>
										
											
											 	<!-- <i class="fas fa-user prefix grey-text"></i>  -->
												<!-- <label data-error="wrong" data-success="right" for="userNo" id="userNo" ></label>  -->
												
										        
											
										        <div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="itemname">품목</label>
												<%-- <input type="text" id="itemcode" name="itemcode" class="form-control validate" value="${ businessCode }" > --%>
												<select class="form-control" name="itemcode">
													<option value="C02045">생선</option>
				                                    <option value="A02045">육류</option>
				                                    <option value="B02045">채소</option>
				                                    <option value="C02047">의류</option>
				                                    <option value="D02045">화장품</option>
			                                    </select>
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>   
												<label data-error="wrong" data-success="right" for="product">제품</label>
												<input type="text" id="product" name="product" class="form-control validate" placeholder="등록된 품목중 원하는 품목 입력" required>
											</div>

											<div class="md-form">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="quantity">수량</label>
												<input type="number" id="quantity" name="quantity" class="form-control validate" placeholder="숫자만 입력" required>
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="unitprice">단가</label>
												<input type="number" id="unitprice" name="unitprice" class="form-control validate" placeholder="숫자만 입력" required>
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag  grey-text"></i>
												<label data-error="wrong" data-success="right" for="origin">원산지</label>
												<input type="text" id="origin" name="origin"class="form-control validate" placeholder="문자만 입력" required> 
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>
												<label data-error="wrong" data-success="right" for="expirationdate">유통기한</label>
												<input type="date" id="expirationdate" name="expirationdate" class="form-control validate" required>
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>
												<label data-error="wrong" data-success="right" for="note">비고</label>
												<input type="text" id="note" name="note" class="form-control validate" placeholder="메모할 사항이나 필수내용 입력" required>
											</div>

										<!-- 	 <div class="md-form">
												<i class="fas fa-pencil prefix grey-text"></i>
												<textarea type="text" id="form8"
													class="md-textarea form-control" rows="4"></textarea>
												<label data-error="wrong" data-success="right" for="form8">원산지</label>
											</div> -->

										</div>
										<div class="modal-footer d-flex justify-content-center">
											<button class="btn btn-unique" style="text-align: center;">
												Update 
											</button>
										</div>
									</div>
								</div>
							</div>
</form>
<%-- <%//수정하기 모달창 끝 %> --%>
						</div>
						
          <!-- DataTales Example -->
         
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>제품 번호</th>
                      <!-- <th>사용자 번호</th> -->
                      <th>품목</th>
                      <th>제품</th>
                      <th>수량</th>
                      <th>단가</th>
                      <th>원산지</th>
                      <th>유통기한</th>
                      <th>비고</th>
                    </tr>
                  </thead>
                  
                   
                  
                  <tbody>
                   <c:forEach var="emp" items="${list}" varStatus="status">
                     <tr id="inventory${status.count}">
                     <input type="hidden" name="_inventoryNo" id="_inventoryNo" value="${emp.inventoryNo}" />
                          <td>${emp.productNo}</td>
                          <%-- <td>${emp.userNo}</td> --%>
                          <td>${emp.itemname}</td>
                          <td>${emp.product}</td>
                          <td>${emp.quantity}</td>
                          <td>${emp.unitprice}</td>
                          <td>${emp.origin}</td>
                          <td>${emp.expirationdate}</td>
                          <td>${emp.note}</td>
                     </tr>
              </c:forEach>
                 
                  </tbody>
                </table>
              </div>
            </div>
          </div>

	<% //2번째 방법 %>
	<form method="Post" action="${pageContext.request.contextPath}/inventory/deleteInventory.do?userNo=${member.userNo}" id="modalDeleteForm">
      	<input type="hidden" name="productNo" value=""/>
      	<input type="hidden" name="inventoryNo" id="inventoryNo" />
    </form>

        </div>
        <!-- /.container-fluid -->
     
 
</div>
    <!-- End of Content Wrapper -->
    
 
  	<!-- Footer -->
		<c:import url="../common/footer.jsp"/>
		<!-- End of Footer -->

  
  <script>
  
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
  
  $(document).ready(function() {
	    var table = $('#dataTable').DataTable();
	    $('#dataTable tbody').on( 'click', 'tr', function () {
// 	    	$('#dataTable *').removeClass('selected');
// 	    	$(this).addClass('selected');
	        $(this).toggleClass('selected');
	    } );
	 
    
	    /* $('#button').click( function () {
	        alert( table.rows('.selected').data().length +' row(s) selected' );
	    } ); */
	} );
  
  //수정하기는 하나씩만
  function fn_inventoryUpdate(){
// 	  alert("fn_inventoryUpdate");
	  
	  var table = $('#dataTable').DataTable();
	  var length = table.rows('.selected').data().length;
	  
	  /* console.log("선택한 행 수 == " + table.rows('.selected').data().length);
	  console.log("전체행 수 == " + table.data().length); */

	  
	  if(length > 1){
		alert("수정은 하나씩만 가능");
	  	return;
	  }else if(length == 0){
		  alert("하나는 선택해야함");
	  	return;
	  }
	  
	  /* 값 가져오기 */
	  $("#modalUpdateForm #productNo").val(table.rows('.selected').data()[0][0]);		  
	 /*  $("#modalUpdateForm #userNo").val(table.rows('.selected').data()[0][1]);	 */	  
	  $("#modalUpdateForm #itemcode").val(table.rows('.selected').data()[0][1]);		  
	  $("#modalUpdateForm #product").val(table.rows('.selected').data()[0][2]);		  
	  $("#modalUpdateForm #quantity").val(table.rows('.selected').data()[0][3]);		  
	  $("#modalUpdateForm #unitprice").val(table.rows('.selected').data()[0][4]);		  
	  $("#modalUpdateForm #origin").val(table.rows('.selected').data()[0][5]);		  
	  $("#modalUpdateForm #expirationdate").val(table.rows('.selected').data()[0][6]);		  
	  $("#modalUpdateForm #note").val(table.rows('.selected').data()[0][7]);
	  $('#inventoryNo2').val($('#_inventoryNo').val())
	 
	  /*창 띄우기  */
	  $("#modalUpdateForm").modal();
	  
  }
  
  function fn_inventoryDelete(){
	  var table = $('#dataTable').DataTable();
	  var length = table.rows('.selected').data().length;
	  	  	  
  
	  if(length >= 1){
		alert(length + "개 선택하였음");
	  }else if(length == 0){
		  alert("하나는 선택해야함");
	  	return;
	  }
	 	  
	  /* //1.첫번째방식
	  var frm = document.createElement("form"); // <form></form>
	  frm.setAttribute("method", "Post");  //Post 방식  -- <form method="Post">
      frm.setAttribute("action", "deleteInventory.do"); //요청 보낼 주소    -- <form method="Post" action="deleteInventory.do" >
	  
      var hiddenField = document.createElement("input");
      hiddenField.setAttribute("type", "hidden");
      hiddenField.setAttribute("name", "productNo");
      hiddenField.setAttribute("value", table.rows('.selected').data()[0][0]);
      form.appendChild(hiddenField);
        
      <form method="Post" action="deleteInventory.do" >
      	<input type="hidden" name="productNo" value=""/>
      </form>
	   */
	 
	  //2번째 방식 
	  $("#modalDeleteForm input[name=productNo]").val(table.rows('.selected').data()[0][0]);
	  $('#modalDeleteForm #inventoryNo').val($('#_inventoryNo').val());
	  $("#modalDeleteForm").submit();
	  
  }
  
  
  </script>
   
</body>

</html>