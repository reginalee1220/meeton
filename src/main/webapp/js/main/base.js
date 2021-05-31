$(function(){
    $('.header-nav > li').click(function(){
        $('.header-submenu').hide();
        $(this).children('.header-submenu').toggle();
    });
    $(document).mouseup(function(e) {
        if ($(e.target).parents('.header-nav >li > ul').length == 0) {
            $('.header-submenu').hide();
        }
    });
});


