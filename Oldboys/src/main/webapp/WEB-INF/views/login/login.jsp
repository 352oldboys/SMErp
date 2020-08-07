<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">
<head>

<title>SMERP_login_page</title>

<link
   href="${pageContext.request.contextPath}/resources/css/member/color.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/member/animate.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/member/bootsnav.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/member/overwrite.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/member/owl.carousel.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/member/owl.theme.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/member/owl.transitions.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/member/magnific-popup.css"
   rel="stylesheet">

<!--// ICONS //-->

<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
   rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">

<!--// BOOTSTRAP & Main //-->

<link
   href="${pageContext.request.contextPath}/resources/css/member/bootstrap.min.css"
   rel="stylesheet">

<link
   href="${pageContext.request.contextPath}/resources/css/member/main.css"
   rel="stylesheet">


</head>


<section id="home"
   style="background : url(${pageContext.request.contextPath}/resources/img/member/banner.jpg)">

   <div class="container">

      <div class="row">

         <!-- Introduction -->

         <div class="col-md-6 caption">

            <h1>Welcome To SMERP</h1>
            <br />
            <h2>

               ERP <span class="animated-text">최적화 모든 곳</span> <span
                  class="typed-cursor"></span>

            </h2>

            <p>소상공인들의 주머니를 아껴주며 소상공인들에게 최적화된 ERP시스템</p>

            <input type="button" class="btn btn-transparent" id="story"
               value="SMERP시스템 자세히 보러가기"> <br />
            <br />
            <p id="showText" style="display: none;">SMERP시스템 자세한 내용은 현재페이지 아래에
               기제되었습니다.</p>

         </div>

         <!-- Sign Up -->

         <div class="col-md-5 col-md-offset-1 signup-form">

               <br />
               <h2 class="text-center">Login here</h2>
               <br />
               <hr>

            <form class="select">
               <div class="form-group">

                  <input type="text" class="form-control" name="userId"
                     placeholder="당신의 아이디를 입력해주세요!" required="required">

               </div>

               <div class="form-group">

                  <input type="password" class="form-control" name="password"
                     placeholder="당신의 비밀번호를 입력해주세요!" required="required">

               </div>
               <hr />
               <div class="form-group text-center">
               
                  <button type="button" class="btn btn-blue btn-block"
                     onclick="movemember();">로그인</button>
               </div>
            </form>
            <div class="form-group text-center">
               <!-- onclick="location.href='insertmember.do'" -->
               <button type="button" class="btn btn-blue btn-block"
                  onclick="location.href='${pageContext.request.contextPath}/member/login.do'">회원가입</button>
               <br /> <span>비밀번호를 잊어버리셨나요?</span>&nbsp;&nbsp;&nbsp;<a
                  onclick="popup_open();">여기를 클릭해주세요.</a>
            </div>
         </div>
      </div>
   </div>

</section>


