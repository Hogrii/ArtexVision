<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
 
<!-- 캘린더 -->    
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7262ac3337a597a3bb0dd8dc4b881cd1"></script>

  <style>
    /* 전체 설정 css start */
    :root {
      --color1: #3d3d3d;
      --color2: white;
      --color3: #181818;
      --color4: #212121;
      --color5: #373749;
      --color6: #5f4b8b;
      --color7: #998ab4;
      --color8: #afa8ba;
      --color9: #4caf50;
      --color10: #c4302b;
      --color11: #9d2622;
    }

    html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,
    blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,
    em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,
    b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,
    table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,
    details,embed,figure,figcaption,footer,header,hgroup,menu,nav,
    output,ruby,section,summary,time,mark,audio,video {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    div {
      /* border: 1px solid black; */
    }
    /* 전체 설정 css end */

    /* container start */
    .container {
      width: 1200px;
      margin: auto;
    }
    /* container end */
    
    
    /* header start */
    .header {
      height: 40px;
      background-color: var(--color3); 
      color: var(--color2);
    }
    
    .header_list {
      display: flex;
      justify-content: flex-end;
      line-height: 40px;
    }
    
    .header_list li {
      list-style-type: none;
      padding-right: 20px;
      font-size: 0.9rem;
    }
    
    .header_list li a {
      text-decoration: none;
      color: var(--color2);
    }

    .search_wrap {
      padding: 5px;
      border-radius: 10px;
      background-color: var(--color4);
      color: var(--text-color);
    }

    .search_text {
      background-color: transparent;
      color: var(--text-color);
      border: 0;
      border-bottom: 1px solid var(--color2);
    }

    .search_text::placeholder {
      color: var(--text-color);
    }

    .search_text:focus {
      outline: none;
    }

    .user_detail {
      color: silver;
      padding-right: 10px;
    }

    #user_grade{
      background-color: var(--color2);
      border-radius: 5px;
      padding: 1px 3px 1px 3px;
    }

    /* header end */

    /* nav start */
    .nav {
      display: flex;
      height: 60px;
    }
    
    .nav_logo {
      text-align: center;
      line-height: 60px;
      width: 25%;
      height: 100%;
      font-size: 2rem;
    }
    
    .nav_side {
      align-items: right;
      width: 75%;
      height: 100%;
    }
    
    .nav_menu_list {
      display: flex;
      justify-content: space-around;
      line-height: 55px;
      padding-right: 20px;  
      
    }
    
    .nav_menu_list li {
      border: 0px;
      list-style-type: none;
      font-size: 1.2rem;
      font-weight: bold;
    }
    
    .nav_menu_list li:hover {
      border-bottom: solid var(--color11);
    }

    .nav_menu_list a {
      text-decoration: none;
      color: var(--color3);
    }

    .nav_menu_list a:hover {
      text-decoration: none;
      color: var(--color7);
    }
    /* nav end */
    
    
    .carousel_timeline {
      display: flex;
    }
    
    .main {
      height: 1200px;
    }

    .sidebar {
      width: 20%;
      height: 100%;
      background-color: var(--color3);
      float: left;
    }

    .list_title {
      color: var(--color2);
      padding-top: 20px;
      text-align: center;
    }

    .sidebar_item_list {
      padding-top: 20px;
      list-style-type: none;
      display: flex;
      flex-direction: column;
    }

    .sidebar_item {
      width: 100%;
      padding-top: 10px;
      padding-bottom: 10px;
      text-align: center;
    }

    .sidebar_item:hover {
      background-color: var(--color11);
    }

    .sidebar_item a {
      font-size: 1rem;
      text-decoration: none;
      color: var(--color2);
    }

    /* 전시 내용 */
    .contents {
      width: 80%;
      height: 100%;
      float: left; 
      padding-top: 100px;
    }

    .contents_wrap1{
      width: 50%;
      height: 60%;
      float: left;
    }

    .contents_wrap2{
      width: 50%;
      height: 60%;
      float: left;
    }

    .contents_wrap2>div{
      width: 100%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      font-size: large;
      margin-bottom: 10px;
    }

  .contents_wrap2>div>div{
      width: 50%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      float : left;
      padding: 2px ;
    }

    .contents_wrap2>div>div:nth-child(1){
      width: 50%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      float : left;
      text-align: right;
      padding-right: 50px;
      font-weight: 550;
    }

    .contents_sub1{
      width: 100%;
      height: 50%;
      text-align: center;
      padding-top: 40px;
      padding-left:50px;
    }

    .contents_sub2{
      width: 100%;
      height: 50%;
      padding-left: 70px;
    }

    #title{
      width: 100%;
      height: 15%;
      text-align: center;
      font-size: large;
      font-weight: bolder;
      padding-top: 5px;
      
    }

    #map{
      width: 100%;
      height:85%;
      text-align: center;

    }

    #buy_btn:hover{
      cursor: pointer;
    }

    .contents_wrap3{
      width: 100%;
      height: 40%;
      padding-left: 80px;
      padding-right: 80px;
      padding-top: 40px;
      float: left;
    }

    .menu_top{
      width: 100%;
      height: 13%;
    }

    .menu_top>div{
      float: left;
      font-size:larger;
      width: 20%;
      text-align: center;
      height: 50px;
      line-height: 50px;
    }

    .menu_top>div:hover{
      cursor: pointer;
      border-bottom: solid var(--color11);
    }

    .menu_content1{
      padding: 20px;
    }
    .menu_content2{
      padding: 20px;
      display : none;
    }
    .menu_content3{
      padding: 20px;
      display : none;
    }

    .footer {
      height: 150px;
      background-color: var(--color1);
    }

    .carousel img {
      width: 100%;
      height: 100%;
    }

    #buy_btn{
      border: 0;
      outline: 0;
      width: 200px; height: 40px; font-size: large; padding: 5px; background-color: black; color: white;
    }

    #buy_btn:hover{
      background-color: #9d2622;;
    }
    
        a{
         	text-align: center;
  			text-decoration: none; /* 링크의 밑줄 제거 */
 		 	color: inherit; /* 링크의 색상 제거 */
        }
            
        a:hover{
            color: black; /* 링크의 색상 제거 */
        }
  </style>
