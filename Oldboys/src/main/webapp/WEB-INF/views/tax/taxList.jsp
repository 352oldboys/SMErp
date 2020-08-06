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
	          <h1 class="h3 mb-2 text-gray-800">세금계산서</h1>
	          <p class="mb-4">간편하게 세금계산서를 등록하고 언제든 원하는 조건으로 조회할 수 있어 효율적인 세금계산서 관리를 할 수 있습니다.</p>
	
	          <!-- DataTales Example -->
	          <div class="card shadow mb-4">
	            <div class="card-header py-3">
	              <h6 class="m-0 font-weight-bold text-primary" style="display: inline;" >매입 세금계산서</h6>
                     <div class="text-center" style="display: inline; float: right;">
                    	   <input class="btn btn-primary btn-sm" type="button" value="추가하기"
                           	       data-toggle="modal" data-target="#modalInsertForm" />
                           <input class="btn btn-secondary btn-sm" type="button" onclick="updateTax();" value="수정하기"/>
                           <input class="btn btn-danger btn-sm" type="button" onclick="deleteTax();" value="삭제하기"/>
                     </div>
	            </div>

	                     
					<% // 추가하기 모달창 시작  %>
                	<form action="${pageContext.request.contextPath}/tax/insertTax.do?userNo=${member.userNo}" id="taxFrm" method="post">
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
                              		 <%-- <input type="hidden" name="taxNo" id="taxNo" value="${ tax.taxNo }"/> --%>
                              		 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i> 
	                                    <label data-error="wrong" data-success="right" for="publishDay">발행일</label>
	                                    <input type="date" name="publishDay" id="publishDay" class="form-control validate">
	                                 </div>
	                              
									 <%-- <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
	                                    <input type="text" name="userNo" id="userNo" class="form-control validate" value="${ member.userNo }" readonly>
	                                 </div> --%>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="businessCode">거래처 코드</label>
	                                    <input type="text" name="businessCode" id="businessCode" class="form-control validate">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>   
	                                    <label data-error="wrong" data-success="right" for="custRegNo">사업자 번호</label>
	                                    <input type="text" name="custRegNo" id="custRegNo" class="form-control validate">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="businessName">기업명</label>
	                                    <input type="text" name="businessName" id="businessName" class="form-control validate">
	                                 </div>
			                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i> 
	                                    <label data-error="wrong" data-success="right" for="item">품목</label>
	                                    <input type="text" name="item" id="item" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="unit">규격</label>
	                                    <input type="text" name="unit" id="unit" class="form-control validate"> 
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="quantity">수량</label>
	                                    <input type="text" name="quantity" id="quantity" class="form-control validate" onkeyup="calcSup()">
	                                 </div>
	                                 
                                	 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="unitCost">단가</label>
	                                    <input type="text" name="unitCost" id="unitCost" class="form-control validate" onkeyup="calcSup()">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="supplyPriceComma">공급가액</label>
	                                    <input type="hidden" name="supplyPrice" id="supplyPrice"/>
	                                    <input type=text id="supplyPriceComma" class="form-control validate" onkeyup="calcSup()">
	                                 </div>	
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="taxPriceComma">세액</label>
	                                    <input type="hidden" name="taxPrice" id="taxPrice"/>
	                                    <input type="text" id="taxPriceComma" class="form-control validate">
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
					<form action="${pageContext.request.contextPath}/tax/deleteTax.do?userNo=${member.userNo}" method="Post" id="modalDeleteForm">
						<input type="hidden" name="taxNo"/>
					</form>
                	
					<% // 수정하기 모달창 시작  %>
					<form action="${pageContext.request.contextPath}/tax/updateTax.do?userNo=${member.userNo}" method="post">
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
                              		 <input type="hidden" name="taxNo" id="uTaxNo"/>
	                              
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i> 
	                                    <label data-error="wrong" data-success="right" for="uPublishDay">발행일</label>
	                                    <input type="date" name="publishDay" id="uPublishDay" class="form-control validate">
	                                 </div>
	                                 
									 <%-- <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
	                                    <input type="text" name="userNo" id="userNo" class="form-control validate" value="${ userNo }">
	                                 </div> --%>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="uBusinessCode">거래처 코드</label>
	                                    <input type="text" name="businessCode" id="uBusinessCode" class="form-control validate">
	                                 </div>

	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>   
	                                    <label data-error="wrong" data-success="right" for="uCustRegNo">사업자 번호</label>
	                                    <input type="text" name="custRegNo" id="uCustRegNo" class="form-control validate">
	                                 </div>
	                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-user"></i> 
	                                    <label data-error="wrong" data-success="right" for="uBusinessName">기업명</label>
	                                    <input type="text" name="businessName" id="uBusinessName" class="form-control validate">
	                                 </div>
			                                 
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i> 
	                                    <label data-error="wrong" data-success="right" for="uItem">품목</label>
	                                    <input type="text" name="item" id="uItem" class="form-control validate">
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="uUnit">규격</label>
	                                    <input type="text" name="unit" id="uUnit" class="form-control validate"> 
	                                 </div>
	
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="uQuantity">수량</label>
	                                    <input type="text" name="quantity" id="uQuantity" class="form-control validate" onkeyup="calcSupUpdate()">
	                                 </div>
	                                 
                                	 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="uUnitCost">단가</label>
	                                    <input type="text" name="unitCost" id="uUnitCost" class="form-control validate" onkeyup="calcSupUpdate()">
	                                 </div>
	                                
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="uSupplyPriceComma">공급가액</label>
	                                    <input type="text" name="supplyPrice" id="uSupplyPrice" class="form-control validate"/>
	                                    <input type="hidden" id="uSupplyPriceComma" class="form-control validate" onkeyup="calcSupUpdate()">
	                                 </div>	
	                                       
	                                 <div class="md-form mb-3">
	                                    <i class="fas fa-tag"></i>
	                                    <label data-error="wrong" data-success="right" for="uTaxPriceComma">세액</label>
	                                    <input type="text" name="taxPrice" id="uTaxPrice" class="form-control validate"/>
	                                    <input type="hidden" id="uTaxPriceComma" class="form-control validate">
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
						<!-- <th>사용자 번호</th> -->
						<!-- <th>순번</th> -->
						<th>발행일</th>
						<th>거래처 코드</th>
						<th>사업자 번호</th>
						<th>기업명</th>
						<th>품목</th>
						<th>규격</th>
						<th>수량</th>
						<th>단가</th>
						<th>공급가액</th>
						<th>세액</th>						
	                  </tr>
	                </thead>
					<tbody>
					  <c:forEach var="tax" items="${list}">
			  	  	  	<tr id="${tax.taxNo}">
							<%-- <td>${tax.userNo}</td> --%>
							<%-- <td>${tax.taxNo}</td> --%>	
							<input type="hidden" name="_taxNo" id="_taxNo" value="${tax.taxNo}" />			
							<td>${tax.publishDay}</td>
  	  	  		  	  		<td>${tax.businessCode}</td>
							<td>${tax.businessName}</td>
							<td>${tax.custRegNo}</td>
							<td>${tax.item}</td>
							<td>${tax.unit}</td>
							<td>${tax.quantity}</td>
							<td>${tax.unitCost}</td>
							<td>${tax.supplyPrice}</td>
							<td>${tax.taxPrice}</td>
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
	
	
	// taxNo 컬럼 숨기기
	/* $(document).ready(function() {
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
	
	// 삭제하기 기능 구현
	function deleteTax(){
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
		$("#modalDeleteForm input[name=taxNo]").val($('#_taxNo').val());		  
		$("#modalDeleteForm").submit();
				  
		}

	// 수정하기 기능 구현
	function updateTax(){
			 
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
		/* $("#modalUpdateForm #uTaxNo").val(table.rows('.selected').data()[0][0]); */
		$("#uPublishDay").val(table.rows('.selected').data()[0][0]);		  
		$("#uBusinessCode").val(table.rows('.selected').data()[0][1]);		  
		$("#uBusinessName").val(table.rows('.selected').data()[0][2]);		  
		$("#uCustRegNo").val(table.rows('.selected').data()[0][3]);		  
		$("#uItem").val(table.rows('.selected').data()[0][4]);		  
		$("#uUnit").val(table.rows('.selected').data()[0][5]);		  
		$("#uQuantity").val(table.rows('.selected').data()[0][6]);		  
		$("#uUnitCost").val(table.rows('.selected').data()[0][7]);		  
		$("#uSupplyPrice").val(table.rows('.selected').data()[0][8]);	
		$("#uTaxPrice").val(table.rows('.selected').data()[0][9]);
		$('#uTaxNo').val($('#_taxNo').val());
		
		/* 창 띄우기 */
		$("#modalUpdateForm").modal();
	}
	
	/* // 추가하기  창 공급가액 & 세액 자동 계산하기
    function calcSup(){
    	var quantity = $("#quantity").val();
    	var unitCost = $("#unitCost").val();
        var resultSup = quantity * unitCost;
        var resultTax = 0.1 * resultSup;
        
        if(unitCost == ""){
            document.getElementById('supplyPrice').value = "0";
            document.getElementById('supplyPriceComma').value = "0";
        }else{
            document.getElementById('supplyPriceComma').value = resultSup.toLocaleString();
            document.getElementById('supplyPrice').value = resultSup;
            document.getElementById('taxPriceComma').value = resultTax.toLocaleString();
            document.getElementById('taxPrice').value = resultTax;
            
        }

    }
    
	// 수정하기 창 공급가액 & 세액 자동 계산하기
    function calcSupUpdate(){
    	var quantity = $("#uQuantity").val();
    	var unitCost = $("#uUnitCost").val();
        var resultSup = quantity * unitCost;
        var resultTax = 0.1 * resultSup;
        
        if(unitCost == ""){
            document.getElementById('uSupplyPrice').value = "0";
            document.getElementById('uSupplyPriceComma').value = "0";
        }else{
            document.getElementById('uSupplyPriceComma').value = resultSup.toLocaleString();
            document.getElementById('uSupplyPrice').value = resultSup;
            document.getElementById('uTaxPriceComma').value = resultTax.toLocaleString();
            document.getElementById('uTaxPrice').value = resultTax;
        }

    } */
	
    </script>
    
    
	
</body>

</html>