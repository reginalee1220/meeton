<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>meeton</title>
    <!--Boxicons CDN Link-->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./css/admin/adminChannelContent.css">
    <link rel="stylesheet" href="./css/admin/videoupload.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="./js/adminChannel/adminChannel.js"></script>
</head>
<body>
<div class="ca-upload-page">
    <div class="ca-main-title">
        <span>영상 세부정보</span>
    </div><!--ca-main-title end-->
    <form method="POST" >
        <div class="ca-upload-info">
            <div class="ca-upload-desc">
                <div class="ca-upload-box"><!--영상제목-->
                    <div class="ca-upload-title">영상제목</div>
                    <div class="ca-upload-text">
                        <input type="text" name="title" />
                    </div>
                    <div class="ca-upload-ajax">글자수</div>
                </div>
                <div class="ca-upload-box"><!--영상설명-->
                    <div class="ca-upload-title">영상설명</div>
                    <div class="ca-upload-text">
                        <textarea name="description" rows="6"></textarea>
                    </div>
                    <div class="ca-upload-ajax">글자수</div>
                </div>
                <div class="ca-upload-box"><!--공개여부--><!--1(공개)이 기본값-->
                    <div class="ca-upload-title">공개여부</div>
                    <input type="radio" name="visibility" id="public" value="1"/>
                    <label for="public">공개</label>
                    <input type="radio" name="visibility" id="private" value="0"/>
                    <label for="private">비공개</label>
                </div>
            </div><!--ca-upload-desc end-->

            <div class="ca-upload-video">
                <div class="ca-upload-box ca-vup"><!--영상업로드-->
                    <div class="ca-upload-title">영상업로드</div>
                    <video poster="" preload="metadata" autoplay controls  >
                        <source src="image/viverse.mp4" type="video/mp4">
                    </video>
                    <input id="ca-video" type="file" name="videofile" />
                    <label class="ca-button" for="ca-video">업로드</label>
                </div>
                <div class="ca-upload-box ca-thumb"><!--썸네일-->
                    <div class="ca-upload-title">썸네일</div>
                    <img src="" />
                    <input id="ca-th" type="file" name="thumbnail" />
                    <label class="ca-button" for="ca-th">업로드</label>
                </div>
            </div><!--ca-upload-video end-->
        </div><!--ca-upload-info end-->
        <input  type="submit" value="업로드" />
    </form>
</div><!--ca-upload-page end-->
</body>
</html>