<div class="row" class="showStory" id="mainStory" style="display: none;">

   <section id="about" class="section-padding">

      <div class="container">

         <h2>ERP의 최적화된 시스템</h2>

         <p>이제는 비싼 돈내고 쓰지말고 필요한 시스템만을 모으고 모았다.</p>

         <div class="row">

            <div class="col-md-4">

               <div class="icon-box">
                  <!-- 필요한 내용 기입하시면 됩니다.-->
                  <i class="material-icons">favorite</i>

                  <h4>재무 관리</h4>

                  <p>
                     내가 어떻게 돈을 쓰고 있는지 손쉽게 <br /> 확인하고 보다 명확하게 관리하자
                  </p>

               </div>

            </div>

            <div class="col-md-4">

               <div class="icon-box">
                  <!-- 필요한 내용 기입하시면 됩니다.-->
                  <i class="material-icons">flash_on</i>

                  <h4>상품 관리</h4>

                  <p>
                     이제 펜으로 적는 시대는 그만!<br /> 웹으로 관리하여 보다 빠르고 싶게 관리하자
                  </p>

               </div>

            </div>

            <div class="col-md-4">

               <div class="icon-box">
                  <!-- 필요한 내용 기입하시면 됩니다.-->
                  <i class="material-icons">settings</i>

                  <h4>인사 관리</h4>

                  <p>
                     우리 알바생들의 관리가 필요하다! <br /> 총 출근시간을 보다 손쉽게 관리하자
                  </p>

               </div>

            </div>

         </div>

      </div>

   </section>

   <section id="story">

      <div class="container-fluid">

         <div class="row">

            <!-- Img -->

            <div class="col-md-6 story-bg"
               style="background : url(${pageContext.request.contextPath}/resources/img/member/success.jpg)"></div>

            <!-- Story Caption -->

            <div class="col-md-6">

               <div class="story-content">

                  <h2>소상공들을 위한 ERP 시스템</h2>

                  <p class="story-quote">" 소상공인들에게 필요한 기능들만 담았다 "</p>

                  <div class="story-text">

                     <p>
                        평소 비싸기만하고 필요하지 않는 기능들을 끼어파는 프로그램은 이제 그만! <br> 소상공인들에게 가장
                        필요한 기능들만 쏙쏙 담아서 웹으로 보다 쉽고 <br> 간편하게 관리하면서 보다 효율적인 가게 운영을
                        만들고자 우리가 등장했다. <br> <br> SMERP는 보다 편리한 기능과 소상공을 위한
                        마음으로 탄생하였습니다.
                     </p>

                  </div>
                  <br /> <a href="#" class="btn btn-white">맨위로 올라가기</a>

               </div>

            </div>

         </div>
      </div>

   </section>


   <section id="services" class="section-padding">

      <div class="container">

         <h2>근무의 환경을 바꾸다</h2>

         <p>어디에 자료를 두었는지 고민하지말자 인터넷이 되는 곳이라면 어디든지 확인 가능한 ERP 시스템</p>

         <div class="row">

            <div class="col-md-3">

               <div class="icon-box">

                  <i class="material-icons">alarm</i>

                  <h4>업무적 시간단축</h4>

                  <p>
                     모든 기능이 한번에 모여 있어 <br> 업무적를 보다 효율적 시간단축
                  </p>

               </div>

            </div>

            <div class="col-md-3">

               <div class="icon-box">

                  <i class="material-icons">shopping_basket</i>

                  <h4>상품관리 총집합</h4>

                  <p>
                     재료에 필요한 재료들 과연 효율적인<br> 구매를 도와주는 재고관리 시스템
                  </p>

               </div>

            </div>

            <div class="col-md-3">

               <div class="icon-box">

                  <i class="material-icons">monetization_on</i>

                  <h4>재무 통합 시스템</h4>

                  <p>
                     매입 매출 통합시스템으로<br> 지출의 폭을 축소시켜주는 시스템
                  </p>

               </div>

            </div>

            <div class="col-md-3">

               <div class="icon-box">

                  <i class="material-icons">connect_without_contact</i>

                  <h4>거래처 관리</h4>

                  <p>
                     거래처의 번호를 한곳에 모아<br> 단번에 찾아 낼수 있는 시스템
                  </p>

               </div>

            </div>

         </div>

      </div>

   </section>

   <section id="features">

      <div class="container">

         <div class="row">

            <div class="col-md-6">

               <h2>SMERP SYSTEM을 만든 배경</h2>

               <p>
                  소상공인이라는 주제를 가지고 어떠한 것이 편하게 사용할 수 있을 것인가 <br> 곰곰히 생각하게 되었습니다.
               </p>

               <hr>

               <div class="feat-media">

                  <!-- Feature -->

                  <div class="media">

                     <div class="media-left">

                        <a href="#"> <i class="material-icons">monetization_on</i>

                        </a>

                     </div>

                     <div class="media-body">

                        <h4 class="media-heading">웹 개발 환경</h4>

                        <p>
                           java, VisualSTudioCode, Spring, SQLDeveloper, GitHub, <br>
                           HTML5, CSS , JavaScript, jQuery, Apache tomcat, myBatis
                        </p>

                     </div>

                  </div>

                  <!-- Feature -->

                  <div class="media">

                     <div class="media-left">

                        <a href="#"> <i class="material-icons">access_time</i>

                        </a>

                     </div>

                     <div class="media-body">

                        <h4 class="media-heading">웹 개발 기간</h4>

                        <p>6월 29일 ~ 8월 10일</p>

                     </div>

                  </div>

                  <!-- Feature -->

                  <div class="media">

                     <div class="media-left">

                        <a href="#"> <i class="material-icons">computer</i>

                        </a>

                     </div>

                     <div class="media-body">

                        <h4 class="media-heading">SMERP 구성원</h4>

                        <p>윤태양, 강신형, 김승규, 이재혁, 정진홍</p>

                     </div>

                  </div>

               </div>

            </div>

            <!-- Features Img -->

            <div class="col-md-6 col-md-push-2">

               <img
                  src="${pageContext.request.contextPath}/resources/img/member/dashboard.png"
                  class="img-responsive" alt="feature">

            </div>

         </div>

      </div>

   </section>

   <section id="team" class="section-padding">

      <div class="container">

         <h2>SMERP SYSTEM 개발자</h2>

         <p>저희는 보다 획기적이면서 편리한 기능들을 구현하기 위해서 노력하는 개발자입니다.</p>

         <div class="row">
            <div class="col-md-6 col-lg-3" style="width: 20%;">

               <!--**Team-Member**-->

               <div class="thumbnail team-member">

                  <img
                     src="${pageContext.request.contextPath}/resources/img/member/team-2.jpg"
                     class="img-responsive img-circle" style="width: 50%;"
                     alt="team-1">

                  <div class="caption">

                     <h4>윤태양</h4>

                     <h6>조장</h6>

                     <p>총괄</p>

                     <hr>

                     <div class="team-social">

                        <ul class="liste-unstyled">

                           <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                           <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                        </ul>

                     </div>

                  </div>

               </div>

            </div>

            <div class="col-md-6 col-lg-3" style="width: 20%;">

               <!--**Team-Member**-->

               <div class="thumbnail team-member">

                  <img
                     src="${pageContext.request.contextPath}/resources/img/member/team-3.jpg"
                     class="img-responsive img-circle" style="width: 50%;"
                     alt="team-2">

                  <div class="caption">

                     <h4>강신형</h4>

                     <h6>행동대장</h6>

                     <p>거래처관리</p>

                     <hr>

                     <div class="team-social">

                        <ul class="liste-unstyled">

                           <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                           <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                        </ul>

                     </div>

                  </div>

               </div>

            </div>

            <div class="col-md-6 col-lg-3" style="width: 20%;">

               <!--**Team-Member**-->

               <div class="thumbnail team-member">

                  <img
                     src="${pageContext.request.contextPath}/resources/img/member/team-4.jpg"
                     class="img-responsive img-circle" style="width: 50%;"
                     alt="team-3">

                  <div class="caption">

                     <h4>김승규</h4>

                     <h6>패션사장님</h6>

                     <p>인사관리</p>

                     <hr>

                     <div class="team-social">

                        <ul class="liste-unstyled">

                           <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                           <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                        </ul>

                     </div>

                  </div>


               </div>

            </div>

            <div class="col-md-6 col-lg-3" style="width: 20%;">

               <!--**Team-Member**-->

               <div class="thumbnail team-member">

                  <img
                     src="${pageContext.request.contextPath}/resources/img/member/team-4.jpg"
                     class="img-responsive img-circle" style="width: 50%;"
                     alt="team-4">

                  <div class="caption">

                     <h4>이재혁</h4>

                     <h6>리재혁동무</h6>

                     <p>게시판</p>

                     <hr>

                     <div class="team-social">

                        <ul class="liste-unstyled">

                           <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                           <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                        </ul>

                     </div>

                  </div>


               </div>

            </div>

            <div class="col-md-6 col-lg-3" style="width: 20%;">

               <!--**Team-Member**-->

               <div class="thumbnail team-member">

                  <img
                     src="${pageContext.request.contextPath}/resources/img/member/team-1.jpg"
                     class="img-responsive img-circle" style="width: 50%;"
                     alt="team-5">

                  <div class="caption">

                     <h4>정진홍</h4>

                     <h6>막내</h6>

                     <p>재무관리 로그인</p>

                     <hr>

                     <div class="team-social">

                        <ul class="liste-unstyled">

                           <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                           <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                        </ul>

                     </div>

                  </div>

               </div>

            </div>

         </div>

      </div>
   </section>


   <section id="contact" class="section-padding">

      <div class="container">

         <h2>KH 정보 교육원(강남)</h2>

         <p>마지막 수료(파이널)프로젝트</p>

         <p>
            다들 6개월동안 고생많이하셨습니다. 다들 좋은 개발자가 되어 꽃길만 걸으시길...! <br> 6개월 동안 좋은
            수업을 가르쳐주신 유정훈 강사님 감사합니다.
         </p>

      </div>

      <!-- Contact Info -->

      <div class="container contact-info">

         <div class="row">

            <div class="col-md-4">

               <div class="icon-box">

                  <i class="material-icons">place</i>

                  <h4>Address</h4>

                  <p>
                     대한민국, 서울특별시 <br> 강남구 강남구 테헤란로14길 6
                  </p>

               </div>

            </div>

            <div class="col-md-4">

               <div class="icon-box">

                  <i class="material-icons">phone</i>

                  <h4>Call Us On</h4>

                  <p>02-1544-9970</p>

               </div>

            </div>

            <div class="col-md-4">

               <div class="icon-box">

                  <i class="material-icons">email</i>

                  <h4>Email us on</h4>

                  <p>lorem@xyz.com</p>

                  <p>lorem@xyz.com</p>

               </div>

            </div>

         </div>

      </div>

      <!-- Google Map -->

      <div id="map"></div>

