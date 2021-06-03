<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>사이드바</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/default/import.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/default/sidebar.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/default/main.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <!-- <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/main/sideba.js"></script> -->
    <script src="/js/main/testmain.js"></script>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
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
            <a href="#" class="nav-home">
                <i class='bx bx-home' ></i>
                <span class="links_name">Home</span>
            </a>
            <span class="tooltip">홈</span>
        </li><!-- //home -->
        <li><!-- MY -->
            <a href="#" class="nav-my">
                <i class='bx bx-star' ></i>
                <span class="links_name">MY</span>
            </a>
            <span class="tooltip">MY</span>
        </li><!-- //MY -->
        <li><!-- PlayList -->
            <a href="#" class="nav-my">
                <i class='bx bx-list-check'></i>
                <span class="links_name">PlayList</span>
            </a>
            <span class="tooltip">시청기록</span>
        </li><!-- //MY -->
        <li><!-- 구독 -->
            <a href="#" class="nav-subs">
                <i class='bx bx-movie-play' ></i>
                <span class="links_name">Subscription</span>
            </a>
            <span class="tooltip">구독</span>
        </li><!-- //구독 -->
    </ul>
</div>

<div class="home_content">
    <div class="text">메인 컨텐츠</div>
    <div class="main-my"> <!-- main-my -->
        <div class="main-my-bar">
            <div class="main-chart-desc">
                <span>My 구독&즐겨찾기</span>
            </div>
            <div class="main-my-slide">
                <div class="main-my-slide-button">
                    <img src="image/chevron_left.png" />
                </div>
                <div class="main-mybox">
                    <div class="main-mybox-profile">
                        <img src="" />
                    </div>
                    <div class="main-mybox-name">채널이름</div>
                    <div class="main-mybox-desc">구독채널입니다.</div>
                </div>
                <div class="main-my-slide-button">
                    <img src="image/chevron_right.png" />
                </div>

            </div>
        </div>
    </div> <!-- // main-my -->
    <!-- main-tab-content -->
    <div class="main-tab-content">
        <!-- main navigation -->
        <div class="main-nav"> <!-- main-nav -->
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
            <div class="main-video-top">
                <div class="main-chart-desc">
                    <span>영상 100차트</span>
                </div>
                <div class="main-video-popgroup">
                    <div class="main-video-box-ver1">
                        <div class="main-video-img-ver1"><img src="image/videobackground.png" /></div>
                        <div class="main-video-desc-ver1">
                            <div class="main-video-rank-ver1">1</div>
                            <ul class="main-video-info-ver1">
                                <li>영상제목</li>
                                <li>20시간전</li>
                                <li>채널이름</li>
                            </ul>
                        </div>
                        <div class="main-video-viewlike-ver1">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div><!--main-video-box-ver1 end-->
                    <div class="main-video-box-ver1">
                        <div class="main-video-img-ver1"><img src="image/videobackground.png" /></div>
                        <div class="main-video-desc-ver1">
                            <div class="main-video-rank-ver1">2</div>
                            <ul class="main-video-info-ver1">
                                <li>영상제목</li>
                                <li>20시간전</li>
                                <li>채널이름</li>
                            </ul>
                        </div>
                        <div class="main-video-viewlike-ver1">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div><!--main-video-box-ver1 end-->
                    <div class="main-video-box-ver1">
                        <div class="main-video-img-ver1"><img src="image/videobackground.png" /></div>
                        <div class="main-video-desc-ver1">
                            <div class="main-video-rank-ver1">3</div>
                            <ul class="main-video-info-ver1">
                                <li>영상제목</li>
                                <li>20시간전</li>
                                <li>채널이름</li>
                            </ul>
                        </div>
                        <div class="main-video-viewlike-ver1">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div><!--main-video-box-ver1 end-->
                </div>
            </div><!--main-video-top end-->
            <div class="main-video-bottom">
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
                <div class="main-video-box-ver2">
                    <div class="main-video-img-ver2">
                        <img src="image/videobackground2.png" />
                        <div class="main-video-time">22:00</div>
                    </div>
                    <div class="main-video-rank-ver2">4</div>
                    <div class="main-video-desc-ver2">
                        <ul class="main-video-info-ver2">
                            <li>영상제목</li>
                            <li>20시간전</li>
                            <li>채널이름</li>
                        </ul>
                        <div class="main-video-viewlike-ver2">
                            <span><img src="image/views.png" />12500</span>
                            <span><img src="image/heart-solid.png" />25700</span>
                        </div>
                    </div>
                </div><!--main-video-box-ver2 end-->
            </div><!--main-video-bottom end-->
        </div><!-- // main-chart -->
        <!-- channel chart -->
        <div class="main-chart main-tab2"><!-- main-chart -->
            <div class="main-chart-desc">
                <span>인기 채널 10위</span>
            </div>
            <div class="main-channel-popgroup">
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">1</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">2</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">3</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">4</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">5</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">6</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">7</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">8</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">9</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
                <div class="main-channel-box">
                    <div class="main-channel-img">
                        <img src="image/channelbackground.png" />
                        <div class="main-channel-name">채널이름</div>
                    </div>
                    <div class="main-channel-desc">
                        <div class="main-channel-rank">10</div>
                        <div class="main-channel-subsc">구독자 : 68,089</div>
                    </div>
                </div><!--main-channel-box end-->
            </div>
        </div><!-- // main-chart -->
    </div><!--main-tab-content end-->

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

</body>
</html>
