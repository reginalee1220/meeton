<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>meeton</title>

  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/default/import.css ">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main/main.css" >
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="./js/main/main.js"></script>

  <style type="text/css">
    *{
      margin: 0;
      border: 0;
      padding: 0;
      box-sizing: border-box;
      text-decoration: none;
    }
    /*  main-my  */
    .main-my{
      background-color: #f5f6f7;
      width: 100%;
      height: 350px;
    }
    .main-my-bar{
      margin: 0 auto;
      margin-top: 20px;
      width: 1200px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
    }
    /*slide button*/
    .main-my-slide-button{
      display: inline-block;
      width : 60px;
      height: 60px;
      border: 1px solid #d9d9d9 ;
      border-radius: 50%;
      background-color: #fff;
      cursor: pointer;
    }
    .main-my-slide-button img{
      width: 60px;
    }
    /*slide*/
    .main-my-slide{
      width: 1060px;
      height: 210px;
      list-style: none;
      display: inline-block;
      overflow: hidden;
      white-space: nowrap;
    }
    .main-mybox{
      display: inline-block;
      width: 250px;
      background-color: #fff;
      border: 1px solid #d9d9d9;
      border-radius: 10px;
      padding: 20px 0;
      margin: 0 5px;
      transition: all 0.5s;
    }
    .main-mybox:hover{
      box-shadow: 2px 5px 5px 1px rgba(91, 91, 91, .1);
    }
    .main-mybox a{
      text-decoration: none;
    }
    .main-mybox-profile{
      margin: 10px auto;
      width: 60px;
      height: 60px;
      border: 2px solid transparent;
      border-radius: 50%;
      background-image:
              linear-gradient(#fff, #fff),
              linear-gradient(to right, #4ba9e1, #a0ffb4);
      background-origin: border-box;/*이미지 시작 위치*/
      background-clip: content-box, border-box; /*이미지 잘릴 위치*/
    }
    .main-mybox-name{
      margin: 0 auto;
      width: 100%;
      font-size: 14px;
      font-weight: bold;
      color: #2c2c2c;
      text-align: center;
    }
    .main-mybox-desc{
      margin-top: 40px;
      width: 100%;
      font-size: 14px;
      color: #4e4e4e;
      text-align: center;
    }

    /*  main-tab-content  */
    .main-tab-content{
      width: 100%;
    }
    /*  main-nav  */
    .main-nav{
      position: relative;
      border-top: 1px solid #d9d9d9;
      border-bottom: 1px solid #d9d9d9;
      width: 100%;
      background-color: #ffffff;
    }
    .main-nav-bar{
      margin: 0 auto;
      width: 1200px;
      height: 47px;
      text-align: center;
      vertical-align: middle;
      line-height: 41px;
      background-color: #ffffff;
    }
    .main-nav-bar input[type="radio"]{
      display: none;
    }
    .main-nav-bar input[type="radio"] + label{
      display: inline-block;
      width: 80px;
      height: 45px;
      margin: 0 10px;
      font-size: 15px;
      font-weight: bold;
      color: #2c2c2c;
      cursor: pointer;
      transition: all 0.5s;
    }
    .main-nav-bar input[type="radio"]:checked + label{
      color: #4ba9e1;
    }
    .main-nav-bar input[type="radio"] + label > span{
      display: inline-block;
      width: 0;
      position: absolute;
      bottom: 0;
      transform: translateX(-85%);
      height: 2px;
      background: linear-gradient(to right bottom, #4ba9e1, #a0ffb4);
      transition: all 0.5s;
    }
    .main-nav-bar input[type="radio"]:checked + label > span{
      display: inline-block;
      width: 80px;
    }

    /*  main-chart 공통  */
    .main-chart{
      width: 100%;
      display: none;
      background-color: #ffffff;
    }
    .active{
      display : block;
    }
    .main-chart-desc{
      margin: 0 auto;
      padding: 20px 0;
      width: 1200px;
      height: 60px;
    }
    .main-chart-desc > span {
      color: #4ba9e1;
      font-size: 22px;
      font-weight: bold;
    }

    /*  main-video-chart  */
    /*  main-video-top  */
    .main-video-top{
      margin: 0 auto;
      width: 100%;
      height: 470px;
      background-color: #f9f9f9 ;
    }
    .main-video-popgroup{
      margin: 0 auto;
      padding: 30px 0;
      width: 1200px;
      display: flex;
      align-items: center;
      flex-wrap: nowrap;
      justify-content: space-between;
    }
    .main-video-box-ver1{
      border: 1px solid #e5e5e5;
      width: 380px;
      background-color: #ffffff;
    }
    .main-video-img-ver1{
      width: 100%;
      height: 210px;
      position: relative;
    }
    .main-video-img-ver1 video{
      width: 100%;
      height:100%;
      border-bottom: 1px solid #e5e5e5;
      padding: 10px;
    }
    video[poster]{
      height:100%;
      width:100%;
    }
    .main-video-img-ver2 video{
      width: 100%;
      height:100%;
      padding: 5px;
      border: 1px solid #e5e5e5;
    }
    video[poster]{
      height:100%;
      width:100%;
    }
    .main-video-desc-ver1{
      border-bottom: 1px solid #f5f5f5;
      margin: 0 auto;
      width: 85%;
      height: 100px;
      padding: 20px 0;
    }
    .main-video-rank-ver1{
      width: 35px;
      float: left;
      line-height: 40px;
      color: #2c2c2c;
      font-size: 45px;
    }
    .main-video-info-ver1{
      float: left;
      list-style: none;
    }
    .main-video-info-ver1 li{
      display: inline-block;
      color: #a0a0a0;
      font-size: 13px;
    }
    .main-video-info-ver1 li::after{
      content: "|";
      float: right;
      padding: 0 10px;
    }
    .main-video-info-ver1 li:first-child {
      display: block;
    }
    .main-video-info-ver1 li:first-child a{
      color: #4e4e4e;
      font-size: 17px;
      font-weight: bold;
    }
    .main-video-info-ver1 li:last-child a{
      color: #a0a0a0;
      font-size: 13px;
    }
    .main-video-info-ver1 li:first-child::after{ content: ""; }
    .main-video-info-ver1 li:last-child::after{ content: ""; }
    .main-video-viewlike-ver1{
      margin: 0 auto;
      width: 85%;
      height: 40px;
      line-height: 35px;
      vertical-align: center;
    }
    .main-video-viewlike-ver1 img{
      width: 13px;
      vertical-align: middle;
      margin-right: 10px;
    }
    .main-video-viewlike-ver1 span{
      padding-left: 35px;
      color: #a0a0a0;
      font-size: 14px;
    }
    /*  main-video-bottom  */
    .main-video-bottom{
      margin: 0 auto;
      padding: 30px 0;
      width: 1200px;
      display: flex;
      align-items: center;
      flex-wrap: wrap;
      justify-content: space-between;
    }
    .main-video-box-ver2{
      width: 480px;
      display: flex;
    }
    .main-video-img-ver2{
      position: relative;
      width: 230px;
      height: 130px;
      float: left;
      margin-bottom: 25px;
      margin-right: 25px;
    }
    .main-video-time {
      position: absolute;
      right: 10px;
      bottom: 10px;
      width: 40px;
      background-color: #4d4d4d;
      text-align: center;
      font-size: 12px;
      color: #ffffff;
    }
    .main-video-rank-ver2{
      width: 45px;
      float: left;
      margin-top: 15px;
      line-height: 30px;
      color: #2c2c2c;
      font-size: 35px;
    }
    .main-video-desc-ver2{
      margin-top: 15px;
      float: left;
      display: flex;
      flex-direction: column;
      align-items: center;
      flex-wrap: nowrap;
    }
    .main-video-info-ver2{
      list-style: none;
    }
    .main-video-info-ver2 li{
      display: inline-block;
      color: #a0a0a0;
      font-size: 13px;
    }
    .main-video-info-ver2 li > a{
      color: #a0a0a0;
      font-size: 13px;
    }
    .main-video-info-ver2 li::after{
      content: "|";
      float: right;
      padding: 0 10px;
    }
    .main-video-info-ver2 li:first-child{
      display: block;
    }
    .main-video-info-ver2 li:first-child > a{
      color: #4e4e4e;
      font-size: 15px;
      font-weight: bold;
    }
    .main-video-info-ver2 li:first-child::after{ content: ""; }
    .main-video-info-ver2 li:last-child::after{ content: ""; }
    .main-video-viewlike-ver2{
      height: 40px;
      line-height: 35px;
      vertical-align: center;
    }
    .main-video-viewlike-ver2 img{
      width: 13px;
      vertical-align: middle;
      margin-right: 10px;
    }
    .main-video-viewlike-ver2 span{
      padding-right: 15px;
      color: #a0a0a0;
      font-size: 14px;
    }

    /*  main-channel-chart  */
    .main-channel-popgroup{
      margin: 0 auto;
      width: 1200px;
      padding: 30px 0;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
    }
    .main-channel-box{
      width: 230px;
      border: 1px solid #e6e6e6;
      border-radius: 10px;
      margin-bottom: 20px;
    }
    .main-channel-img{
      width: 100%;
      height: 120px;
      position: relative;
    }
    .main-channel-name{
      width: 100%;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      font-size: 30px;
      color: #fff;
      text-align: center;
    }
    .main-channel-desc{
      width: 100%;
      height: 90px;
      padding: 20px;
      display: flex;
      justify-content: space-between;
    }
    .main-channel-rank{
      width: 45px;
      height: 45px;
      border: 2px solid transparent;
      border-radius: 10px;
      background-image:
              linear-gradient(#fff, #fff),
              linear-gradient(to right, #4ba9e1, #a0ffb4);
      background-origin: border-box;/*이미지 시작 위치*/
      background-clip: content-box, border-box; /*이미지 잘릴 위치*/
      font-size: 30px;
      color: #2c2c2c;
      text-align: center;
      line-height: 40px;
    }
    .main-channel-subsc{
      width: 130px;
      font-size: 15px;
      color: #a0a0a0;
      text-align: center;
      line-height: 45px;
    }

  </style>


</head>
<body>
<%= session.getAttribute("userid")%>
<%@include file="header.jsp"%>
<!--                        main-my                   -->
<div class="main-my">
  <div class="main-chart-desc">
    <span>My 구독&즐겨찾기</span>
  </div>
  <div class="main-my-bar">

    <div class="main-my-slide-button" id="l">
      <img src="/images/next-prev/prev.png" />
    </div><!--main-my-slide-button end-->

    <ul class="main-my-slide">
      <!-- 구독즐겨찾기 목록 출력 -->
      <c:forEach var="f" items="${favoriteList}">
        <li class="main-mybox">
          <a href="channel.do?channelnum=${f.channelnum}">
            <div class="main-mybox-profile">
              <img src="./upload/${f.profile}" alt="${f.profile}"/><!--프로필-->
            </div>
            <div class="main-mybox-name">${f.aka}</div><!--채널이름-->
          </a>
          <div class="main-mybox-desc"><!--채널타입-->
            <c:if test="${f.type == 'subscript'}">
              구독 채널입니다.
            </c:if>
            <c:if test="${f.type == 'bookmark'}">
              즐겨찾기 채널입니다.
            </c:if>
          </div>
        </li><!--"main-mybox end-->
      </c:forEach>

    </ul><!--main-my-slide end-->

    <div class="main-my-slide-button" id="r">
      <img src="/images/next-prev/next.png" />
    </div><!--main-my-slide-button end-->

  </div><!--main-my-bar end-->
</div>

<!--                        main-tab-content                     -->
<div class="main-tab-content">

  <!--                   main-nav                    -->
  <div class="main-nav">
    <div class="main-nav-bar">
      <input type="radio" name="main-tab-menu" id="main-tab1" checked />
      <label for="main-tab1">
        영상차트
        <span></span>
      </label>
      <input type="radio" name="main-tab-menu" id="main-tab2" />
      <label for="main-tab2">
        채널차트
        <span></span>
      </label>
    </div>
  </div>

  <!--                    video chart                   -->
  <div class="main-chart main-tab1">
    <div class="main-video-top">
      <div class="main-chart-desc">
        <span>영상 100차트</span>
      </div>
      <div class="main-video-popgroup">
        <!--videoList TOP3 출력 -->
        <c:set var="vrank" value="1"/>
        <c:forEach var="v" items="${videoList}" begin="0" end="2" step="1">
          <div class="main-video-box-ver1">
            <div class="main-video-img-ver1">
              <a href="video.do?videonum=${v.videonum}">
                <video muted="muted" poster="${v.thumbnail}">
                  <source src="${v.videofile}" type="video/mp4" />
                  <source src="${v.videofile}" type="video/webm" />
                  <source src="${v.videofile}" type="video/ogg" />
                </video>
              </a>
            </div>
            <div class="main-video-desc-ver1">
              <div class="main-video-rank-ver1">${vrank}</div><!--순위-->
              <c:set var="vrank" value="${vrank + 1}" />
              <ul class="main-video-info-ver1">
                <li> <a href="video.do?videonum=${v.videonum}"> ${v.title}</a></li><!--영상제목-->
                <!--영상업로드 시간 -->
                <c:set var="time" value="${v.register}" />
                <!--24시간 초과-->
                <c:if test="${time > 24}" >
                  <c:forTokens  var="day" items="${time/24}" delims="." begin="0" end="0">
                    <li>${day}일전</li>
                  </c:forTokens>
                </c:if>
                <!--24시간 이하-->
                <c:if test="${time <= 24}" >
                  <li>${time}시간전</li>
                </c:if>
                <li> <a href="channelnum.do?channelnum=${v.channelnum}"> ${v.userid}</a></li><!--채널명-->
              </ul>
            </div>
            <div class="main-video-viewlike-ver1">
              <span><img src="image/views.png" />${v.views}</span><!--조회수-->
              <span><img src="image/heart-solid.png" />${v.likes}</span><!--좋아요수-->
            </div>
          </div><!--main-video-box-ver1 end-->
        </c:forEach>
      </div><!--main-video-popgroup end-->
    </div><!--main-video-top end-->

    <div class="main-video-bottom">
      <!--videoList 나머지 출력 -->
      <c:forEach var="v" items="${videoList}" begin="3" end="99" step="1">
        <div class="main-video-box-ver2">
          <div class="main-video-img-ver2">
            <a href="video.do?videonum=${v.videonum}">
              <video muted="muted" poster="${v.thumbnail}">
                <source src="${v.videofile}" type="video/mp4" />
                <source src="${v.videofile}" type="video/webm" />
                <source src="${v.videofile}" type="video/ogg" />
              </video>
            </a>
            <div class="main-video-time">${v.videotime}</div>
          </div>
          <div class="main-video-rank-ver2">${vrank}</div><!--순위-->
          <c:set var="vrank" value="${vrank + 1}" />
          <div class="main-video-desc-ver2">
            <ul class="main-video-info-ver2">
              <li><a href="video.do?videonum=${v.videonum}">${v.title}</a></li><!--영상제목-->
              <!--영상업로드 시간 -->
              <c:set var="time" value="${v.register}" />
              <!--24시간 초과-->
              <c:if test="${time > 24}" >
                <c:forTokens  var="day" items="${time/24}" delims="." begin="0" end="0">
                  <li>${day}일전</li>
                </c:forTokens>
              </c:if>
              <!--24시간 이하-->
              <c:if test="${time <= 24}" >
                <li>${time}시간전</li>
              </c:if>
              <li><a href="channelnum.do?channelnum=${v.channelnum}">${v.userid}</a></li><!--채널명-->
            </ul>
            <div class="main-video-viewlike-ver2">
              <span><img src="image/views.png" />${v.views}</span>
              <span><img src="image/heart-solid.png" />${v.likes}</span>
            </div>
          </div>
        </div><!--main-video-box-ver2 end-->
      </c:forEach>
    </div><!--main-video-bottom end-->
  </div><!--"main-chart main-tab1 end-->

  <!--                   channel chart                    -->
  <div class="main-chart main-tab2">
    <div class="main-chart-desc">
      <span>인기 채널 10위</span>
    </div>
    <div class="main-channel-popgroup">
      <!--channelList TOP 10 출력-->
      <c:set var="crank" value="1" />
      <c:forEach var="c" items="${channelList}">
        <div class="main-channel-box">
          <div class="main-channel-img">
            <img src="./upload/${c.profile}" alt="${c.profile}" /><!--프로필-->
            <div class="main-channel-name">${c.aka}</div><!--채널이름-->
          </div>
          <div class="main-channel-desc">
            <div class="main-channel-rank">${crank}</div><!--랭킹-->
            <c:set var="crank" value="${crank + 1}" />
            <div class="main-channel-subsc">구독자 : ${c.subscribers} </div><!--구독자수-->
          </div>
        </div><!--main-channel-box end-->
      </c:forEach>
    </div><!--main-channel-popgroup end-->
  </div><!--main-chart main-tab2 end-->
</div><!--main-tab-content end-->

<footer>
  메인 테스트 입니다. 수정해야 합니다. 마지막에<br>

  <a href="call">날짜 호출</a>
</footer>
</body>
</html>






