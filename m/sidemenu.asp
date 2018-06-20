<%
Dim arrayCampusList
arrayCampusList = objCampus.branchCampusList


Dim intLoop, arrayProcessList
arrayProcessList = objCampus.gnbProcessList
%>
<aside id="side-menu">
    <div class="side-menu__banner">
        <span class="ezen">이젠 컴퓨터 아카데미</span>
        <%
        If Not checkNull(objCampus.info("tel_img_path")) Then
        %>
        <a href="tel:<%=objCampus.info("campus_phone")%>">
            <img src="<%=objCampus.info("tel_img_path")%>" alt="대표전화 <%=objCampus.info("campus_phone")%>" />
        </a>
        <%
        Else
        %>
        <a href="tel:<%=objCampus.info("campus_phone")%>">
            <img src="/images/curriculum/banner_tel.jpg" alt="대표전화 1544-8147" />
        </a>
        <%
        End If
        %>
        <a href="/m/ezen/curriculum/employed_application.asp" class="join">직장인 모바일 신청</a>
        <a href="/m/ezen/intro/company_edu.asp" class="camp">대학취업캠프</a>
        <a href="/m/ezen/intro/company_edu.asp" class="kigan">기업 &middot; 관공서 출강교육</a>
    </div>
    <div class="side-menu__menulist">
        <ul>
            <li>
                <a href="#" class="items">캠퍼스안내</a>
                <ul class="depth2">
                    <%
                    If isArray(arrayBranchCampusList) Then
                        For intLoop=0 To Ubound(arrayBranchCampusList, 2)
                        %>
                        <li><a href="http://<%=arrayBranchCampusList(1,intLoop)%>.<%=objCampus.serverDomainName%>/m/" index="<%=intLoop+1%>"><%=arrayBranchCampusList(3,intLoop)%></a></li><%
                        Next
                    End If
                    %>
                </ul>
            </li>
            <li><a href="/m/ezen/campus/allcurri.asp" class="item">교육과정</a></li>
            <li>
                <a href="#" class="items">포트폴리오</a>
                <ul class="depth2">
                    <%=getCodeTagTemplate("PORTFOLIOCATEGORY", "", False, "<li><a href=""/m/ezen/community/portfolio.asp?sc=_CODE_"" index=""_CODE_"">_VALUE_</a></li>", "",vbcr)%>
                </ul>
            </li>
            <li>
                <a href="#" class="items">국비지원안내</a>
                <ul class="depth2">
                    <li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=1">국가기간전략산업훈련</a></li>
                    <li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=2">취업성공패키지</a></li>
                    <li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=3">내일배움카드제</a></li>
                    <li><a href="/m/ezen/curriculum/employed_support.asp?ti=1">근로자카드</a></li>
                    <li><a href="/m/ezen/curriculum/employed_support.asp?ti=2">사업주위탁훈련</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="items">자격증소개</a>
                <ul class="depth2">
                    <%=getCodeTagTemplate("LICENSECATEGORY", "", False, "<li><a href=""/m/ezen/license/?sc=_CODE_"" index=""_CODE_"">_VALUE_</a></li>", "",vbcr)%>
                </ul>
            </li>
            <li>
                <a href="#" class="items">커뮤니티</a>
                <ul class="depth2">
                    <li><a href="/m/ezen/community/notice.asp">공지사항</a></li>
                    <li><a href="/m/ezen/community/epilogue_all.asp">수강생후기</a></li>
                    <li><a href="/m/ezen/community/qna.asp">Q&amp;A</a></li>
                    <li><a href="/m/ezen/community/photostory.asp">포토갤러리</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="items">학원소개</a>
                <ul class="depth2">
                    <li><a href="/m/ezen/intro/brandstory.asp">학원소개</a></li>
                    <li><a href="/m/ezen/intro/company_edu.asp">기업·대학 출강교육</a></li>
                    <li><a href="/m/ezen/intro/history.asp">연혁</a></li>
                    <li><a href="/m/ezen/intro/ci_bi.asp">CI&amp;BI</a></li>
                </ul>
            </li>
        </ul>
    </div>
</aside>