<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<heade>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>채널</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="./css/default/import.css">
    <link rel="stylesheet" type="text/css" href="./css/channel/channel.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<style>
    .kc{
        border-top: 1px solid #dadada;
        padding: 20px 0;
        width: 100%;
        height: 500px;
    }
    .kc-title{
        height: 50px;
        padding: 15px;
    }
    .kc-title a{
        font-size: 14px;
        color: #b3b6be;
    }
    .kc-previewbox{
        padding: 10px;
        display: flex;
        justify-content: space-between;
        flex-wrap: nowrap;
        gap: 10px;
        height: 470px;
    }
    .kc-bigbox{
        width: 60%;
        height: 450px;
        position: relative;
        overflow: hidden;
    }
    .kc-bigbox img{
        display: block;
        border: 1px solid #dadada;
        width: 100%;
        height: 100%;
    }
    .kc-desc1{
        width: 100%;
        height: 50px;
        position: absolute;
        bottom: -50px;
        transition: all 0.5s;
        background: rgba(0,0,0,0.5);
        padding: 15px;
    }
    .kc-desc1 span{
        color: #fff;
        font-size: 13px;
    }
    .kc-bigbox > a:hover + .kc-desc1{
        bottom: 10%;
    }
    .kc-smallbox{
        width: 40%;
        height: 450px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        gap: 10px;
    }
    .kc-smallbox img{
        display: block;
        border: 1px solid #dadada;
        width: 100%;
        height: 100%;
    }
    .kc-samllbox2{
        height: 220px;
        position: relative;
        overflow: hidden;
    }
    .kc-desc2{
        width: 100%;
        height: 50px;
        position: absolute;
        bottom: -50px;
        transition: all 0.5s;
        background: rgba(0,0,0,0.5);
        padding: 15px;
    }
    .kc-desc2 span{
        color: #fff;
        font-size: 13px;
    }
    .kc-samllbox2 > a:hover + .kc-desc2{
        bottom: 10%;
    }
</style>
</heade>
<body>
<%@ include file="header.jsp" %>
<div id="channel_wrap" class="channel">
    <!-- side_wrap -->
    <div class="side_wrap">
        <div class="side_inner"><!-- side_inner -->
            <div class="channel_profile"><!-- channel_profile -->
                <div class="profile_img">
                        <span>
                            <c:if test="${user.profile == null }"><!--프로필 없으면-->
                                <img src="data:image/png;base64,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"/>
                            </c:if>
                            <c:if test="${user.profile != null }"><!--프로필 있으면-->
                                <img src="/imgUpload/${user.profile}">
                            </c:if>
                        </span>
                </div>
                <div class="channel_name">
                    <dl>
                        <dt class="channel_aka">${channel.aka}</dt><!--채널 닉네임-->
                        <dd class="channel_email">@${channel.userid}</dd><!--가입한 아이디-->
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
<%--                    <a href="videoPage.do"><li class="upload_video">업로드 영상보기</li></a>--%>
                    <a href="videoPage.do" class="allVideo"><li class="all_video">전체영상</li></a>
                </ul>
            </div><!-- // kategorie -->
        </div><!-- //side_inner -->
    </div>
    <!-- // side_wrap -->
    <div class="main_wrap"><!-- main_wrap -->
        <div class="channel_info"><!-- channel_info 채널 이름 & 채널알람,즐겨찾기,구독 버튼 -->
            <div class="channelName"><!-- channelName -->
                <h2>${channel.aka}</h2><!--채널이름-->
            </div><!-- // channelName -->
            <div class="ch_alam_bkm_subs"><!-- 채널 알람,즐겨찾기,구독 버튼 -->
                <div class="btn_alam chBTN"><!-- 알람 -->
                    <box-icon type='solid' name='bell'>
                        <i class='bx bxs-bell' ></i>
                    </box-icon>
                </div>
                <div class="btn_bookmark chBTN"><!-- 즐겨찾기 -->
                    <ul class="btn_bkm_list">
                        <li>
                            <box-icon name='star' >
                                <i class='bx bx-star' ></i>
                            </box-icon>
                        </li>
                        <li><span>${channel.bookmarkers}</span></li><!--즐겨찾기 수-->
                    </ul>
                </div>
                <div class="btn_subscript chBTN"><!-- 구독 -->
                    <ul class="btn_subs_list">
                        <a href="purchase.do">
                            <li>
                                <box-icon name='donate-heart' >
                                    <i class='bx bx-donate-heart' ></i>
                                </box-icon>
                            </li>
                            <li>
                                <span class="bookmark_click">${channel.subscribers}</span><!--구독자 수-->
                            </li>
                        </a>
                    </ul>
                </div>
            </div><!-- // 채널 알람,즐겨찾기,구독 버튼 -->
            <script>

            </script>
        </div><!-- // channel_info  -->
        <div class="channel_em_chat"><!-- channel_em_chat 채널 이메일 & 멀티채팅 버튼 -->
            <div class="channelEmail"><!-- channelEmail -->
                <span>${user.email}@${user.domain}</span>
            </div><!-- // channelEmail -->
