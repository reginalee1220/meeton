function check(){
    if($.trim($("#passwd").val())==""){
        alert("비밀번호를 입력하세요!");
        $("#passwd").val("").focus();
        return false;
    }
}
