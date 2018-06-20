<%
Dim arrayCampusList
arrayCampusList = objCampus.branchCampusList


Dim intLoop, arrayProcessList
arrayProcessList = objCampus.gnbProcessList
%>
<aside id="side-menu">
    <div class="side-menu__banner">
        <span class="ezen">���� ��ǻ�� ��ī����</span>
        <%
        If Not checkNull(objCampus.info("tel_img_path")) Then
        %>
        <a href="tel:<%=objCampus.info("campus_phone")%>">
            <img src="<%=objCampus.info("tel_img_path")%>" alt="��ǥ��ȭ <%=objCampus.info("campus_phone")%>" />
        </a>
        <%
        Else
        %>
        <a href="tel:<%=objCampus.info("campus_phone")%>">
            <img src="/images/curriculum/banner_tel.jpg" alt="��ǥ��ȭ 1544-8147" />
        </a>
        <%
        End If
        %>
        <a href="/m/ezen/curriculum/employed_application.asp" class="join">������ ����� ��û</a>
        <a href="/m/ezen/intro/company_edu.asp" class="camp">�������ķ��</a>
        <a href="/m/ezen/intro/company_edu.asp" class="kigan">��� &middot; ������ �Ⱝ����</a>
    </div>
    <div class="side-menu__menulist">
        <ul>
            <li>
                <a href="#" class="items">ķ�۽��ȳ�</a>
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
            <li><a href="/m/ezen/campus/allcurri.asp" class="item">��������</a></li>
            <li>
                <a href="#" class="items">��Ʈ������</a>
                <ul class="depth2">
                    <%=getCodeTagTemplate("PORTFOLIOCATEGORY", "", False, "<li><a href=""/m/ezen/community/portfolio.asp?sc=_CODE_"" index=""_CODE_"">_VALUE_</a></li>", "",vbcr)%>
                </ul>
            </li>
            <li>
                <a href="#" class="items">���������ȳ�</a>
                <ul class="depth2">
                    <li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=1">�����Ⱓ��������Ʒ�</a></li>
                    <li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=2">���������Ű��</a></li>
                    <li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=3">���Ϲ��ī����</a></li>
                    <li><a href="/m/ezen/curriculum/employed_support.asp?ti=1">�ٷ���ī��</a></li>
                    <li><a href="/m/ezen/curriculum/employed_support.asp?ti=2">�������Ź�Ʒ�</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="items">�ڰ����Ұ�</a>
                <ul class="depth2">
                    <%=getCodeTagTemplate("LICENSECATEGORY", "", False, "<li><a href=""/m/ezen/license/?sc=_CODE_"" index=""_CODE_"">_VALUE_</a></li>", "",vbcr)%>
                </ul>
            </li>
            <li>
                <a href="#" class="items">Ŀ�´�Ƽ</a>
                <ul class="depth2">
                    <li><a href="/m/ezen/community/notice.asp">��������</a></li>
                    <li><a href="/m/ezen/community/epilogue_all.asp">�������ı�</a></li>
                    <li><a href="/m/ezen/community/qna.asp">Q&amp;A</a></li>
                    <li><a href="/m/ezen/community/photostory.asp">���䰶����</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="items">�п��Ұ�</a>
                <ul class="depth2">
                    <li><a href="/m/ezen/intro/brandstory.asp">�п��Ұ�</a></li>
                    <li><a href="/m/ezen/intro/company_edu.asp">��������� �Ⱝ����</a></li>
                    <li><a href="/m/ezen/intro/history.asp">����</a></li>
                    <li><a href="/m/ezen/intro/ci_bi.asp">CI&amp;BI</a></li>
                </ul>
            </li>
        </ul>
    </div>
</aside>