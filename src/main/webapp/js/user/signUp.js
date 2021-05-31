// 회원가입 유효성
$(document).ready(function (){

    // User_ID 중복검사
    $("#idCheck").click(function (){
        $('#idError').hide();

        if($("#userId").val() == ""){
            //           alert("ID를 입력 해주세요.");
            $('#idError').text("ID를 입력 해주세요.");
            $("#userId").focus();
            return false;
        }else {
            var userId = $("#userId").val();
            $.ajax({
                type:"post",
                url:"/IdCheck.do",
                data:{"userId":userId},
                datatype:"text",
                success:function (data){
                    // alert(data);
                    if(data == 1){  // 중복 ID0
                        $('#idError').show();
                        $('#idError').text('');
                        $("#idError").text("중복 ID 입니다.");
                        $("#userId").val("").focus();
                    }else {     // 사용 가능한 ID
                        $('#idError').show();
                        $('#idError').text('');
                        $("#idError").text("사용 가능한 ID 입니다.");
                        $("#idError").css("color", "#9b52c7");
                        $("#aka").focus();
                    }
                }
            });
        }

    })// User_ID 중복검사 end

    // 닉네임 중복검사
    $("#akaCheck").click(function (){
//        $("#akaMsg").hide();

        if($("#aka").val() == ""){
            // alert("닉네임을 입력 해주세요.");
            $("#akaError").text("닉네임을 입력 해주세요.");
            $("#aka").focus();
            return false;
        }else {
            var aka = $("#aka").val();
            $.ajax({
                type:"post",
                url:"/AkaCheck.do",
                data:{"aka":aka},
                datatype:"text",
                success:function (data){
                    // alert(data);
                    if(data == 1){  // 중복 닉네임
                        $('#akaError').show();
                        $('#akaError').text('');
                        $("#akaError").text("중복 닉네임 입니다.");
                        $("#aka").val("").focus();
                    }else {     // 사용 가능한 닉네임
                        $('#akaError').show();
                        $('#akaError').text('');
                        $("#akaError").text("사용 가능한 닉네임 입니다.");
                        $("#akaError").css("color", "#9b52c7");
                        $("#userPw").focus();
                    }
                }
            });
        }

    })// User_ID 중복검사 end

    // 도메인 선택
    $("#email").change(function(){
        if($("#email").val() == ""){	// 직접 입력 선택
//			$("#domain").attr("readonly", false);
            $("#domain").removeAttr("readonly");
            $("#domain").val("").focus();
        }else{							// 도메인명 선택
            $("#domain").val($("#email").val());
            $("#domain").attr("readonly","readonly");
        }
    });

    $("#firstName").keyup(function (){
        if($('#firstName').val().length < 2){
            $('#firstMsg').text("Family Name (성)을 입력해주세요");
        }
    });




    $("#signupForm").submit(function(){
        if($("#firstName").val() == ""){
            alert("Family Name (성) 입력하세요.");
            $("#lastName").focus();
            return false;
        }
        if($("#lastName").val()==""){
            alert("Name(이름)을 입력해주세요.");
            $("#userId").focus();
            return false;
        }
        if($("#userId").val()==""){
            alert("ID를 입력해주세요.");
            $("#aka").focus();
            return false;
        }
        if($("#aka").val()==""){
            alert("닉네임을 입력해주세요.");
            $("#userPw").focus();
            return false;
        }
        if($("#userPw").val()==""){
            alert("비밀번호 입력해주세요.");
            $("#userPwConfirm").focus();
            return false;
        }
        if($("#userPwConfirm").val()==""){
            alert("비밀번호 다시 입력해주세요.");
            $("#phone").focus();
            return false;
        }
        if($('#userPw').val() != $('#userPwConfirm').val()){
            alert("비밀번호가 일치하지 않습니다.");
            $('#userPwConfirm').val('');
            $('#userPwConfirm').focus();

            return false;

        }
        if($("#phone").val().length != 11){
            alert("핸드폰번호를 전부 입력하세요");
            $("#phone").val("").focus();
            return false;
        }
        if(isNaN($("#phone").val())){
            alert("숫자만 입력하세요");
            $("#phone").val("").focus();
            return false;
        }
        if($("#emailId").val()==""){
            alert("EMail 주소를 입력하세요");
            $("#emailId").focus();
            return false;
        }
        if($("#domain").val()==""){
            alert("도메인을 입력하세요");
            $("#domain").focus();
            return false;
        }
        if($("#zip").val()==""){
            alert("우편번호를 입력하세요");
            $("#zip").focus();
            return false;
        }
        if($("#address").val()==""){
            alert("주소를 입력하세요");
            $("#address").focus();
            return false;
        }
        if($("#yyyy").val().length != 4){
            alert("년도4자리 입력해주세요.");
            $("#yyyy").val("").focus();
            return false;
        }
        if(isNaN($("#yyyy").val())){
            alert("숫자만 입력하세요");
            $("#yyyy").val("").focus();
            return false;
        }
        if($("#mm").val()==""){
            alert("월을 선택하세요");
            return false;
        }
        if($("#dd").val().length != 2){
            alert("일을 입력해주세요.");
            $("#dd").val("").focus();
            return false;
        }
        if(isNaN($("#dd").val())){
            alert("숫자만 입력하세요");
            $("#dd").val("").focus();
            return false;
        }
        if($("#job").val()==""){
            alert("직업을 선택하세요");
            return false;
        }

    }); // submit() end
});// ready() end