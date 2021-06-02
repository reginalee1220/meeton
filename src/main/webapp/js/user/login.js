// 로그인
function check(){
    if($.trim($("#userid").val())==""){
        alert("로그인 아이디를 입력하세요!");
        $("#userid").val("").focus();
        return false;
    }
    if($.trim($("#passwd").val())==""){
        alert("비밀번호를 입력하세요!");
        $("#passwd").val("").focus();
        return false;
    }
}

/*비번찾기 공지창*/
function pwd_find() {
    window.open("pwd_find.do", "비번찾기", "width=450,height=500");
//자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
//메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
}


// 구글 로그인 버튼
// function onSignIn(googleUser) {
//     var profile = googleUser.getBasicProfile();
//     var id_token = googleUser.getAuthResponse().id_token;
//     $("#googleBtn").click(function(){
//         $.ajax({
//             url: 'user_login_ok.do',
//             type: 'POST',
//             data: 'idtoken=' + id_token,
//             dataType: 'JSON',
//             beforeSend : function(xhr){
//                 xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
//             },
//             success: function(json) {
//                 if (json.login_result == "success"){
//                     location.href = "로그인 완료 후 이동할 main 주소";
//                 }//end if
//             }//success
//         });//ajax
//     }); //click