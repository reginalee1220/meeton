<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>검색결과</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="css/default/reset.css">
    <link rel="stylesheet" type="text/css" href="../../css/main/slidebar.css">
    <link rel="stylesheet" type="text/css" href="css/search/search.css" />

    <!-- js -->
    <!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<%@include file="header.jsp"%>
<div class="sidebar">

    <div class="menu_content">
        <div class="menu">
            <div class="menu_name">메뉴</div>
        </div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav_list">
        <li>
            <i class='bx bx-search' ></i>
            <!-- <input type="text" placeholder="Search..."> -->
            <span class="tooltip">Search</span>
        </li>
        <li><!-- home -->
            <a href="main.do" class="nav-home">
                <i class='bx bx-home' ></i>
                <span class="links_name">홈</span>
            </a>
            <span class="tooltip">Home</span>
        </li><!-- //home -->
        <c:if test="${userid != null}"><!--로그인 했으면 -->
        <li><!-- 즐겨찾기 -->
            <a href="bookmark.do" class="nav-my">
                <i class='bx bx-star' ></i>
                <span class="links_name">MY</span>
            </a>
            <span class="tooltip">즐겨찾기</span>
        </li><!-- // 즐겨찾기 -->
        </c:if>
        <c:if test="${userid == null}"><!--로그인 안 했으면 -->
        <li><!-- 즐겨찾기 -->
            <a href="reject.do" class="nav-my">
                <i class='bx bx-star' ></i>
                <span class="links_name">MY</span>
            </a>
            <span class="tooltip">즐겨찾기</span>
        </li><!-- //즐겨찾기 -->
        </c:if>
        <c:if test="${userid != null}"><!--로그인 했으면 -->
        <li><!-- 마이 플레이 리스트 -->
            <a href="bookmark.do" class="nav-my">
                <i class='bx bxs-user-detail'></i>
                <span class="links_name">History</span>
            </a>
            <span class="tooltip">내 영상기록</span>
        </li><!-- //마이 플레이 리스트 -->
        </c:if>
        <c:if test="${userid == null}"><!--로그인 안 했으면 -->
        <li><!-- 마이 플레이 리스트 -->
            <a href="reject.do" class="nav-my">
                <i class='bx bxs-user-detail'></i>
                <span class="links_name">History</span>
            </a>
            <span class="tooltip">내 영상기록</span>
        </li><!-- //마이 플레이 리스트 -->
        </c:if>
        <li><!-- 구독 -->
            <a href="purchasedList.do" class="nav-subs">
                <i class='bx bx-movie-play' ></i>
                <span class="links_name">구독</span>
            </a>
            <span class="tooltip">구독리스트</span>
        </li><!-- //구독 -->
    </ul>
</div>