</section>

      <section id="clients" class="section-padding">

         <div class="container">

            <div class="row">

               <h2>프로젝트를 마치며</h2>

               <p>짧으면 짧고 길면은 길다는 6개월 동안 우리는 무엇을 위해 달려왔는가?</p>

               <!--// Clients Images //-->

               <div class="clients-images">

                  <div id="owl-clients">

                     <div class="item">
                        <img
                           src="${pageContext.request.contextPath}/resources/img/member/c_logo01.png"
                           class="center-block" alt="client">
                     </div>

                     <div class="item">
                        <img
                           src="${pageContext.request.contextPath}/resources/img/member/c_logo02.png"
                           class="center-block" alt="client">
                     </div>

                     <div class="item">
                        <img
                           src="${pageContext.request.contextPath}/resources/img/member/c_logo03.png"
                           class="center-block" alt="client">
                     </div>

                     <div class="item">
                        <img
                           src="${pageContext.request.contextPath}/resources/img/member/c_logo04.png"
                           class="center-block" alt="client">
                     </div>

                     <div class="item">
                        <img
                           src="${pageContext.request.contextPath}/resources/img/member/c_logo05.png"
                           class="center-block" alt="client">
                     </div>

                     <div class="item">
                        <img
                           src="${pageContext.request.contextPath}/resources/img/member/c_logo06.png"
                           class="center-block" alt="client">
                     </div>

                  </div>

               </div>

               <!--// Clients Testimonials //-->

               <div id="owl-testimonials">

                  <div class="item">

                     <i class="material-icons">mood</i>

                     <p class="quote">Vivamus quam neque, aliquet ac faucibus ut,
                        vestibulum. Nulla quis laoreet diam. Donec sed egestas ex, nec
                        facilisis ante. Vivamus imperdiet odio. Cras luctus interdum
                        sodales. Quisque quis odio dui.</p>

                     <h4>- 윤 태 양 -</h4>

                  </div>

                  <div class="item">

                     <i class="material-icons">mood</i>

                     <p class="quote">Vivamus quam neque, aliquet ac faucibus ut,
                        vestibulum. Nulla quis laoreet diam. Donec sed egestas ex, nec
                        facilisis ante. Vivamus imperdiet odio. Cras luctus interdum
                        sodales. Quisque quis odio dui.</p>

                     <h4>- 강 신 형 -</h4>

                  </div>

                  <div class="item">

                     <i class="material-icons">mood</i>

                     <p class="quote">Vivamus quam neque, aliquet ac faucibus ut,
                        vestibulum. Nulla quis laoreet diam. Donec sed egestas ex, nec
                        facilisis ante. Vivamus imperdiet odio. Cras luctus interdum
                        sodales. Quisque quis odio dui.</p>

                     <h4>- 김 승 규 -</h4>

                  </div>


                  <div class="item">

                     <i class="material-icons">mood</i>

                     <p class="quote">Vivamus quam neque, aliquet ac faucibus ut,
                        vestibulum. Nulla quis laoreet diam. Donec sed egestas ex, nec
                        facilisis ante. Vivamus imperdiet odio. Cras luctus interdum
                        sodales. Quisque quis odio dui.</p>

                     <h4>- 이 재 혁 -</h4>

                  </div>


                  <div class="item">

                     <i class="material-icons">mood</i>

                     <p class="quote">Vivamus quam neque, aliquet ac faucibus ut,
                        vestibulum. Nulla quis laoreet diam. Donec sed egestas ex, nec
                        facilisis ante. Vivamus imperdiet odio. Cras luctus interdum
                        sodales. Quisque quis odio dui.</p>

                     <h4>- 정 진 홍 -</h4>

                  </div>

               </div>

            </div>

         </div>

      </section>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->

