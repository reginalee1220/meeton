$(function(){
    var state = 0;
    $(".my_video_check").hide();
    $("#btn_success").hide();
    $("#btn_mod_recent").bind("click", function(){
        if(state == 0){
            $(this).val("완료")
            state=1
            $(".my_video_check").show();
            $("#btn_success").show();

        } else{
            $(this).val("편집")
            state=0
            $(".my_video_check").hide();
            $("#btn_success").hide();
        }
    });
});