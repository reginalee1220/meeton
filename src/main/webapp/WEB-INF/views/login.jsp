<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% String contextPath = request.getContextPath(); %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>로그인</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default/import.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/login.css">

    <script src="<%=request.getContextPath()%>/js/user/login.js"></script>
</head>
<body>
<!-- header -->
<div class="top_title">
    <div class="top_inner">
        <h1>MEETON 회원가입</h1>
    </div>
</div>
<div class="wrap"><!--  시작 -->

    <div class="login_bg"><!-- login_bg -->
        <main id="main_wrap"><!-- main_wrap 시작 -->
            <section class="login_section"><!-- login_section -->
                <div class="login_title">
                    <h2>안녕하세요.</h2>
                    <h3>MEETON 입니다.</h3>
                    <p>기존회원이시면 아이디와 비밀번호를 입력해주세요.</p>
                </div>
                <form id="loginForm" method="post" action="/user_login_ok.do"
                        onsubmit="return check()"><!-- 전체 form 요소 시작 -->
                    <fieldset>
                        <legend>Login Form</legend>
                        <div class="user_infoen"><!-- user_infoen -->
                            <div class="idpw"><!-- idpw -->
                                <!-- 아이디 -->
                                <div class="user_id_info"><!-- user_id_group -->
                                    <label for="userid"></label>
                                    <input id="userid" type="text" name="userid" placeholder="아이디를 입력하세요." value="" autofocus="autofocus">
                                </div><!-- // user_id_group -->
                                <!-- 비밀번호 -->
                                <div class="user_pw_info"><!-- user_pw_group -->
                                    <label for="passwd"></label>
                                    <input id="passwd" type="password" name="passwd" placeholder="비밀번호" value="">
                                </div><!-- // user_pw_group -->
                            </div><!-- // idpw -->

                            <!-- 로그인 버튼 -->
                            <div class="login_btn">
                                <button type="submit" value="로그인"><a href="#">로그인</a></button>
                            </div>
                        </div><!-- // user_infoen-->

                        <!-- 아이디 저장 체크박스 -->
                        <div class="user_idsave_group">
                            <ul class="int_idsave">
                                <li class="info_word">
                                    <input type="checkbox" id="idSave" name="idSave" value="아이디저장">
                                </li>
                                <li class="info_idsave">
                                    <label for="idSave">아이디 저장</label>
                                </li>
                            </ul>
                        </div>

                        <!-- 아이디 비번 찾기 -->
                        <div class="member_search">
                            <div class="id_search_box">
                                <ul>
                                    <li class="member_title">아이디를 잊으셨나요?</li>
                                    <li class="id_searchBt">
                                        <button type="button" id="idSearch" value="아이디 찾기">아이디 찾기</button>
                                    </li>
                                </ul>
                            </div>
                            <div class="pw_search_box">
                                <ul>
                                    <li class="member_title">비밀번호를 잊으셨나요?</li>
                                    <li class="pw_searchBt">
                                        <button type="button" id="pwSearch" value="비밀번호 찾기" onclick="pwd_find()">비밀번호 찾기</button>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- 다른계정 로그인 -->
                        <div class="account_linking">
                            <div class="google_btn">
                                <button type="button" value="구글계정">
                                    <ul>
                                        <li><img src="/images/login/google.png" alt="구글"></li>
                                        <li>Google 계정 로그인</li>
                                    </ul>
                                </button>
                            </div>
                            <div class="naver_btn">
                                <button type="button" value="네이버계정">
                                    <ul>
                                        <li><img src="/images/login/naver.png" alt="네이버"></li>
                                        <li>NAVER 계정 로그인</li>
                                    </ul>
                                </button>
                            </div>
                        </div>
                    </fieldset>
                </form>

            </section><!-- // login_section -->

        </main><!-- //main_wrap -->

        <!-- 회원가입 -->
        <div class="sign_btn">
            <div class="sign_inner">
                <div class="signsstit">
                    <p>회원가입</p>
                    <span>회원이 아니신가요? </span>
                </div>
                <div class="signup_btn">
                    <button type="button" value="회원가입" onclick="location='signUp.do'">회원가입</button>
                </div>
            </div>
        </div>

    </div><!-- //login_bg -->
</div><!-- //wrap -->
</body>
</html>