<script
   src="${pageContext.request.contextPath}/resources/js/member/bootstrap.min.js"></script>

<script
   src="${pageContext.request.contextPath}/resources/js/member/owl.carousel.min.js"></script>

<script
   src="${pageContext.request.contextPath}/resources/js/member/bootsnav.js"></script>

<script
   src="${pageContext.request.contextPath}/resources/js/member/typed.min.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
   src="${pageContext.request.contextPath}/resources/js/member/jquery.magnific-popup.js"></script>

<script
   src="${pageContext.request.contextPath}/resources/js/member/particles.min.js"></script>

<script
   src="${pageContext.request.contextPath}/resources/js/member/main.js"></script>

<script
   src="${pageContext.request.contextPath}/resources/js/member/main.js"></script>

<script>
      $(function() {
         $("#story").on("click", function() {
            $("#showText").show();
            $("#mainStory").show("slowly");
         });
       });

     function movemember(){
      $(".select").attr("action","member/checkMember.do");
      $(".select").attr("method","post");
      $(".select").submit();
   }
     
      function popup_open(){
        var popup = window.open("${pageContext.request.contextPath}/member/find.do", "SMERP", "top=10, left=10, width=600, height=300, status=no, number=no, toobar=no, resizable=no");
        
      };
      
</script>

</body>



</html>