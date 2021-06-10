<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi"/>
    <title>영상보기</title>
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="./css/default/reset.css">
    <link rel="stylesheet" type="text/css" href="./css/channel/video.css"/>

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
<%--    <script src="./js/channel/more.js"></script>--%>
    <!-- 외부 자바스크립트 파일 연동 오류 -->
    <script type="text/javascript">

        $(function () {
            // ***현재문서가 실행되었을 때 댓글 불러오기
            $('#cm_list').load('cmList.do?videonum=${video.videonum}') //load : 현재문서가 브라우저가 로딩될때 실행되는 함수
            <%--$('#cm_count').load('"cmCount.do?videonum=${video.videonum}')--%>

            // ***여기는 새로운 댓글이 달렸을 때 비동기적으로 처리
            $('#repInsert').click(function() {
                var content = $('#content').val();
                if (!content) {  //frm.replytext 에 값이 없으면
                    alert('댓글 입력후에 클릭하시오');
                    $('#content').focus();
                    return false;
                }
                var frmData = $('form').serialize();  // serialize : form 태그 안에 있는 모든 값을 전달(아래 코드와 같은 역할)

                // 전달할곳, 전달될 데이터, 콜백함수(댓글 비동기처리)
                $.post('cmInsert.do', frmData,
                    //콜백함수
                    function(data) {
                        $('#cm_list').html(data);
                        content.value = '';
                    }
                );

                // // 전달할곳, 전달될 데이터, 콜백함수(댓글 수 올리기 비동기 처리)
                // $.post('cmCount.do', frmData,
                //     //콜백함수
                //     function(data) {
                //         $('#cm_count').html(data);
                //     }
                // );
            });

        });
    </script>
