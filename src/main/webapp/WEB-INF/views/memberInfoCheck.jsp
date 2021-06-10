<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi" />
    <title>회원정보 조회&수정</title>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <!-- css -->
    <link rel="stylesheet" href="../../css/default/import.css">
    <link rel="stylesheet" href="../../css/user/userInfoCheck.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function openDaumPostcode() {
            new daum.Postcode({
                oncomplete : function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                    //				document.getElementById('join_zip1').value = data.postcode1;
                    document.getElementById('zip').value = data.zonecode;
                    document.getElementById('address1').value = data.address;

                }
            }).open();
        }
    </script>

    <script src="../../js/user/userInfoCheck.js"></script>


</head>
<body>
<c:if test="${sessionScope.userid == null }">
    <script>
        alert("로그인 후 사용가능한 페이지 입니다.");
        location.href="<%=request.getContextPath()%>/login.do";
    </script>
</c:if>

<c:if test="${sessionScope.userid != null }">
<!-- header -->
<%--<%@ include file="header.jsp"%>--%>

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
        <section class="userinfo_section"><!-- userinfo_section -->
            <h6>회원가입 시 입력하신 정보를 확인, 수정할 수 있습니다.</h6>
            <div class="user_check" ><!-- user_check -->
                <form id="memberInfoCheck" method="post" action="/memberInfoCheck_ok.do"
                      onsubmit="return check()" enctype="multipart/form-data"><!-- 전체 form 요소 시작 -->
                        <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
                    <fieldset>
                        <legend>회원정보 수정 폼</legend>

                        <!-- 프로필 -->
                        <div class="user_profile"><!-- user_profile -->
                            <div class="mem_edat">
                                <span class="icon"><i class='bx bx-user'></i></span>
                                <span class="text">프로필 이미지 변경</span>
                            </div>

                            <div class="mem_world">
                                <div class="text_tit">
                                    <span>프로필</span>
                                </div>
                                <div class="upload_profile">
                                    <div class="proview"><!-- 현재 프로필 -->
                                        <span>
                                            <img src="<%=request.getContextPath() %>/imgUpload/${user.profile}"/>

                                        </span>
                                    </div>
                                    <div class="img_upload">
                                        <input type="file" name="userUp_profile" />
