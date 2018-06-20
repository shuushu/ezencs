<nav class="float__menu--wrap">
    <div class="float__menu">
        <input type="checkbox" class="menu-open" name="menu-open" id="menu-open"/>
        <label class="menu-open-button" for="menu-open">
            <span class="float hamburger-1"></span>
            <span class="float hamburger-2"></span>
            <span class="float hamburger-3"></span>
        </label>

        <a href="tel:<%=objCampus.info("campus_phone")%>" class="menu-item"> <i class="fa fa fa-phone"><%=objCampus.info("campus_phone")%></i> </a>
        <a href="/m/ezen/counsel/counsel_create.asp" class="menu-item"> <i class="fa fa-envelope">전과목 빠른 상담</i> </a>
        <a href="http://tv.naver.com/ezencomputer" class="menu-item"> <i class="fa fa-youtube-play">네이버TV</i> </a>
        <a href="https://www.facebook.com/ezenac.co.kr/" class="menu-item"> <i class="fa fa-facebook">페이스북</i> </a>
        <a href="http://blog.naver.com/ezenkn" class="menu-item"> <i class="fa fa-connectdevelop">네이버블로그</i> </a>
        <a href="#" class="menu-item"> <i class="fa fa-eject">위로</i> </a>
    </div>
    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
        <defs>
            <filter id="shadowed-goo">
                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="8" />
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                <feGaussianBlur in="goo" stdDeviation="3" result="shadow" />
                <feColorMatrix in="shadow" mode="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 -0.2" result="shadow" />
                <feOffset in="shadow" dx="1" dy="1" result="shadow" />
                <feComposite in2="shadow" in="goo" result="goo" />
                <feComposite in2="goo" in="SourceGraphic" result="mix" />
            </filter>
            <filter id="goo">
                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" />
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                <feComposite in2="goo" in="SourceGraphic" result="mix" />
            </filter>
        </defs>
    </svg>
</nav>