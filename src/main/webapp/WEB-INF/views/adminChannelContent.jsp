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
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="./css/admin/adminChannelContent.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="./js/adminChannel/adminChannel.js"></script>
</head>
<body>
<!--                    content                  -->
<div class="ca-content">
  <div class="ca-main-title">
    <span>채널 콘텐츠</span>
  </div>
  <ul class="ca-content-content">
    <li class="ca-content-list">
      <img class="ca-content-filter-img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAA5UlEQVRIS+2TQQ6CMBBFW0pYewO5gR5BjwUNcQxpOJZ6A70B3sA1AWpmh4iWwWJZdJZN57/Om5QzR8UdcZkH/828V+1WdZ7nOyGEtvWKNE0v/azBHSulrEERKKV84ywLjKptacacLMvOo1TbhH7KMv5jAFhFUbShPKaqqhsAPL71GMGoPQiCEwXctu1+SG83Y7lgVC2E2FImbprm+rNqCpBy16i6H1YURay1Xr/si/N7kiTlrGClFDDGDj3IUUqJ56OLPLEzMKqu6zrujhaGYTm76tEuDRfJqj14qgGveqo5cp8z1U+m6UsfvsKjaAAAAABJRU5ErkJggg=="/>
      <span>필터</span><!-- 필터 -->
      <ul class="ca-content-filter-box">
        <li><input type="radio" /><label>제목</label></li>
        <li><input type="radio" /><label>공개여부</label></li>
        <li><input type="radio" /><label>날짜순</label></li>
        <li><input type="radio" /><label>조회수순</label></li>
        <li><input type="radio" /><label>댓글순</label></li>
        <li><input type="radio" /><label>좋아요순</label></li>
      </ul>
    </li>
    <li class="ca-content-list"><!-- 상위 분류 해더 -->
      <div>
        <input class="ca-content-filter-chk" type="checkbox"/>
        <span>동영상</span>
      </div>
      <div>
        <span>공개상태</span>
      </div>
      <div>
        <span>날짜</span>
      </div>
      <div>
        <span>조회수</span>
      </div>
      <div>
        <span>댓글</span>
      </div>
      <div>
        <span>좋아요</span>
      </div>
    </li>
    <c:forEach var="vl" items="videoList" >
    <li class="ca-content-list"><!-- 동영상 리스트 -->
      <div class="ca-content-video">
        <input class="ca-content-filter-chk" type="checkbox"/>
        <a href="">
          <video class="ca-content-video-video" muted="muted" poster="./imgUpload/" preload="metadata">
            <source src="image/viverse.mp4" type="video/mp4" />
            <source src="image/viverse.mp4" type="video/webm" />
            <source src="image/viverse.mp4" type="video/ogg" />
          </video>
        </a>
        <div class="ca-content-video-desc">
          <h5>영상제목</h5>
          <p>영상설명</p>
        </div>
      </div>
      <div>
        <span>공개</span>
      </div>
      <div>
        <span>2021.05.22</span>
      </div>
      <div>
        <span>24</span>
      </div>
      <div>
        <span>13</span>
      </div>
      <div>
        <span>2</span>
      </div>
    </li>
    </c:forEach>
    <li class="ca-content-list"><!-- 페이징 처리 -->
      <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAwklEQVRIS+2UsQ3DIBBF7ySgzibxCM4ImSQ915wL9skG8QjOJulBIkJKgSJjfMiWG1Of/vv/A4ew88Gd9eEEVBs+tiLnXEwWiWjWCDNftNYPIhpKURYTLAF+4i8A6ABgICKegzQBcvEY4zuE0DPzZxOARDwBRQmk4iJAi7gYoJQaEfEKAJP3/lbqPb8LcUVSiAiQnKWqJBAxQAppAvxDEPFurX1u8g9ykVSXMaYviVdfUXVVrhg4dpuuMFgdORNUK/oCID+WGStseG4AAAAASUVORK5CYII="/>
      <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtklEQVRIS+2TsQ3CMBBF/0mxazaBEcIITELvay4bZQMYATahtyUjSxRWmrvEsUQRt7Heu7xLCJ0PdebjEKiF/y+RiJycc3dmntTxgXVL/sEfAC4AJmYWTWJOVMNzzu+U0igin10EW+FFrr5BC1wVtMJNgmEYnkR0BvCKMV4t3eu9mBK1SFRBmaak2ioxCVokZsFSQkS3EMK8y39QQ0ou7/1ogatfkTad5fmqRBbg8s4hUKt1T/QFxkhmGTtrYfsAAAAASUVORK5CYII="/>
      <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAsUlEQVRIS+3UsQ0CMQwF0G8p6dkERoAN2Ag3Sc0mjMCNAJtQx5GM0iEKYls6ieKuzv0X/yghrPzRyvnYgGnD/1NRKYVF5MrMr+m2PxaYJhjhAC4AHiJy8iAmgJl3KaWFiPZexASMiaOIGYgiLiCChICc8x3AQVWfvffjr0N3AeMcPOFjYjMQCTcD0XAzUGs9q+rN0vn3LTdXNJDW2uK5xeYJPG9PeIIoYq5oA6INTP97A3pmfBkzm1HfAAAAAElFTkSuQmCC"/>
      <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAuUlEQVRIS+2UsQ0DIQxFjQR9NklGSDbIPhRxA3U2yQi5EZJNUgOSI3dRBPgkg645SrD+8/8WNjD5mMn6sAPEhLeNKISAOec7In5qrYYQiO+9981Gmw8sDgA3AHjlnC81iAqAiAdr7WKMObYgKgBblyBqgAQZAuhBhgKcc08AOBHRu5Ry5qEPAfAcauLsTA3oiasBkrgaEGO8EtHjN/P/36yOiCEppWXKqhDX5MqCbbfpyia7ZbsDMcUvbJmsGRiNZuQAAAAASUVORK5CYII="/>
    </li>
  </ul><!--ca-content-content end-->
  <input id="ca-content-popup" type="checkbox" />
  <label for="ca-content-popup">영상 업로드</label>
  <div>
    <div><!--pop-up page start-->
      <label for="ca-content-popup">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAABHklEQVRYR+2WUQ6DIAyGiyfbTrJ5DvRJPcf0JNvJZMGNhRikf0ETl8ArFj6+0oqikw11Mh4qQFxGiqFiiDPAzf/3Heq67tK27Ys7pT8vjYENDcNwJ6IHEY1a6xqB6vt+VErdiKjWWo9IDARkT1lV1dNbkIXyYJaweZ6viF0IyC643iBmav2tMWZqmsYaZgcMhELlwNg9REAcVC5MEtAWlDFGfS/wkhZJmvw8ig254MCd+q2bCpNsKAaVA3MIkKRPhUrukJTlQCUBhapp0f3pym6wzXMXQ7HSljTPrQ4pMoT0mVwoGAiBiVQfnD4IaP1zRUr78J+re34gMAFT+z4/3AbSx5aNk8ZAKWPfDDt+UIA4mcVQMcQZ4ObLHeIMvQEbv8ElmHXsTQAAAABJRU5ErkJggg=="/>
      </label><!--첫번째 닫기버튼-->
      <div class="ca-content-upload">

        <%@ include file="videoUpload.jsp"%>

      </div><!--ca-content-upload end-->
    </div><!--pop-up page end-->
    <label></label><!--두번째 닫기버튼-->
  </div>
</div><!--ca-content end-->

</body>
</html>