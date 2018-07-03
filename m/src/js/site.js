var GNB;
// lazyloading
var observer = lozad('.lozad', {
    loaded: function(el) {
        el.classList.add('lozad-fade');
    }
});



$(document).ready(function () {
    observer.observe();
// Layout
    $('.menu-button').click(function(e){
        e.preventDefault();

        $('body').toggleClass('cross');

        var isClass = $('body').hasClass('cross'),
            isMain = $('.main').size();

        if(isMain) {
            if(isClass) {
                rollingDate.autoplay.stop();
                pf.autoplay.stop();
            } else {
                rollingDate.autoplay.start();
                pf.autoplay.start();
            }
        }
    });

// floating btn
    $('#menu-open').change(function(e) {
        $('.float__menu--wrap').removeClass('down up');
        $('.float__menu--wrap').toggleClass('checked');
    });

// sidemenu depth
    $('.side-menu__menulist .items').click(function() {
        var flag = $(this).hasClass('active');

        if(flag) {
            $('.side-menu__menulist .depth2').hide();
            $('.side-menu__menulist .items').removeClass('active');
        } else {
            $('.side-menu__menulist .depth2').hide();
            $(this).next().show();
            $('.side-menu__menulist .items').removeClass('active');
            $(this).addClass('active');
        }

        return false;
    });

(function() {
    $('.tab--s1 .item').click(function(e){
        e.preventDefault();
        var getID = $(this).attr('data-rel');

        $('.tab--s1 .item').removeClass('on');
        $(this).addClass('on');

        $('.cnt').hide();
        $('#'+ getID).show();
    });


    // scroll
    var getHeader = $('#re-header').height(),
        lastScrollTop = 0;

    $(window).scroll(function(e){
        var isClass = $('body').hasClass('cross'),
            p = $(window).scrollTop();

        if(isClass) return true;

        $('#re-header').removeAttr('class');
        $('.float__menu--wrap').removeClass('down up');
        if (p > lastScrollTop){
            $('#re-header, .float__menu--wrap').addClass('up');
        } else {
            $('#re-header, .float__menu--wrap').addClass('down');
        }
        lastScrollTop = p;


        if( p >= getHeader) {
            $('body').addClass('head-fixed');
        } else {
            $('body').removeClass('head-fixed');
        }
    });
}());

    // header rolling
    var rollingDate = new Swiper('.rolling-date .swiper-container', {
        direction: 'vertical',
        autoplay: {
            delay: 5000
        }
    });

// DOC END
});

$(window).load(function(){
    if(GNB === undefined) {
        GNB = 'None'
    }
    // GNB ACTIVE
    $('#re-gnb').addClass('active'+ GNB);
});