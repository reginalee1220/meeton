<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>영상보기</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="./css/default/import.css">
    <link rel="stylesheet" type="text/css" href="./css/channel/video.css" />

    <!-- js -->
    <!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
    <script src="./js/channel/more.js"></script>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<div class="head"><!-- head -->
    헤더
</div><!-- // head -->
<div id="video" class="video_wrap"><!-- video -->
    <main class="video_main_inner"><!-- video_main_inner -->
        <section class="video_contents"><!-- video_contents -->
            <form>
                <div class="video_play_view"><!-- video_play_view -->
                    <div class="video_play">
                        <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                        <video class="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                            <source src="./images/video/testvideo.mp4" type="video/mp4" />
                            <source src="./images/video/testvideo.mp4" type="video/webm" />
                            <source src="./images/video/testvideo.mp4" type="video/ogg" />
                        </video>
                    </div>
                </div><!-- // video_play_view -->
                <div class="video_play_info"><!-- video_play_info -->
                    <div class="infoin"><!-- infoin -->
                        <div class="info_ppt"><!--  채널정보, 영상 제목 -->
                            <div class="channel_profile"><!-- channel_profile -->
                                <a href="#">
                                    <span><img src="/images/profile/profile-img.jpeg" /></span>
                                </a>
                            </div><!-- // channel_profile -->
                            <div class="aka_videoName"><!-- aka_videoName -->
                                <ul class="an">
                                    <a href="#"><li class="aka">채널이름</li></a>
                                    <a href="#"><li class="videoName">영상제목</li></a>
                                </ul>
                            </div><!-- // aka_videoName -->
                        </div><!-- //  채널정보, 영상 제목 -->
                        <div class="behavior"><!-- 유저행동 -->
                            <button type="button" id="btnLater" class="beBTN"><!-- 나중에 볼 영상 -->
                                <box-icon name='time' class="bx_box" >
                                    <i class='bx bx-time' ></i>
                                    <span class="tooltip">나중에 볼 영상</span>
                                </box-icon>
                            </button>
                            <button type="button" id="btnSubs" class="beBTN"><!-- 구독 여부 -->
                                <box-icon name='donate-heart' class="bx_box" >
                                    <i class='bx bx-donate-heart' ></i>
                                    <span class="tooltip">구독</span>
                                </box-icon>
                            </button>
                            <button type="button" id="btnBmk" class="beBTN"><!-- 즐겨찾기 여부 -->
                                <box-icon name='star' class="bx_box" >
                                    <i class='bx bx-star'></i>
                                    <span class="tooltip">즐겨찾기</span>
                                </box-icon>
                            </button>
                            <button type="button" id="btnLike" class="beBTN"><!-- 좋아요 -->
                                <box-icon name='like' class="bx_box" >
                                    <i class='bx bx-like' ></i>
                                    <span class="tooltip">좋아요</span>
                                </box-icon>
                            </button>
                            <!-- 카카오톡 공유 -->
                            <!-- <a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">카카오톡<box-icon name='share-alt' ><i class='bx bx-share-alt' ></i></box-icon></a>  -->
                        </div><!-- // 유저행동 -->
                    </div><!-- // infoin -->

                    <div class="video_result"><!-- 좋아요수, 댓글수, 재생수 -->
                        <ul>
                            <li class="up">
                                    <span class="cds_ifc cnl">
                                        <i class='bx bx-like'></i>
                                        100
                                    </span>
                            </li>
                            <li class="cm">
                                    <span class="cds_ifc cnc">
                                        <i class='bx bx-comment-detail' ></i>
                                        22
                                    </span>
                            </li>
                            <li class="playsq">
                                    <span class="cds_ifc cnp">
                                        <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                        158,079
                                    </span>
                            </li>
                        </ul>
                    </div><!-- // 좋아요수, 댓글수, 재생수 -->

                </div><!-- // video_play_info -->

                <div class="video_comment"><!-- video_comment -->
                    <div class="cm_input"><!-- cm_input -->
                        <div class="cm_squ"><!-- comment_squ -->
                            <span>댓글</span>
                            <span class="comq">77</span>
                        </div><!-- // comment_squ -->

                        <div class="cm_form"><!-- cm_form -->
                            <div class="channel_profile"><!-- channel_profile -->
                                <a href="#">
                                    <span><img src="/images/profile/coco.jpg" /></span>
                                </a>
                            </div><!-- // channel_profile -->
                            <div class="cm_fm"><!-- 댓글 입력 & 등록버튼 -->
                                <div class="cm_fm_in">
                                    <label for="comment"></label>
                                    <input id="comment" class="cm_cont" type="text" name="comment" placeholder="댓글 입력..." >
                                </div>
                                <div class="cmt_btn">
                                    <button id="btn_insert_cmt" >등록</button>
                                </div>
                            </div><!-- // 댓글 입력 & 등록버튼 -->
                        </div><!-- // cm_form -->

                    </div><!-- // cm_input -->

                    <div class="cm_list"><!-- cm_list -->
                        <div class="cm_line"><!-- cm_line -->
                            <div class="cm_inf"><!-- cm_inf -->
                                <div class="channel_profile"><!-- channel_profile -->
                                    <a href="#">
                                        <span><img src="/images/profile/coco.jpg" /></span>
                                    </a>
                                </div><!-- // channel_profile -->
                                <div class="cm_inf_conwrap"><!-- 댓글정보 , 댓글좋아요, 댓글신고, 댓글고정 -->
                                    <div class="cm_inf_con"><!-- cm_inf_con -->
                                        <a href="#"><span class="cm_aka">댓글닉네임</span></a>
                                        <a href="#"><span class="cm_id">(dkdlel123)</span></a>
                                        <a href="#"><span class="cm_ymd">2021-11-15</span></a>
                                        <a href="#"><span class="cm_time">13:15:30</span></a>
                                    </div><!-- // cm_inf_con -->

                                    <div class="cm_up_more"><!-- cm_up_more -->
                                        <div class="cm_up"><!-- cm_up -->
                                            <button type="button">
                                                <i class='bx bx-like'></i>
                                            </button>
                                            <span class="cds_ifc cnl">
                                                    7
                                                </span>
                                        </div><!-- // cm_up -->

                                        <div class="cm_more"><!-- cm_more -->
                                            <span id="toc-toggle" class="cm_more_btn" onclick="openCloseToc()">
                                                    <i class='bx bx-dots-vertical-rounded' ></i>
                                                </span>
                                            <ul id="toc-content">
                                                <li>댓글신고</li>
                                                <li>댓글고정</li>
                                            </ul>
                                        </div><!-- // cm_more -->
                                    </div><!-- // cm_up_more -->

                                </div><!-- // 댓글정보 , 댓글좋아요, 댓글신고, 댓글고정 -->

                            </div><!-- // cm_inf -->

                            <div class="cm_inResult"><!-- 댓글 내용 -->
                                <span>댓글 내용 입니다.</span>
                            </div><!-- // 댓글 내용 -->

                            <div class="re_btn"><!-- 답글쓰기 버튼 -->
                                <button type="button" >
                                    답글쓰기
                                </button>
                            </div><!-- // 답글쓰기 버튼 -->


                            <!-- 답글쓰기 눌렀을때 추가 되는 댓글 영역 -->
                            <!-- <div class="board_cmt_list" id="cmtMore" style="display:none;"></div>
                            <div style="text-align: center; display:none; margin: 20px 0px;" id="div_cmt_back">
                                <span class="cmt_back_guide" id="cmt_back_guide" style="display: none; position: absolute;"></span>
                                <a href='javascript:void(0);' id='btn_cmt_back' style='position: relative;'>
                                    <img src="/home/img/ico_cmt_back_before.png" id="imgBack" style="cursor:pointer; width: 20px;">
                                </a>
                            </div> -->

                        </div><!-- // cm_line -->

                        <div class="cm_line"><!-- cm_line -->
                            <div class="cm_inf"><!-- cm_inf -->
                                <div class="channel_profile"><!-- channel_profile -->
                                    <a href="#">
                                        <span><img src="/images/profile/coco.jpg" /></span>
                                    </a>
                                </div><!-- // channel_profile -->
                                <div class="cm_inf_conwrap"><!-- 댓글정보 , 댓글좋아요, 댓글신고, 댓글고정 -->
                                    <div class="cm_inf_con"><!-- cm_inf_con -->
                                        <a href="#"><span class="cm_aka">댓글닉네임</span></a>
                                        <a href="#"><span class="cm_id">(dkdlel123)</span></a>
                                        <a href="#"><span class="cm_ymd">2021-11-15</span></a>
                                        <a href="#"><span class="cm_time">13:15:30</span></a>
                                    </div><!-- // cm_inf_con -->

                                    <div class="cm_up_more"><!-- cm_up_more -->
                                        <div class="cm_up"><!-- cm_up -->
                                            <button type="button">
                                                <i class='bx bx-like'></i>
                                            </button>
                                            <span class="cds_ifc cnl">
                                                    7
                                                </span>
                                        </div><!-- // cm_up -->

                                        <div class="cm_more"><!-- cm_more -->
                                            <i class='bx bx-dots-vertical-rounded' ></i>
                                        </div><!-- // cm_more -->
                                    </div><!-- // cm_up_more -->

                                </div><!-- // 댓글정보 , 댓글좋아요, 댓글신고, 댓글고정 -->

                            </div><!-- // cm_inf -->

                            <div class="cm_inResult"><!-- 댓글 내용 -->
                                <span>댓글 내용 입니다.</span>
                            </div><!-- // 댓글 내용 -->

                            <div class="re_btn"><!-- 답글쓰기 버튼 -->
                                <button type="button" >
                                    답글쓰기
                                </button>
                            </div><!-- // 답글쓰기 버튼 -->


                            <!-- 답글쓰기 눌렀을때 추가 되는 댓글 영역 -->
                            <!-- <div class="board_cmt_list" id="cmtMore" style="display:none;"></div>
                            <div style="text-align: center; display:none; margin: 20px 0px;" id="div_cmt_back">
                                <span class="cmt_back_guide" id="cmt_back_guide" style="display: none; position: absolute;"></span>
                                <a href='javascript:void(0);' id='btn_cmt_back' style='position: relative;'>
                                    <img src="/home/img/ico_cmt_back_before.png" id="imgBack" style="cursor:pointer; width: 20px;">
                                </a>
                            </div> -->

                        </div><!-- // cm_line -->

                        <div class="cm_line"><!-- cm_line -->
                            <div class="cm_inf"><!-- cm_inf -->
                                <div class="channel_profile"><!-- channel_profile -->
                                    <a href="#">
                                        <span><img src="/images/profile/coco.jpg" /></span>
                                    </a>
                                </div><!-- // channel_profile -->
                                <div class="cm_inf_conwrap"><!-- 댓글정보 , 댓글좋아요, 댓글신고, 댓글고정 -->
                                    <div class="cm_inf_con"><!-- cm_inf_con -->
                                        <a href="#"><span class="cm_aka">댓글닉네임</span></a>
                                        <a href="#"><span class="cm_id">(dkdlel123)</span></a>
                                        <a href="#"><span class="cm_ymd">2021-11-15</span></a>
                                        <a href="#"><span class="cm_time">13:15:30</span></a>
                                    </div><!-- // cm_inf_con -->

                                    <div class="cm_up_more"><!-- cm_up_more -->
                                        <div class="cm_up"><!-- cm_up -->
                                            <button type="button">
                                                <i class='bx bx-like'></i>
                                            </button>
                                            <span class="cds_ifc cnl">
                                                    7
                                                </span>
                                        </div><!-- // cm_up -->

                                        <div class="cm_more"><!-- cm_more -->
                                            <i class='bx bx-dots-vertical-rounded' ></i>
                                        </div><!-- // cm_more -->
                                    </div><!-- // cm_up_more -->

                                </div><!-- // 댓글정보 , 댓글좋아요, 댓글신고, 댓글고정 -->

                            </div><!-- // cm_inf -->

                            <div class="cm_inResult"><!-- 댓글 내용 -->
                                <span>댓글 내용 입니다.</span>
                            </div><!-- // 댓글 내용 -->

                            <div class="re_btn"><!-- 답글쓰기 버튼 -->
                                <button type="button" >
                                    답글쓰기
                                </button>
                            </div><!-- // 답글쓰기 버튼 -->


                            <!-- 답글쓰기 눌렀을때 추가 되는 댓글 영역 -->
                            <!-- <div class="board_cmt_list" id="cmtMore" style="display:none;"></div>
                            <div style="text-align: center; display:none; margin: 20px 0px;" id="div_cmt_back">
                                <span class="cmt_back_guide" id="cmt_back_guide" style="display: none; position: absolute;"></span>
                                <a href='javascript:void(0);' id='btn_cmt_back' style='position: relative;'>
                                    <img src="/home/img/ico_cmt_back_before.png" id="imgBack" style="cursor:pointer; width: 20px;">
                                </a>
                            </div> -->

                        </div><!-- // cm_line -->

                    </div><!-- // cm_list -->

                </div><!-- // video_comment -->
            </form>
        </section><!-- // video_contents -->

        <div class="side_video_list"><!-- side_video_list -->
            <div class="side_tl_cse"><!-- side_tl_cse -->
                <div class="title"><!-- title -->
                    <span>리스트</span>
                </div><!-- // title-->
                <div class="close_re"><!-- close_re -->
                    <div class="list_refresh">
                        <box-icon name='refresh' ><i class='bx bx-refresh' ></i></box-icon>
                    </div>
                    <div class="list_close">
                        <box-icon name='x' ><i class='bx bx-x' ></i></box-icon>
                    </div>
                </div><!-- // close_re -->

            </div><!-- // side_tl_cse -->

            <section class="video_list"><!-- video_list -->
                <div class="next_video"><!-- next_video -->
                    <div class="svideo"><!-- svideo -->
                        <div class="video_play">
                            <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                            <video class="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                <source src="./images/video/testvideo.mp4" type="video/webm" />
                                <source src="./images/video/testvideo.mp4" type="video/ogg" />
                            </video>
                        </div>
                    </div><!-- // svideo -->
                    <div class="video_desc"><!-- video_desc -->
                        <div class="video_title">
                            <a href="#">영상제목 길게길게 영상제목 길게길게 영상제목 길게길게</a>
                        </div>
                        <div class="video_aka">
                            <a href="#">닉네임</a>
                        </div>
                        <div class="svideo_data">
                                <span class="cds_ifc cnp">
                                    <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                    <span>1.270</span>
                                </span>
                            <span>
                                     2021-11-15
                                </span>
                        </div>
                    </div><!-- // video_desc -->
                </div><!-- // next_video -->

                <div class="next_video"><!-- next_video -->
                    <div class="svideo"><!-- svideo -->
                        <div class="video_play">
                            <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                            <video class="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                <source src="./images/video/testvideo.mp4" type="video/webm" />
                                <source src="./images/video/testvideo.mp4" type="video/ogg" />
                            </video>
                        </div>
                    </div><!-- // svideo -->
                    <div class="video_desc"><!-- video_desc -->
                        <div class="video_title">
                            <a href="#">영상제목 길게길게 영상제목 길게길게 영상제목 길게길게</a>
                        </div>
                        <div class="video_aka">
                            <a href="#">닉네임</a>
                        </div>
                        <div class="svideo_data">
                                <span class="cds_ifc cnp">
                                    <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                    <span>1.270</span>
                                </span>
                            <span>
                                     2021-11-15
                                </span>
                        </div>
                    </div><!-- // video_desc -->
                </div><!-- // next_video -->

                <div class="next_video"><!-- next_video -->
                    <div class="svideo"><!-- svideo -->
                        <div class="video_play">
                            <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                            <video class="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                                <source src="./images/video/testvideo.mp4" type="video/mp4" />
                                <source src="./images/video/testvideo.mp4" type="video/webm" />
                                <source src="./images/video/testvideo.mp4" type="video/ogg" />
                            </video>
                        </div>
                    </div><!-- // svideo -->
                    <div class="video_desc"><!-- video_desc -->
                        <div class="video_title">
                            <a href="#">영상제목 길게길게 영상제목 길게길게 영상제목 길게길게</a>
                        </div>
                        <div class="video_aka">
                            <a href="#">닉네임</a>
                        </div>
                        <div class="svideo_data">
                                <span class="cds_ifc cnp">
                                    <i class='bx bx-play' style='color:#4ba9e1' ></i>
                                    <span>1.270</span>
                                </span>
                            <span>
                                     2021-11-15
                                </span>
                        </div>
                    </div><!-- // video_desc -->
                </div><!-- // next_video -->




            </section><!-- // video_list -->

        </div><!-- // side_video_list -->

    </main><!-- // video_main_inner -->
</div><!-- // video -->

</body>
</html>