</head>

<body>
  <div class="container">
    <c:choose>
          <c:when test="${loginId!=null}">
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${loginGrade }</li></span>
                <li id="welcome"> ${loginId } 님 환영합니다.</li>
                <li id="mypage"><a href="/modifyForm.mem">마이페이지</a></li>
                <li id="basket"><a href="/basket/basket.jsp" id="basket">장바구니</a></li>
                <li id=logout><a href="/logout.mem"  id="logout">로그아웃</a></li>
              </ul>
            </div>
          </c:when>
          <c:otherwise>
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li id=login><a href="/home.mem">로그인</a></li>
                <li id=signup><a href="/signup.mem">회원가입</a></li>
              </ul>
            </div>
          </c:otherwise>
     </c:choose>
    <div class="nav">
      <div class="nav_logo">
        <a href="/artexMain/mainpage.jsp"><i class="fab fa-artstation"> Artex Vision</i></a>
      </div>
      <div class="nav_side">
        <div class="nav_menu">
          <ul class="nav_menu_list">
            <li><a href="/nb_list.board?cpage=1" id="notice">NOTICE</a></li>
            <li><a href="/artexDesc/artex_desc.jsp">Artex Vision</a></li>
            <li><a href="/exhibition/main_ex/now_main_ex.jsp">전시</a></li>
            <li><a href="#" id="event">이벤트</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="carousel_timeline">
      <div class="carousel">
        <img src="../img/artex_main_img.png" class="carousel_img">
      </div>
    </div>
    <div class="main">
      <div class="sidebar">
        <h2 class="list_title">전시</h2>
        <ul class="sidebar_item_list">
          <li class="sidebar_item"><a href="/exhibition/main_ex/now_main_ex.jsp">현재 전시</a></li>
          <li class="sidebar_item"><a href="/exhibition/main_ex/future_main_ex.jsp">예정된 전시</a></li>
          <li class="sidebar_item"><a href="/exhibition/main_ex/end_main_ex.jsp">마감된 전시</a></li>
        </ul>
      </div>

      <div class="contents">
        <div class="contents_wrap1">
          <div class="contents_sub1">
            <img src="../img/weiwei.png" width="200px" height="240px">
          </div>
          <div class="contents_sub2">
            <div id="title">오시는 길</div>
            <div id="map"></div>
          </div>
        </div>
        
        <form action="/priceToss.book" method="post" id="frmPrice">
        <div class="contents_wrap2">
          <div class="ex_title" style="margin-bottom: 20px; padding-left: 90px;">
            <input type=text name ="ex_title" style="font-weight: bolder; font-size: x-large; text-align:center; border:0px;" value="아이 웨이웨이">
          </div>
          <hr style="background-color: #9d2622; width: 400px; margin-top: 30px; margin-bottom: 30px; ">
          <div class="ex_name">
            <div>장소 </div>
            <div>국립 현대 미술관</div>
          </div>
          <div class="ex_date">
           	<div>전시 기간</div>
            <div>2021-12-11 ~ 2022-04-17</div>
          </div>
          <div class="ex_price">
            <div>가격</div>
            <div id="price">4000</div>
          </div>
          <div class="ex_person" >
            <div>인원</div>
            <div>
            <select name="person" style="width:120px; height:40px;" id="person">
              <option >인원 선택</option>
              <option value=1 >1</option>
              <option value=2 >2</option>
              <option value=3 >3</option>
              <option value=4 >4</option>
              <option value=5 >5</option>
              <option value=6 >6</option>
            </select></div>
          </div>
          <div class="ex_date">
	          <div>날짜 선택</div>
              <div><input type="text" id="choiceDate"></div>
          </div>
          <div class="ex_buy">
            <div>결제가격</div>
            <div><input type=text id="realprice" name="realprice" style="border:0px;"></div>
          </div>
          <div class="buy" style="height: 30%; text-align: center;  padding-top: 30px; padding-left: 30px;">
            <button id="buy_btn">예매하기</button>
          </div>
        </div>
        </form>
        
        <div class="contents_wrap3">
          <div class="menu_top">
            <div id="desc">상세정보</div>
            <div id="review">이용후기</div>
            <div id="expect">기대평</div>
          </div>
          <hr>
          <div class="menu_content1">
            &nbsp&nbsp《아이 웨이웨이: 인간미래》는 회화, 사진에서부터 영화, 설치, 건축, 공공미술, 전시기획, 출판 등 전 방위적으로 활동하는 아이 웨이웨이(1957–)의 예술세계를 소개한다. 
            1957년 중국 베이징에서 시인 아이 칭과 가오 잉의 아들로 태어났으며, 문화혁명기에 아버지가 반우파 운동으로 인해 
            ‘하방’(下放, 중국 문화혁명기에 도시 청년과 지식인들을 농촌으로 보내 농민과 지내게한 정치 운동) 되면서 중국 서부 신장 지역에서 성장했다. 
            아버지가 완전히 복권된 후 1975년 베이징으로 돌아왔고 1978년 베이징영화학원 애니메이션과에 입학해 1979년 현대미술 그룹 '성성화회'에서 활동했다. 
            1981년 뉴욕으로 건너가 마르셀 뒤샹, 앤디 워홀, 재스퍼 존스 등의 작품을 접하면서 현대미술에 대한 자신의 관점을 확립해 나갔다. 
            1993년 베이징으로 귀국 이후, 베이징 동쪽 지역 차오창디 예술촌 형성에 참여했고, 
            헤르조그 & 드 뫼롱의 2008년 베이징 올림픽 경기장인 ‘베이징 국가 체육장’ (종종 ‘새의 둥지’로도 불린다) 프로젝트에도 참여했다.
          </div>
          <div class="menu_content2">
            리뷰입니다.
          </div>
          <div class="menu_content3">
            기대평입니다.
          </div>
        </div>
      </div>
    </div>

    <div class="footer"> </div>
  </div>
  <!-- 예매하기 버튼 클릭 시  -->
  <script>
  $("#buy_btn").on("click",function(){
	  
      if(!($('#person > option:selected').val())) {
    	    alert("인원을 선택하세요.");
    	    return false;
    	}
      
      if(!$("#realprice").val()) {
    	    alert("인원을 선택하세요");
    	    return false;
    	}
      
      if(!$("#choiceDate").val()) {
  	    alert("날짜를 선택하세요");
  	    return false;
  		}
     
          
      let price = $("#realprice").val(); 
      
	  let result = confirm(price+"원 결제하시겠습니까?");
	  
	  if(result){
		  $("#frmPrice").submit();
	  }
  })
  </script>
  
    <!-- 인원수 선택시 -->
  <script>
  $("#person").change(function(){
	  /* location.href="/buy.exbuy"; */
 	  let price = parseInt($("#price").text()); 
	  let person = parseInt($("#person option:selected").val()); 
  	  let realpriceInt = price*person; 
	  let realprice = realpriceInt.toString();  
	  $("#realprice").val(realprice);
  });
  
  </script>
  
  <!-- 상세설명, 리뷰, q&a 클릭에 따른 div 보여주기 코드  -->
  <script type="text/javascript">
  /*  상세 정보 클릭 시  */
  $("#desc").on("click", function(){

		$(".menu_content2").css("display", "none");
		$(".menu_content3").css("display", "none");
		$(".menu_content1").css("display", "inline");
		
	})
	
	/*  리뷰 클릭 시  */
  $("#review").on("click", function(){

		$(".menu_content2").css("display", "inline");
		$(".menu_content3").css("display", "none");
		$(".menu_content1").css("display", "none");
		
	})
	
	/*  qna 클릭 시  */
  $("#expect").on("click", function(){

		$(".menu_content2").css("display", "none");
		$(".menu_content3").css("display", "inline");
		$(".menu_content1").css("display", "none");
		
	})
	
	$("#logout").on("click",function(){
		if(!confirm("로그아웃 하시겠습니까?")){
			return false;
		}
	})
	
	$("#basket").on("click",function(){
		alert("현재 기능은 구현중에 있습니다.");
		return false;
	})
	
	$("#event").on("click",function(){
		alert("현재 기능은 구현중에 있습니다.");
		return false;
	})
  </script>
  
  
  <!--  날짜 api  -->
  <script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#choiceDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 /*onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    */
            });
             
    });
	</script>


	<!--  지도 api -->
	<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.568887812260314, 126.97452758697138), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.568887812260314, 126.97452758697138); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
    	position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	</script>
</body>

</html>