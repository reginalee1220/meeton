// 회원정보 수정 유효성 검사

// 닉네임 중복 체크
function aka_Check(){
    $("#akaError").hide();//idcheck span 아이디 영역을 숨긴다.
    var userid=$("#aka").val();
    //1.입력글자 길이 체크
    if($.trim($("#aka").val()).length < 2){
        var newtext='2~20자리로만 사용 가능합니다.';
        $("#akaError").text('');
        $("#akaError").show();
        $("#akaError").append(newtext);//span 아이디 영역에 경고문자 추가
        $("#aka").val("").focus();
        return false;
    };
    if($.trim($("#userid").val()).length >20){
        var newtext='2~20자리로만 사용 가능합니다.';
        $("#akaError").text('');
        $("#akaError").show();
        $("#akaError").append(newtext);//span 아이디 영역에 경고문자 추가
        $("#aka").val("").focus();
        return false;
    };

    // 입력아이디 유효성 검사
    // if(!(validate_aka(aka))){
    //     var newtext='영문 소문자/숫자 5~20자리로만 사용 가능합니다.';
    //     $("#akaError").text('');//문자 초기화
    //     $("#akaError").show();//span 아이디 영역을 보이게 한다.
    //     $("#akaError").append(newtext);
    //     $("#aka").val("").focus();
    //
    //
    //     return false;
    // };


    //닉네임 중복확인
    $.ajax({
        type:"POST",
        url:"user_akaCheck.do",
        data: {"aka" : aka},
        success: function (data) {
            alert("return success="+data);
            if(data==1){	//중복 닉네임
                var newtext='중복 닉네임입니다.';
                $("#akaError").text('');
                $("#akaError").show();
                $("#akaError").append(newtext);
                $("#aka").val('').focus();
                return false;

            }else{	//사용 가능한 닉네임
                var newtext='사용가능한 닉네임입니다.';
                $("#akaError").text('');
                $("#akaError").show();
                $("#akaError").append(newtext);
                // $("#passwd").focus();
            }
        }
        ,
        error:function(e){
            alert("data error"+e);
        }
    });//$.ajax
};
// 아이디 중복 체크 끝

// 정규식 표현식
// function validate_aka(aka)
// {
//     var pattern= new RegExp(/^[a-z0-9_]+$/);
//     //영문 소문자,숫자 ,_가능,정규표현식
//     return pattern.test(aka);
// };



/* 회원정보 수정 경고창 */

// function edit_check(){
//     if($.trim($("#passwdCH").val())==""){
//         alert("현재 회원비번을 입력하세요!");
//         $("#passwdCH").val("").focus();
//         return false;
//     }
//
//     if($.trim($("#passwd").val())==""){
//         alert("새 비밀번호를 입력하세요");
//         $("#passwd").val("").focus();
//         return false;
//     }
//
//     if($.trim($("#passwdConfirm").val())==""){
//         alert("새 비밀번호를 확인하세요!");
//         $("#passwdConfirm").val("").focus();
//         return false;
//     }
//     if($.trim($("#passwd").val()) != $.trim($("#passwdConfirm").val())){
//         //!=같지않다 연산. 비번이 다를 경우
//         alert("비번이 다릅니다!");
//         $("#passwd").val("");
//         $("#passwdConfirm").val("");
//         $("#passwd").focus();
//         return false;
//     }
//
// }

