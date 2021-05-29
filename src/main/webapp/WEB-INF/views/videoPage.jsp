<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<heade>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>업로드 영상 보드</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="./css/default/import.css">
    <link rel="stylesheet" type="text/css" href="./css/channel/videoPage.css">

    <!-- js -->


    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</heade>
<body>
<header>헤드자리</header>
<div id="channel_wrap" class="channel">
    <!-- side_wrap -->
    <div class="side_wrap">
        <div class="side_inner"><!-- side_inner -->
            <div class="channel_profile"><!-- channel_profile -->
                <div class="profile_img">
                        <span>
                            <img src="data:image/png;base64,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"/>
                        </span>
                </div>
                <div class="channel_name">
                    <dl>
                        <dt class="channel_aka">채널 닉네임</dt>
                        <dd class="channel_email">@가입한 아이디</dd>
                    </dl>
                </div>
            </div><!-- // channel_profile -->
            <div class="direct_msg"><!-- direct_msg -->
                <a href="#" class="btn">
                    <button type="button" value="dmmsg">
                        메시지
                    </button>
                </a>
            </div><!-- // direct_msg -->
            <div class="kategorie"><!-- kategorie -->
                <ul class="kategorie_title">
                    <a href="#"><li class="upload_video">업로드 영상보기</li></a>
                    <a href="#" class="allVideo"><li class="all_video">전체영상</li></a>
                </ul>
            </div><!-- // kategorie -->
        </div><!-- //side_inner -->
    </div>
    <!-- // side_wrap -->
    <div class="main_wrap"><!-- main_wrap -->
        <form>
            <section class="video_page_info"><!-- video_page_info -->
                <div class="video_page_title"><!-- video_page_info -->
                    <h2>업로드 영상 보기</h2>
                </div><!-- // video_page_info -->
                <div class="video_page_desc"><!-- video_page_desc -->
                    <div class="video_page_sq"><!-- video_page_sq -->
                        <span class="video_sequence">75</span>
                        <span>개의 업로드 영상</span>
                    </div><!-- // video_page_sq -->
                    <div class="video_page_filter"><!-- video_page_filter -->
                        <div class="btn_page"><!-- 전체기간 / btn_page -->
                            <label for="overall_period"></label>
                            <select id="overall_period" name="overall_period" aria-label="전체기간">
                                <option value="00" selected="selected">전체 기간</option>
                                <option value="1">3개월</option>
                                <option value="2">6개월</option>
                                <option value="3">1년</option>
                            </select>
                        </div><!-- // 전체기간 / btn_page -->
                        <div class="btn_page"><!-- 최신순 / btn_page -->
                            <label for="data_time"></label>
                            <select id="data_time" name="data_time" aria-label="최신순">
                                <option value="00" selected="selected">최신순</option>
                                <option value="1">오래된순</option>
                                <option value="2">조회순</option>
                                <option value="3">댓글순</option>
                                <option value="4">인기순</option>
                            </select>
                        </div><!-- // 최신순 / btn_page -->
                        <div class="btn_page"><!-- 뷰 리스트 / btn_page -->
                            <label for="page_view_list"></label>
                            <select id="page_view_list" name="page_view_list" aria-label="뷰리스트">
                                <option value="00" selected="selected">20</option>
                                <option value="1">40</option>
                                <option value="2">60</option>
                            </select>
                        </div><!-- // 뷰 리스트 / btn_page -->
                    </div><!-- // video_page_filter -->

                </div><!-- // video_page_desc -->
            </section><!-- // video_page_info -->
            <section class="upload_video_board"><!-- upload_video_board -->
                <div class="upload_list"><!-- upload_list -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <!-- --- -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <!-- --- -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <!-- --- -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <!-- --- -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                    <div class="chUp"><!-- chUp -->
                        <div class="chUp_video">
                            <a href="#">
                                <video muted="muted" poster=" " preload="metadata" controls ><!-- controls : 동영상 체크  -->
                                    <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                    <source src="./images/video/testvideo.mp4" type="video/webm" />
                                    <source src="./images/video/testvideo.mp4" type="video/ogg" />
                                </video>
                            </a>
                            <div class="video_time">22:00</div>
                        </div>
                        <div class="chUp_desc">
                            <div class="chUp_video_name">
                                <a href="#">방송제목</a>
                            </div>
                            <ul class="chUp_video_data">
                                <li class="chUp_playSq">
                                        <span class="cds_ifc cnp">
                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        </span>
                                    158,079
                                </li>
                                <li class="chUp_time">
                                    2021.11.15
                                </li>
                            </ul>
                        </div>
                    </div><!-- // chUp -->
                </div><!-- // upload_list -->
            </section><!-- // upload_video_board -->
            <div class="board_paging"><!-- board_paging -->
                1
            </div><!-- // board_paging -->
            <div class="board_search"><!-- board_search -->
                <div class="select_box active"><!-- select-box active -->
                    <label for="select_box"></label>
                    <select id="select_box" name="select_box" aria-label="제목+내용">
                        <option value="00" selected="selected">제목+내용</option>
                        <option value="1">제목</option>
                        <option value="2">내용</option>
                    </select>
                </div><!-- // select-box active -->
                <div class="search_box">
                    <div class="search_text">
                        <input type="text" id="search_board" name="search_board" />
                    </div>
                    <div class="search_Btn">
                        <input type="submit" value="검색">
                    </div>
                </div>
            </div><!-- // board_search -->
        </form>
    </div><!-- // main_wrap -->
</div><!-- channel_wrap -->
</body>
</html>