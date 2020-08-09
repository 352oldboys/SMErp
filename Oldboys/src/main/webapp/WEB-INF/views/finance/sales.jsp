<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	 uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SMERP</title>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
 
 	<c:import url="../common/header.jsp" />
 	
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">매출 테이블</h1>
          <p class="mb-4">매출에 대한 모든 정보는 여기서 관리</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"
								style="display: inline;">매출</h6>
							<div class="text-center" style="display: inline; float: right;">
								<input class="btn btn-primary btn-sm" type="button" value="추가하기"
									data-toggle="modal" data-target="#modalInsertForm" />	
                           		<input class="btn btn-secondary btn-sm" type="button" onclick="updateSal();" value="수정하기"/>
                            	<input class="btn btn-danger btn-sm" type="button" onclick="deleteSal();" value="삭제하기"/>
							</div>
						</div>
						
					<div class="table-responsive">
							<%-- // 추가하기 모달창 시작  --%>
							<div class="modal fade" id="modalInsertForm" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
								<form action=" insertSal.do" method="post">
										<div class="modal-header text-center">
									<input type="hidden" name="userNo" value="${member.userNo}" />
											<h4 class="modal-title w-100 font-weight-bold">매출 추가등록</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body mx-3">
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="productName">상품명</label>
												<input type="text" id="productName" name="productName" class="form-control validate" value="${ productName }">
											</div>
										
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="productNo">상품번호</label>
												<input type="text" id="productNo" name="productNo" class="form-control validate" value="${ productNo }">
												<input type="hidden" id="userNo" name="userNo" class="form-control validate" value="${ member.userNo }" />
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="businessCode">단가</label>
												<input type="text" id="unitPrice" name="unitPrice" class="form-control validate" value="${ unitPrice }">
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>   
												<label data-error="wrong" data-success="right" for="userNo">날짜</label>
												<input type="date" id="day" name="day" class="form-control validate" value="${day}">
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="day">수량</label>
												<input type="number" id="quantity" name="quantity" class="form-control validate" value="${ quantity }">
											</div>
											
										</div>
										<div class="modal-footer d-flex justify-content-center">
											<button type="submit" class="btn btn-unique" style="text-align: center;">
												Send <i class="fas fa-paper-plane-o ml-1"></i>
											</button>
										</div>
											</form>
									</div>
								</div>
							</div>
							
					<%-- // 삭제하기 2번째 방법 --%>
					<form method="Post" action="deleteSal.do" id="modalDeleteForm">
						<input type="hidden" name="productNo"/>
						<input type="hidden" name="salesNo"/>
					</form>
						
						<%-- // 수정 모달창 시작  --%>
							<div class="modal fade" id="modalUpdateForm" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
								<form action=" updateSal.do" method="post">
									<div class="modal-content">
										<div class="modal-header text-center">
											<h4 class="modal-title w-100 font-weight-bold">매출 수정</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body mx-3">
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="productName">상품명</label>
												<input type="text" id="productName" name="productName" class="form-control validate" value="${ productName }">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i>
												<label data-error="wrong" data-success="right" for="productNo">상품 번호</label>
												<input type="text" id="productNo" name="productNo" class="form-control validate" value="${ productNo }" readonly>
												<input type="hidden" id="userNo" name="userNo" class="form-control validate" value="${ member.userNo }" />
											</div>
										
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="productName">상품 코드</label>
												<input type="text" id="productNo" name="productNo" class="form-control validate" value="${ productNo }" >
												<input type="hidden" id="userNo" name="userNo" class="form-control validate" value="${ member.userNo }" readonly>
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="businessCode">단가</label>
												<input type="text" id="unitPrice" name="unitPrice" class="form-control validate" value="${ unitPrice }">
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>   
												<label data-error="wrong" data-success="right" for="userNo">날짜</label>
												<input type="date" id="day" name="day" class="form-control validate" value="${day}">
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="day">수량</label>
												<input type="number" id="quantity" name="quantity" class="form-control validate" value="${ quantity }">
											</div>
											
										</div>
										<div class="modal-footer d-flex justify-content-center">
											<button type="submit" class="btn btn-unique" style="text-align: center;">
												Send <i class="fas fa-paper-plane-o ml-1"></i>
											</button>
										</div>
											</form>
									</div>
								</div>
							</div>

						
						</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>상품 명</th>
                      <th>상품 번호</th>
                      <th style="display:none">유저 번호</th>
                      <th>단가</th>
                      <th>날짜</th>
                      <th>수량</th>
                      <th style="display:none"></th>
                    </tr>
                  </thead>

 				  <tfoot>
 				  
 				  <tr>
                   	<th colspan="4" style="text-align:left;">이달의 매출 금액 ( 원 ) </th>
                   	<th colspan="1" style="text-align:right;"><span id="monthTotal"></span>${sMonth} 원</th>
                   </tr>
                   <tr>
                   	<th colspan="4" style="text-align:left;">총 매출 금액 ( 원 ) </th>
                   	<th colspan="1" style="text-align:right;"><span id="total"></span> 원</th>
                   </tr>
                  </tfoot>

                  <tbody>
                  	<c:forEach var="sal" items="${list}">
                    <tr id="${sal.productNo}">
                      <th> ${sal.productNo} </th>
                      <th> ${sal.productName}</th>
                      <th style="display:none"> ${sal.userNo} </th>
                      <th class="unitPrice"> ${sal.unitPrice} </th>
                      <th> ${sal.day} </th>
                      <th class="quantity"> ${sal.quantity} </th>
                      <th style="display:none">${sal.salesNo}</th>
					</tr>
					</c:forEach>
                  </tbody>
                </table>
              
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->
		<c:import url="../common/footer.jsp" />
      </div>

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
	function deleteSal(){
		var table = $('#dataTable').DataTable();
		var length = table.rows('.selected').data().length;
 	  	  

		if(length >= 1){
			alert(length + "개 선택하셨습니다.");
		} else if(length == 0){
			alert("삭제할 목록을 선택해주세요.");
			return;
		}
		
		// 2번째 방식 
		$("#modalDeleteForm input[name=productNo]").val(table.rows('.selected').data()[0][0]);		 
		$("#modalDeleteForm input[name=salesNo]").val(table.rows('.selected').data()[0][6]);
		$("#modalDeleteForm").submit();
				  
		}
	


	// 수정하기 기능 구현
	function updateSal(){
			 
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
		$("#modalUpdateForm #productNo").val(table.rows('.selected').data()[0][0]);			  
		$("#modalUpdateForm #productName").val(table.rows('.selected').data()[0][1]);	
		$("#modalUpdateForm #userNo").val(table.rows('.selected').data()[0][2]);		  
		$("#modalUpdateForm #unitPrice").val(table.rows('.selected').data()[0][3]);		  
		$("#modalUpdateForm #day").val(table.rows('.selected').data()[0][4]);		  
		$("#modalUpdateForm #quantity").val(table.rows('.selected').data()[0][5]);		

		/* 창 띄우기 */
		$("#modalUpdateForm").modal();
	 
	}	
    	
    	var tableSum = document.getElementsByClassName("unitPrice"), totalVal = 0;
		var tableTimes = document.getElementsByClassName("quantity")
    
    	for(var i = 0; i < tableSum.length; i++) {
    		totalVal += parseInt(tableSum[i].innerHTML) * parseInt(tableTimes[i].innerHTML);
   	 	}
    	
    	document.getElementById("total").innerHTML = totalVal.toLocaleString("en");
    	
    	console.log(totalVal);
    	
		// document.getElementById("monthTotal").innerHTML = ${sMonth}.toLocaleString("en");
    	
    	
    	
    	/* 
    	var salesMonth = $('#monthTotal').text(${sMonth});
    	
    	salesMonth.toLocaleString("en"); */
    
	
	</script>
