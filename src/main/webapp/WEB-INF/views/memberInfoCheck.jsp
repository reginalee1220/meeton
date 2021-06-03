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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default/import.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/userinfoCheck.css">

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

    <script src="./js/user/userInfoCheck.js"></script>

    <style>
        /* userInfoCheck.css layout */
        *{margin:0; padding:0; box-sizing: border-box; font-family: 'Noto Sans KR', sans-serif;}
        ul, ol, li {list-style: none;}
        a {color: #333; text-decoration: none; line-height: 1;}
        a:hover, a:focus, a:active {text-decoration:none;}
        /*===========================================================================*/
        /* ------- 메인 레이아웃 ------- */
        /* 전체 layout */
        .wrap{width:100%; height:auto; box-sizing: border-box;}
        .null {display: none;} /* 더미 숨기기 */
        legend{display: none;} /* 더미 숨기기 */
        fieldset{border:none;} /* 더미 숨기기 */
        /* 유효성 검사 메세지 */
        .text_red {font-size: 13px; line-height: 14px; margin:10px 0 10px 60px; color: #bc3838; text-align: left;}
        .text_purple {font-size: 13px; line-height: 14px;  margin:10px 0 10px 120px; color: #53afdc; text-align: left;}
        /*===========================================================================*/
        /* ------- 타이틀 ------- */
        .userinfo_top{
            width: 100%;
            background-color: #fafbfc;
        }
        .userinfo_inner{
            max-width: 970px;
            margin: 0 auto;
        }
        .userinfo_inner > h2{
            padding-top:70px;
            font-size: 30px;
            font-weight: bold;
            color:#4e4e4e;
        }
        /*===========================================================================*/
        /* ------- 네비게이션 ------- */
        .userinfo_top .katego{
            width: 100%;
            background-color: #fafbfc;
            border-bottom: 1px solid #d8d8d8;
        }
        .userinfo_top .katego .userinfo_nav{
            width: 970px;
            height: 100px;
            margin: 0 auto;
            padding-top:65px;
        }
        .userinfo_top .katego .userinfo_nav > ul > li {
            display: inline;
            width: 120px;
            height: 35px;
            margin-right: 10px;
        }
        .userinfo_top .katego .userinfo_nav > ul > li.my_info > button {
            width: 120px;
            height: 35px;
            color:#53afdc;
            font-size:15px;
        }
        .userinfo_top .katego .userinfo_nav > ul > li > button {
            width: 120px;
            height: 35px;
            background: #fff;
            border:#fff;
            color:#4e4e4e;
            font-size:15px;
            transition: 0.3s;
            cursor: pointer;
        }
        .userinfo_top .katego .userinfo_nav > ul > li > button:hover {
            width: 120px;
            height: 35px;
            color:#53afdc;
            font-size:15px;
            border-bottom: 1px solid #53afdc;
        }
        /*===========================================================================*/
        /* ------- 정보수정폼 ------- */
        .userinfo_section{
            width: 970px;
            height: auto;
            margin:0 auto;
        }
        .userinfo_section h6{
            font-size:13px;
            color:#878787;
            padding-top:20px;
        }

        .userinfo_section .user_check{
            padding-top:95px;
        }
        /* ------- 프로필 ------- */
        .userinfo_section .user_check .user_profile{
            width: 100%;
        }
        .userinfo_section .user_check .user_profile > .mem_edat > span{
            vertical-align: middle;
            font-size:17px;
            color:#878787;
        }
        /* 프로필 수정 업로드 */
        .userinfo_section .user_check .user_profile .mem_world{
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 100%;
            border-top:1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;
            margin-top:15px;
        }
        .userinfo_section .user_check .user_profile .mem_world .text_tit{
            width: 30%;
            padding-top:58px;
            padding-bottom: 58px;
            text-align: center;
            background: #f8f8f8;
            border-right: 1px solid #e9e9e9;
        }
        .userinfo_section .user_check .user_profile .mem_world .text_tit > span {
            font-size: 15px;
            color: #878787;
        }
        /* 프로필 프리뷰 & 업로드 */
        .userinfo_section .user_check .user_profile .upload_profile {
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 70%;
        }
        /* 프로필 이미지 프리뷰 */
        .userinfo_section .user_check .user_profile .upload_profile .proview{
            width: 100px;
            height: 100px;
            border: 2px solid transparent;
            border-radius: 5px;
            background-image:
                    linear-gradient(#a0ffb4, #a0ffb4),
                    linear-gradient(to top, #4ba9e1, #a0ffb4);
            background-origin: border-box;/*이미지 시작 위치*/
            background-clip: content-box, border-box; /*이미지 잘릴 위치*/
            overflow: hidden;
            margin: 0 20px 0 50px;
        }
        .userinfo_section .user_check .user_profile .upload_profile .proview img{
            width:100%;
        }
        /* 프로필 업로드 버튼 */
        .userinfo_section .user_check .user_profile .upload_profile .img_upload{
            width: 70%;
        }
        .userinfo_section .user_check .user_profile .upload_profile .img_upload input[type="file"]{
            padding-left:1em; font-family: inherit; background-color:#fff;border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }

        /*===========================================================================*/
        /* ------- 닉네임 ------- */
        .userinfo_section .user_check .user_aka{
            width: 100%;
            margin-top: 30px;
        }
        .userinfo_section .user_check .user_aka > .mem_edat > span{
            vertical-align: middle;
            font-size:17px;
            color:#878787;
        }
        /* 닉네임 수정  */
        .userinfo_section .user_check .user_aka .mem_world{
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 100%;
            border-top:1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;
            margin-top:15px;

        }
        .userinfo_section .user_check .user_aka .mem_world .text_tit{
            width: 30%;
            padding-top:58px;
            padding-bottom: 58px;
            text-align: center;
            background: #f8f8f8;
            border-right: 1px solid #e9e9e9;
        }
        .userinfo_section .user_check .user_aka .mem_world .text_tit > span {
            font-size: 15px;
            color: #878787;
        }
        /* 닉네임 & 중복확인체크 */
        .userinfo_section .user_check .user_aka .mem_world .aka_upl{
            width: 70%;
        }
        .userinfo_section .user_check .user_aka .mem_world .aka_upl .test{
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 70%;

        }
        .userinfo_section .user_check .user_aka .mem_world .aka_upl .test .proview{
            width: 40%;
            margin: 0 20px 0 50px;

        }
        .test > .proview input[type="text"]{
            width: 210px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        /* focus */
        .test > .proview input[type="text"]:focus{
            width:210px;
            height:40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }
        /* 중복체크 */
        .userinfo_section .user_check .user_aka .mem_world .aka_upl .test .btn_check{
            width:30%;
            margin-left:30px;
        }
        /* 중복 버튼 */
        .userinfo_section .user_check .user_aka .mem_world .aka_upl .btn_check button{
            width: 150px;
            height: 45px;
            border-radius: 10px;
            border:1px solid #d7d7dd;
            background-color: #fff;
            font-size: 13px;
            color: #666666;
            text-align: center;
            cursor: pointer;
            transition: 0.5s;

        }
        .userinfo_section .user_check .user_aka .mem_world .aka_upl .btn_check button a{
            color: #666666;
            text-align: center;
            transition: 0.3s;
        }
        .userinfo_section .user_check .user_aka .mem_world .aka_upl .btn_check button:hover{
            width: 150px;
            height: 45px;
            background:linear-gradient(312deg, rgba(76,168,223,1) 0%, rgba(160,255,180,1) 100%);
            border-radius: 10px;
            box-shadow: 3px 3px 3px 1px rgba(76, 76, 76, .2);
            border:1px solid #f2f2f3;
            color: #fff;
        }
        .userinfo_section .user_check .user_aka .mem_world .aka_upl .btn_check button a:hover{
            color: #fff;
            text-align: center;
        }
        /*===========================================================================*/
        /* ------- 비밀번호 ------- */
        .userinfo_section .user_check .user_pw{
            width: 100%;
            margin-top: 30px;
        }
        .userinfo_section .user_check .user_pw > .mem_edat > span{
            vertical-align: middle;
            font-size:17px;
            color:#878787;
        }
        /* 비밀번호 수정  */
        .userinfo_section .user_check .user_pw .mem_world{
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 100%;
            border-top:1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;
            margin-top:15px;
        }
        .userinfo_section .user_check .user_pw .mem_world .text_tit{
            width: 30%;
            padding-top:58px;
            padding-bottom: 150px;
            text-align: center;
            background: #f8f8f8;
            border-right: 1px solid #e9e9e9;
        }
        .userinfo_section .user_check .user_pw .mem_world .text_tit > span {
            font-size: 15px;
            color: #878787;
        }
        /* 비밀번호 입력 */
        .userinfo_section .user_check .user_pw .mem_world .pw_de{
            width: 70%;
            padding-left:50px;
        }
        .userinfo_section .user_check .user_pw .mem_world .pw_de .info_word{
            width: 100%;
            margin-bottom: 7px;
        }
        .userinfo_section .user_check .user_pw .mem_world .pw_de .info_word > span{
            font-size:12px;
            color: #878787;
        }
        .pw_de .info_word input[type="password"]{
            width: 250px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        .pw_de .info_word:nth-child(3){
            padding-bottom: 20px;
        }
        /* focus */
        .info_word input[type="password"]:focus{
            width:250px;
            height:40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }
        /*===========================================================================*/
        /* ------- 주소 ------- */
        .userinfo_section .user_check .user_ads{
            width: 100%;
            margin-top: 30px;
        }
        .userinfo_section .user_check .user_ads > .mem_edat > span{
            vertical-align: middle;
            font-size:17px;
            color:#878787;
        }
        /* 주소 수정  */
        .userinfo_section .user_check .user_ads .mem_world{
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 100%;
            border-top:1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;
            margin-top:15px;
        }
        .userinfo_section .user_check .user_ads .mem_world .text_tit{
            width: 30%;
            padding-top:58px;
            padding-bottom: 150px;
            text-align: center;
            background: #f8f8f8;
            border-right: 1px solid #e9e9e9;
        }
        .userinfo_section .user_check .user_ads .mem_world .text_tit > span {
            font-size: 15px;
            color: #878787;
        }
        /* 주소 입력 */
        .userinfo_section .user_check .user_ads .mem_world .ads_de{
            width: 70%;
            padding-left:50px;
        }
        .userinfo_section .user_check .user_ads .mem_world .ads_de .info_word{
            display: flex;
            width: 100%;
        }
        /* 우편번호 검색 버튼 */
        .ads_de .info_word .btn_ZIPcheck button{
            width: 150px;
            height: 45px;
            border-radius: 10px;
            border:1px solid #d7d7dd;
            background-color: #fff;
            font-size:15px;
            color: #666666;
            text-align: center;
            cursor: pointer;
            transition: 0.5s;
            margin-left: 20px;
        }
        .ads_de .info_word .btn_ZIPcheck button a{
            color: #666666;
            text-align: center;
            transition: 0.3s;
        }
        .ads_de .info_word .btn_ZIPcheck button:hover{
            width: 150px;
            height: 45px;
            background:linear-gradient(312deg, rgba(76,168,223,1) 0%, rgba(160,255,180,1) 100%);
            border-radius: 10px;
            box-shadow: 3px 3px 3px 1px rgba(76, 76, 76, .2);
            border:1px solid #f2f2f3;
            color: #fff;
        }
        .ads_de .info_word .btn_ZIPcheck button a:hover{
            color: #fff;
            text-align: center;
        }
        .userinfo_section .user_check .user_ads .mem_world .ads_de .address1{
            width: 100%;
            margin-top:10px;
            margin-bottom: 10px;
        }
        /* 우편번호 input 요소 */
        .zip_wd > input[type="text"]{
            width:210px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        .address1 > input[type="text"]{
            width:450px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        .address2 > input[type="text"]{
            width:450px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        /* focus */
        .info_word input[type="text"]:focus{
            width:210px;
            height:40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }
        .address1 > input[type="text"]:focus{
            width:450px;
            height:40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }
        .address2 > input[type="text"]:focus{
            width:450px;
            height:40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }
        /*===========================================================================*/
        /* ------- 핸드폰번호 ------- */
        .userinfo_section .user_check .user_phone{
            width: 100%;
            margin-top: 30px;
        }
        .userinfo_section .user_check .user_phone > .mem_edat > span{
            vertical-align: middle;
            font-size:17px;
            color:#878787;
        }
        /* 핸드폰번호 수정  */
        .userinfo_section .user_check .user_phone .mem_world{
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 100%;
            border-top:1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;
            margin-top:15px;
        }
        .userinfo_section .user_check .user_phone .mem_world .text_tit{
            width: 30%;
            padding-top:50px;
            padding-bottom: 50px;
            text-align: center;
            background: #f8f8f8;
            border-right: 1px solid #e9e9e9;
        }
        .userinfo_section .user_check .user_phone .mem_world .text_tit > span {
            font-size: 15px;
            color: #878787;
        }
        /* 핸드폰번호 입력 */
        .userinfo_section .user_check .user_phone .mem_world .ph_de{
            width: 70%;
            padding-left:50px;
            padding-bottom: 20px;
        }
        .userinfo_section .user_check .user_phone .mem_world .ph_de .info_word{
            width: 100%;
        }
        .info_word .ph_wd input[type="tel"]{
            width:450px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        /* focus */
        .info_word .ph_wd input[type="tel"]:focus{
            width:450px;
            height:40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }
        /*===========================================================================*/
        /* ------- 이메일 ------- */
        .userinfo_section .user_check .user_email{
            width: 100%;
            margin-top: 30px;
        }
        .userinfo_section .user_check .user_email > .mem_edat > span{
            vertical-align: middle;
            font-size:17px;
            color:#878787;
        }
        /* 이메일 수정  */
        .userinfo_section .user_check .user_email .mem_world{
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 100%;
            border-top:1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;
            margin-top:15px;
        }
        .userinfo_section .user_check .user_email .mem_world .text_tit{
            width: 30%;
            padding-top:50px;
            padding-bottom: 50px;
            text-align: center;
            background: #f8f8f8;
            border-right: 1px solid #e9e9e9;
        }
        .userinfo_section .user_check .user_email .mem_world .text_tit > span {
            font-size: 15px;
            color: #878787;
        }

        .userinfo_section .user_check .user_email .mem_world .em_de{
            width: 70%;
            padding-left:50px;
            padding-bottom: 20px;
        }
        .userinfo_section .user_check .user_email .mem_world .em_de .info_word{
            display: flex;
            /* align-content:center; 줄이 여러개일 때 한 줄에 대한 세로축 높이가 똑같을 때 사용 */
            align-items:center; /* 한줄에대한 높이가 다를 때 세로축 */
            flex-direction:row; /* 기본값 */
            justify-content:flex-start; /* 가록 축 정렬에 대한 설정값 */
            flex-wrap: wrap;
            width: 100%;
        }
        .userinfo_section .user_check .user_email .mem_world .em_de .info_word .domain{
            margin-right: 10px;
            margin-left: 10px;
        }

        .email input[type="text"]{
            width:150px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        .em_de > .domain > input[type="text"]{
            width: 130px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        .em_de > .selectd{
            width:130px;
            height: 40px;
            padding-left:1em; font-family: inherit; background-color:#fff; border: 1px solid #f0f3f6; border-radius: 5px; /* iSO 둥근모서리 제거 */ outline-style: none; -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ appearance: none;
        }
        /* focus */
        .email input[type="text"]:focus{
            width:150px;
            height: 40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }
        .em_de > .domain > input[type="text"]:focus{
            width:130px;
            height: 40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }
        .em_de > select:focus {
            width:130px;
            height: 40px;
            line-height : normal; padding-left:1em; font-family: inherit; background-color:#fff;/* iSO 둥근모서리 제거 */ /* outline-style: none; */ border: solid 2px #9efdb5;border-radius: 5px;  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -moz-appearance: none; /* 브라우저별 기본 스타일링 제거 */ -webkit-transition: 0.5s; transition: 0.5s; appearance: none;
        }







        /* ======= 회원수정 ======= */
        .complete{
            width:970px;
            padding:100px 0 100px 0 ;
        }
        .complete button{
            margin-left:350px;
            width:183px;
            height:50px;
            border-radius: 10px;
            border:1px solid #d7d7dd;
            background-color: #fff;
            font-size: 13px;
            color: #666666;
            text-align: center;
            cursor: pointer;
            transition: 0.5s;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .complete button:hover{
            width:183px;
            height:50px;
            background:linear-gradient(312deg, rgba(76,168,223,1) 0%, rgba(160,255,180,1) 100%);
            box-shadow: 3px 3px 3px 1px rgba(76, 76, 76, .2);
            border-radius: 10px;
            border:1px solid #d7d7dd;
            font-size:13px; color:#ffffff;
            font-family: 'Noto Sans KR', sans-serif;
        }

    </style>


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
                                            <img src="./imgUpload/${user.profile}"/>

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
