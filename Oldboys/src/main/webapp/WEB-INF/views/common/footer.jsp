<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

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


<footer class="sticky-footer bg-white"  style="margin-top:20%;">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      
 
      
         <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"/></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/></script>

  <!-- Core plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"/></script>

  <!-- Custom scripts for all pages -->
  <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"/></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"/></script>
  
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"/></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/datatables.min.js"/></script>
  <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

	  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
  <script>
	$(function(){
		$("#dataTable_filter").css("float","right");	
	});
	
	$(document).ready(function(){
	
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
	}); 
	
	$(document).ready(function(){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/finance/salesPrice.do',
			type: 'POST',
			data: {
				userId : '${member.userId}'
			}, success : function(data){
				console.log(data);
				$('#priceTotal_').text(data.salesPrice.toLocaleString("en"));
			}, error : function(error, code, msg){
				console.log(error);
			}			
		});	
	}); 
	
	$(document).ready(function(){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/finance/purchasePrice.do',
			type: 'POST',
			data: {
				userId : '${member.userId}'
			}, success : function(data){
				console.log(data);
				$('#priceTotal_P').text(data.purchasePrice.toLocaleString("en"));
			}, error : function(error, code, msg){
				console.log(error);
			}			
		});	
	}); 
	
	/* $(document).ready(function(){
		var purVal = 
		var salVal = 
		
		sumVal = purVal - salVal;
		
		document.getElementById("sumVal").text = (sumVal.toLocaleString("en"));
		
		consloe.log(sumVal);
		
	}); */
	
	
	
	document.addEventListener("DOMContentLoaded", function() {
	  var toDay = new Date();
	    document.getElementById("to1Ymd").innerHTML = toDay.yyyymmdd();
	    document.getElementById("to2Ymd").innerHTML = toDay.yyyymmdd();
	    document.getElementById("to3Ymd").innerHTML = toDay.yyyymmdd();
	  });

	  // 현재 날짜값을 yyyy-mm-dd 형식으로 변환해주는 함수s
	  Date.prototype.yyyymmdd = function() {
	      var yyyy = this.getFullYear().toString();
	      var mm = (this.getMonth() + 1).toString();
	      var dd = this.getDate().toString();
	      return  yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
	  }
	  
</script>

</html>