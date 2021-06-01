// 회원정보 수정 유효성 검사

function edit_check(){
    if($.trim($("#passwd").val())==""){
        alert("회원비번을 입력하세요!");
        $("#passwd").val("").focus();
        return false;
    }
    if($.trim($("#passwdConfirm").val())==""){
        alert("회원비번확인을 입력하세요!");
        $("#passwdConfirm").val("").focus();
        return false;
    }
    if($.trim($("#passwd").val()) != $.trim($("#passwdConfirm").val())){
        //!=같지않다 연산. 비번이 다를 경우
        alert("비번이 다릅니다!");
        $("#passwd").val("");
        $("#passwdConfirm").val("");
        $("#passwd").focus();
        return false;
    }
    if($.trim($("#name").val())==""){
        alert("회원이름을 입력하세요!");

        $("#name").val("").focus();
        return false;
    }

    if($.trim($("#phone").val())==""){
        alert("휴대전화번호를 입력하세요!");
        $("#join_phone3").val("").focus();
        return false;
    }

    if($.trim($("#email").val())==""){
        alert("메일 아이디를 입력하세요!");
        $("#email").val("").focus();
        return false;
    }
    if($.trim($("#domain").val())==""){
        alert("메일 주소를 입력하세요!");
        $("#domain").val("").focus();
        return false;
    }

    if($.trim($("#address1").val())==""){
        alert("주소를 입력하세요!");
        $("#address1").val("").focus();
        return false;
    }
    if($.trim($("#address2").val())==""){
        alert("나머지 주소를 입력하세요!");
        $("#address2").val("").focus();
        return false;
    }


}

