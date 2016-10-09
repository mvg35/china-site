$(function(){
        // Check the initial Poistion of the Sticky Header
        var stickyHeaderTop = jQuery('.navbar').offset().top;

        $(window).scroll(function(){

                if( $(window).scrollTop() > (stickyHeaderTop) ) { //-3?

                    $('.navbar').css({position: 'fixed', top: '0px'}); //3?
                        
                } else if( $(window).scrollTop() < stickyHeaderTop )  {
                        $('.navbar').css({position: 'none', top: stickyHeaderTop-$(window).scrollTop()});
                        
                }
        });
});