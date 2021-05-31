/*  slide bar */
$(function(){
    var list = $('.main-my-slide').children().length;
    var count =  0;
    $('#r').click(function(){
        if(count < list-4 ){
            $('.main-mybox:nth-child('+(count+1)+')')
                .fadeOut(2.0,'swing', function(){
                    count+=1;
                    console.log('count:'+count);
                });
        }
    });

    $('#l').click(function(){
        if(count > 0 ){
            $('.main-mybox:nth-child('+(count)+')')
                .fadeIn(2.0,'swing',function(){
                    count-=1;
                    console.log('count:'+count);
                });
        }
    });

});

/*  nav bar */
$(function(){



    $('.'+$('input[name="main-tab-menu"]:checked').attr('id')).addClass('active');

    $('input[name="main-tab-menu"]').change(function(){
        $('input[name="main-tab-menu"]').each(function(){
            var id = $(this).attr('id');
            var checked = $(this).prop('checked');
            if(checked){
                $('.'+id).addClass('active');
            }else{
                $('.'+id).removeClass('active');
            }
        });
    });
});