<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <img src="image/videobackground.png" />
      <div class="ca-dash-video-desc">
        <div>업로드 날짜</div>
        <div class="ca-dash-video-value">${video.register}</div>
        <div>조회수</div>
        <div class="ca-dash-video-value">${video.views}</div>
        <div>댓글수</div>
        <div class="ca-dash-video-value">${video.comments}</div>
      </div>
      <div class="ca-dashboard-move">
        <a href="#">동영상분석으로 이동</a>
      </div>
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
            <div class="ca-dash-video-value">0</div>
            <div>총 조회수</div>
            <div class="ca-dash-video-value">${totalviews}</div>
          </div>
        </li>
        <li>
          <span>인기동영상</span>
          <div class="ca-dash-channel-video">
            <div class="ca-dash-channel-video-img">
              <img src="image/videobackground2.png" />
              <div class="main-video-time">22:00</div>
            </div>
            <div class="ca-dash-channel-video-desc">
              <ul>
                <li>영상제목</li>
                <li>업로드 날짜</li>
                <li>
                  <div>
                    <span><img src="image/views.png" />12500</span>
                    <span><img src="image/heart-solid.png" />25700</span>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </li>
      </ul>
      <div class="ca-dashboard-move">
        <a href="#" >채널분석으로 이동</a>
      </div>
    </div><!--ca-dash-channel end-->
  </div><!--ca-dashboard-content end-->
</div><!--ca-dashboard end-->
</body>
</html>