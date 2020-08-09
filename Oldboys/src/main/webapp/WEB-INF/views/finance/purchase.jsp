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

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">매입 테이블</h1>
          <p class="mb-4">매입에 대한 모든 정보는 여기서 관리</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"
								style="display: inline;">매입</h6>
							<div class="text-center" style="display: inline; float: right;">
								<input class="btn btn-primary btn-sm" type="button" value="추가하기"
									data-toggle="modal" data-target="#modalInsertForm" />	
                           		<input class="btn btn-secondary btn-sm" type="button" onclick="updatePur();" value="수정하기"/>
                            	<input class="btn btn-danger btn-sm" type="button" onclick="deletePur();" value="삭제하기"/>
							</div>
						</div>

					<div class="table-responsive">
							<%-- // 추가하기 모달창 시작  --%>
							<div class="modal fade" id="modalInsertForm" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
								<form action=" insertPur.do" method="post">
										<div class="modal-header text-center">
									<input type="hidden" name="userNo" value="${member.userNo}" />
											<h4 class="modal-title w-100 font-weight-bold"> 매입 추가등록 <h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body mx-3">
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="productNo">제품 번호</label>
												<input type="text" id="productNo" name="productNo" class="form-control validate" value="${ productNo }">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="product">상품</label>
												<input type="text" id="product" name="product" class="form-control validate" value="${ product }">
											</div>
										
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="itemCode">품목 코드</label>
												<input type="text" id="itemCode" name="itemCode" class="form-control validate">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="businessCode">거래처 코드</label>
												<input type="text" id="businessCode" name="businessCode" class="form-control validate" value="${ businessCode }">
											</div>

											<%-- <div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>   
												<label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
												<input type="email" id="userNo" name="userNo" class="form-control validate" value="${member.userNo}" readonly>
											</div> --%>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="day">날짜</label>
												<input type="date" id="day" name="day" class="form-control validate" value="${ day }">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="price">가격</label>
												<input type="text" id="price" name="price" class="form-control validate">
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag  grey-text"></i>
												<label data-error="wrong" data-success="right" for="origin">원산지</label>
												<input type="text" id="origin" name="origin" class="form-control validate"> 
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>
												<label data-error="wrong" data-success="right" for="quantity">수량</label>
												<input type="number" id="quantity" name="quantity" class="form-control validate">
											</div>

											<!-- <div class="md-form">
												<i class="fas fa-pencil prefix grey-text"></i>
												<textarea type="text" id="form8"
													class="md-textarea form-control" rows="4"></textarea>
												<label data-error="wrong" data-success="right" for="form8">원산지</label>
											</div> -->

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
					<form method="Post" action="deletePur.do" id="modalDeleteForm">
						<input type="hidden" name="productNo"/>
						<input type="hidden" name="purchaseNo"/>
					</form>
						
						<%-- // 수정 모달창 시작  --%>
							<div class="modal fade" id="modalUpdateForm" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
								<form action=" updatePur.do" method="post">
									<div class="modal-content">
										<div class="modal-header text-center">
											<h4 class="modal-title w-100 font-weight-bold">매입 수정</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body mx-3">
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="productNo">제품 번호</label>
												<input type="text" id="productNo" name="productNo" class="form-control validate" value="${ productno }">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="product">상품</label>
												<input type="text" id="product" name="product" class="form-control validate" value="${ product }">
											</div>
										
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="itemCode">품목 코드</label>
												<input type="text" id="itemCode" name="itemCode" class="form-control validate">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="businessCode">거래 코드</label>
												<input type="text" id="businessCode" name="businessCode" class="form-control validate" value="${ businessCode }">
											</div>

											<%-- <div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>   
												<label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
												<input type="email" id="userNo" name="userNo" class="form-control validate" value="${member.userNo}" readonly>
											</div> --%>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="day">날짜</label>
												<input type="date" id="day" name="day" class="form-control validate" value="${ day }">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="price">가격</label>
												<input type="text" id="price" name="price" class="form-control validate">
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag  grey-text"></i>
												<label data-error="wrong" data-success="right" for="origin">원산지</label>
												<input type="text" id="origin" name="origin" class="form-control validate"> 
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>
												<label data-error="wrong" data-success="right" for="quantity">수량</label>
												<input type="number" id="quantity" name="quantity" class="form-control validate">
											</div>

											<!-- <div class="md-form">
												<i class="fas fa-pencil prefix grey-text"></i>
												<textarea type="text" id="form8"
													class="md-textarea form-control" rows="4"></textarea>
												<label data-error="wrong" data-success="right" for="form8">원산지</label>
											</div> -->

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
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>제품 번호</th>
                      <th>상품</th>
                      <th>품목 코드</th>
                      <th>거래처 코드</th>
                      <th style="display:none">사용자 번호</th>
                      <th>날짜</th>
                      <th>가격</th>
                      <th>원산지</th>
                      <th>수량</th>
                      <th style="display:none"></th>
                    </tr>
                  </thead>
                  
                  <tfoot>
                  <tr>
                    <th colspan="7" style="text-align:left;">이달의 매입 금액</th>
                   	<th colspan="2" style="text-align:right;"><span id="monthTotal"></span>${pMonth} 원</th>                  
                  </tr>
                   <tr>
                   	<th colspan="7" style="text-align:left;">총 매입 금액</th>
                   	<th colspan="2" style="text-align:right;"><span id="total"></span> 원</th>
                   </tr>
                  </tfoot>
                 
                  <tbody>
                  	<c:forEach var="pur" items="${list}">
                    <tr id="${pur.productNo}">
                      <th> ${pur.productNo} </th>
                      <th> ${pur.product}</th>
                      <th> ${pur.itemCode} </th>
                      <th> ${pur.businessCode} </th>
                      <th style="display:none"> ${pur.userNo} </th>
                      <th id="pDay"> ${pur.day} </th>
                      <th class="purchasePrice"> ${pur.price}</th>
                      <th> ${pur.origin} </th>
                      <th class="purchaseQuantity"> ${pur.quantity} </th>
                      <th style="display:none">${pur.purchaseNo}</th>
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
  	console.log(${pMonth});
  	
  	var date = new Date();
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1);
	
	if(month.length == 1){ 
		  month = "0" + month; 
		};

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
	function deletePur(){
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
		$("#modalDeleteForm input[name=productNo]").val(table.rows('.selected').data()[0][0]);
		$("#modalDeleteForm input[name=purchaseNo]").val(table.rows('.selected').data()[0][9]);
		$("#modalDeleteForm").submit();
				  
		}

	// 수정하기 기능 구현
	function updatePur(){
			 
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
		$("#modalUpdateForm #product").val(table.rows('.selected').data()[0][1]);		  
		$("#modalUpdateForm #itemCode").val(table.rows('.selected').data()[0][2]);		  
		$("#modalUpdateForm #businessCode").val(table.rows('.selected').data()[0][3]);		  
		$("#modalUpdateForm #userNo").val(table.rows('.selected').data()[0][4]);		  
		$("#modalUpdateForm #day").val(table.rows('.selected').data()[0][5]);		  
		$("#modalUpdateForm #price").val(table.rows('.selected').data()[0][6]);		  
		$("#modalUpdateForm #origin").val(table.rows('.selected').data()[0][7]);		  
		$("#modalUpdateForm #quantity").val(table.rows('.selected').data()[0][8]);

		/* 창 띄우기 */
		$("#modalUpdateForm").modal();
	 
	}	
	
    	/* var table = document.getElementsByClassName("purchasePrice"), sumVal = 0;
    
    	for(var i = 0; i < table.length; i++) {
        	sumVal += parseInt(table[i].innerHTML);
   	 	}
    	
    	document.getElementById("total").innerHTML = sumVal;
    	
    	console.log(sumVal); */
    
    	
    	var tableSum = document.getElementsByClassName("purchasePrice"), totalVal = 0;
		var tableQuantity = document.getElementsByClassName("purchaseQuantity")
    
    	for(var i = 0; i < tableSum.length; i++) {
    		totalVal += parseInt(tableSum[i].innerHTML) * parseInt(tableQuantity[i].innerHTML);
   	 	}
    	
    	document.getElementById("total").innerHTML = totalVal.toLocaleString("en");
    	
    	console.log(totalVal);
    	
    	/* <c:forEach items="${list}" var="p">
		console.log('${p.day}'.substring(5,7));
		console.log(month);
		if(year == '${p.day}'.substring(0,4) && month == '${p.day}'.substring(5,7)){
			
			var monthSum = document.getElementsByClassName("purchasePrice"), monthTotal = 0;
			var monthQuantity = document.getElementsByClassName("purchaseQuantity");
			
			for(var i = 0; i < monthSum.length; i++) {
				monthTotal += parseInt(monthSum[i].innerHTML) * parseInt(monthQuantity[i].innerHTML);
	   	 	}
			
			document.getElementById("monthTotal").innerHTML = monthTotal.toLocaleString("en");
			
		}
		</c:forEach> */
    	
	 /*  	<c:forEach items='${list}' var='p'>
	  	console.log($('#pDay').text().substring(1,5));
	  	console.log('${p.day}'.substring(0,4));
	  	</c:forEach> */
    
	
	</script>
	
	 <script>
                  console.log('${pMonth}');
                  </script>
  
 