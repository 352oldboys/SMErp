<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>통합 매입 / 매출</title>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<c:import url="../common/header.jsp" />


		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">매입 / 매출 통합</h1>
			</div>

			<!-- Content Row -->
			<div class="row">

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-primary shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-primary text-uppercase mb-1">
										<h5>매입</h5>
										<a
											href="${pageContext.request.contextPath}/finance/purchase.do?userNo=${member.userNo}">(자세히
											보러가기)</a>
									</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<p id="priceTotal_P" style="display: inline;"></p>
										원
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-calendar fa-3x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">
										<h5>매출</h5>
										<a href="${pageContext.request.contextPath}/finance/sales.do?userNo=${member.userNo}"
											style="color: #1cc88a !important;">(자세히 보러가기)</a>
									</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<p id="priceTotal_" style="display: inline;"></p>
										원
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-3x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-info shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-info text-uppercase mb-1">
										<h5>매입/매출 비율</h5>
									</div>
									<p
										style="color: #36b9cc !important; font-size: .7rem; margin-top: 8px;">
										<B>(매입 퍼센트)</B>
									</p>
									<div class="row no-gutters align-items-center">
										<div class="col-auto">
											<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
										</div>
										<div class="col">
											<div class="progress progress-sm mr-2">
												<div class="progress-bar bg-info" role="progressbar"
													style="width: 50%" aria-valuenow="50" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-clipboard-list fa-3x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Pending Requests Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-warning shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-warning text-uppercase mb-1">
										<h5>이달의 이익</h5>
										<p style="font-size: 7px;">(이달의 이익)</p>
									</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<p id="sumVal" style="display: inline;"></p>
										원
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-comments fa-3x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

				


			<div class="row">

				<!-- Area Chart -->
				<div class="col-xl-8 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">이달의 매출 그래프</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i
									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
									aria-labelledby="dropdownMenuLink">
									<div class="dropdown-header">Dropdown Header:</div>
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-area">
								<canvas id="myAreaChart"></canvas>
							</div>
						</div>
					</div>
				</div>

				<!-- Pie Chart -->
				<div class="col-xl-4 col-lg-5">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">매출 분포</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i
									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
									aria-labelledby="dropdownMenuLink">
									<div class="dropdown-header">Dropdown Header:</div>
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle text-primary"></i> Direct </span> 
								<span class="mr-2"> <i class="fas fa-circle text-success"></i> Social </span> 
								<span class="mr-2"> <i class="fas fa-circle text-info"></i> Referral </span>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		
		
		
		<c:import url="../common/footer.jsp" />
		
		

	</div>
	
	<script>
	$(document).ready(function(){
		
		var date = new Date();
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1);
		
		if(month.length == 1){ 
			  month = "0" + month; 
			};
		
		<c:forEach items="${pList}" var="p">
			console.log('${p.day}'.substring(5,7));
			console.log('month : ' + month);
	if(year == '${p.day}'.substring(0,4) && month == '${p.day}'.substring(5,7)){			
	
		$.ajax({
			url : '${pageContext.request.contextPath}/finance/salesPrice.do',
			type: 'POST',
			data: {
				userId : '${member.userId}'
			}, success : function(data){
				console.log(data);
				$('#priceTotal').text(data.salesPrice.toLocaleString("en"));
			}, error : function(error, code, msg){
				console.log(error);
			}			
		});	
	
// 	$(document).ready(function(){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/finance/salesPrice.do',
			type: 'POST',
			data: {
				userId : '${member.userId}'
			}, success : function(data){
				console.log(data);
				var sPrice = data;
				$('#priceTotal_').text(data.salesPrice.toLocaleString("en"));
			}, error : function(error, code, msg){
				console.log(error);
			}			
		});	
	
	// $(document).ready(function(){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/finance/purchasePrice.do',
			type: 'POST',
			data: {
				userId : '${member.userId}'
			}, success : function(data){
				console.log(data);
				var pPrice = data;
				
				$('#priceTotal_P').text(data.purchasePrice.toLocaleString("en"));
			}, error : function(error, code, msg){
				console.log(error);
			}			
		});
		
		$.ajax({
			
			url : '${pageContext.request.contextPath}/finance/integrated.do',
			type : 'POST',
			data : {
				userId : '${member.userId}' 
			}, success : function(data){
				
				console.log($('#priceTotal_').text());
				console.log($('#priceTotal_P').text());
			
				var a = parseInt($('#priceTotal_').text().replace(/,/g,"")) - parseInt($('#priceTotal_P').text().replace(/,/g,""));
				console.log(a);
				
				$('#sumVal').text(a.toLocaleString("en"));			
					
			}, error : function(error, code, msg){
				console.log(error);
			}
			
		
			});
	}
		</c:forEach>
		
	});
	
	</script>
	