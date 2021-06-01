function check(){
    if($.trim($("#pwd").val())==""){
    alert("비밀번호를 입력하세요!");
    $("#pwd").val("").focus();
    return false;
}
    if($.trim($("#del_cont").val())==""){
    alert("탈퇴사유를 입력하세요!");
    $("#del_cont").val("").focus();
    return false;
}
}