<div class="home_content"><!-- home_content -->
    <div id="search_results"><!-- search_results -->
    <div class="search_title"><!-- search_title -->
        <div class="search_title_inner">
            <span class="searchResults_keywords">${keyword}</span>
            <span class="searchResults_fix">검색결과</span>
            <span class="searchResults_fix">총 ${count}</span>
        </div>
    </div><!-- // search_title -->
    <main class="my_content"><!-- my_content -->
        <form>
            <div class="btn_search_bmk" id="btn_search"><!-- btn_search_bmk -->
                <div class="btn">
                    <input type="button" id="all_sequence" class="btn_all" value="전체">
                </div>
                <div class="btn">
                    <input type="button" id="video_sequence" class="btn_video" value="영상">
                </div>
                <div class="btn">
                    <input type="button" id="chaneel_sequence" class="btn_channel" value="채널">
                </div>
            </div><!-- // btn_search_bmk -->
            <section class="search_wrap"><!-- search_wrap -->
                <c:if test="${not empty searchList}"><!--검색결과가 있으면 -->
                <div class="search_list"><!-- search_list -->
                    <div class="search_video_view left"><!-- search_video_left -->
                        <c:forEach var="sl" items="${searchList}">
                        <div class="main_video"><!-- main_video -->
                            <div class="main_video_img"><!-- main_video_img -->
                                <a href="video.do?videonum=${sl.videonum}">
                                    <img src="./videoUpload/${sl.thumbnail}" />
                                </a>
                            </div>
                            <div class="desc"><!-- desc -->
                                <ul class="desc_inner">
                                    <li class="vd_text">
                                        <a href="video.do?videonum=${sl.videonum}" data-event="clickTitle" data-clickcode="#" data-move_uri="#">
                                            ${sl.title}<!--영상제목-->
                                        </a>
                                    </li>
                                    <li class="ch_txt">
                                        <a href="channel.do?userid=${sl.userid}" data-event="clickChannel" data-clickcode="#" data-move_uri="#">
                                            ${sl.userid}<!--영상 채널명-->
                                        </a>
                                    </li>
                                    <li class="play_like_date">
                                            <span class="cds_ifc cnp"> <!-- 재생수 -->
                                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                                ${sl.views}
                                            </span>
                                        <span class="cds_ifc bch"> <!-- 좋아요 -->
                                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                                ${sl.likes}
                                            </span>
                                        <span class="cds_ifc date"> <!-- 날짜 -->
                                            <fmt:parseDate value="${sl.register}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><!--string을 date로형 변환-->
                                            <fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /><!--pattern 값으로 변경 출력 -->
                                        </span>
                                    </li>
                                </ul>
                            </div><!-- // desc -->
                        </div><!-- // main_video -->
                        </c:forEach>
                    </div><!-- // search_video_left -->
                </div><!-- // search_list -->

                <div class="nav"><!--nav-->
                    <!--1page로 이동-->
                    <a href="search.do?page=1&keyword=${keyword}">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAwklEQVRIS+2UsQ3DIBBF7ySgzibxCM4ImSQ915wL9skG8QjOJulBIkJKgSJjfMiWG1Of/vv/A4ew88Gd9eEEVBs+tiLnXEwWiWjWCDNftNYPIhpKURYTLAF+4i8A6ABgICKegzQBcvEY4zuE0DPzZxOARDwBRQmk4iJAi7gYoJQaEfEKAJP3/lbqPb8LcUVSiAiQnKWqJBAxQAppAvxDEPFurX1u8g9ykVSXMaYviVdfUXVVrhg4dpuuMFgdORNUK/oCID+WGStseG4AAAAASUVORK5CYII="/>
                    </a>
                    <!--이전블럭으로 이동 -->
                    <c:if test="${startpage > nav}">
                        <a href="search.do?page=${startpage - nav}&keyword=${keyword}">
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAA00lEQVRIS+3TsQ3CMBAF0IsXIKNkBTZgBBiB0rpYcuM9wgZsACMwAiPAAjaylCKKUty3T6Rx6u+8+Ouno52ebieXGvy35lvVcNXe+957/0EPVlUdQhiI6EFEV2aeELwYXqB9BmOMR+fcU4oXwWs0pXQbx/EsRXMOhjVQGNZCIVgTFcPaKArnxR7mAU3MfEHGtM6KxzXfWg0Xw/mLNXEI1sRhWAsvgjfwrzFmsNa+pYMrhhf4nYhOzPySouLfCXmhNFt1YymylWtwTXvQ2VY1VFdN+Aco/l0fa51srQAAAABJRU5ErkJggg=="/>
                        </a>
                    </c:if>
                    <!--페이징 출력 -->
                    <c:forEach var="navNum" begin="${startpage}" end="${endpage}" >
                        <c:if test="${navNum == page }">
                           <span> ${navNum} </span>
                        </c:if>
                        <c:if test="${navNum != page }">
                            <a href="search.do?page=${navNum}&keyword=${keyword}"> <span> ${navNum} </span> </a>
                        </c:if>
                    </c:forEach>
                    <!--다음블럭으로 이동-->
                    <c:if test="${endpage < maxpage}">
                        <a href="search.do?page=${startpage + nav}&keyword=${keyword}">
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAyklEQVRIS+3VwQ1CIQwG4B8W0BEcwRGeG7iB7sGlCTQcXcER3MAVHEUXIIbE00teQlsiFzhDvvQvFIdByw1yMeG/JT+jboqaiPZE9G7avLFJHDUzXwHcAJxCCC8tLoJjjIv3/vnDasVqXARXMKV0d85drLgY7oWr4B64GrbiJtiC94Y/AJaWZ2aCVze8Ga1JqWELqoatqArugYrhnPOhlFLn8w6AqKfrmS7uMTMfATwAnFtu79YnIoa1v5G54glrE5g91iYnPjcs6i/QQ1kfY+LvygAAAABJRU5ErkJggg=="/>
                        </a>
                    </c:if>
                    <!--마지막 page로 이동 -->
                    <a href="search.do?page=${maxpage}&keyword=${keyword}">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAuUlEQVRIS+2UsQ0DIQxFjQR9NklGSDbIPhRxA3U2yQi5EZJNUgOSI3dRBPgkg645SrD+8/8WNjD5mMn6sAPEhLeNKISAOec7In5qrYYQiO+9981Gmw8sDgA3AHjlnC81iAqAiAdr7WKMObYgKgBblyBqgAQZAuhBhgKcc08AOBHRu5Ry5qEPAfAcauLsTA3oiasBkrgaEGO8EtHjN/P/36yOiCEppWXKqhDX5MqCbbfpyia7ZbsDMcUvbJmsGRiNZuQAAAAASUVORK5CYII="/>
                    </a>
                </div><!--// nav-->
                </c:if>

                <c:if test="${empty searchList}"><!--검색결과가 없으면 -->
                   <div class="no_result"> 검색결과가 없습니다. </div>
                </c:if>
            </section><!-- // search_wrap -->
        </form>
    </main><!-- // my_content -->


</div><!-- // search_results -->
</div><!-- // home_content -->

<script type="text/javascript">
    let btn = document.querySelector("#btn");
    let sidebar = document.querySelector(".sidebar");
    let searchBtn = document.querySelector(".bx-search");

    btn.onclick = function() {
        sidebar.classList.toggle("active");
        if(btn.classList.contains("bx-menu")){
            btn.classList.replace("bx-menu" , "bx-menu-alt-left");
        }else{
            btn.classList.replace("bx-menu-alt-left", "bx-menu");
        }
    }

    searchBtn.onclick = function() {
        sidebar.classList.toggle("active");
    }

</script>
</body>
</html>