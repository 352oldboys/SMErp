<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/main.min.css"  rel='stylesheet'/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <!-- Page Wrapper -->
  <div id="wrapper">
<c:import url="../common/header.jsp"></c:import>
			<div id='calendar'></div> 
			
			<%-- <c:forEach items="${slist}" var="s">
					<tr>
				<td><input type="hidden"  value="${s.allDay}" id="scheduleAllDay" /></td>
				<td><input type="hidden"  value="${s.title}" id="scheduleTitle"/></td>
				<td><input type="hidden"  value="${s.startDate}" id="scheduleStartDate" /></td>
				<td><input type="hidden"  value="${s.endDate}" id="scheduleEndDate"/></td>
				<td><input type="hidden"  value="${s.category}" id="scheduleCategory"/></td>
				<td><input type="hidden"  value="${s.color}" id="scheduleColor"/></td>
				<td><input type="hidden"  value="${s.content}" id="scheduleContent" /></td>
			</tr>
			</c:forEach> --%>						
	<input type="hidden"  value="${schedule.userNo}" name="userNo" id="userNo"/>
  
   			<!-- 일자 클릭시 메뉴오픈 -->
	<!-- 		        <div id="contextMenu" class="dropdown clearfix">
			            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
			                style="display:block; position:absolute; left:-240px; top:-55px; margin-bottom:5px;;">
			                <li><a tabindex="-1" href="#">카테고리1</a></li>
			                <li><a tabindex="-1" href="#">카테고리2</a></li>
			                <li><a tabindex="-1" href="#">카테고리3</a></li>
			                <li><a tabindex="-1" href="#">카테고리4</a></li>
			                <li class="divider"></li>
			                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
			            </ul>
			        </div> -->
        
          <!-- 일정 추가 MODAL -->
   <form action="scheduleInsert.do" method="post">
     <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                             aria-hidden="true">&times;</span></button>
                     <h4 class="modal-title"></h4>
                 </div>
                 <div class="modal-body">

                     <div class="row">
                         <div class="col-xs-12">
                             <label class="col-xs-4" for="edit-allDay">하루종일</label>
                             <input class='allDayNewEvent' id="edit-allDay" type="checkbox" checked
                             			  name="allDay">
                         </div>
                     </div>

		<c:if test="${ empty employee && !empty enterprise }">
					 <input type="hidden" id="SCeCode" name="SCeCode" value="${enterprise.eCode}"/>

					</c:if>
				<c:if test="${ empty enterprise && !empty employee }">
					<input type="hidden" id="SCeCode" name="SCeCode" value="${employee.eCode}"/>
					</c:if>



      <div class="row">
          <div class="col-xs-12">
              <label class="col-xs-4" for="edit-title">일정명</label>
              <input class="inputModal" type="text" name="title" id="title"
                  required="required" />
          </div>
      </div>
                       <!--  <div class="row">
                            <div class="col-xs-12 input-group date" id="datetimepicker1" data-target-input="nearest">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal datetimepicker-input" data-target="#datetimepicker1"
                                			 type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div> -->
                        
    <div class='col-md-10'>
        <div class="form-group">
           <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
           <label class="col-xs-4" for="edit-start">시작</label>
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker7"
                			name="startDate" id="startDate"/>
                <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div class='col-md-10' >
        <div class="form-group">
           <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
           <label class="col-xs-4" for="edit-end" style="float: auto;">끝</label>
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker8"
                			  name="endDate" id="endDate"/>
                <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
                     
         <div class="row">
             <div class="col-xs-12">
                 <label class="col-xs-4" for="edit-type">구분</label>
                 <select class="inputModal" type="text" name="category" id="edit-type">
                     <option value="카테고리1">카테고리1</option>
                     <option value="카테고리2">카테고리2</option>
                     <option value="카테고리3">카테고리3</option>
                     <option value="카테고리4">카테고리4</option>
                 </select>
             </div>
         </div>
          <div class="row">
              <div class="col-xs-12">
                  <label class="col-xs-4" for="edit-color">색상</label>
                  <select class="inputModal" name="color" id="edit-color">
                      <option value="#D25565" style="color:#D25565;">빨간색</option>
                      <option value="#9775fa" style="color:#9775fa;">보라색</option>
                      <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                      <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                      <option value="#f06595" style="color:#f06595;">핑크색</option>
                      <option value="#63e6be" style="color:#63e6be;">연두색</option>
                      <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                      <option value="#4d638c" style="color:#4d638c;">남색</option>
                      <option value="#495057" style="color:#495057;">검정색</option>
                  </select>
              </div>
          </div>
          <div class="row">
              <div class="col-xs-12">
                  <label class="col-xs-4" for="edit-desc">설명</label>
                  <textarea rows="4" cols="50" class="inputModal" name="content"
                      id="edit-desc"></textarea>
              </div>
          </div>
      </div>
      <div class="modal-footer modalBtnContainer-addEvent">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="submit" class="btn btn-primary" id="save-event">저장</button>
      </div>
                    <!-- <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div> 
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal --> 
        </div>
	</form>
	
	
	
	
	
	
	<!-- 일정 수정 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="updateModal">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                             aria-hidden="true">&times;</span></button>
                     <h4 class="modal-title"></h4>
                 </div>
                 <div class="modal-body">

                     <div class="row">
                         <div class="col-xs-12">
                             <label class="col-xs-4" for="edit-allDay">하루종일</label>
                             <input class='allDayNewEvent' id="edit-allDay" type="checkbox" checked
                             			  name="allDay">
                         </div>
                     </div>

		<c:if test="${ empty employee && !empty enterprise }">
					 <input type="hidden" id="SCeCode" name="SCeCode" value="${enterprise.eCode}"/>

					</c:if>
				<c:if test="${ empty enterprise && !empty employee }">
					<input type="hidden" id="SCeCode" name="SCeCode" value="${employee.eCode}"/>
					</c:if>



      <div class="row">
          <div class="col-xs-12">
              <label class="col-xs-4" for="edit-title">일정명</label>
              <input class="inputModal" type="text" name="title" id="title" value="${schedule.title }"
                  required="required" />
          </div>
      </div>
                       <!--  <div class="row">
                            <div class="col-xs-12 input-group date" id="datetimepicker1" data-target-input="nearest">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal datetimepicker-input" data-target="#datetimepicker1"
                                			 type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div> -->
                        
    <div class='col-md-10'>
        <div class="form-group">
           <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
           <label class="col-xs-4" for="edit-start">시작</label>
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker7"
                			name="startDate" id="startDate"/>
                <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div class='col-md-10' >
        <div class="form-group">
           <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
           <label class="col-xs-4" for="edit-end" style="float: auto;">끝</label>
                <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker8"
                			  name="endDate" id="endDate"/>
                <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
        </div>
    </div>
                     
         <div class="row">
             <div class="col-xs-12">
                 <label class="col-xs-4" for="edit-type">구분</label>
                 <select class="inputModal"  name="category" id="edit-type">
                     <option value="카테고리1">카테고리1</option>
                     <option value="카테고리2">카테고리2</option>
                     <option value="카테고리3">카테고리3</option>
                     <option value="카테고리4">카테고리4</option>
                 </select>
             </div>
         </div>
          <div class="row">
              <div class="col-xs-12">
                  <label class="col-xs-4" for="edit-color">색상</label>
                  <select class="inputModal" name="color" id="edit-color">
                      <option value="#D25565" style="color:#D25565;">빨간색</option>
                      <option value="#9775fa" style="color:#9775fa;">보라색</option>
                      <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                      <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                      <option value="#f06595" style="color:#f06595;">핑크색</option>
                      <option value="#63e6be" style="color:#63e6be;">연두색</option>
                      <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                      <option value="#4d638c" style="color:#4d638c;">남색</option>
                      <option value="#495057" style="color:#495057;">검정색</option>
                  </select>
              </div>
          </div>
          <div class="row">
              <div class="col-xs-12">
                  <label class="col-xs-4" for="edit-desc">설명</label>
                  <textarea rows="4" cols="50" class="inputModal" name="content"
                      id="edit-desc"></textarea>
              </div>
          </div>
      </div>
      <!-- <div class="modal-footer modalBtnContainer-addEvent">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="submit" class="btn btn-primary" id="save-event">저장</button>
      </div> -->
                     <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div> 
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal --> 
			</div>
			
			   
			        
		<c:import url="../common/footer.jsp"></c:import>
  </div>
  
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/js/tempusdominus-bootstrap-4.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker7').datetimepicker({
        	format: 'YYYY-MM-DDTHH:mm:ss'
        });
        $('#datetimepicker8').datetimepicker({
        	useCurrent: false,
            format: 'YYYY-MM-DDTHH:mm:ss'
            
        });
        $("#datetimepicker7").on("change.datetimepicker", function (e) {
            $('#datetimepicker8').datetimepicker('minDate', e.date);
        });
        $("#datetimepicker8").on("change.datetimepicker", function (e) {
            $('#datetimepicker7').datetimepicker('maxDate', e.date);
        });
    });
