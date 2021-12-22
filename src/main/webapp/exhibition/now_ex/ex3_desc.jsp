<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>전시회 상세페이지</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
      <!-- 캘린더 -->
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
      <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

      <!-- 지도 -->
      <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7262ac3337a597a3bb0dd8dc4b881cd1"></script>

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


        a:hover {
          color: black;
          /* 링크의 색상 제거 */
        }
      </style>

      <!-- 리뷰 css  -->
      <style>
        /* 레이아웃 외곽 너비 400px 제한*/
        .wrap {
          max-width: 100%;
          margin: 0 auto;
          /* 화면 가운데로 */
          background-color: #fff;
          height: 30%;
          /*  padding: 20px; */
          box-sizing: border-box;

        }

        .reviewform textarea {
          width: 100%;
          padding: 10px;
          box-sizing: border-box;
        }

        .rating .rate_radio {
          position: relative;
          display: inline-block;
          z-index: 20;
          opacity: 0.001;
          width: 30px;
          height: 30px;
          background-color: #fff;
          cursor: pointer;
          vertical-align: top;
          display: none;
        }

        .rating .rate_radio+label {
          position: relative;
          display: inline-block;
          margin-left: -4px;
          z-index: 10;
          width: 30px;
          height: 30px;
          background-image: url('../img/starrate.png');
          background-repeat: no-repeat;
          background-size: 30px 30px;
          cursor: pointer;
          background-color: #f0f0f0;
        }

        .rating .rate_radio:checked+label {
          background-color: rgb(255, 60, 0);
        }

        .warning_msg {
          display: none;
          position: relative;
          text-align: left;
          background: #ffffff;
          line-height: 20px;
          width: 100%;
          color: red;
          padding: 5px;
          box-sizing: border-box;
          /* border: 1px solid #e0e0e0; */
        }

        .cmd {
          text-align: right;
          padding: 5px;
        }

        html,
        body,
        div,
        span,
        applet,
        object,
        iframe,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        blockquote,
        pre,
        a,
        abbr,
        acronym,
        address,
        big,
        cite,
        code,
        del,
        dfn,
        em,
        img,
        ins,
        kbd,
        q,
        s,
        samp,
        small,
        strike,
        strong,
        sub,
        sup,
        tt,
        var,
        b,
        u,
        i,
        center,
        dl,
        dt,
        dd,
        ol,
        ul,
        li,
        fieldset,
        form,
        label,
        legend,
        table,
        caption,
        tbody,
        tfoot,
        thead,
        tr,
        th,
        td,
        article,
        aside,
        canvas,
        details,
        embed,
        figure,
        figcaption,
        footer,
        header,
        hgroup,
        menu,
        nav,
        output,
        ruby,
        section,
        summary,
        time,
        mark,
        audio,
        video {
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

        #user_grade {
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

        .contents_wrap1 {
          width: 50%;
          height: 60%;
          float: left;
        }

        .contents_wrap2 {
          width: 50%;
          height: 60%;
          float: left;
        }

        .contents_wrap2>div {
          width: 100%;
          height: 40px;
          line-height: 40px;
          /* text-align: center; */
          font-size: large;
          margin-bottom: 10px;
        }

        .contents_wrap2>div>div {
          width: 50%;
          height: 40px;
          line-height: 40px;
          /* text-align: center; */
          float: left;
          padding: 2px;
        }

        .contents_wrap2>div>div:nth-child(1) {
          width: 50%;
          height: 40px;
          line-height: 40px;
          /* text-align: center; */
          float: left;
          text-align: right;
          padding-right: 50px;
          font-weight: 550;
        }

        .contents_sub1 {
          width: 100%;
          height: 50%;
          text-align: center;
          padding-top: 40px;
          padding-left: 50px;
        }

        .contents_sub2 {
          width: 100%;
          height: 50%;
          padding-left: 70px;
        }

        #title {
          width: 100%;
          height: 15%;
          text-align: center;
          font-size: large;
          font-weight: bolder;
          padding-top: 5px;

        }

        #map {
          width: 100%;
          height: 85%;
          text-align: center;

        }

        #buy_btn:hover {
          cursor: pointer;
        }

        .contents_wrap3 {
          width: 100%;
          height: 40%;
          padding-left: 80px;
          padding-right: 80px;
          padding-top: 40px;
          float: left;
        }

        .menu_top {
          width: 100%;
          height: 13%;
        }

        .menu_top>div {
          float: left;
          font-size: larger;
          width: 20%;
          text-align: center;
          height: 50px;
          line-height: 50px;
        }

        .menu_top>div:hover {
          cursor: pointer;
          border-bottom: solid var(--color11);
        }

        .menu_content1 {
          padding: 20px;
        }

        .menu_content2 {
          padding: 20px;
          display: none;
        }

        .menu_content3 {
          padding: 20px;
          display: none;
        }

        .footer {
          height: 300px;
          background-color: var(--color1);
        }

        .carousel img {
          width: 100%;
          height: 100%;
        }

        #buy_btn {
          border: 0;
          outline: 0;
          width: 200px;
          height: 40px;
          font-size: large;
          padding: 5px;
          background-color: black;
          color: white;
        }

        #buy_btn:hover {
          background-color: #9d2622;
          ;
        }

        a {
          text-align: center;
          text-decoration: none;
          /* 링크의 밑줄 제거 */
          color: inherit;
          /* 링크의 색상 제거 */
        }

        a:hover {
          color: black;
          /* 링크의 색상 제거 */
        }
      </style>
      <style>
        .fContainer {
          width: 100%;
          height: 100%;
        }

        .fContainer>div {
          float: left;
        }

        .fLogoContainer {
          height: 100%;
          width: 30%;

        }

        .fLogoContainer>div {
          height: 50%;
          width: 100%;
        }

        .fLogo {

          padding-top: 30px;
          padding-left: 30px;

        }

        .fSiteLogo {
          padding-top: 80px;
          padding-left: 120px;
        }

        #fLogoImg {
          font-size: 40px;
          color: #ffffff70;
        }

        .fContents {
          height: 100%;
          width: 70%;
          padding: 10px;
          font-weight: bold;
          color: #ffffff70;
        }

        #insta,
        #youtube,
        #facebook,
        #twitter {
          font-size: 2rem;
          color: white;
          padding-left: 10px;
        }

        .fLine1 {
          width: 100%;
          height: 20%;
          font-size: 15px;
          padding-top: 5px;
          padding-bottom: 5px;
        }

        .fLine3 {
          width: 100%;
          height: 11%;
          font-size: 15px;
        }

        .fLine2 {
          height: 20%;
          width: 100%;
          font-size: 15px;
          padding-top: 5px;
        }

        .fLine1>div {
          float: left;
          height: 100%;
          text-align: left;
          line-height: 46px;
        }

        .fLine2>div,
        .fLine3>div {
          float: left;
          height: 100%;
        }

        .exh {
          width: 35%;
        }

        .exh2 {
          width: 60%;
        }

        .ceo {
          border-right: 1px solid #ffffff70;
          width: 15%;
        }

        .ceoNum {
          line-height: 46px;
          width: 23%;
          padding-left: 15px;
          border-right: 1px solid #ffffff70;

        }

        .companyNum {
          line-height: 46px;
          width: 42%;
          padding-left: 15px;
        }
      </style>
    </head>

    <body>
      <div class="container">
        <c:choose>
          <c:when test="${loginId!=null}">
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${dto.mem_grade}</li></span>
                <li id="welcome"> ${loginId } 님 환영합니다.</li>
                <li id="mypage"><a href="/modifyForm.mem">마이페이지</a></li>
                <li id="basket"><a href="/basket/basket.jsp" id="basket">장바구니</a></li>
                <li id=logout><a href="/logout.mem" id="logout">로그아웃</a></li>
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
                <li><a href="/event/now_event/now_event.jsp" id="event">이벤트</a></li>
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
                <img src="../img/chagall.png" width="200px" height="240px">
              </div>
              <div class="contents_sub2">
                <div id="title">오시는 길</div>
                <div id="map"></div>
              </div>
            </div>

            <form action="/priceToss.book" method="post" id="frmPrice">
              <div class="contents_wrap2">
                <div class="ex_title" style="margin-bottom: 20px; padding-left: 90px;">
                  <input type=text name="ex_title"
                    style="font-weight: bolder; font-size: x-large; text-align:center; border:0px;" value="샤갈 특별전">
                </div>
                <hr style="background-color: #9d2622; width: 400px; margin-top: 30px; margin-bottom: 30px; ">
                <div class="ex_name">
                  <div>장소</div>
                  <div>마이 아트 뮤지엄 </div>
                </div>
                <div class="ex_date">
                  <div>전시 기간</div>
                  <div>2021-11-25 ~ 2022-04-10</div>
                </div>
                <div class="ex_price">
                  <div>가격</div>
                  <div id="price">20000</div>
                </div>
                <div class="ex_person">
                  <div>인원</div>
                  <div>
                    <select name="person" style="width:120px; height:40px;" id="person">
                      <option>인원 선택</option>
                      <option value=1>1</option>
                      <option value=2>2</option>
                      <option value=3>3</option>
                      <option value=4>4</option>
                      <option value=5>5</option>
                      <option value=6>6</option>
                    </select>
                  </div>
                </div>
                <div class="ex_date">
                  <div>날짜 선택</div>
                  <input type="text" id="choiceDate" autocomplete="off" name="bookDate">
                </div>
                <div class="ex_buy">
                  <div>결제가격</div>
                  <div><input type=text id="realprice" name="realprice" style="border:0px;"></div>
                </div>
                <div class="buy" style="height: 30%; text-align: center;  padding-top: 30px; padding-left: 30px;">
                  <button id="buy_btn" type="button">예매하기</button>
                </div>
              </div>
            </form>

            <div class="contents_wrap3">
              <div class="menu_top">
                <div id="desc">상세정보</div>
                <div id="review">리뷰 남기기</div>
                <div id="expect">부가 정보</div>
              </div>
              <hr>
              <div class="menu_content1">
                &nbsp&nbsp마이아트뮤지엄은 독창적인 소재와 화풍으로 미술사에 족적을 남긴 화가 샤갈의 회고전이자, 샤갈에게 가장 중요한 예술 창조의 원천이었던 ‘성서’를 주제로
                〈샤갈 특별전, Chagall and the Bible〉을 2021년 11월 25일부터 22년 4월 10일까지 개최한다. 마르크 샤갈은 러시아 태생이자 프랑스에 정착한 화가로,
                다채로운 색감과 몽환적인 화풍을 바탕으로 삶과 사랑에 대한 메시지를 전파해 피카소, 마티스 등과 함께 20세기 가장 위대한 화가 중 한 명으로 많은 사랑을 받고 있다.
                이번 전시는 기존 국내에서 여러 차례 진행된 샤갈 전과 달리 그간 단독으로 다뤄지지 않았던 ‘성서’라는 주제와 함께 샤갈의 유족이 소장하고 있는 <강기슭에서의 부활>, 〈
                  푸른 다윗 왕〉등 유화, 과슈를 포함한 19점의 명작과 4m에 육박하는 대형 태피스트리 2점 및 독일 Kunstmuseum Pablo Picasso Münster 소장품 등 총
                  220여점의 오리지널 작품이 공개된다.
                  그는 성서를 주제로 한 작품을 그리는 시간 동안 전쟁과 학살로부터 고통 받는 인류에 대한 사랑을 바탕으로 그의 예술세계를 펼쳤다.
                  이런 그가 성서를 통해 전달하는 인류에 대한 사랑의 메시지를 온전히 감상하는 시간이 될 것이다.
              </div>
              <div class="menu_content2">
                <div class="wrap">
                  <form name="reviewform" class="reviewform" method="post" action="/writeRv.rvboard" id="frmRv">
                    <input type="hidden" name="rate" id="rate" value="0" />
                    <!-- <p class="title_star">별점과 리뷰를 남겨주세요.</p> -->

                    <div class="review_rating">
                      <div class="warning_msg">별점을 선택해 주세요.</div>
                      <div class="rating">
                        <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                        <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                        <label for="rating1"></label>
                        <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                        <label for="rating2"></label>
                        <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점">
                        <label for="rating3"></label>
                        <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                        <label for="rating4"></label>
                        <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                        <label for="rating5"></label>
                      </div>
                    </div>
                    <div class="review_contents">
                      <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
                      <textarea rows="10" class="review_textarea" name="re_contents"></textarea>
                    </div>
                    <div class="cmd">
                      <button name="save" id="save" type="button">등록</button>
                      <!-- <input type="button" name="save" id="save" value="등록"> -->
                    </div>
                  </form>
                </div>
              </div>
              <div class="menu_content3">
                <p>
                <h3>기획사 정보</h3>
                주최: 마이아트뮤지엄<br>
                주관: 마이아트뮤지엄<br>
                문의: 02-567-8878</p>
                <br>
                <p>
                <h3>공연시간 정보</h3>
                전시기간: 2021년 11월 25일 - 2022년 4월 10일 (2월 1일 설날 당일만 휴관 | 공휴일 정상개관)<br>
                관람시간: 월-일 10:00 - 20:00 (입장마감 19:00)<br>
                정규도슨트: 평일 월-금 11시, 14시, 16시 (3회)<br></p>
              </div>
            </div>
          </div>
        </div>
        <div class="footer">
          <div class="fContainer">
            <div class="fLogoContainer">
              <div class="fLogo">
                <i class="fab fa-artstation" id="fLogoImg"> Artex Vision</i>

              </div>
              <div class="fSiteLogo">
                <a href="https://www.instagram.com/?hl=ko"><i class="fab fa-instagram" id="insta"></i></a>
                <a href="https://www.youtube.com/"><i class="fab fa-youtube" id="youtube"></i></a>
                <a href="https://www.facebook.com/"><i class="fab fa-facebook" id="facebook"></i></a>
                <a href="https://twitter.com/"><i class="fab fa-twitter" id="twitter"></i></a>
              </div>
            </div>
            <div class="fContents">
              <div class="fLine1">
                <div class="ceo">대표자 이진호</div>
                <div class="ceoNum">전화번호 010-****-****</div>
                <div class="companyNum">사업자등록번호 13-72005511</div>
              </div>
              <div class="fLine2">
                <div class="exh">국립현대미술관 대표전화</div>
                <div class="exhNum">(서울) 02-3701-9500, (과천) 02-2188-6000,<br>(덕수궁) 02-2022-0600, (청주) 043-261-1400</div>
              </div>
              <div class="fLine3">
                <div class="exh">세종문화회관 대표전화</div>
                <div class="exhNum">02-399-1114</div>
              </div>
              <div class="fLine3">
                <div class="exh">국립중앙박물관 대표전화</div>
                <div class="exhNum">02-2077-9000</div>
              </div>
              <div class="fLine3">
                <div class="exh">마이 아트 뮤지엄 대표전화</div>
                <div class="exhNum">02-567-8878</div>
              </div>
              <div class="fLine3">
                <div class="exh">그라운드시소 서촌 대표전화</div>
                <div class="exhNum">02-501-9544</div>
              </div>
              <div class="fLine3">
                <div class="exh">석파정 서울미술관 대표전화</div>
                <div class="exhNum">02-395-0010</div>
              </div>
            </div>

          </div>
        </div>
      </div>

      </div>
      <!-- 예매하기 버튼 클릭 시  -->
      <script>
        $("#buy_btn").on("click", function () {

          if (!($('#person > option:selected').val())) {
            alert("인원을 선택하세요.");
            return false;
          }

          if (!$("#realprice").val()) {
            alert("인원을 선택하세요");
            return false;
          }

          if (!$("#choiceDate").val()) {
            alert("날짜를 선택하세요");
            return false;
          }

          /* 로그아웃 상태 일 때 */
          let uid = '<%=(String)session.getAttribute("loginId")%>';

          if (uid == "null") {
            alert("로그인 후 이용가능합니다.");
            location.replace("/login.jsp");
            return false;
          }

          let price = $("#realprice").val();

          let result = confirm(price + "원 결제하시겠습니까?");

          if (result) {
            $("#frmPrice").submit();
          }
        })
      </script>
      <!-- 리뷰남기기 -->
      <script>
        /* 버튼 클릭시 */
        $("#save").on("click", function () {

          //별점 선택 안했으면 메시지 표시
          if (rating.rate == 0) {
            rating.showMessage('rate');
            return false;
          }
          //리뷰 5자 미만이면 메시지 표시
          if (document.querySelector('.review_textarea').value.length < 5) {
            rating.showMessage('review');
            return false;
          }


          /* 로그아웃 상태 일 때 */
          let uid = '<%=(String)session.getAttribute("loginId")%>';

          if (uid == "null") {
            alert("로그인 후 이용가능합니다.");
            location.replace("/login.jsp");
            return false;
          } else {
            alert("현재 기능은 구현 중에 있습니다.");
          }





        })
      </script>
      <!-- 리뷰남기기 -->
      <script>
        /* 버튼 클릭시 */
        $("#save").on("click", function () {
          //별점 선택 안했으면 메시지 표시
          if (rating.rate == 0) {
            rating.showMessage('rate');
            return false;
          }
          //리뷰 5자 미만이면 메시지 표시
          if (document.querySelector('.review_textarea').value.length < 5) {
            rating.showMessage('review');
            return false;
          }
          //폼 서밋
          if (rating.rate != 0 && document.querySelector('.review_textarea').value.length >= 5) {
            $("#frmRv").submit();
          }


        });
      </script>



      <script>
        //별점 마킹 모듈 프로토타입으로 생성
        function Rating() { };
        Rating.prototype.rate = 0;
        Rating.prototype.setRate = function (newrate) {
          //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
          this.rate = newrate;
          let items = document.querySelectorAll('.rate_radio');
          items.forEach(function (item, idx) {
            if (idx < newrate) {
              item.checked = true;
            } else {
              item.checked = false;
            }
          });
        }

        let rating = new Rating();//별점 인스턴스 생성

        document.addEventListener('DOMContentLoaded', function () {
          //별점선택 이벤트 리스너
          document.querySelector('.rating').addEventListener('click', function (e) {
            let elem = e.target;
            if (elem.classList.contains('rate_radio')) {
              rating.setRate(parseInt(elem.value));
            }
          })
        });

        //상품평 작성 글자수 초과 체크 이벤트 리스너
        document.querySelector('.review_textarea').addEventListener('keydown', function () {
          //리뷰 400자 초과 안되게 자동 자름
          let review = document.querySelector('.review_textarea');
          let lengthCheckEx = /^.{400,}$/;
          if (lengthCheckEx.test(review.value)) {
            //400자 초과 컷
            review.value = review.value.substr(0, 400);
          }
        });


        Rating.prototype.showMessage = function (type) {//경고메시지 표시
          switch (type) {
            case 'rate':
              //안내메시지 표시
              document.querySelector('.review_rating .warning_msg').style.display = 'block';
              //지정된 시간 후 안내 메시지 감춤
              setTimeout(function () {
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
              }, 1000);
              break;
            case 'review':
              //안내메시지 표시
              document.querySelector('.review_contents .warning_msg').style.display = 'block';
              //지정된 시간 후 안내 메시지 감춤
              setTimeout(function () {
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
              }, 1000);
              break;
          }
        }
      </script>
      <!-- 인원수 선택시 -->
      <script>
        $("#person").change(function () {
          /* location.href="/buy.exbuy"; */
          let price = parseInt($("#price").text());
          let person = parseInt($("#person option:selected").val());
          let realpriceInt = price * person;
          let realprice = realpriceInt.toString();
          $("#realprice").val(realprice);
        });

      </script>

      <!-- 상세설명, 리뷰, q&a 클릭에 따른 div 보여주기 코드  -->
      <script type="text/javascript">
        /*  상세 정보 클릭 시  */
        $("#desc").on("click", function () {

          $(".menu_content2").css("display", "none");
          $(".menu_content3").css("display", "none");
          $(".menu_content1").css("display", "inline");

        })

        /*  리뷰 클릭 시  */
        $("#review").on("click", function () {

          $(".menu_content2").css("display", "inline");
          $(".menu_content3").css("display", "none");
          $(".menu_content1").css("display", "none");

        })

        /*  qna 클릭 시  */
        $("#expect").on("click", function () {

          $(".menu_content2").css("display", "none");
          $(".menu_content3").css("display", "inline");
          $(".menu_content1").css("display", "none");

        })

        $("#logout").on("click", function () {
          if (!confirm("로그아웃 하시겠습니까?")) {
            return false;
          }
        })

        $("#basket").on("click", function () {
          alert("현재 기능은 구현중에 있습니다.");
          return false;
        })

      </script>



      <!-- 날짜  -->
      <script type="text/javascript">
        $(document).ready(function () {
          $.datepicker.setDefaults($.datepicker.regional['ko']);
          $("#choiceDate").datepicker({
            changeMonth: true,
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달',
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
            monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
            dateFormat: "yy-MM-dd",
            minDate: 0,// 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
            maxDate: new Date('2022-04-10')

          });
        });
      </script>
      >>>>>>> 3e113603c9fa15bad9a6715a29bc2ae4afa791a4




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
            center: new kakao.maps.LatLng(37.50774693008208, 127.06057172716619), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커가 표시될 위치입니다 
        var markerPosition = new kakao.maps.LatLng(37.50774693008208, 127.06057172716619);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
          position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

      </script>
    </body>

    </html>