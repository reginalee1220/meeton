$(function(){
    var state = 0;
    $('.header-nav > li').click(function(){
        if(state == 0){
            $('.header-submenu').hide();
            $(this).children('.header-submenu').toggle();
            state = 1 ;
        }else if(state == 1){
            $('.header-submenu').hide();
            state = 0 ;
        }

    });
    $(document).mouseup(function(e) {
        if ($(e.target).parents('.header-nav >li > ul').length == 0) {
            $('.header-submenu').hide();
        }
    });


});


