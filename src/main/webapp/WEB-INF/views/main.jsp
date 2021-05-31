<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>meeton</title>
  <link rel="stylesheet" href="./css/main/main.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="./js/main/main.js"></script>
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
      <img src="./images/chevron_left.png" />
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
      <img src="./images/chevron_right.png" />
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






