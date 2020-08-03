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

<title>Insert title here</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
 
 	<c:import url="../common/header.jsp" />

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">매입에 관련된 내용입니다.
            <a target="_blank" href="https://datatables.net">블라블라</a>.</p>

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

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>   
												<label data-error="wrong" data-success="right" for="userNo">사용자 번호</label>
												<input type="email" id="userNo" name="userNo" class="form-control validate" value="${member.userNo}" readonly>
											</div>

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
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="form34">제품 번호</label>
												<input type="text" id="form34" class="form-control validate" value="${ productno }">
											</div>
										
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="form34">거래내용</label>
												<input type="text" id="form34" class="form-control validate">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-user prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="form34">거래 코드</label>
												<input type="text" id="form34" class="form-control validate" value="${ businessCode }">
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>   
												<label data-error="wrong" data-success="right" for="form29">사용자번호</label>
												<input type="email" id="form29" class="form-control validate">
											</div>

											<div class="md-form">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="form32">날짜</label>
												<input type="text" id="form32" class="form-control validate" value="${ day }">
											</div>
											
											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i> 
												<label data-error="wrong" data-success="right" for="form32">가격</label>
												<input type="text" id="form32" class="form-control validate">
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag  grey-text"></i>
												<label data-error="wrong" data-success="right" for="form32">원산지</label>
												<input type="text" id="form32" class="form-control validate"> 
											</div>

											<div class="md-form mb-3">
												<i class="fas fa-tag prefix grey-text"></i>
												<label data-error="wrong" data-success="right" for="form32">수량</label>
												<input type="text" id="form32" class="form-control validate">
											</div>

											<!-- <div class="md-form">
												<i class="fas fa-pencil prefix grey-text"></i>
												<textarea type="text" id="form8"
													class="md-textarea form-control" rows="4"></textarea>
												<label data-error="wrong" data-success="right" for="form8">원산지</label>
											</div> -->

										</div>
										<div class="modal-footer d-flex justify-content-center">
											<button class="btn btn-unique" style="text-align: center;"TableInsert.do">
												Send <i class="fas fa-paper-plane-o ml-1"></i>
											</button>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>제품 번호</th>
                      <th>거래 내용</th>
                      <th>거래 코드</th>
                      <th>사용자 번호</th>
                      <th>날짜</th>
                      <th>가격</th>
                      <th>원산지</th>
                      <th>수량</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
                      <th> ${productno} </th>
                      <th> ${itemCode} </th>
                      <th> ${businessCode} </th>
                      <th> ${userNo} </th>
                      <th> ${day} </th>
                      <th> ${price} </th>
                      <th> ${origin} </th>
                      <th> ${quantity} </th>
                    </tr>

                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->
		<c:import url="../common/footer.jsp" />
      </div>
 
 <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시나요?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">"로그아웃"을 하시려면 로그아웃을 눌러주세요!</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/member/memberLogout.do">로그아웃</a>
        </div>
      </div>
    </div>
  </div>
  
  
 