<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>회원탈퇴</title>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <!-- css -->
    <link rel="stylesheet" href="../../css/default/import.css">
    <link rel="stylesheet" href="../../css/user/withdrawal.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="../../js/user/delete.js"></script>

</head>
<body>
<!-- header -->
<%--<%@ include file="/header.jsp" %>--%>
<div class="wrap"><!-- wrap 시작 -->
    <div class="userinfo_top">
        <div class="userinfo_inner">
            <h2>마이페이지</h2>
        </div>

        <div class="katego"><!-- katego -->
            <nav class="userinfo_nav">
                <ul class="nav_list">
                    <li class="my_info"><button type="button" value="정보수정" onclick="location='memberinfoCheck.do'" > 내 정보 관리</button></li>
                    <li class="purchasedList"><button type="button" value="구독결제리스트" onclick="location='purchasedList.do'"  >구독 결제 리스트</button></li>
                    <li class="withdrawal"><button type="button" value="회원탈퇴" onclick="location='withdrawal.do'"   >회원탈퇴</button></li>
                </ul>
            </nav>
        </div><!-- // katego -->

    </div>
    <main id="main_wrap"><!-- main_wrap 시작 -->
        <section class="with"><!-- with -->
            <h6>회원탈퇴</h6>
            <form method="post" action="user_del_ok.do" onsubmit="return check()">
                <div class="delete_member">
                    <input type="hidden" name="id" value="${sessionScope.id}">
                    <legend>회원 삭제 폼</legend>
                    <div class="pw_name">
                        <ul class="name_box">
                            <li class="name_title">
                                <label for="passwd"></label>
                            </li>
                            <li class="name_word">
                                <input id="passwd" type="password" name="passwd" placeholder="비밀번호를 입력해주세요." />
                            </li>
                        </ul>
                    </div>
                    <!-- 회원삭제 -->
                    <div class="complete"><!-- complete 시작 -->
                        <button type="submit" value="회원삭제" class="delete_box">회원탈퇴</button>
                    </div><!-- //complete -->
                </div>
            </form>
        </section><!-- // with -->

    </main><!-- //main_wrap -->
</div><!-- //wrap -->
</body>
</html>
