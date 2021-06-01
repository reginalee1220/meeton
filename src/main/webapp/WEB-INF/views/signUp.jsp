<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>회원가입</title>
    <!-- css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default/import.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/signUp.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 주소 -->
    <script type="text/javascript">
        function openDaumPostcode() {
            new daum.Postcode({
                oncomplete : function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
//				document.getElementById('join_zip1').value = data.postcode1;
//				document.getElementById('join_zip2').value = data.postcode2;
                    document.getElementById('zip').value = data.zonecode;
                    document.getElementById('address1').value = data.address;

                }
            }).open();
        }
    </script>

    <script src="./js/user/signUp.js"></script>

</head>
<body>
<!-- header -->
<%@ include file="header.jsp" %>
<div class="wrap"><!-- wrap 시작 -->
    <div class="top_title">
        <div class="top_inner">
            <h1>MEETON 회원가입</h1>
        </div>
    </div>
    <main id="main-wrap"><!-- main-wrap 시작 -->
        <section class="signup_section"><!-- 회원가입 signup_section 시작 -->
            <form id="signupForm" method="post" action="/user_signup_ok.do"
                    onsubmit="return check()" enctype="multipart/form-data"><!-- 전체 form 요소 시작 -->
                <fieldset>
                    <legend>SignUp Form</legend>
                    <!-- 아이디 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <span>*</span>
                                    <label for="userid">아이디</label>
                                </div>
                                <div class="info_word">
                                    <input id="userid" type="text" name="userid" placeholder="영문 소문자/숫자 5~20자리 입력해주세요.">
                                </div>
                            </div><!-- // mem_info -->
                            <div class="btn_check">
                                <button type="button" value="ID중복검사" id="idCheck" onclick="id_check()" >ID 중복 확인</button>
                            </div>
                        </div><!-- // frg -->

                        <!-- 아이디 입력 메세지 : ID를 입력 해주세요. -->
                        <div id="idMsg" class="text_red"></div>
                        <!-- 아이디 입력 메세지 :영문 소문자/숫자 5~20자리로만 사용 가능합니다.-->
                        <div id="idMsgError" class="text_red"></div>
                        <!-- 아이디 중복 메시지 : 중복 ID 입니다. -->
                        <div id="idError" class="text_red"></div>
                        <!-- 아이디 중복 메시지 : 사용 가능한 ID 입니다. -->
                        <div id="idPass" class="text_purple"></div>

                    </div><!-- // form_group -->

                    <!-- 비밀번호 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <span>*</span>
                                    <label for="passwd">비밀번호</label>
                                </div>
                                <div class="info_word">
                                    <input id="passwd" type="password" name="passwd" placeholder="영문/숫자/특수문자를 사용하며, 8~16자리로 입력해주세요.">
                                </div>
                            </div><!-- // mem_info -->
                        </div><!-- // frg -->

                        <!-- 비밀번호 입력 메세지 : 비밀번호를 입력 해주세요. -->
                        <div id="pwMsg" class="text_red">비밀번호를 입력 해주세요.</div>
                        <!-- 비밀번호 입력 메세지 : 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.-->
                        <div id="pwMsgError" class="text_red"></div>
                        <!-- 비밀번호 내 ID가 포함되거나,연속되는 문자 또는 숫자는 3자리 이상 사용할 수 없습니다. -->

                    </div><!-- // form_group -->

                    <!-- 비밀번호 재입력 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <span>*</span>
                                    <label for="passwdConfirm">비밀번호 확인</label>
                                </div>
                                <div class="info_word">
                                    <input id="passwdConfirm" type="password" name="passwdConfirm" placeholder="비밀번호 확인">
                                </div>
                            </div><!-- // mem_info -->
                        </div><!-- // frg -->

                        <!-- 비밀번호 재입력 중복 메세지 : 비밀번호를 입력 해주세요. -->
                        <div id="pwMsg2" class="text_red">비밀번호를 입력 해주세요.</div>
                        <!-- 비밀번호 일치 메세지 : 비밀번호가 일치하지 않습니다 다시 입력 해주세요. -->
                        <div id="pwMsgError2" class="text_red"></div>

                    </div><!-- // form_group -->

                    <!-- 이름 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <span>*</span>
                                    <label for="name">이름</label>
                                </div>
                                <div class="info_word">
                                    <input id="name" type="text" name="name" placeholder="이름">
                                </div>
                            </div><!-- // mem_info -->
                        </div><!-- // frg -->

                        <!-- 이름 입력 메세지 : Name(이름)을 입력해주세요.-->
                        <div id="nameError" class="text_red">이름</div>

                    </div><!-- // form_group -->

                    <!-- 핸드폰번호 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <span>*</span>
                                    <label for="phone">휴대폰번호</label>
                                </div>
                                <div class="info_word">
                                    <input id="phone" type="tel" name="phone" placeholder="‘-’없이 입력하세요.">
                                </div>
                            </div><!-- // mem_info -->
                            <div class="btn_check">
                                <button type="button" value="인증번호전송" id="phCheck">인증번호 전송</button>
                            </div>
                        </div><!-- // frg -->

                        <!-- 핸드폰번호 입력 메세지 : 핸드폰번호를 입력 해주세요. -->
                        <div id="phoneMsg" class="text_red"></div>

                    </div><!-- // form_group -->

                    <!-- 핸드폰번호 인증번호 입력 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <label for="phoneAuth"></label>
                                </div>
                                <div class="info_word">
                                    <input id="phoneAuth" type="tel" name="phoneAuth" placeholder="인증번호를 입력하세요.">
                                </div>
                            </div><!-- // mem_info -->
                            <div class="btn_check">
                                <button type="button" value="인증번호입력" id="authCheck">인증번호 입력</button>
                            </div>
                        </div><!-- // frg -->

                        <!-- 핸드폰번호 입력 메세지 : 인증번호를 입력 해주세요. -->
                        <div id="authMsg" class="text_red"></div>
                        <!-- 핸드폰번호 입력 메세지 : 인증번호 성공 -->
                        <div id="authPass" class="text_purple">인증번호 성공</div>

                    </div><!-- // form_group -->

                    <!-- 이메일 입력 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <span>*</span>
                                    <label for="email">이메일</label>
                                </div>
                                <div class="info_word_ema">
                                    <div class="email">
                                        <input id="email" type="text" name="email" placeholder="email" />
                                        <span>
                                            @
                                        </span>
                                    </div>
                                    <div class="domain">
                                        <input id="domain" type="text" name="domain" placeholder="doamin" />
                                    </div>
                                    <div class="selectd">
                                        <select id="mail_list" name="mail_list" onchange="domain_list()" class="sel" aria-label="이메일 입력">
                                            <option value="" selected="selected">이메일 선택</option>
                                            <option value="0">직접입력</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="gmail.com">gmail.com</option>
                                            <option value="nate.com">nate.com</option>
                                        </select>
                                    </div>
                                </div>
                            </div><!-- // mem_info -->
                            <div class="btn_check">
                                <button type="button" value="이메일인증번호" id="emailCheck">인증번호 전송</button>
                            </div>
                        </div><!-- // frg -->

                        <!-- 이메일 입력 메세지 : 이메일을 입력 해주세요. -->
                        <div id="emailMsg" class="text_red"></div>
                        <!-- 이메일 인증 완료 메세지 : 이메일 인증이 완료 되었습니다. -->
                        <div id="emailPass" class="text_purple">인증번호 성공</div>

                    </div><!-- // form_group -->

                    <!-- 주소 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg_ad"><!-- frg_ad -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <span>*</span>
                                    <label for="zip">주소</label>
                                </div>
                                <div class="info_word">
                                    <input id="zip" type="text" name="zip" placeholder="우편번호" readonly onclick="post_search() ">
                                </div>
                            </div><!-- // mem_info -->
                            <div class="btn_ZIPcheck"><!-- 우편번호 검색 버튼  -->
                                <button type="button" value="우편번호검색" onClick="openDaumPostcode()" id="addressCheck" class="address_check_box" >우편번호 검색</button>
                            </div>
                        </div><!-- // frg_ad -->

                    </div><!-- // form_group -->

                    <!-- 상세주소 입력 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <label for="address1"></label>
                                    <label for="address2"></label>
                                </div>
                                <div class="info_word_ads">
                                    <div class="address1">
                                        <input id="address1" type="text" name="address1" placeholder="상세주소"
                                               readonly onclick="post_search()">
                                    </div>
                                    <div class="address2">
                                        <input id="address2" type="text" name="address2" placeholder="동/호수 입력">
                                    </div>
                                </div>
                            </div><!-- // mem_info -->
                        </div><!-- // frg -->

                        <!-- 주소 입력 메세지 : 주소를 입력 해주세요. -->
                        <div id="address_msg" class="text_red">주소를 입력 해주세요.</div>

                    </div><!-- // form_group -->

                    <!-- 생일 입력 -->
                    <div class="form_group"><!-- form_group -->
                        <div class="frg"><!-- frg -->
                            <div class="mem_info"><!-- mem_info -->
                                <div class="info_name">
                                    <span>*</span>
                                    <label for="year">생일</label>
                                </div>
                                <div class="info_word_bth">
                                    <div class="year"><!-- 년 입력  -->
                                        <input id="year" type="text" name="year" placeholder="년도(입력)">
                                    </div><!-- //년 입력  -->
                                    <div class="month"><!-- 월 선택  -->
                                        <label for="month" class="ldl"></label>
                                        <select id="month" name="month" class="sel" aria-label="월 선택">
                                            <option value="00" selected="selected">월 선택</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div><!-- //월 선택  -->
                                    <div class="day"><!-- 일 입력 -->
                                        <label for="day" class="ldl"></label>
                                        <input id="day" type="text" name="day" placeholder="일(입력)" >
                                    </div><!-- //일 입력 -->
                                </div>
                            </div><!-- // mem_info -->
                        </div><!-- // frg -->

                        <!-- 생일 입력 메세지 : 년도4자리를 입력 해주세요. -->
                        <div id="birtYearMsg" class="text_red"></div>
                        <!-- 생일 입력 메세지 : 월을 선택 해주세요. -->
                        <div id="birthMonthMsg" class="text_purple">인증번호 성공</div>
                        <!-- 생일 입력 메세지 : 일을 입력 해주세요. -->
                        <div id="birthDayMsg" class="text_purple">인증번호 성공</div>

                    </div><!-- // form_group -->


                    <!-- 회원가입,취소 버튼 -->
                    <div class="complete"><!-- complete 시작 -->
                        <button type="reset" value="회원가입취소" id="exit" class="exit_box cmp" onclick="$('#userid').focus();" >취소</button>
                        <button type="submit" value="회원가입완료" id="join" class="join_box cmp">회원가입</button>
                    </div><!-- //complete -->
                </fieldset>
            </form><!-- // 전체 form 요소 끝 -->
        </section><!-- //signup_section -->

    </main><!-- //main-wrap -->
</div><!-- //wrap -->

<!-- footer -->
<%--<%@ include file="footer.jsp" %>--%>
</body>
</html>
