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
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="./css/admin/adminChannelContent.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="./js/adminChannel/adminChannel.js"></script>
</head>
<body>

<!-- content -->
<div class="ca-content">
  <div class="ca-main-title">
    <span>채널 콘텐츠</span>
    <a class="ca-uploadgo" href="videoUploadgo.do">영상업로드</a>
  </div><!--ca-main-title end-->

  <!--          영상 리스트 내역          -->
  <form method="post" name="ca-updateForm" action="update.do"><!--수정할 영상 넘기는 form tag -->
  <ul class="ca-content-content">
    <li class="ca-content-list">
      <img class="ca-content-filter-img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAA5UlEQVRIS+2TQQ6CMBBFW0pYewO5gR5BjwUNcQxpOJZ6A70B3sA1AWpmh4iWwWJZdJZN57/Om5QzR8UdcZkH/828V+1WdZ7nOyGEtvWKNE0v/azBHSulrEERKKV84ywLjKptacacLMvOo1TbhH7KMv5jAFhFUbShPKaqqhsAPL71GMGoPQiCEwXctu1+SG83Y7lgVC2E2FImbprm+rNqCpBy16i6H1YURay1Xr/si/N7kiTlrGClFDDGDj3IUUqJ56OLPLEzMKqu6zrujhaGYTm76tEuDRfJqj14qgGveqo5cp8z1U+m6UsfvsKjaAAAAABJRU5ErkJggg=="/>
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
        <div class="ca-filter-nav">
            <input class="ca-filter-button" type="button" value="편집"/>
            <input class="ca-filter-button" id="ca-update" type="submit" value="수정"/>
            <span>동영상</span>
        </div>
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
    <c:if test="${acvideoList != null}"><!--업로드한 동영상이 있으면 -->
    <c:forEach var="vl" items="${acvideoList}" begin="${startPage}" end ="${endPage}" >
    <li class="ca-content-list"><!-- 동영상 리스트 -->
      <div class="ca-content-video">
        <input class="ca-filter-chk" type="radio" name="videonum" value="${vl.videonum}"/>
        <a href="video.do?videonum=${vl.videonum}&page=${pageNum}">
          <video class="ca-content-video-video" muted="muted" poster="./imgUpload/${vl.thumbnail}" preload="metadata">
            <source src="./videoUpload/${vl.videofile}" type="video/mp4" />
            <source src="./videoUpload/${vl.videofile}" type="video/webm" />
            <source src="./videoUpload/${vl.videofile}" type="video/ogg" />
          </video>
        </a>
        <div class="ca-content-video-desc">
          <h5>${vl.title}</h5><!--영상 제목-->
          <p><pre>${vl.description}</pre></p><!--영상 설명 -->
        </div>
      </div>
      <div>
        <span><!-- 공개여부 -->
          <c:if test="${vl.visibility == 1}">
            공개
          </c:if>
          <c:if test="${vl.visibility == 0}">
            비공개
          </c:if>
        </span>
      </div>
      <div><!-- 업로드 날짜 -->
        <span>
          <fmt:parseDate value="${vl.register}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><!--string을 date로형 변환-->
          <fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /><!--pattern 값으로 변경 출력 -->
        </span>
      </div>
      <div><!-- 조회수 -->
        <span>${vl.views}</span>
      </div>
      <div><!-- 댓글수 -->
        <span>${vl.comments}</span>
      </div>
      <div><!-- 좋아요수 -->
        <span>${vl.likes}</span>
      </div>
    </li>
    </c:forEach>
    </c:if>
    <c:if test="${acvideoList == null}"><!--업로드한 동영상이 없으면 -->
    <li>업로드한 동영상이 없습니다.</li>
    </c:if>
    <li class="ca-content-list"><!-- 페이징 처리 -->
      <div>
        <span>
            <a href="adminChannel.do?state=content&pageNum=${1}">
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAwklEQVRIS+2UsQ3DIBBF7ySgzibxCM4ImSQ915wL9skG8QjOJulBIkJKgSJjfMiWG1Of/vv/A4ew88Gd9eEEVBs+tiLnXEwWiWjWCDNftNYPIhpKURYTLAF+4i8A6ABgICKegzQBcvEY4zuE0DPzZxOARDwBRQmk4iJAi7gYoJQaEfEKAJP3/lbqPb8LcUVSiAiQnKWqJBAxQAppAvxDEPFurX1u8g9ykVSXMaYviVdfUXVVrhg4dpuuMFgdORNUK/oCID+WGStseG4AAAAASUVORK5CYII="/>
            </a>
          <c:if test="${pageNum != 1}">
            <a href="adminChannel.do?state=content&pageNum=${pageNum-1}">
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtklEQVRIS+2TsQ3CMBBF/0mxazaBEcIITELvay4bZQMYATahtyUjSxRWmrvEsUQRt7Heu7xLCJ0PdebjEKiF/y+RiJycc3dmntTxgXVL/sEfAC4AJmYWTWJOVMNzzu+U0igin10EW+FFrr5BC1wVtMJNgmEYnkR0BvCKMV4t3eu9mBK1SFRBmaak2ioxCVokZsFSQkS3EMK8y39QQ0ou7/1ogatfkTad5fmqRBbg8s4hUKt1T/QFxkhmGTtrYfsAAAAASUVORK5CYII="/>
            </a>
          </c:if>
          <c:if test="${pageNum == 1}">
            <a>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtklEQVRIS+2TsQ3CMBBF/0mxazaBEcIITELvay4bZQMYATahtyUjSxRWmrvEsUQRt7Heu7xLCJ0PdebjEKiF/y+RiJycc3dmntTxgXVL/sEfAC4AJmYWTWJOVMNzzu+U0igin10EW+FFrr5BC1wVtMJNgmEYnkR0BvCKMV4t3eu9mBK1SFRBmaak2ioxCVokZsFSQkS3EMK8y39QQ0ou7/1ogatfkTad5fmqRBbg8s4hUKt1T/QFxkhmGTtrYfsAAAAASUVORK5CYII="/>
            </a>
          </c:if>
        </span>
        <c:forEach var="nNc" begin="${navBegin}" end="${navEnd}" varStatus="status">
            <c:if test="${status.current == pageNum}">
              <span><a style="font-weight: bold ; color: #4BA9E1;"
                    href="adminChannel.do?state=content&pagNum=${nNc}">
                ${nNc}
              </a></span>
            </c:if >
            <c:if test="${status.current != pageNum}">
              <span><a href="adminChannel.do?state=content&pageNum=${nNc}">
                ${nNc}
              </a></span>
            </c:if >
        </c:forEach>
        <span>
          <c:if test="${pageNum != navNumCount}">
          <a href="adminChannel.do?state=content&pageNum=${pageNum+1}">
              <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAsUlEQVRIS+3UsQ0CMQwF0G8p6dkERoAN2Ag3Sc0mjMCNAJtQx5GM0iEKYls6ieKuzv0X/yghrPzRyvnYgGnD/1NRKYVF5MrMr+m2PxaYJhjhAC4AHiJy8iAmgJl3KaWFiPZexASMiaOIGYgiLiCChICc8x3AQVWfvffjr0N3AeMcPOFjYjMQCTcD0XAzUGs9q+rN0vn3LTdXNJDW2uK5xeYJPG9PeIIoYq5oA6INTP97A3pmfBkzm1HfAAAAAElFTkSuQmCC"/>
          </a>
          </c:if>
          <c:if test="${pageNum == navNumCount}">
          <a>
              <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAsUlEQVRIS+3UsQ0CMQwF0G8p6dkERoAN2Ag3Sc0mjMCNAJtQx5GM0iEKYls6ieKuzv0X/yghrPzRyvnYgGnD/1NRKYVF5MrMr+m2PxaYJhjhAC4AHiJy8iAmgJl3KaWFiPZexASMiaOIGYgiLiCChICc8x3AQVWfvffjr0N3AeMcPOFjYjMQCTcD0XAzUGs9q+rN0vn3LTdXNJDW2uK5xeYJPG9PeIIoYq5oA6INTP97A3pmfBkzm1HfAAAAAElFTkSuQmCC"/>
          </a>
          </c:if>
          <a href="adminChannel.do?state=content&pageNum=${navNumCount}">
              <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAuUlEQVRIS+2UsQ0DIQxFjQR9NklGSDbIPhRxA3U2yQi5EZJNUgOSI3dRBPgkg645SrD+8/8WNjD5mMn6sAPEhLeNKISAOec7In5qrYYQiO+9981Gmw8sDgA3AHjlnC81iAqAiAdr7WKMObYgKgBblyBqgAQZAuhBhgKcc08AOBHRu5Ry5qEPAfAcauLsTA3oiasBkrgaEGO8EtHjN/P/36yOiCEppWXKqhDX5MqCbbfpyia7ZbsDMcUvbJmsGRiNZuQAAAAASUVORK5CYII="/>
          </a>
        </span>
      </div>
    </li>
  </ul><!--ca-content-content end-->
  </form>
</div><!--ca-content end-->


</body>
</html>