</script>
        
<script>

var startDate = $('#scheduleStartDate');
var endDate = $('#scheduleEndDate');
var title = $('#scheduleTitle');


document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
  	customButtons: { 

          myCustomButton: { 
              text: '일정추가', 
              click: function(event) { 			                	
              	// var popOption = "width=450, height=400, resizable=no, scrollbars=no, status=no";
              	/* window.location.href = 'scheduleInsert.do'; */
                 // window.open('scheduleInsert.do', 'test', popOption);
                // onSelectEvent(event);
              	$('#eventModal').modal('show');
              }
          }
  }, 
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth,myCustomButton'
    },
    navLinks: true, // can click day/week names to navigate views
    businessHours: true, // display business hours
    editable: true,
    selectable: true,
    events: [
    	<c:forEach items="${slist}" var="s" varStatus="status">
    	{
    	   	 title: '${s.title}',
    	     start: '${s.startDate}',
    	     end: '${s.endDate}',
    	     color: '${s.color}'
    	     
    	}
    	<c:if test="${status.index + 1 ne slist.size()}">,</c:if>
    	</c:forEach>
    	],     
     eventClick:function(event) {
    	 $('#updateModal').modal('show');
    }
  /*   $('#save-event').click(function(){
    
    	url : '/schedule/scheduleList.jsp',
    	cashe : false,
    	type : 'get',
    	success :  $('#calendar').fullCalendar({
    		
    		events: [{
    			title : title.val(),
    			start : startDate.val(),
    			end : endDate.val()
    		}]
    		
    	}) 
     
    
  }); */
});
  calendar.render();
}); 

	$('#save-event').click(function() {
		location.href = 'schedule/scheduleList.do'
	});



</script>		

</body>



	

</html>