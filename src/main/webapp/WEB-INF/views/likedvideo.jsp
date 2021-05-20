<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>좋아요 한 영상</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/import.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/likedvideo.css">

    <!-- js -->

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<div id="likevideo"><!-- likevideo -->
    <div class="likevideo_title"><!-- likevideo_title -->
        <div class="likevideo_title_inner">
            <h2>좋아요 한 영상</h2>
        </div>
    </div><!-- // likevideo_title -->
    <main class="my_content"><!-- main_content -->
        <div class="btn_video_nav" id="video_nav"><!-- btn_video_nav -->
            <ul class="tablist">
                <li class="history">
                    <a href="history.html">최근에 본 영상</a>
                </li>
                <li class="watrchlater">
                    <a href="watrchlater.html">나중에 볼 영상</a>
                </li>
                <li class="likedvideo" id="on_likedvideo">
                    <a href="likedvideo.html">좋아요 한 영상</a> <!-- 현재 페이지 -->
                </li>
            </ul>
        </div><!-- // btn_video_nav -->
        <section class="myplaylist_wrap"><!-- myplaylist_wrap -->
            <div class="edit_btn"><!-- edit_btn -->
                <a href="#" id="btn_mod_recent" class="btn btn_mod">편집</a>
                <a href="#" id="btn_all_recent" class="btn btn_all">전체선택</a>
                <a href="#" id="btn_delete_recent" class="btn btn_delete">삭제</a>
            </div><!-- // edit_btn -->
            <div class="video_list"><!-- video_list -->
                <div class="video_view"><!-- video_view -->
                    <div class="my_video_check"><!-- my_video_check -->
                        <label for="mycheck">영상체크</label>
                        <input id="mycheck" type="checkbox" name="" value="" />
                    </div><!-- // my_video_check -->
                    <div class="video"><!-- video -->
                        <div class="img"><span>재생시간</span></div>
                    </div><!-- // video -->
                    <div class="desc"><!-- desc -->
                        <dl>
                            <dt>
                                <a href="#" data-event="clickTitle" data-clickcode="rct.clist" data-move_uri="/v/20296141">
                                    영상 제목
                                </a>
                            </dt>
                            <dd>
                                    <span class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="rct.cch" data-move_uri="https://tv.naver.com/cjenm.youquizontheblock">
                                            영상 채널명
                                        </a>
                                    </span>
                            </dd>
                            <dd class="play_like">
                                    <span class="cds_ifc cnp">
                                        <i class='bx bx-play' style='color:#4ba9e1'  ></i>
                                        158,079
                                    </span>
                                <span class="cds_ifc bch">
                                        <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                            1,405
                                    </span>
                            </dd>
                        </dl>
                    </div><!-- // desc -->
                </div><!-- // video_view -->
                <div class="video_view"><!-- video_view -->
                    <div class="my_video_check"><!-- my_video_check -->
                        <label for="mycheck">영상체크</label>
                        <input id="mycheck" type="checkbox" name="" value="" />
                    </div><!-- // my_video_check -->
                    <div class="video"><!-- video -->
                        <div class="img"><span>재생시간</span></div>
                    </div><!-- // video -->
                    <div class="desc"><!-- desc -->
                        <dl>
                            <dt>
                                <a href="#" data-event="clickTitle" data-clickcode="rct.clist" data-move_uri="/v/20296141">
                                    영상 제목
                                </a>
                            </dt>
                            <dd>
                                    <span class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="rct.cch" data-move_uri="https://tv.naver.com/cjenm.youquizontheblock">
                                            영상 채널명
                                        </a>
                                    </span>
                            </dd>
                            <dd class="play_like">
                                    <span class="cds_ifc cnp">
                                        <i class='bx bx-play' style='color:#4ba9e1'  ></i>
                                        158,079
                                    </span>
                                <span class="cds_ifc bch">
                                        <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                            1,405
                                    </span>
                            </dd>
                        </dl>
                    </div><!-- // desc -->
                </div><!-- // video_view -->
                <div class="video_view"><!-- video_view -->
                    <div class="my_video_check"><!-- my_video_check -->
                        <label for="mycheck">영상체크</label>
                        <input id="mycheck" type="checkbox" name="" value="" />
                    </div><!-- // my_video_check -->
                    <div class="video"><!-- video -->
                        <div class="img"><span>재생시간</span></div>
                    </div><!-- // video -->
                    <div class="desc"><!-- desc -->
                        <dl>
                            <dt>
                                <a href="#" data-event="clickTitle" data-clickcode="rct.clist" data-move_uri="/v/20296141">
                                    영상 제목
                                </a>
                            </dt>
                            <dd>
                                    <span class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="rct.cch" data-move_uri="https://tv.naver.com/cjenm.youquizontheblock">
                                            영상 채널명
                                        </a>
                                    </span>
                            </dd>
                            <dd class="play_like">
                                    <span class="cds_ifc cnp">
                                        <i class='bx bx-play' style='color:#4ba9e1'  ></i>
                                        158,079
                                    </span>
                                <span class="cds_ifc bch">
                                        <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                            1,405
                                    </span>
                            </dd>
                        </dl>
                    </div><!-- // desc -->
                </div><!-- // video_view -->
                <div class="video_view"><!-- video_view -->
                    <div class="my_video_check"><!-- my_video_check -->
                        <label for="mycheck">영상체크</label>
                        <input id="mycheck" type="checkbox" name="" value="" />
                    </div><!-- // my_video_check -->
                    <div class="video"><!-- video -->
                        <div class="img"><span>재생시간</span></div>
                    </div><!-- // video -->
                    <div class="desc"><!-- desc -->
                        <dl>
                            <dt>
                                <a href="#" data-event="clickTitle" data-clickcode="rct.clist" data-move_uri="/v/20296141">
                                    영상 제목
                                </a>
                            </dt>
                            <dd>
                                    <span class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="rct.cch" data-move_uri="https://tv.naver.com/cjenm.youquizontheblock">
                                            영상 채널명
                                        </a>
                                    </span>
                            </dd>
                            <dd class="play_like">
                                    <span class="cds_ifc cnp">
                                        <i class='bx bx-play' style='color:#4ba9e1'  ></i>
                                        158,079
                                    </span>
                                <span class="cds_ifc bch">
                                        <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                            1,405
                                    </span>
                            </dd>
                        </dl>
                    </div><!-- // desc -->
                </div><!-- // video_view -->
                <div class="video_view"><!-- video_view -->
                    <div class="my_video_check"><!-- my_video_check -->
                        <label for="mycheck">영상체크</label>
                        <input id="mycheck" type="checkbox" name="" value="" />
                    </div><!-- // my_video_check -->
                    <div class="video"><!-- video -->
                        <div class="img"><span>재생시간</span></div>
                    </div><!-- // video -->
                    <div class="desc"><!-- desc -->
                        <dl>
                            <dt>
                                <a href="#" data-event="clickTitle" data-clickcode="rct.clist" data-move_uri="/v/20296141">
                                    영상 제목
                                </a>
                            </dt>
                            <dd>
                                    <span class="ch_txt">
                                        <a href="#" data-event="clickChannel" data-clickcode="rct.cch" data-move_uri="https://tv.naver.com/cjenm.youquizontheblock">
                                            영상 채널명
                                        </a>
                                    </span>
                            </dd>
                            <dd class="play_like">
                                    <span class="cds_ifc cnp">
                                        <i class='bx bx-play' style='color:#4ba9e1'  ></i>
                                        158,079
                                    </span>
                                <span class="cds_ifc bch">
                                        <i class='bx bxs-heart' style='color:#e14b4b'  ></i>
                                            1,405
                                    </span>
                            </dd>
                        </dl>
                    </div><!-- // desc -->
                </div><!-- // video_view -->
            </div><!-- // video_list -->
        </section><!-- // myplaylist_wrap -->

    </main><!-- // main_content -->


</div><!-- // likevideo -->

</body>
</html>