<%--                                        <button type="button">이미지 업로드</button>--%>
                                    </div>
                                </div>
                            </div>

                        </div><!-- user_profile -->

                        <!-- 닉네임 -->
                        <div class="user_aka"><!-- user_aka -->
                            <div class="mem_edat">
                                <span class="icon"><i class='bx bx-user'></i></span>
                                <span class="text">닉네임 설정</span>
                            </div>

                            <div class="mem_world">
                                <div class="text_tit">
                                    <span>닉네임 설정</span>
                                </div>
                                <div class="aka_upl">
                                    <div class="test">
                                        <div class="proview"><!-- 닉네임 설정 -->
                                            <label for="aka"></label>
                                            <input id="aka" type="text" name="aka" value="${editm.name}" />
                                        </div>
                                        <div class="btn_check">
                                            <button type="button" value="닉네임 중복 확인" id="akaCheck" onclick="aka_Check()" >닉네임 중복 확인</button>
                                        </div>
                                    </div>
                                    <!-- 닉네임 입력 메세지 : 중복 닉네임 입니다.-->
                                    <div id="akaError" class="text_red"></div>
                                </div>
                            </div>

                        </div><!-- user_aka -->

                        <!-- 비밀번호 -->
                        <div class="user_pw"><!-- user_pw -->
                            <div class="mem_edat">
                                <span class="icon"><i class='bx bx-lock'></i></span>
                                <span class="text">바밀번호 변경</span>
                            </div>

                            <div class="mem_world">
                                <div class="text_tit">
                                    <span>비밀번호 변경</span>
                                </div>
                                <div class="pw_de">
                                    <div class="info_word"><!-- 현재 비밀번호 -->
                                        <label for="passwdCH"></label>
                                        <input id="passwdCH" type="password" name="passwdCH" value="" />
                                    </div>
                                    <div class="info_word"><!-- 변경 비밀번호 -->
                                        <label for="passwd"></label>
                                        <input id="passwd" type="password" name="passwd" placeholder="새 비밀번호">
                                        <span>영문/숫자/특수문자를 사용하며, 8~16자리로 입력해주세요.</span>
                                    </div>
                                    <div class="info_word">
                                        <label for="passwdConfirm"></label>
                                        <input id="passwdConfirm" type="password" name="passwdConfirm" placeholder="새 비밀번호 확인">
                                    </div>
                                </div>
                            </div>

                        </div><!-- user_pw -->


                        <!-- 주소 수정 -->
                        <div class="user_ads"><!-- user_ads -->
                            <div class="mem_edat">
                                <span class="icon"><i class='bx bx-comment-edit' ></i></span>
                                <span class="text">주소</span>
                            </div>

                            <div class="mem_world">
                                <div class="text_tit">
                                    <span>주소 변경</span>
                                </div>
                                <div class="ads_de">
                                    <div class="info_word"><!-- 우편번호 -->
                                        <div class="zip_wd">
                                            <input id="zip" type="text" name="zip" placeholder="우편번호"
                                                   readonly onclick="post_search()" value="${editm.zip}">
                                        </div>
                                        <div class="btn_ZIPcheck"><!-- 우편번호 검색 버튼  -->
                                            <button type="button" value="우편번호검색" onClick="openDaumPostcode()" id="addressCheck" class="address_check_box" >우편번호 검색</button>
                                        </div>
                                    </div><!-- // 우편번호 -->
                                    <div class="address1">
                                        <label for="address1"></label>
                                        <input id="address1" type="text" name="address1" placeholder="상세주소"
                                               readonly value="${editm.address1}" onclick="post_search()">
                                    </div>
                                    <div class="address2">
                                        <label for="address2"></label>
                                        <input id="address2" type="text" name="address2" placeholder="동/호수 입력"
                                               value="${editm.address2}" >
                                    </div>
                                </div>
                            </div>

                        </div><!-- user_ads -->

                        <!-- 핸드폰번호 수정 -->
                        <div class="user_phone"><!-- user_phone -->
                            <div class="mem_edat">
                                <span class="icon"><i class='bx bx-comment-edit' ></i></span>
                                <span class="text">핸드폰번호</span>
                            </div>

                            <div class="mem_world">
                                <div class="text_tit">
                                    <span>핸드폰번호 변경</span>
                                </div>
                                <div class="ph_de">
                                    <div class="info_word"><!-- 핸드폰번호 -->
                                        <div class="ph_wd">
                                            <label for="phone"></label>
                                            <input id="phone" type="tel" name="phone" value="${editm.phone}" placeholder="ex) 010-0000-0000" />
                                        </div>
                                    </div><!-- // 핸드폰번호 -->
                                </div>
                            </div>

                        </div><!-- user_phone -->

                        <!-- 이메일 수정 -->
                        <div class="user_email"><!-- user_email -->
                            <div class="mem_edat">
                                <span class="icon"><i class='bx bx-comment-edit' ></i></span>
                                <span class="text">이메일</span>
                            </div>

                            <div class="mem_world">
                                <div class="text_tit">
                                    <span>이메일</span>
                                </div>
                                <div class="em_de">
                                    <div class="info_word"><!-- 이메일 -->
                                        <div class="email">
                                            <input id="email" type="text" name="email" value="${editm.email}" />
                                            <span>
                                                @
                                            </span>
                                        </div>
                                        <div class="domain">
                                            <input id="domain" type="text" name="domain" value="${editm.domain}">
                                        </div>
                                        <div class="selectd">
                                            <select id="mail_list" name="mail_list" onchange="domain_list()" class="sel" aria-label="이메일 입력">
                                                <option value="" selected="selected">이메일 선택</option>
                                                <option value="0">직접입력</option>
                                                <option value="daum.net"
                                                    <c:if test="${domain == 'daum.net'}">${'selected'}
                                                    </c:if>>daum.net</option>
                                                <option value="nate.com"
                                                        <c:if test="${domain == 'nate.com'}">${'selected'}
                                                        </c:if>>nate.com</option>
                                                <option value="naver.com"
                                                        <c:if test="${domain == 'naver.com'}">${'selected'}
                                                        </c:if>>naver.com</option>
                                                <option value="gmail.com"
                                                        <c:if test="${domain == 'gmail.com'}">${'selected'}
                                                        </c:if>>gmail.com</option>
                                            </select>
                                        </div>
                                    </div><!-- // 이메일 -->
                                </div>
                            </div>

                        </div><!-- user_email -->

                        <!-- 회원정보 수정 버튼 -->
                        <div class="complete"><!-- complete 시작 -->
                            <button type="submit" value="정보 수정" id="join" class="join_box">정보 수정</button>
                        </div><!-- //complete -->

                    </fieldset>
                </form><!-- // 전체 form 요소 끝 -->
            </div><!-- // user_check -->
        </section><!-- // userinfo_section -->

    </main><!-- //main_wrap -->
</div><!-- //wrap -->
</c:if>
</body>
</html>