</head>
<body>
<%@include file="header.jsp"%>
<div class="head"><!-- head -->
</div><!-- // head -->
<div id="video" class="video_wrap"><!-- video -->
    <main class="video_main_inner"><!-- video_main_inner -->
        <section class="video_contents"><!-- video_contents -->
            <form>
                <div class="video_play_view"><!-- video_play_view -->
                    <div class="video_play">
                        <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                        <video class="background_video" controls preload="auto" muted="muted">
                            <!-- controls : 동영상 체크  -->
                            <source src="./images/video/testvideo.mp4" type="video/mp4"/>
                            <source src="./images/video/testvideo.mp4" type="video/webm"/>
                            <source src="./images/video/testvideo.mp4" type="video/ogg"/>
                        </video>
                    </div>
                </div><!-- // video_play_view -->
                <div class="video_play_info"><!-- video_play_info -->
                    <div class="infoin"><!-- infoin -->
                        <div class="info_ppt"><!--  채널정보, 영상 제목 -->
                            <div class="channel_profile"><!-- channel_profile -->
                                <a href="#">
                                    <span><img src="/images/profile/profile-img.jpeg"/></span>
                                </a>
                            </div><!-- // channel_profile -->
                            <div class="aka_videoName"><!-- aka_videoName -->
                                <ul class="an">
                                    <a href="#">
                                        <li class="aka">채널이름</li>
                                    </a>
                                    <a href="#">
                                        <li class="videoName">${video.title}</li>
                                    </a>
                                </ul>
                            </div><!-- // aka_videoName -->
                        </div><!-- //  채널정보, 영상 제목 -->
                        <div class="behavior"><!-- 유저행동 -->
                            <button type="button" id="btnLater" class="beBTN"><!-- 나중에 볼 영상 -->
                                <box-icon name='time' class="bx_box">
                                    <i class='bx bx-time'></i>
                                    <span class="tooltip">나중에 볼 영상</span>
                                </box-icon>
                            </button>
                            <button type="button" id="btnSubs" class="beBTN"><!-- 구독 여부 -->
                                <box-icon name='donate-heart' class="bx_box">
                                    <i class='bx bx-donate-heart'></i>
                                    <span class="tooltip">구독</span>
                                </box-icon>
                            </button>
                            <button type="button" id="btnBmk" class="beBTN"><!-- 즐겨찾기 여부 -->
                                <box-icon name='star' class="bx_box">
                                    <i class='bx bx-star'></i>
                                    <span class="tooltip">즐겨찾기</span>
                                </box-icon>
                            </button>
                            <button type="button" id="btnLike" class="beBTN"><!-- 좋아요 -->
                                <box-icon name='like' class="bx_box">
                                    <i class='bx bx-like'></i>
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
                                        ${video.likes}
                                    </span>
                            </li>
                            <li class="cm">
                                    <span class="cds_ifc cnc">
                                        <i class='bx bx-comment-detail'></i>
                                        ${video.comments}
                                    </span>
                            </li>
                            <li class="playsq">
                                    <span class="cds_ifc cnp">
                                        <i class='bx bx-play' style='color:#4ba9e1'></i>
                                        ${video.views}
                                    </span>
                            </li>
                        </ul>
                    </div><!-- // 좋아요수, 댓글수, 재생수 -->

                </div><!-- // video_play_info -->

                <div class="video_comment"><!-- video_comment -->
                    <div class="cm_input"><!-- cm_input -->
                        <div class="cm_squ"><!-- comment_squ -->
                            <span>댓글</span>
                            <span class="comq" id="cm_count"></span>
                        </div><!-- // comment_squ -->

                        <div class="cm_form"><!-- cm_form -->
                            <div class="channel_profile"><!-- channel_profile -->
                                <div class="img-border">
                                    <img src=""/>
                                </div>
                            </div><!-- // channel_profile -->
                            <div class="cm_fm"><!-- 댓글 입력 & 등록버튼 -->
                                <form name="frm" id="frm"><!-- name id 유지 -->
                                    <input type="hidden" name="videonum" value="${video.videonum}">
                                    <input type="hidden" name="userid" value="${sessionScope.userid}">
                                    <textarea rows="3" cols="50" name="content" id="content"></textarea>
                                    <input class="frm_submit" type="submit" value="확인" id="repInsert">
                                </form>
                            </div><!-- // 댓글 입력 & 등록버튼 -->
                        </div><!-- // cm_form -->

                    </div><!-- // cm_input -->
                    <div id="cm_list" class="cm_list"><!-- cm_list -->



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
                        <box-icon name='refresh'><i class='bx bx-refresh'></i></box-icon>
                    </div>
                    <div class="list_close">
                        <box-icon name='x'><i class='bx bx-x'></i></box-icon>
                    </div>
                </div><!-- // close_re -->

            </div><!-- // side_tl_cse -->

            <section class="video_list"><!-- video_list -->
                <div class="next_video"><!-- next_video -->
                    <div class="svideo"><!-- svideo -->
                        <div class="video_play">
                            <!-- <video muted="muted" poster=" " preload="metadata" controls ></video> -->
                            <video class="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted"
                                   volume="0" controls><!-- controls : 동영상 체크  -->
                                <source src="./images/video/testvideo.mp4" type="video/mp4"/>
                                <source src="./images/video/testvideo.mp4" type="video/webm"/>
                                <source src="./images/video/testvideo.mp4" type="video/ogg"/>
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
                                    <i class='bx bx-play' style='color:#4ba9e1'></i>
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
                            <video class="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted"
                                   volume="0" controls><!-- controls : 동영상 체크  -->
                                <source src="./images/video/testvideo.mp4" type="video/mp4"/>
                                <source src="./images/video/testvideo.mp4" type="video/webm"/>
                                <source src="./images/video/testvideo.mp4" type="video/ogg"/>
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
                                    <i class='bx bx-play' style='color:#4ba9e1'></i>
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
                            <video class="background_video" preload="auto" autoplay="autoplay" loop="loop" muted="muted"
                                   volume="0" controls><!-- controls : 동영상 체크  -->
                                <source src="./images/video/testvideo.mp4" type="video/mp4"/>
                                <source src="./images/video/testvideo.mp4" type="video/webm"/>
                                <source src="./images/video/testvideo.mp4" type="video/ogg"/>
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
                                    <i class='bx bx-play' style='color:#4ba9e1'></i>
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