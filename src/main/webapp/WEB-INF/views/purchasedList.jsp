<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>구독 결제 리스트</title>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <!-- css -->
    <link rel="stylesheet" href="/css/default/import.css">
    <link rel="stylesheet" href="/css/user/purchasedList.css">

    <!-- js -->
    <!-- <script src="/js/member.js"></script> -->

</head>
<body>
<!-- header -->

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
        <section class="purch"><!-- purch -->
            <h6>회원 구독채널 결제를 확인할 수 있습니다.</h6>
            <div class="pay_check" ><!-- pay_check -->
                <form id="memberinfoCheck" method="post" action="/Update.do"><!-- 전체 form 요소 시작 -->
                    <fieldset>
                        <legend>구독결제 리스트</legend>
                        <div class="title_data">
                            <div class="title">
                                <span>결제 내역</span>
                            </div>
                        </div>

                        <div class="subs_list">
                            <div class="subs_title">
                                <ul>
                                    <li>결제일</li>
                                    <li>결제수단</li>
                                    <li>결제금액</li>
                                    <li>사용기한</li>
                                </ul>
                            </div>

                            <div class="pay_list">
                                <div class="payon">
                                    <ul>
                                        <li>2021-11-15</li>
                                        <li>kakao pay</li>
                                        <li>35,000</li>
                                        <li>2021-11-15~2021-12-15</li>
                                    </ul>
                                </div>
                            </div>


                        </div>

                    </fieldset>
                </form><!-- // 전체 form 요소 끝 -->
            </div><!-- // pay_check -->
        </section><!-- // purch -->

    </main><!-- //main_wrap -->
</div><!-- //wrap -->
</body>
</html>

