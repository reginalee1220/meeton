// 회원가입 유효성
function check(){
    if($.trim($("#userid").val())==""){
        alert("회원아이디를 입력하세요!");
        $("#userid").val("").focus();
        return false;
    }
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
        $("#phone").val("").focus();
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

// 우편번호 검색 버튼
function post_search(){
    alert("우편번호 검색 버튼을 클릭하세요!");
}

function post_check(){
    window.open("zipcode_find.do","우편번호검색",
        "width=420,height=200,scrollbars=yes");
    //폭이 420이고 높이가 200,스크롤바가 생성되는 새로운 공지창을 만듬
}


// 아이디 중복 체크
function id_check(){
    //$("#idMsg").hide();//idcheck span 아이디 영역을 숨긴다.
    var userid=$("#userid").val();
    //1.입력글자 길이 체크
    if($.trim($("#userid").val()).length < 5){
        var newtext='영문 소문자/숫자 5~20자리로만 사용 가능합니다.';
        $("#idMsg").text('');
        $("#idMsg").show();
        $("#idMsg").append(newtext);//span 아이디 영역에 경고문자 추가
        $("#userid").val("").focus();
        return false;
    };
    if($.trim($("#userid").val()).length >20){
        var newtext='영문 소문자/숫자 5~20자리로만 사용 가능합니다.';
        $("#idMsg").text('');
        $("#idMsg").show();
        $("#idMsg").append(newtext);//span 아이디 영역에 경고문자 추가
        $("#userid").val("").focus();
        return false;
    };
    //입력아이디 유효성 검사
    if(!(validate_userid(userid))){
        var newtext='영문 소문자/숫자 5~20자리로만 사용 가능합니다.';
        $("#idMsg").text('');//문자 초기화
        $("#idMsg").show();//span 아이디 영역을 보이게 한다.
        $("#idMsg").append(newtext);
        $("#userid").val("").focus();
        return false;
    };




    //아이디 중복확인
    $.ajax({
        type:"POST",
        url:"user_idCheck.do",
        data: {"userid":userid},
        success: function (data) {
            alert("return success="+data);
            if(data==1){	//중복 ID
                var newtext='중복 아이디입니다.';
                $("#idMsg").text('');
                $("#idMsg").show();
                $("#idMsg").append(newtext);
                $("#userid").val('').focus();
                return false;

            }else{	//사용 가능한 ID
                var newtext='사용가능한 아이디입니다.';
                $("#idPass").text('');
                $("#idPass").show();
                $("#idPass").append(newtext);
                $("#passwd").focus();
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
function validate_userid(userid)
{
    var pattern= new RegExp(/^[a-z0-9_]+$/);
    //영문 소문자,숫자 ,_가능,정규표현식
    return pattern.test(userid);
};

// 메일 도메인 표현식
function domain_list() {
    var num=f.mail_list.selectedIndex;
    /*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
    */
    if ( num == -1 ) {
        //num==-1은 해당 리스트목록이 없다
        return true;
    }
    if(f.mail_list.value=="0") // 직접입력
    {
        /*리스트에서 직접입력을 선택했을때*/
        f.domain.value="";
        //@뒤의 도메인입력란을 빈공간시켜라.
        f.domain.readOnly=false;
        //@뒤의 도메인입력란을 쓰기 가능
        f.domain.focus();
        //도메인입력란으로 입력대기상태
    }

    else {
        //리스트목록을 선택했을때

        f.domain.value=f.mail_list.options[num].value;
        /*num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
        */
        f.domain.readOnly=true;
    }
}