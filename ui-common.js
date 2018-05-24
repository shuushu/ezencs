$(document).ready(function(){

    // resize
    (function () {
        var timer,
            isResize = false;

        $(window).resize(function(){
            if(timer) {
                clearTimeout(timer);
            }

            if(!isResize) {
                // plugin Auto stop
                //seasonNoti.stopAuto();
                isResize = true;
            }

            timer = setTimeout(function () {
                if(window.innerWidth <= 1100) {

                } else {

                }

                //seasonNoti.startAuto();
                isResize = false;
            }, 100);
        });
    })();

    // scroll
    (function () {
        var isScroll = false,
            scrollTimer,
            header = $('#mHeader'),
            content = $('#mContent');


        $(window).scroll(function(){
            var scrolltop = $(window).scrollTop();

            if(scrollTimer) {
                clearTimeout(scrollTimer);
            }

            if (scrolltop >= content.offset().top) {
                header.addClass('fixed');
                content.addClass('fixed');
            } else {
                header.removeClass('fixed');
                content.removeClass('fixed');
            }

            if(!isScroll) {
                isScroll = true;
            }

            scrollTimer = setTimeout(function () {
                //seasonNoti.startAuto();
                isScroll = false;
            }, 300)
        });

    })();

    // sidemenu
    (function(){
        var trigger = $('.hamburger'),
            overlay = $('.overlay'),
            isClosed = false;

        trigger.click(function () {
            hamburger_cross();      
        });

        function hamburger_cross() {

          if (isClosed == true) {          
            overlay.hide();
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
          } else {   
            overlay.show();
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
          }
        }

        $('[data-toggle="offcanvas"]').click(function () {
            $('body').toggleClass('toggled');
        });

        $('.mCateMenu, .overlay').click(function(e){
            var isFlag1 = $(e.target).closest('.mCateBox').is('.mCateBox'),
                isFlag2 = $(e.target).closest('.hamburger').is('.hamburger');

            if (!isFlag1) {
                if(isFlag2) {
                    return false;
                }
                $('body').toggleClass('toggled');
                overlay.hide();
                hamburger_cross();
            }
        });

        $('.mCateMenu .depth a').click(function(e) {
            e.preventDefault();
            
            $('.mCateMenu .depth ul').not($(this).next()).hide();
            $(this).next().show();
        });
    })();

    // imageload
    /*
    var observer = lozad('.lozad', {
        loaded: function(el) {
            el.classList.add('fade')
        }
    });

    observer.observe();
    */



});

function toggleEvent(e) {
    try {


    } catch(e) {
        console.log(e);
    }
}


var layer = {
    target: $('#MainLayer'),
    off: function() {
        $('body').removeClass('layer-init');
        $('#MainLayer').removeClass('open');

        if($("input[name='checkbox']").is(":checked") == true ){
            $.cookie('MainLayerwww' , 'N', { expires : 1, path : '/' });
        }        
    },
    init: function(){
        $('body').addClass('layer-init');
        $('#MainLayer').addClass('open');


        $('#MainLayer').find('.bg').click(function() {
            layer.off();
        });

        $('#MainLayer .cbtn').click(function(){
            layer.off();
        });
    }
}
