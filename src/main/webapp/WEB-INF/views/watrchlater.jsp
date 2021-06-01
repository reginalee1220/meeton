<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>나중에 볼 영상</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/default/import.css">
    <link rel="stylesheet" type="text/css" href="/css/mypick/watchlater.css">
    <link rel="stylesheet" type="text/css" href="/css/default/sidebar.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="/js/mypick/button.js"></script>
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
                <span class="links_name">홈</span>
            </a>
            <span class="tooltip">Home</span>
        </li><!-- //home -->
        <li><!-- MY -->
            <a href="#" class="nav-my">
                <i class='bx bx-star' ></i>
                <span class="links_name">MY</span>
            </a>
            <span class="tooltip">MY</span>
        </li><!-- //MY -->
        <li><!-- 구독 -->
            <a href="#" class="nav-subs">
                <i class='bx bx-movie-play' ></i>
                <span class="links_name">구독</span>
            </a>
            <span class="tooltip">Subscription</span>
        </li><!-- //구독 -->
    </ul>
</div>


<div class="home_content"><!-- home_content -->
<div id="mypick"><!-- mypick -->
    <div class="watchlater_title"><!-- watchlater_title -->
        <div class="watchlater_title_inner">
            <h2>나중에 볼 영상</h2>
        </div>
    </div><!-- // watchlater_title -->
    <main class="my_content"><!-- main_content -->
        <div class="btn_video_nav" id="video_nav"><!-- btn_video_nav -->
            <ul class="tablist">
                <li class="history" id="on_likedvideo">
                    <a href="history.html">최근에 본 영상</a>
                </li>
                <li class="watchlater">
                    <a href="watchlater.html">나중에 볼 영상</a> <!-- 현재 페이지 -->
                </li>
                <li class="likedvideo" >
                    <a href="likedvideo.html">좋아요 한 영상</a>
                </li>
            </ul>
        </div><!-- // btn_video_nav -->
        <section class="myplaylist_wrap"><!-- myplaylist_wrap -->
            <form>
                <div class="edit_btn"><!-- edit_btn -->
                    <input type="button" id="btn_mod_recent" class="btn btn_mod" value="편집">
                    <div id="btn_success">
                        <input type="button" id="btn_all_recent" class="btn btn_all" value="전체선택">
                        <input type="submit" id="btn_delete_recent" class="btn btn_delete" value="삭제">
                    </div>
                </div><!-- // edit_btn -->
                <div class="video_list"><!-- video_list -->
                    <div class="video_view"><!-- video_view -->
                        <div class="my_video_check"><!-- my_video_check -->
                            <label>
                                <input type="checkbox" name="myplaylist" value="영상체크" />
                            </label>
                        </div><!-- // my_video_check -->
                        <div class="main_video"><!-- main_video -->
                            <div class="main_video_img"><!-- main_video_img -->
                                <div class="video_play_view"><!-- video_play_view -->
                                    <div class="video_play">
                                        <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                                        <video id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                            <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                            <source src="./images/video/testvideo.mp4" type="video/webm" />
                                            <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                        </video>
                                    </div>
                                </div><!-- // video_play_view -->
                                <div class="main_video_time">22:00</div>
                            </div>
                            <div class="desc"><!-- desc -->
                                <ul class="desc_inner">
                                    <li class="vd_text">
                                        <a href="#" data-event="clickTitle" data-clickcode="#" data-move_uri="#">
                                            영상 제목
                                        </a>
                                    </li>
                                    <li class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="#" data-move_uri="#">
                                            영상 채널명
                                        </a>
                                    </li>
                                    <li class="play_like">
                                            <span class="cds_ifc cnp">
                                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                                158,079
                                            </span>
                                        <span class="cds_ifc bch">
                                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                                    1,405
                                            </span>
                                    </li>
                                </ul>
                            </div><!-- // desc -->
                        </div><!-- // main_video -->
                    </div><!-- // video_view -->

                    <div class="video_view"><!-- video_view -->
                        <div class="my_video_check"><!-- my_video_check -->
                            <label>
                                <input type="checkbox" name="myplaylist" value="영상체크" />
                            </label>
                        </div><!-- // my_video_check -->
                        <div class="main_video"><!-- main_video -->
                            <div class="main_video_img"><!-- main_video_img -->
                                <div class="video_play_view"><!-- video_play_view -->
                                    <div class="video_play">
                                        <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                                        <video id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                            <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                            <source src="./images/video/testvideo.mp4" type="video/webm" />
                                            <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                        </video>
                                    </div>
                                </div><!-- // video_play_view -->
                                <div class="main_video_time">22:00</div>
                            </div>
                            <div class="desc"><!-- desc -->
                                <ul class="desc_inner">
                                    <li class="vd_text">
                                        <a href="#" data-event="clickTitle" data-clickcode="#" data-move_uri="#">
                                            영상 제목
                                        </a>
                                    </li>
                                    <li class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="#" data-move_uri="#">
                                            영상 채널명
                                        </a>
                                    </li>
                                    <li class="play_like">
                                            <span class="cds_ifc cnp">
                                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                                158,079
                                            </span>
                                        <span class="cds_ifc bch">
                                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                                    1,405
                                            </span>
                                    </li>
                                </ul>
                            </div><!-- // desc -->
                        </div><!-- // main_video -->
                    </div><!-- // video_view -->

                    <div class="video_view"><!-- video_view -->
                        <div class="my_video_check"><!-- my_video_check -->
                            <label>
                                <input type="checkbox" name="myplaylist" value="영상체크" />
                            </label>
                        </div><!-- // my_video_check -->
                        <div class="main_video"><!-- main_video -->
                            <div class="main_video_img"><!-- main_video_img -->
                                <div class="video_play_view"><!-- video_play_view -->
                                    <div class="video_play">
                                        <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                                        <video id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                            <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                            <source src="./images/video/testvideo.mp4" type="video/webm" />
                                            <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                        </video>
                                    </div>
                                </div><!-- // video_play_view -->
                                <div class="main_video_time">22:00</div>
                            </div>
                            <div class="desc"><!-- desc -->
                                <ul class="desc_inner">
                                    <li class="vd_text">
                                        <a href="#" data-event="clickTitle" data-clickcode="#" data-move_uri="#">
                                            영상 제목
                                        </a>
                                    </li>
                                    <li class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="#" data-move_uri="#">
                                            영상 채널명
                                        </a>
                                    </li>
                                    <li class="play_like">
                                            <span class="cds_ifc cnp">
                                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                                158,079
                                            </span>
                                        <span class="cds_ifc bch">
                                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                                    1,405
                                            </span>
                                    </li>
                                </ul>
                            </div><!-- // desc -->
                        </div><!-- // main_video -->
                    </div><!-- // video_view -->

                    <div class="video_view"><!-- video_view -->
                        <div class="my_video_check"><!-- my_video_check -->
                            <label>
                                <input type="checkbox" name="myplaylist" value="영상체크" />
                            </label>
                        </div><!-- // my_video_check -->
                        <div class="main_video"><!-- main_video -->
                            <div class="main_video_img"><!-- main_video_img -->
                                <div class="video_play_view"><!-- video_play_view -->
                                    <div class="video_play">
                                        <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                                        <video id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                            <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                            <source src="./images/video/testvideo.mp4" type="video/webm" />
                                            <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                        </video>
                                    </div>
                                </div><!-- // video_play_view -->
                                <div class="main_video_time">22:00</div>
                            </div>
                            <div class="desc"><!-- desc -->
                                <ul class="desc_inner">
                                    <li class="vd_text">
                                        <a href="#" data-event="clickTitle" data-clickcode="#" data-move_uri="#">
                                            영상 제목
                                        </a>
                                    </li>
                                    <li class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="#" data-move_uri="#">
                                            영상 채널명
                                        </a>
                                    </li>
                                    <li class="play_like">
                                            <span class="cds_ifc cnp">
                                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                                158,079
                                            </span>
                                        <span class="cds_ifc bch">
                                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                                    1,405
                                            </span>
                                    </li>
                                </ul>
                            </div><!-- // desc -->
                        </div><!-- // main_video -->
                    </div><!-- // video_view -->

                    <div class="video_view"><!-- video_view -->
                        <div class="my_video_check"><!-- my_video_check -->
                            <label>
                                <input type="checkbox" name="myplaylist" value="영상체크" />
                            </label>
                        </div><!-- // my_video_check -->
                        <div class="main_video"><!-- main_video -->
                            <div class="main_video_img"><!-- main_video_img -->
                                <div class="video_play_view"><!-- video_play_view -->
                                    <div class="video_play">
                                        <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                                        <video id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                            <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                            <source src="./images/video/testvideo.mp4" type="video/webm" />
                                            <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                        </video>
                                    </div>
                                </div><!-- // video_play_view -->
                                <div class="main_video_time">22:00</div>
                            </div>
                            <div class="desc"><!-- desc -->
                                <ul class="desc_inner">
                                    <li class="vd_text">
                                        <a href="#" data-event="clickTitle" data-clickcode="#" data-move_uri="#">
                                            영상 제목
                                        </a>
                                    </li>
                                    <li class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="#" data-move_uri="#">
                                            영상 채널명
                                        </a>
                                    </li>
                                    <li class="play_like">
                                            <span class="cds_ifc cnp">
                                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                                158,079
                                            </span>
                                        <span class="cds_ifc bch">
                                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                                    1,405
                                            </span>
                                    </li>
                                </ul>
                            </div><!-- // desc -->
                        </div><!-- // main_video -->
                    </div><!-- // video_view -->

                    <div class="video_view"><!-- video_view -->
                        <div class="my_video_check"><!-- my_video_check -->
                            <label>
                                <input type="checkbox" name="myplaylist" value="영상체크" />
                            </label>
                        </div><!-- // my_video_check -->
                        <div class="main_video"><!-- main_video -->
                            <div class="main_video_img"><!-- main_video_img -->
                                <div class="video_play_view"><!-- video_play_view -->
                                    <div class="video_play">
                                        <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                                        <video id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                            <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                            <source src="./images/video/testvideo.mp4" type="video/webm" />
                                            <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                        </video>
                                    </div>
                                </div><!-- // video_play_view -->
                                <div class="main_video_time">22:00</div>
                            </div>
                            <div class="desc"><!-- desc -->
                                <ul class="desc_inner">
                                    <li class="vd_text">
                                        <a href="#" data-event="clickTitle" data-clickcode="#" data-move_uri="#">
                                            영상 제목
                                        </a>
                                    </li>
                                    <li class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="#" data-move_uri="#">
                                            영상 채널명
                                        </a>
                                    </li>
                                    <li class="play_like">
                                            <span class="cds_ifc cnp">
                                                <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                                158,079
                                            </span>
                                        <span class="cds_ifc bch">
                                                <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                                    1,405
                                            </span>
                                    </li>
                                </ul>
                            </div><!-- // desc -->
                        </div><!-- // main_video -->
                    </div><!-- // video_view -->

                </div><!-- // video_list -->
            </form>
        </section><!-- // myplaylist_wrap -->

    </main><!-- // main_content -->


</div><!-- // mypick -->
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