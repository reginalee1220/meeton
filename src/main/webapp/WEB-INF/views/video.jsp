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
                        <video id="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted" volume="0" controls><!-- controls : 동영상 체크  -->
                            <source src="./images/video/testvideo.mp4" type="video/mp4" />
                            <source src="./images/video/testvideo.mp4" type="video/webm" />
                            <source src="./images/video/testvideo.mp4" type="video/ogg" />
                        </video>
                    </div>
                </div><!-- // video_play_view -->
                <div class="video_play_info"><!-- video_play_info -->
                    <div class="video_infomation"><!-- 채널정보, 영상 제목 -->
                        <div class="channel_profile">
                            <a href="#">
                                <span><img src="/images/profile/profile-img.jpeg" /></span>
                            </a>
                        </div>
                    </div><!-- // 채널정보, 영상 제목 -->
                    <div class="behavior"><!-- 유저행동 -->

                    </div><!-- // 유저행동 -->
                </div><!-- // video_play_info -->
                <div class="video_comment">
                    댓글
                </div>
            </form>
        </section><!-- // video_contents -->

        <div class="side_video_list"><!-- side_video_list -->
            사이드 다음 영상 리스트
        </div><!-- // side_video_list -->

    </main><!-- // video_main_inner -->
</div><!-- // video -->

</body>
</html>