<%--            <div class="ch_chatting"><!-- 멀티채팅 -->--%>
<%--                <a href="#">--%>
<%--                    <button type="button">채널 채팅 시작하기</button>--%>
<%--                </a>--%>
<%--            </div><!-- // 멀티채팅 -->--%>
        </div><!-- // channel_em_chat 채널 이메일 & 멀티채팅 버튼 -->
        <c:if test="${user.userid.equals(sessionScope.userid)}">
            <div class="channel_adminSET"><!-- 채널 관리 -->
                <a href="adminChannel.do?state=dashboard">
                    <button type="button">채널 관리</button>
                </a>
            </div><!-- // 채널 관리 -->
        </c:if>
        <div class="kc">
            <div class="kc-title"><!--다시보기 title-->
                <a href="videoPage.do?channelnum=${channel.channelnum}"><i class='bx bx-play-circle' ></i>다시보기</a>
            </div>
            <div class="kc-previewbox"><!--preview box-->
                <c:forEach var="cv" items="${video}" begin="0" end="0">
                <div class="kc-bigbox"><!--big preview-->
                    <a href="video.do?videonum=${cv.videonum}">
                        <img src="./videoUpload/${cv.thumbnail}">
                    </a>
                    <div class="kc-desc1">
                        <span>${cv.title}</span>
                        <span>${cv.views}</span>
                        <span>${cv.likes}</span>
                    </div>
                </div><!--kc-bigbox end -->
                </c:forEach>
                <div class="kc-smallbox"><!--small preview-->
                    <c:forEach var="cv" items="${video}" begin="1" end="2">
                    <div class="kc-samllbox2">
                        <a href="video.do?videonum=${cv.videonum}">
                            <img src="./videoUpload/${cv.thumbnail}">
                        </a>
                        <div class="kc-desc2">
                            <span>${cv.title}</span>
                            <span>${cv.views}</span>
                            <span>${cv.likes}</span>
                        </div>
                    </div>
                    </c:forEach>
                </div><!--kc-smallbox end -->
            </div><!--kc-previewbox end -->
        </div>

<%--        <section class="vod"><!-- vod -->--%>
<%--            <div class="vod_title"><!-- vod_title -->--%>
<%--                <a href="#">--%>
<%--                        <span>--%>
<%--                            <box-icon name='play-circle' >--%>
<%--                                <i class='bx bx-play-circle' ></i>--%>
<%--                            </box-icon>--%>
<%--                        </span>--%>
<%--                    <a href="videoPage.do?channelnum=${channel.channelnum}"><span class="text">다시보기</span></a>--%>
<%--                </a>--%>
<%--            </div><!-- // vod_title -->--%>
<%--            <div class="vod_preview"><!-- vod_preview -->--%>
<%--                <c:forEach var="v" items="${video}" begin="0" end="0">--%>
<%--                    <div class="preview_B"><!-- preview_B -->--%>
<%--                        <div class="video_pview"><!-- video_pview -->--%>
<%--                            <div class="main_video_img"><!-- main_video_img -->--%>
<%--                                <a href="/videoPage.do?videoNum=${v.videonum}"><!--해당 영상으로 이동-->--%>
<%--                                    <video muted="muted" poster="./videoUpload/${v.thumbnail} " preload="metadata" controls ><!-- controls : 동영상 체크  -->--%>
<%--                                        <source src="./videoUpload/${v.videofile}" type="video/mp4" />--%>
<%--                                        <source src="./videoUpload/${v.videofile}" type="video/webm" />--%>
<%--                                        <source src="./videoUpload/${v.videofile}" type="video/ogg" />--%>
<%--                                    </video>--%>
<%--                                </a>--%>
<%--                                <div class="main_video_desc"><!-- main_video_desc -->--%>
<%--                                    <div class="video_name">--%>
<%--                                        ${v.title}<!--영상이름-->--%>
<%--                                    </div>--%>
<%--                                    <div class="video_data">--%>
<%--                                        <div class="play_sq">--%>
<%--                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>--%>
<%--                                            <span>${v.views}</span><!--조회수-->--%>
<%--                                        </div>--%>
<%--                                        <div class="data_sq">--%>
<%--                                            ${v.register}<!--업로드일자-->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div><!-- // main_video_desc -->--%>
<%--                            </div><!-- // main_video_img -->--%>
<%--                        </div><!-- // video_pview-->--%>
<%--                    </div><!-- // preview_B -->--%>
<%--                </c:forEach>--%>

<%--                <div class="preview_s"><!-- preview_s -->--%>
<%--                    <c:forEach var="v" items="${video}" begin="1" end="2" step="1">--%>
<%--                        <div class="video_pview"><!-- video_pview -->--%>
<%--                            <div class="main_video_img"><!-- main_video_img -->--%>
<%--                                <a href="video">--%>
<%--                                    <video muted="muted" poster="./videoUpload/${v.thumbnail} " preload="metadata" controls ><!-- controls : 동영상 체크  -->--%>
<%--                                        <source src="./videoUpload/${v.videofile}" type="video/mp4" />--%>
<%--                                        <source src="./videoUpload/${v.videofile}" type="video/webm" />--%>
<%--                                        <source src="./videoUpload/${v.videofile}" type="video/ogg" />--%>
<%--                                    </video>--%>
<%--                                </a>--%>
<%--                                <div class="main_video_desc"><!-- main_video_desc -->--%>
<%--                                    <div class="video_name">--%>
<%--                                        ${v.title}<!--영상이름-->--%>
<%--                                    </div>--%>
<%--                                    <div class="video_data">--%>
<%--                                        <div class="play_sq">--%>
<%--                                            <i class='bx bx-play' style='color:#4ba9e1' ></i>--%>
<%--                                            <span>${v.views}</span><!--조회수-->--%>
<%--                                        </div>--%>
<%--                                        <div class="data_sq">--%>
<%--                                            ${v.register}<!--업로드일자-->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div><!-- // main_video_desc -->--%>
<%--                            </div><!-- // main_video_img -->--%>
<%--                        </div><!-- // video_pview-->--%>
<%--                    </c:forEach>--%>
<%--                </div><!-- // preview_s -->--%>

<%--            </div><!-- //vod_preview -->--%>
<%--        </section><!-- // vod -->--%>
    </div><!-- // main_wrap -->
</div><!-- channel_wrap -->
</body>
</html>
