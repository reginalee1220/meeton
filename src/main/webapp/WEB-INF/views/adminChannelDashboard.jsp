<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>meeton</title>
  <!--Boxicons CDN Link-->
  <link rel="stylesheet" href="./css/admin/adminChannelDashboard.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="./js/adminChannel/adminChannel.js"></script>
</head>
<body>

<!--                    dachboard                  -->
<div class="ca-dashboard">
  <div class="ca-main-title">
    <span>채널 대시보드</span>
  </div>
  <div class="ca-dashboard-content">
    <!--    최신 동영상 실적    -->
    <div class="ca-dash-video">
      <div class="ca-dashboard-subject">최신 동영상 실적</div>
      <video muted="muted" poster="./imgUpload/${video.thumbnail}" preload="metadata">
        <source src="./videoUpload/${video.videofile}" type="video/mp4" />
        <source src="./videoUpload/${video.videofile}" type="video/webm" />
        <source src="./videoUpload/${video.videofile}" type="video/ogg" />
      </video>
      <div class="ca-dash-video-desc">
        <div>업로드 날짜</div>
        <div class="ca-dash-video-value">
          <fmt:parseDate value="${video.register}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><!--string을 date로형 변환-->
          <fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /><!--pattern 값으로 변경 출력 -->
        </div>
        <div>조회수</div>
        <div class="ca-dash-video-value">${video.views}</div>
        <div>댓글수</div>
        <div class="ca-dash-video-value">${video.comments}</div>
      </div>
<%--      <div class="ca-dashboard-move">--%>
<%--        <a href="#">동영상분석으로 이동</a>--%>
<%--      </div>--%>
    </div><!--ca-dash-video end-->
    <!--    채널 분석    -->
    <div class="ca-dash-channel">
      <div class="ca-dashboard-subject">채널 분석</div>
      <ul class="ca-dash-channel-desc">
        <li>
          <span>현재 구독자수</span>
          <div class="ca-dash-channel-subsc">${channel.subscribers}</div>
        </li>
        <li>
          <span>요약</span>
          <div class="ca-dash-video-desc">
            <div>구독자수</div>
            <div class="ca-dash-video-value">${channel.subscribers}</div>
            <div>즐겨찾기 시청자수</div>
            <div class="ca-dash-video-value">${channel.bookmarkers}</div>
            <div>총 조회수</div>
            <div class="ca-dash-video-value">${totalviews}</div>
          </div>
        </li>
        <li>
          <span>인기동영상</span>
          <div class="ca-dash-channel-video">
            <div class="ca-dash-channel-video-img">
              <video muted="muted" poster="image/LOGO.png" preload="metadata">
                <source src="image/viverse.mp4" type="video/mp4" />
                <source src="image/viverse.mp4" type="video/webm" />
                <source src="image/viverse.mp4" type="video/ogg" />
              </video>
            </div>
            <div class="ca-dash-channel-video-desc">
              <ul>
                <li>${topvideo.title}</li><!--영상제목-->
                <li><!--영상 업로드 날짜 -->
                  <fmt:parseDate value="${topvideo.register}" var="date2" pattern="yyyy-MM-dd HH:mm:ss" /><!--string을 date로형 변환-->
                  <fmt:formatDate value="${date2}" pattern="yyyy.MM.dd" /><!--pattern 값으로 변경 출력 -->
                </li>
                <li>
                  <div>
                    <span><img src="image/views.png" />${topvideo.views}</span><!--조회수-->
                    <span><img src="image/heart-solid.png" />${topvideo.likes}</span><!--좋아요수-->
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </li>
      </ul>
      <div class="ca-dashboard-move">
        <a href="adminChannel.do?state=analysis" >채널분석으로 이동</a>
      </div>
    </div><!--ca-dash-channel end-->
  </div><!--ca-dashboard-content end-->
</div><!--ca-dashboard end-->
</body>
</html>