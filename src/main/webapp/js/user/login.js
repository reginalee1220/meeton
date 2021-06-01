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