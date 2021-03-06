<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<%@include file="header.jsp"%>
<div class="wrap"><!-- wrap 시작 -->
    <div class="userinfo_top">
        <div class="userinfo_inner">
            <h2>마이페이지</h2>
        </div>

        <div class="katego"><!-- katego -->
            <nav class="userinfo_nav">
                <ul class="nav_list">
                    <li class="my_info"><button type="button" value="정보수정" onclick="location='memberInfoCheck.do'" > 내 정보 관리</button></li>
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
                            <!--결제 내역이 있으면-->
                            <c:if test="${not empty list}">
                            <c:forEach var="list" items="${list}">
                            <div class="pay_list">
                                <div class="payon">
                                    <ul>
                                        <li>
                                            <fmt:parseDate var="date" value="${list.paydate}" pattern="yyyy-MM-dd HH:mm:ss" /><!--string을 date로형 변환-->
                                            <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /><!--pattern 값으로 변경 출력 -->
                                        </li>
                                        <li>${list.method}</li>
                                        <li>${list.payment}</li>
                                        <li>
                                            <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /><!--pattern 값으로 변경 출력 -->
                                            ~
                                            <fmt:parseDate var="expired" value="${list.expired}" pattern="yyyy-MM-dd HH:mm:ss" /><!--string을 date로형 변환-->
                                            <fmt:formatDate value="${expired}" pattern="yyyy-MM-dd" /><!--pattern 값으로 변경 출력 -->
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            </c:forEach>
                            </c:if>

                            <!--결제 내역이 없으면-->
                            <c:if test="${empty list}">
                            <div class="pay_list">
                                결제 내역이 없습니다.
                            </div>
                            </c:if>

                        </div>

                    </fieldset>
                </form><!-- // 전체 form 요소 끝 -->
            </div><!-- // pay_check -->
        </section><!-- // purch -->

    </main><!-- //main_wrap -->
</div><!-- //wrap -->
</body>
</html>

