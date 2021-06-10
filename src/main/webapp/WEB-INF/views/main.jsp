<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0" />
    <title>meeton</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../../css/default/reset.css">
    <link rel="stylesheet" type="text/css" href="../../css/main/slidebar.css">
    <link rel="stylesheet" type="text/css" href="../../css/main/main.css">

    <!-- js -->
    <!-- <script src="https://code.jquery.com/jquery-latest.js"></script> -->
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="../../js/main/main.js"></script>
    <script src="../../js/main/jquery.bxslider.js"></script>

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


<div class="home_content">
    <!-- 구독 즐겨찾기 -->
    <div class="main-my"><!-- main-my -->
        <div class="main-chart-desc">
            <span>My 구독&즐겨찾기</span>
        </div>

        <!-- 메인 슬라이드 스크립트 -->
        <script type="text/javascript">
            $(document).ready(function(){
                $('.my_chbmk').bxSlider({
                    slideWidth: 300,
                    minSlides: 4,
                    maxSlides: 4,
                    auto:true,
                    autoHover:true,
                    slideMargin:22
                });
            });
        </script>

        <section class="main_chbmk_wrap"><!-- main_chbmk_wrap -->
            <div class="my_chbmk"><!-- my_chbmk -->
                <c:forEach var="f" items="${favoriteList}">
                <div class="chbmk_item">
                    <a href="channel.do?channelnum=${f.channelnum}">
                        <div class="profile_img">
                            <img src="./imgUpload/${f.profile}" alt="${f.profile}" /><!--프로필-->
                        </div>
                        <div class="chbmk_mybox_name">${f.aka}</div><!--채널이름-->
                    </a>
                    <div class="chbmk_mybox_desc"><!--채널타입-->
                        <c:if test="${f.type == 'subscript'}">
                            구독 채널입니다.
                        </c:if>
                        <c:if test="${f.type == 'bookmark'}">
                            즐겨찾기 채널입니다.
                        </c:if>
                    </div>
                </div>
                </c:forEach>
            </div><!-- // my_chbmk -->
        </section><!-- // main_chbmk_wrap -->
    </div><!-- // main-my -->

    <!-- 영상/채널 차트 -->
    <div class="main-tab-content"><!-- main-tab-content -->

        <div class="main-nav"><!-- main-nav -->
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
        </div><!-- // main-nav -->

        <!-- video chart -->
        <div class="main-chart main-tab1"><!-- main-chart -->
            <div class="main-video-top"><!-- "main-video-top -->
                <div class="main-chart-desc">
                    <span>영상 100차트</span>
                </div>
                <div class="main-video-popgroup"><!-- main-video-popgroup -->
                    <!--videoList TOP3 출력 -->
                    <c:set var="vrank" value="1" />
                    <c:forEach var="v" items="${videoList}" begin="0" end="2" step="1">
                        <div class="main-video-box-ver1">
                            <div class="main-video-img-ver1">
                                <a href="video.do?videonum=${v.videonum}">
                                    <video muted="muted" volume="0" poster="../../imgUpload/${v.thumbnail}" class="background_video">
                                        <source src="../../videoUpload/${v.videofile}" type="video/mp4" />
                                        <source src="../../videoUpload/${v.videofile}" type="video/webm" />
                                        <source src="../../videoUpload/${v.videofile}" type="video/ogg" />
                                    </video>
                                </a>
                            </div>
                            <!-- 1순위 -->
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
                                <span class="cds_ifc cnp"><!--조회수-->
                                    <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                    ${v.views}
                                </span>
                                <span class="cds_ifc bch"><!--좋아요수-->
                                    <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                        ${v.likes}
                                </span>
                            </div>
                        </div><!--main-video-box-ver1 end-->
                    </c:forEach>
                    <%--
                    <div class="main-video-box-ver1">
                        <div class="main-video-img-ver1">
                            <a href="#">
                                <video muted="muted" volume="0" poster="" class="background_video">
                                    <source src="/images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="/images/video/testvideo.mp4" type="video/webm" />
                                    <source src="/images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                        </div>
                        <!-- 2순위 -->
                        <div class="main-video-desc-ver1">
                            <div class="main-video-rank-ver1">2</div>
                            <ul class="main-video-info-ver1">
                                <li>
                                    <a href="#">영상제목</a>
                                </li>
                                <li>
                                    <a href="#">20시간전</a>
                                </li>
                                <li>
                                    <a href="#">채널이름</a>
                                </li>
                            </ul>
                        </div>
                        <div class="main-video-viewlike-ver1">
                            <span class="cds_ifc cnp">
                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                158,079
                            </span>
                            <span class="cds_ifc bch">
                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                    1,405
                            </span>
                        </div>
                    </div><!--main-video-box-ver1 end-->
                    <div class="main-video-box-ver1">
                        <div class="main-video-img-ver1">
                            <a href="#">
                                <video muted="muted" volume="0" poster="" class="background_video">
                                    <source src="/images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="/images/video/testvideo.mp4" type="video/webm" />
                                    <source src="/images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                        </div>
                        <!-- 3순위 -->
                        <div class="main-video-desc-ver1">
                            <div class="main-video-rank-ver1">3</div>
                            <ul class="main-video-info-ver1">
                                <li>
                                    <a href="#">영상제목</a>
                                </li>
                                <li>
                                    <a href="#">20시간전</a>
                                </li>
                                <li>
                                    <a href="#">채널이름</a>
                                </li>
                            </ul>
                        </div>
                        <div class="main-video-viewlike-ver1">
                            <span class="cds_ifc cnp">
                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                158,079
                            </span>
                            <span class="cds_ifc bch">
                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                    1,405
                            </span>
                        </div>
                    </div><!--main-video-box-ver1 end-->
                    --%>
                </div><!-- // main-video-popgroup -->
            </div><!--main-video-top end-->

            <!--videoList 나머지 출력 -->
            <div class="main-video-bottom">
                <c:forEach var="v" items="${videoList}" begin="3" end="99" step="1">
                    <div class="main-video-box-ver2">
                        <div class="main-video-img-ver2">
                            <a href="video.do?videonum=${v.videonum}">
                                <img src="../../imgUpload/${v.thumbnail}" />
                            </a>
                            <div class="main-video-time">22:00</div>
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
                                <span class="cds_ifc cnp">
                                    <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                    ${v.views}
                                </span>
                                <span class="cds_ifc bch">
                                    <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                    ${v.likes}
                                </span>
                            </div>
                        </div>
                    </div><!--main-video-box-ver2 end-->
                </c:forEach>
                <%--
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <a href="#">
                            <img src="images/videobackground2.png" />
                        </a>
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>
                                <a href="#">영상제목</a>
                            </li>
                            <li>
                                <a href="#">20시간전</a>
                            </li>
                            <li>
                                <a href="#">채널이름</a>
                            </li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span class="cds_ifc cnp">
                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                158,079
                            </span>
                            <span class="cds_ifc bch">
                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                    1,405
                            </span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <a href="#">
                            <img src="images/videobackground2.png" />
                        </a>
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>
                                <a href="#">영상제목</a>
                            </li>
                            <li>
                                <a href="#">20시간전</a>
                            </li>
                            <li>
                                <a href="#">채널이름</a>
                            </li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span class="cds_ifc cnp">
                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                158,079
                            </span>
                            <span class="cds_ifc bch">
                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                    1,405
                            </span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <a href="#">
                            <img src="images/videobackground2.png" />
                        </a>
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>
                                <a href="#">영상제목</a>
                            </li>
                            <li>
                                <a href="#">20시간전</a>
                            </li>
                            <li>
                                <a href="#">채널이름</a>
                            </li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span class="cds_ifc cnp">
                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                158,079
                            </span>
                            <span class="cds_ifc bch">
                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                    1,405
                            </span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                --%>
            </div><!--main-video-bottom end-->
        </div><!-- // main-chart -->

        <!-- 채널 차트 -->
        <div class="main-chart main-tab2"><!-- channel chart -->
            <div class="main-chart-desc">
                <span>인기 채널 10위</span>
            </div>
            <div class="main-channel-popgroup"><!-- main-channel-popgroup -->
                <!--channelList TOP 10 출력-->
                <c:set var="crank" value="1" />
                <c:forEach var="c" items="${channelList}">
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <a href="#">
                            <img src="../../imgUpload/${c.profile}" alt="${c.profile}" /><!--프로필-->
                            <div class="main-channel-name">${c.aka}</div><!--채널이름-->
                        </a>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">${crank}</div><!--랭킹-->
                        <c:set var="crank" value="${crank + 1}" />
                        <div class="main-channel-subsc">구독자 : ${c.subscribers} </div><!--구독자수-->
                    </div>
                </div><!--main-channel-box end-->
                </c:forEach>
                <%--
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">2</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">3</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">4</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">5</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">6</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">7</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">8</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">9</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="images/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">10</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                --%>
            </div><!-- // main-channel-popgroup -->
        </div><!-- // channel chart -->

    </div><!-- // main-tab-content end -->
</div>

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
<%--<%@include file="footer.jsp"%>--%>
</body>
</html>