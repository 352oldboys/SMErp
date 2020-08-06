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
										<h5>이달의 매입</h5>
										<a
											href="${pageContext.request.contextPath}/finance/purchase.do?userNo=${member.userNo}">(자세히
											보러가기)</a>
									</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<p id="purchaseMonth" style="display: inline;"></p>
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
										<h5>이달의 매출</h5>
										<a href="${pageContext.request.contextPath}/finance/sales.do?userNo=${member.userNo}"
											style="color: #1cc88a !important;">(자세히 보러가기)</a>
									</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<p id="salesMonth" style="display: inline;"></p>
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
											<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"
											id="ratio"></div>
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
										<p id="profitMonth" style="display: inline;"></p>
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
								<span class="mr-2"> <i class="fas fa-circle text-primary"></i> 매입 </span> 
								<span class="mr-2"> <i class="fas fa-circle text-success"></i> 매출 </span> 								
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
				$('#salesMonth').text(data.salesPrice.toLocaleString("en"));
			}, error : function(error, code, msg){
				console.log(error);
			}
		});	
	
	// $(document).ready(function(){
/* 		
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
		}); */
		
		
		$.ajax({
			
			url : '${pageContext.request.contextPath}/finance/pMonthPrice.do',
			type : 'POST',
			data : {
				userNo : '${member.userNo}' 
			}, success : function(data){
				console.log(data);
				console.log(data.pMonth);
				
				$('#purchaseMonth').text(data.pMonth);			
					
			}, error : function(error, code, msg){
				console.log(error);
				console.log(code);
				console.log(msg);
				console.log(${pMonth});
			}
		});
	
		$.ajax({
			
			url : '${pageContext.request.contextPath}/finance/integrated.do',
			type : 'POST',
			data : {
				userNo : '${member.userNo}'
			}, success : function(data){
							
				var a = parseInt($('#salesMonth').text().replace(/,/g,"")) - parseInt($('#purchaseMonth').text().replace(/,/g,""));
				
				console.log(a);
				
				$('#profitMonth').text(a.toLocaleString("en"));			
					
			}, error : function(error, code, msg, a){
				console.log(error);
				console.log(a);
			}
		});
		
$.ajax({
			
			url : '${pageContext.request.contextPath}/finance/integrated.do',
			type : 'POST',
			data : {
				userNo : '${member.userNo}'
			}, success : function(data){
							
				var b = parseInt($('#salesMonth').text().replace(/,/g,"")) / parseInt($('#purchaseMonth').text().replace(/,/g,""));
				
				console.log(b);
				
				$('#ratio').text(Math.round(b)+'%');			
					
			}, error : function(error, code, msg){
				console.log(error);
			}
		});
		
	});
	
	$(function(){
		console.log("test");	
		console.log("확인 : " + '${iList}');
		
/* 		var list = new Array();
		console.log("값 넣기 전 : " + list)
		
		<c:forEach items="${iList}" var="i">
			
			console.log('${i.totalPrice}');
			list.push('${i.totalPrice}');
			
		</c:forEach>
		
		console.log("값 진행 후 : " + list) */
	});
	
		
	
	function number_format(number, decimals, dec_point, thousands_sep) {
		  // *     example: number_format(1234.56, 2, ',', ' ');
		  // *     return: '1 234,56'
		  number = (number + '').replace(',', '').replace(' ', '');
		  var n = !isFinite(+number) ? 0 : +number,
		    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		    s = '',
		    toFixedFix = function(n, prec) {
		      var k = Math.pow(10, prec);
		      return '' + Math.round(n * k) / k;
		    };
		  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
		  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
		  if (s[0].length > 3) {
		    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		  }
		  if ((s[1] || '').length < prec) {
		    s[1] = s[1] || '';
		    s[1] += new Array(prec - s[1].length + 1).join('0');
		  }
		  return s.join(dec);
		}

		// Area Chart Example
		
		var list = new Array();
		
		console.log("값 진행 전 : " + list)
		
		//foreach문을 하나씩 보여주기때문에 다 합쳐가지고 보내줘야하니 배열함수 push로 하나하나의 값을 추가해준다. 
		<c:forEach items="${iList}" var="i">
			list.push('${i.totalPrice}');
			console.log("값 진행 중 : " + list)
			
		</c:forEach>
		
		console.log("값 진행 후 : " + list)
		
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
		  type: 'line',
		  data: {
		    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		    datasets: [{
		      label: "매출 : ",
		      lineTension: 0.3,
		      backgroundColor: "rgba(78, 115, 223, 0.05)",
		      borderColor: "rgba(78, 115, 223, 1)",
		      pointRadius: 3,
		      pointBackgroundColor: "rgba(78, 115, 223, 1)",
		      pointBorderColor: "rgba(78, 115, 223, 1)",
		      pointHoverRadius: 3,
		      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
		      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
		      pointHitRadius: 10,
		      pointBorderWidth: 2, 
		      data: list
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    layout: {
		      padding: {
		        left: 10,
		        right: 25,
		        top: 25,
		        bottom: 0
		      }
		    },
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          display: false,
		          drawBorder: false
		        },
		        ticks: {
		          maxTicksLimit: 7
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          maxTicksLimit: 5,
		          padding: 10,
		          // Include a dollar sign in the ticks
		          callback: function(value, index, values) {
		            return number_format(value) + '원' ;  
		          }
		        },
		        gridLines: {
		          color: "rgb(234, 236, 244)",
		          zeroLineColor: "rgb(234, 236, 244)",
		          drawBorder: false,
		          borderDash: [2],
		          zeroLineBorderDash: [2]
		        }
		      }],
		    },
		    legend: {
		      display: false
		    },
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      titleMarginBottom: 10,
		      titleFontColor: '#6e707e',
		      titleFontSize: 14,
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      intersect: false,
		      mode: 'index',
		      caretPadding: 10,
		      callbacks: {
		        label: function(tooltipItem, chart) {
		          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		          return datasetLabel + number_format(tooltipItem.yLabel) + '원';
		        }
		      }
		    }
		  }
		});
	
		
		// Pie Chart Example
		var tlist = new Array();
		
		<c:forEach items="${tList}" var="t">
			tlist.push('${t.totalPurchase}','${t.totalSales}');
			console.log("값 진행 중 : " + list)
			
		</c:forEach>
		
	
		
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
		  type: 'doughnut',
		  data: {
		    labels: ["매입", "매출",],
		    datasets: [{
		      data: tlist,
		      backgroundColor: ['#4e73df', '#1cc88a'],
		      hoverBackgroundColor: [ '#17a673','#2e59d9',],
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 80,
		  },
		});
	</script>
	