jQuery(document).ready(function(){
    (function () {
        var timer,
            side = $('#leftMenu'),
            sideBtn = $('.leftOpen'),
            pop = $('.pop-container'),
            isResize = false;

        $(window).resize(function(){
            if(timer) {
                clearTimeout(timer);
            }

            // �ㅽ겕濡� 以묒씪�� �먮룞濡ㅻ쭅 紐⑤몢 �뺤�
            if(!isResize) {
                seasonNoti.stopAuto();
                isResize = true;
            }

            timer = setTimeout(function () {
                if(window.innerWidth <= 1100) {
                    side.addClass('close');
                    sideBtn.addClass('open')
                    pop.addClass('extend');
                } else {
                    side.removeClass('close');
                    sideBtn.removeClass('open');
                    pop.removeClass('extend');
                }

                seasonNoti.startAuto();
                isResize = false;
            }, 100);
        });
    })();

    (function () {
        var isScroll = false, // �ㅽ겕濡� 吏꾪뻾 �좊Т flag
            scrollTimer,
            header = $('#header'),
            content = $('#content'),
            lnb = $('#leftMenu'),
            quickMenu = $('.cm-quick'),
            flag = false, // 스탑지점 구간도달하면 시작되는 flag
            cmItem = quickMenu.find('.cm-item');

        // �듬찓�� 怨듯넻 珥덇린��
        if (quickMenu.length > 0) {
            var arr = [];
            cmItem.each(function() {
                try {
                    var target = $(this).attr('href');
                    var k = $(target).offset().top;
                    arr.push(k);
                } catch(e) {
                    console.log(e)
                }               
            });


            cmItem.click(function(e) {
                e.preventDefault();

                var idx = cmItem.index($(this));
                var target = $(this).attr('href');
                var pos = $(target).offset().top;

                arr[idx] = pos;

                cmItem.parent().removeClass('on');
                cmItem.parent().eq(idx).addClass('on');

                $('html, body').stop().animate({ scrollTop: pos - 147});
            });
        }


        $(window).scroll(function(){
            var scrolltop = $(window).scrollTop();

            if(scrollTimer) {
                clearTimeout(scrollTimer);
            }

            if (scrolltop >= content.offset().top) {
                header.addClass('fixed');
                lnb.addClass('fixed');

            } else {
                header.removeClass('fixed');
            }

            // �ㅽ겕濡� 以묒씪�� �먮룞濡ㅻ쭅 紐⑤몢 �뺤�
            if(!isScroll) {
                seasonNoti.stopAuto();
                isScroll = true;
            }


            // COMMON - QUICK MENU
            if (quickMenu.length > 0) {
                var quickPos = quickMenu.offset().top,
                    sub1Content2 =  (function(){
                        var k = $('.max-position'); // 스탑지점

                        if(k.length > 0) {                        
                            return k.offset().top
                        } else {
                            return $('#wrap').height() - $('#footer').height() + 20;
                        }
                    }()), // �ㅽ겕濡� 踰붿쐞? �대뵒源뚯� 吏꾪뻾�섎뒗媛�
                    quickCalc = sub1Content2 - ($('.cm-quick').children().height() + 160);


                if (scrolltop < quickPos) {
                    quickMenu.children().removeClass('fixed').removeAttr('style');
                    flag = false;
                } else if (scrolltop >= quickPos && scrolltop < quickCalc) {
                    quickMenu.children().addClass('fixed').removeAttr('style');
                    flag = false;
                } else if(scrolltop >= quickCalc) {                    
                    if(!flag) {
                        quickMenu.children().css({
                            position: 'absolute',
                            top: quickCalc - ($('.cm-quick').children().height() + 300) + 'px'
                        })

                        flag = true;
                    }
                }
            }

            //  0.3s�� �ㅽ겕濡� 醫낅즺 �먮룞濡ㅻ쭅 �쒖옉
            scrollTimer = setTimeout(function () {
                seasonNoti.startAuto();
                isScroll = false;
            }, 300)
        });

        // 醫뚯륫�ㅻ퉬 scroll plugin
        lnb.mCustomScrollbar({
            alwaysShowScrollbar: 0,
            scrollInertia: 300,
            autoHideScrollbar: true,
            scrollbarPosition: 'outside'
        });

        //�쇱そ 硫붾돱 2depth
        var sideMenu = $('.leftNav .item > a'),
            sideMenuDepth2 = $('.leftNav > ul ul');

        sideMenu.click(function(){
            var isVisible = $(this).next().is(':visible');

            sideMenu.parent().removeClass('on').not($(this).parent()).find('> a').next().slideUp();

            if(!isVisible) {
                $(this).parent().addClass('on');
                $(this).next().stop().slideDown();
            } else {
                sideMenu.parent().removeClass('on');
                sideMenuDepth2.stop().slideUp();
            }

            return false;
        });

        // �섏씠吏� �뚮씪誘명꽣
        sideMenu.eq(selectDepth1).addClass('on').next().show();
        sideMenu.eq(selectDepth1).addClass('on').next().find('li').eq(selectDepth2).addClass('on');
        header.find('[process='+ selectDepth2 +']').find('> a').addClass('on');
    })();

    // �섍컯
    var seasonNoti = $('.previewT').bxSlider({
        mode: 'vertical',
        speed: 600,
        pause: 4000,
        pager: false,
        controls: false,
        auto: true
    });


    //2depth
    (function () {
        var gnb = $('#nav');

        gnb.find(' > ul > li').mouseenter(function () {
            $('.sNav').hide();
            $(this).find('.sNav').show();
        });

        gnb.find('> ul').mouseleave(function(){
            $('.sNav').hide();
        });
    })();

    //�쇱そ 硫붾돱 蹂댁씠湲� �④린湲�
    (function () {
        var sideOpen = $('.leftOpen'),
            sideClose = $('.lMclose'),
            sideBar = $('#leftMenu');

        sideClose.click(function () {
            sideBar.addClass('close');
            sideOpen.addClass('open');
            $('.pop-container').addClass('extend');
        });

        sideOpen.click(function () {
            sideBar.removeClass('close');
            sideOpen.removeClass('open');
            $('.pop-container').removeClass('extend');
        });
    }());


    //���됲듃諛뺤뒪 �좏깮�� �띿뒪�� 蹂�寃�
    $('select.nsbox').change(function(){
        var selectName= $(this).children('option:selected').text();
        $(this).siblings('label').text(selectName);
    });

	/* photostory2 img濡ㅻ쭅 */
    var current =0;
    var imgs = $('.imgBox >img');

    var prevButton = $('.pvBox2 .imgBox a.lefta');
    var nextButton = $('.pvBox2 .imgBox a.righta');

    prevButton.click(function(e){
        var prev = imgs.eq(current);
        e.preventDefault();
        $('.imgBox span >img').css('opacity',0);

        if(prev.css('left') != '0px') return;
        move(prev,0,'105%');


        if(current === 0) current = imgs.size();
        --current;

        $('.thumImg span').removeClass('active');
        $('.thumImg span').eq(current).addClass('active');

        var next = imgs.eq(current);
        move(next,'-105%',0);

    })

    nextButton.click(function(e){
        e.preventDefault();
        var prev = imgs.eq(current);
        $('.imgBox span >img').css('opacity',0);

        if(prev.css('left') != '0px') return;
        move(prev,0,'-105%');

        current++;
        if(current === imgs.size()) current = 0;

        $('.thumImg span').removeClass('active');
        $('.thumImg span').eq(current).addClass('active');

        var next = imgs.eq(current);
        move(next,'105%',0);

    });

    function move(tg,start,end){
        tg.css('left',start).stop().animate({left:end},{duration:1000});
    }

    var observer = lozad('.lozad', {
        loaded: function(el) {
            el.classList.add('fade')
        }
    });

    observer.observe();
});
