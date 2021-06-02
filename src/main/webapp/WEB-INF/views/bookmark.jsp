<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>즐겨찾기</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/default/import.css">
    <link rel="stylesheet" type="text/css" href="/css/mypick/bookmark.css" />

    <!-- js -->
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/mypick/jquery.bxslider.js"></script>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<%= session.getAttribute("userid") %>
<div id="mypick"><!-- mypick -->
    <div class="bookmark_title"><!-- bookmark_title -->
        <div class="bookmark_title_inner">
            <h2>즐겨찾기</h2>
        </div>
    </div><!-- // bookmark_title -->
    <main class="my_content"><!-- my_content -->
        <form>
            <div class="btn_channel_bmk" id="btn_channel"><!-- btn_channel_bmk -->
                <div class="btn">
                    <input type="button" id="recent_sequence" class="btn_recent" value="최신등록순">
                </div>
                <btn class="btn">
                    <input type="button" id="aka_sequence" class="btn_aka" value="닉네임 순">
                </btn>
                <btn class="btn">
                    <input type="button" id="old_sequence" class="btn_old" value="오래된 순">
                </btn>
            </div><!-- // btn_channel_bmk -->
            <script type="text/javascript">
                $(document).ready(function(){
                    $('.my_chbmk').bxSlider({
                        slideWidth: 300,
                        minSlides: 4,
                        maxSlides: 4,
                        auto:true,
                        autoHover:true,
                        slideMargin:22
                    });
                });
            </script>
            <section class="my_chbmk_wrap"><!-- my_chbmk_wrap -->

                <div class="my_chbmk"><!-- my_chbmk -->
                    <c:forEach var="bk" items="${bookmark_favoriteList}">
                    <div class="chbmk_item">

                        <a href="#">
                            <div class="profile_img">
                                <img src="./imgUpload/${bk.profile}" alt="${bk.profile}" /> <!-- 프로필 -->
                                <!-- <img src="/images/mypick/profile-img.jpeg" /> -->
                            </div>
                            <div class="chbmk_mybox_name">${bk.aka}</div><!-- 채널이름 -->
                        </a>
                        <div class="chbmk_mybox_desc">
                            최근업로드


                            <!-- 추후 반영 예정 -->
                            <!-- 채널 영상 업로드 날짜 2021-11-15 -->
                                <%--                    <div class="chbmk_mybox_desc">--%>
                                <%--                            최근업로드 <fmt:parseDate value="${video.register}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><!--string을 date로형 변환-->--%>
                                <%--                                    <fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /><!--pattern 값으로 변경 출력 -->--%>
                                <%--                    </div>--%>

                        </div>

                    </div>
                    </c:forEach>

                </div><!-- // my_chbmk -->

            </section><!-- // my_chbmk_wrap -->
        </form>
    </main><!-- // my_content -->


</div><!-- // mypick -->

</body>
</html>