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

    <!-- css -->
    <link rel="stylesheet" href="./css/admin/videoupload.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="./js/adminChannel/adminChannel.js"></script>
</head>
<body>
<div class="uploadpage">
    <div class="upload-title">
        <h3>영상 세부정보</h3>
    </div><!--upload-title end-->
    <form name="f" method="post" action="videoUpload.do" enctype="multipart/form-data">
        <div class="upload-info">
            <div class="upload-desc">
                <div class="upload-box up-t"><!--영상제목-->
                    <div class="upload-sub">영상제목</div>
                    <input type="text" name="title" />
                </div><!--영상제목 끝-->

                <div class="upload-box up-d" ><!--영상설명-->
                    <div class="upload-sub">영상설명</div>
                    <textarea name="description" rows="6"></textarea>
                </div><!--영상설명 끝-->

                <div class="upload-box up-v"><!--공개여부-->
                    <div class="upload-sub">공개여부</div>
                    <input type="radio" name="visibility" id="public" value="1"/>
                    <label for="public">공개</label>
                    <input type="radio" name="visibility" id="private" value="0"/>
                    <label for="private">비공개</label>
                </div><!--공개여부 끝-->
            </div><!--upload-desc end-->

            <div class="upload-video">
                <div class="upload-box up-vup"><!--영상업로드-->
                    <div class="upload-sub">영상업로드</div>
                    <div id="ca-videoAjax">

                    </div>
                    <input id="ca-video" type="file" name="videofile1" />
                </div><!--영상업로드 끝-->

                <div class="upload-box up-thumb"><!--썸네일-->
                    <div class="upload-sub">썸네일</div>
                    <img src="" />
                    <input id="ca-th" type="file" name="thumbnail1" />
                </div><!--썸네일 끝-->
            </div><!--ca-upload-video end-->
        </div><!--upload-info end-->
        <div class="ca-btn">
            <input type="submit" value="업로드">
        </div>
    </form>
</div><!--uploadpage end-->
</body>
</html>