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
    <link rel="stylesheet" type="text/css" href="css/default/import.css">
    <link rel="stylesheet" type="text/css" href="css/search/search.css" />

    <!-- js -->
    <!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
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
                    <c:forEach var="navNum" begin="${startpage}" end="${endpage}" >
                        <c:if test="${navNum == page }">
                           <span> ${navNum} </span>
                        </c:if>
                        <c:if test="${navNum != page }">
                            <a href="search.do?page=${navNum}&keyword=${keyword}"> <span> ${navNum} </span> </a>
                        </c:if>
                    </c:forEach>
                </div><!--// nav-->
                </c:if>

                <c:if test="${empty searchList}"><!--검색결과가 없으면 -->
                   <div class="no_result"> 검색결과가 없습니다. </div>
                </c:if>
            </section><!-- // search_wrap -->
        </form>
    </main><!-- // my_content -->


</div><!-- // search_results -->

</body>
</html>