/*          content         */
/* filter 클릭 이벤트 */
$(function(){
    $('.ca-content-filter-box').hide();
    $('.ca-content-filter-img').click(function(){
        $('.ca-content-filter-box').toggle();
    });
});

/* 수정버튼 생성 이벤트 */
$(function (){
     var state = 0;
    $(".ca-filter-chk").hide();
    $("#ca-update").hide();
    $("#ca-allchk").hide();

    $(".ca-filter-button").bind("click", function(){
        if(state == 0){
            state=1
            $(this).val("취소");
            $("#ca-update").show();
            $(".ca-filter-chk").show();
            $("#ca-allchk").show();
        } else{
            state=0
            $(this).val("편집");
            $("input[type=radio]").attr("checked", false);
            $("#ca-update").hide();
            $(".ca-filter-chk").hide();
            $("#ca-allchk").show();
        }
    });
});

/*  수정 form 이벤트 */

