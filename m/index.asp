<!--#include virtual="/_include/asp_top_euckr.asp"--><%
%><!--#include virtual="/_include/asp_common.asp"--><!--#include virtual="/_include/asp_front_common.asp"--><%
'/**
' * @(#) index.asp
' * home
' */
Dim dbHelper, objRs, query, i
Set dbHelper = new clsDBHelper

Dim arrayPortfolioList
query = "SELECT TOP 5 idx, category_idx, name, program, img_path FROM ez_portfolio "
query = query & "WHERE display_yn='Y'"
query = query & " ORDER BY newid()"
'query = query & " ORDER BY (CASE WHEN display_order IS NULL THEN 1 ELSE 0 END), display_order ASC, idx DESC"
Set objRs = dbHelper.ExecSQLReturnRS(query, Nothing, Nothing)
If (Not objRs.EOF) Then
	arrayPortfolioList = objRs.getRows()
End If
objRs.close()

Dim arrayPhotostoryList
query = "SELECT TOP 3 idx, title, summary, thumb_img_path FROM ez_photostory "
query = query & "WHERE display_yn='Y'"
query = query & " ORDER BY (CASE WHEN display_order IS NULL THEN 1 ELSE 0 END), display_order ASC, idx DESC"
Set objRs = dbHelper.ExecSQLReturnRS(query, Nothing, Nothing)
If (Not objRs.EOF) Then
	arrayPhotostoryList = objRs.getRows()
End If
objRs.close()

Dim arrayBannerList1
query = "SELECT TOP 3 idx, title, banner_img_path, bg_img_path, banner_target FROM ez_site_mobile_banner esb INNER JOIN ez_site_mobile_banner_campus_mapp esbcm ON esb.idx = esbcm.banner_idx "
query = query & "WHERE category_idx = 1 AND esbcm.display_yn='Y' AND (DATEDIFF(day, getdate(), esb.start_date) <= 0 AND DATEDIFF(day, getdate(), esb.end_date) >= 0) AND esbcm.campus_idx = " & objCampus.currentCampusIdx
query = query & " ORDER BY newid()"
Set objRs = dbHelper.ExecSQLReturnRS(query, Nothing, Nothing)
If (Not objRs.EOF) Then
	arrayBannerList1 = objRs.getRows()
End If
objRs.close()

Dim arrayBannerList2
query = "SELECT idx, title, banner_img_path, bg_color, banner_target FROM ez_site_mobile_banner esb INNER JOIN ez_site_mobile_banner_campus_mapp esbcm ON esb.idx = esbcm.banner_idx "
query = query & "WHERE category_idx = 2 AND esbcm.display_yn='Y' AND (DATEDIFF(day, getdate(), esb.start_date) <= 0 AND DATEDIFF(day, getdate(), esb.end_date) >= 0) AND esbcm.campus_idx = " & objCampus.currentCampusIdx
query = query & " ORDER BY display_order, idx"
Set objRs = dbHelper.ExecSQLReturnRS(query, Nothing, Nothing)
If (Not objRs.EOF) Then
	arrayBannerList2 = objRs.getRows()
End If
objRs.close()

Dim arrayCurriBannerList
query = "SELECT escb.idx, category_idx, title, banner_img_path "
query = query & "FROM ez_site_curri_banner escb INNER JOIN ez_site_curri_banner_campus_mapp escbcm ON escb.idx = escbcm.banner_idx "
query = query & "WHERE display_yn='Y' AND escbcm.campus_idx = " & objCampus.currentCampusIdx & " "
query = query & "ORDER BY category_idx, display_order"
Set objRs = dbHelper.ExecSQLReturnRS(query, Nothing, Nothing)
If (Not objRs.EOF) Then
	arrayCurriBannerList = objRs.getRows()
End If
objRs.close()

Dim arrayEpilogueBestList
query = "SELECT TOP 3 idx, subject, name, contents, category_idx FROM ez_epilogue WHERE display_yn='Y' AND display_order IS NULL ORDER BY newid()"
Set objRs = dbHelper.ExecSQLReturnRS(query, Nothing, Nothing)
If (Not objRs.EOF) Then
	arrayEpilogueBestList = objRs.getRows()
End If
objRs.close()

Set objRs = Nothing
Set dbHelper = Nothing

Dim arrayCampusList
arrayCampusList = objCampus.branchCampusList
%><!DOCTYPE HTML>
<html lang="ko-KR">
<head>
	<!--#include virtual="/m/common/include/head.asp"-->
	<link rel="stylesheet" href="/m/common/css/jquery.bxslider.css" />
	<script type="text/javascript" src="/m/common/js/jquery.bxslider.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var swiper = new Swiper('.swiper-container2',{
				pagination: '.swiper-pagination2',
				autoplay: 3000,
			});	
			
			var swiper = new Swiper('.swiper-container6',{
				pagination: '.swiper-pagination6',
			});	
			
			<%If (isArray(arrayBannerList1)) Then%>
			//���� ���̾��˾�
			if($.cookie('MainLayer<%=objCampus.currentCampusDomain%>') != "N"){
				layer_open('MainLayer<%=objCampus.currentCampusDomain%>');
			}
			<%End If%>
			$(".cbtn").click(function(){
				layerClose();
			});
			
			$('.bxslider').bxSlider({
				minSlides: 1,
				maxSlides: 3,
				infiniteLoop: false
			});
			
			$('.specialCourse').bxSlider({
				minSlides: 1,
				maxSlides: 8,
				controls:false,
				slideWidth:156,
				pager:false,
				slideMargin:10,
				responsive:false,
				randomStart:true,
			});
		});
		function layer_open(el){
			
			var temp = $('#' + el);
			var bg = temp.prev().hasClass('bg');
	
			if(bg){
				$("#MainLayer").fadeIn();
			}else{
				temp.fadeIn();
			}
			
			//if (temp.outerHeight() < $(document).height() ) temp.css('margin-bottom', '-'+temp.outerHeight()/2+'px');
			if (temp.outerHeight() < $(document).height() ) temp.css('top', '100' + 'px');
			else temp.css('top', '0px');
			if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
			else temp.css('left', '0px');

			temp.find('a.cbtn').click(function(e){
				if(bg){
					$("#MainLayer").fadeOut(); //'bg' Ŭ������ �����ϸ� ���̾ ������� �Ѵ�. 
				}else{
					temp.fadeOut();
				}
				e.preventDefault();
			});

			$("#MainLayer .bg").click(function(e){	//����� Ŭ���ϸ� ���̾ ������� �ϴ� �̺�Ʈ �ڵ鷯
				$("#MainLayer").fadeOut();
				e.preventDefault();
			});

		}
		function layerClose(){
			if($("input[name='checkbox']").is(":checked") ==true){
				$.cookie('MainLayer<%=objCampus.currentCampusDomain%>' , 'N', { expires : 1, path : '/' });
			}
			$("#MainLayer").fadeOut();
		}
	</script>
</head>
<body>
	<div id="MainLayer">
		<div class="bg"></div>
		<div id="MainLayer<%=objCampus.currentCampusDomain%>" class="pop-layer">
			<div class="closeBtn">
				<span><label for="chk">���� �Ϸ� ���� �ʱ�<input id="chk" name="checkbox" type="checkbox"></label><a href="#" class="cbtn"><img src="/images/main/close_layer.png" alt="#"></a></span>
			</div>
			<div class="pop-container">
				<div class="pop-conts">
					<ul class="bxslider"><%
					If (isArray(arrayBannerList1)) Then
						For i=0 To Ubound(arrayBannerList1, 2)
						%>
						<li><a href="/m/site_banner_link.asp?idx=<%=arrayBannerList1(0,i)%>" target="<%=arrayBannerList1(4,i)%>"><img src="<%=arrayBannerList1(2,i)%>" alt="<%=arrayBannerList1(1,i)%>" /></a></li>
						<%
						Next
					End If
					%>
					</ul>
				</div>
			</div>
		</div>
	</div>



<div class="mCateMenu">
	<div class="mCateBox cf">
		<div class="mCateLbox">
			<ul>
				<li><a href="javascript:;"><img src="/m/images/common/l_menu_img1.jpg" alt="#" /></a></li>
				<!-- li><a href="javascript:;">����ķ�۽�</a></li -->
				<li><a href="#"><%
				If Not checkNull(objCampus.info("tel_img_path")) Then
				%><a href="tel:<%=objCampus.info("campus_phone")%>"><img src="<%=objCampus.info("tel_img_path")%>" alt="��ǥ��ȭ <%=objCampus.info("campus_phone")%>" /></a><%
				Else
				%><a href="tel:<%=objCampus.info("campus_phone")%>"><img src="/images/curriculum/banner_tel.jpg" alt="��ǥ��ȭ 1544-8147" /></a><%
				End If
				%></a></li>
				<li class="hideBoxOpen"><a href="javascript:;"><img src="/m/images/common/l_menu_img3.jpg" alt="#" /></a></li>
				<li><a href="/m/ezen/intro/company_edu.asp"><img src="/m/images/common/l_menu_img4.jpg" alt="#" /></a></li>
				<li><a href="/m/ezen/intro/company_edu.asp"><img src="/m/images/common/l_menu_img5.jpg" alt="#" /></a></li>
			</ul>
		</div>
		<div class="mCateRbox">
			<a href="#" class="close"><img src="/m/images/common/l_menu_close_btn.jpg" alt="�ݱ�" width="18"></a>
			<h1><img src="/m/images/common/l_menu_logo.jpg" alt="#" /></h1>
			<ul>
					<li class="depth">
						<a href="javascript:;"><span>�� ķ�۽� �ȳ�</span><span class="arrow"></span></a>
						<ul><%
						If isArray(arrayBranchCampusList) Then
							For intLoop=0 To Ubound(arrayBranchCampusList, 2)
							%>
							<li><a href="http://<%=arrayBranchCampusList(1,intLoop)%>.<%=objCampus.serverDomainName%>/m/" index="<%=intLoop+1%>"><%=arrayBranchCampusList(3,intLoop)%></a></li><%
							Next
						End If
						%>
						</ul>
					</li>
				<li>
					<a href="/m/ezen/campus/allcurri.asp"><span>�� ��������</span></a>
				</li>
				<li class="depth">
					<a href="#"><span>�� ��Ʈ������</span><span class="arrow"></span></a>
					<ul>
						<%=getCodeTagTemplate("PORTFOLIOCATEGORY", "", False, "<li><a href=""/m/ezen/community/portfolio.asp?sc=_CODE_"" index=""_CODE_"">_VALUE_</a></li>", "",vbcr)%>
					</ul>
				</li>
				<li>
					<a href="/m/ezen/campus/teacher_list.asp"><span>�� ����Ұ�</span></a>
				</li>
				<li class="depth">
					<a href="#"><span>�� ���������ȳ�</span><span class="arrow"></span></a>
					<ul>
						<li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=1">�����Ⱓ��������Ʒ�</a></li>
						<li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=2">���������Ű��</a></li>
						<li><a href="/m/ezen/curriculum/unemployed_support.asp?ti=3">���Ϲ��ī����</a></li>
						<li><a href="/m/ezen/curriculum/employed_support.asp?ti=1">�ٷ���ī��</a></li>
						<li><a href="/m/ezen/curriculum/employed_support.asp?ti=2">�������Ź�Ʒ�</a></li>
					</ul>
				</li>
				<li class="depth">
					<a href="#"><span>�� �ڰ����Ұ�</span><span class="arrow"></span></a>
					<ul>
						<%=getCodeTagTemplate("LICENSECATEGORY", "", False, "<li><a href=""/m/ezen/license/?sc=_CODE_"" index=""_CODE_"">_VALUE_</a></li>", "",vbcr)%>
					</ul>
				</li>
				<li class="depth">
					<a href="#"><span>�� Ŀ�´�Ƽ</span><span class="arrow"></span></a>
					<ul>
							<li><a href="/m/ezen/community/notice.asp">��������</a></li>
							<li><a href="/m/ezen/community/epilogue_all.asp">�������ı�</a></li>
							<li><a href="/m/ezen/community/qna.asp">Q&amp;A</a></li>
							<li><a href="/m/ezen/community/photostory.asp">���䰶����</a></li>
						</ul>
				</li>
				<li class="depth">
					<a href="#"><span>�� �п��Ұ�</span><span class="arrow"></span></a>
					<ul>
						<li><a href="/m/ezen/intro/brandstory.asp">�п��Ұ�</a></li>
						<li><a href="/m/ezen/intro/company_edu.asp">��������� �Ⱝ����</a></li>
						<li><a href="/m/ezen/intro/history.asp">����</a></li>
						<li><a href="/m/ezen/intro/ci_bi.asp">CI&BI</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>




	
	<div id="mWrap" class="noto">
		<!--#include virtual="/m/common/include/header.asp"-->
		<div id="mContent">
			<div id="mContent1">
				<div class="swiper-container2">
					<div class="swiper-wrapper"><%
					If (isArray(arrayBannerList2)) Then
						For i=0 To Ubound(arrayBannerList2, 2)
						%>
						<div class="swiper-slide" style="background:<%=arrayBannerList2(3,i)%>;"><a href="/m/site_banner_link.asp?idx=<%=arrayBannerList2(0,i)%>" target="<%=arrayBannerList2(4,i)%>"><img src="<%=arrayBannerList2(2,i)%>" alt="<%=arrayBannerList2(1,i)%>" /></a></div>
						<%
						Next
					End If
					%>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination2 swiper-pagination"></div>
				</div>
			</div>
			<div id="mContent3">
				<div id="portfolioM">
					<div class="title"><img src="/m/images/main/m_portfolio_title.png" alt="portfolio" /><a href="/m/ezen/community/portfolio.asp"><span>��&nbsp;&nbsp;��ü����</span></a></div>
					<div class="portMArea cf">
						<div class="portMLeftArrow">
							<a href="#"><img src="/m/images/main/port_m_left_arrow.png" alt="����" /></a>
						</div>
						<div class="portMBox"><%
						If (isArray(arrayPortfolioList)) Then
							For i=0 To Ubound(arrayPortfolioList, 2)
						%>
							<div class="portMImg <%If i=0 Then%> active<%End If%>"><a href="/m/ezen/community/portfolio_read.asp?sc=<%=arrayPortfolioList(1,i)%>&idx=<%=arrayPortfolioList(0,i)%>"><img src="<%=arrayPortfolioList(4,i)%>" alt="<%=arrayPortfolioList(2,i)%> ��Ʈ������ ��ǰ" /></a><div class="portMeffect"></div></div><%
							Next
						End If
						%>
						</div>
						<div class="portMRightArrow">
							<a href="#"><img src="/m/images/main/port_m_right_arrow.png" alt="����" /></a>
						</div>
					</div>
				</div>
			</div>
			
			<div id="mContent6">
				<div class="mSContent6">
					<div class="title"><img src="/m/images/special_course_title.jpg" alt="portfolio" /></div>
					<ul class="specialCourse cf"><%
					If (isArray(arrayCurriBannerList)) Then
						For i=0 To Ubound(arrayCurriBannerList, 2)
						%>
						<li><a href="/m/site_curri_banner_link.asp?idx=<%=arrayCurriBannerList(0,i)%>"><img src="<%=arrayCurriBannerList(3,i)%>" alt="<%=arrayCurriBannerList(2,i)%>" /></a></li>
						<%
						Next
					End If
					%>
					</ul>
				</div>
			</div>

			<div id="mContent5">
				<div class="mSContent5">
					<div class="swiper-container swiper-container5">
						<div class="swiper-wrapper">
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_01.asp"><img src="/m/images/main/m_teacher_img01.jpg" alt="�������� ���� ������" /></a>
							</div>
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_02.asp"><img src="/m/images/main/m_teacher_img02.jpg" alt="�������� ������ ������" /></a>
							</div>
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_10.asp"><img src="/m/images/main/m_teacher_img13.jpg" alt="���꼼��ȸ�� ������ ������" /></a>
							</div>
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_03.asp"><img src="/m/images/main/m_teacher_img04.jpg" alt="��輳�� ������ ���̳� ������" /></a>
							</div>
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_05.asp"><img src="/m/images/main/m_teacher_img05.jpg" alt="���θ������� ������ ������" /></a>
							</div>
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_06.asp"><img src="/m/images/main/m_teacher_img06.jpg" alt="��輳�� ������ �ں�â ������" /></a>
							</div>
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_08.asp"><img src="/m/images/main/m_teacher_img10.jpg" alt="��輳�� ������ �ڻ� ������" /></a>
							</div>
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_11.asp"><img src="/m/images/main/m_teacher_img14.jpg" alt="���꼼��ȸ�� ������ ������" /></a>
							</div>
							<div class="swiper-slide cf">
								<a href="/m/ezen/campus/teacher_read_09.asp"><img src="/m/images/main/m_teacher_img12.jpg" alt="��輳������� ������ ������" /></a>
							</div>
						</div>
						<div class="paging">
							<div class="swiper-button-prev"></div>
							<!--div class="opens">
								<span class="num"><div class="swiper-pagination swiper-pagination5"></div></span>
								<span>/</span>
								<span class="total"></span>
							</div-->
							<div class="swiper-button-next"></div>
						</div>
					</div>
					<div class="teacherText"><strong class="opens">EZEN Teacher</strong></div>
					<div class="totalShow"><a href="#"><span>��&nbsp;&nbsp;��ü����</span></a></div>
				</div>
			</div>
			
			<div id="mContent9">
				<div class="mSContent9">
					<img src="/m/images/main/review_bg.jpg" alt="#" />
					<div id="reviewAbsoluteBox">
						<div class="swiper-container swiper-container6">
							<div class="swiper-wrapper">
								<%
								If (isArray(arrayEpilogueBestList)) Then
									For i=0 To Ubound(arrayEpilogueBestList, 2)
								%>
								<div class="swiper-slide">
									<li>
										<a href="/m/ezen/community/epilogue.asp?sci=<%=arrayEpilogueBestList(4,i)%>">
											<p><strong><%=arrayEpilogueBestList(1,i)%></strong>
												<%=arrayEpilogueBestList(2,i)%>
											</p>
											<p class="reViewcontents">
											<%=arrayEpilogueBestList(3,i)%>
											</p>
										</a>
									</li>
								</div>
								<%
									Next
								End If
								%>
							</div>
							<div class="swiper-pagination6 swiper-pagination"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="mContent7">
				<div class="mSContent7">
					<img src="/m/images/main/event_banner.jpg" alt="#"/>
				</div>
			</div>
			
			<div id="mContent8">
				<div class="mSContent8">
					<div class="title"><img src="/m/images/main/campus_info_title.jpg" alt="#" /></div>
					<ul class="cf"><%
						If isArray(arrayBranchCampusList) Then
							For intLoop=0 To Ubound(arrayBranchCampusList, 2)
								'����IT��ī���� ����
								If arrayBranchCampusList(0,intLoop) <> 9 Then
							%>
							<li<%If objCampus.currentCampusDomain = arrayBranchCampusList(1,intLoop) Then%> class="on"<%End If%>><a href="http://<%=arrayBranchCampusList(1,intLoop)%>.<%=objCampus.serverDomainName%>/m/"<%If objCampus.currentCampusDomain = arrayBranchCampusList(1,intLoop) Then%> class="active"<%End If%>><%=arrayBranchCampusList(2,intLoop)%></a></li><%
								End If
							Next
						End If
						%>
						<li><a href="http://it.ezenac.co.kr/m/" target="_blank">����IT��ī����</a></li>
						<li><a href="http://edu.ezenac.co.kr" target="_blank">�¶��ο���</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--#include virtual="/m/common/include/footer.asp"-->
	</div>
	<div class="teacherLayerBg"></div>
	<div class="teacherLayer">
		<div class="teacherLayerTitle cf">
			<span class="text">��ü ����</span>
			<a href="#" class="close"><img src="/m/images/common/m_cate_close.png" alt="�ݱ�" /></a>
		</div>
		<div class="teacherLayerImg">
			<a href="/m/ezen/campus/teacher_read_10.asp"><img src="/m/images/main/m_teacher_layer13.jpg" alt="������������" /></a>
			<a href="/m/ezen/campus/teacher_read_11.asp"><img src="/m/images/main/m_teacher_layer14.jpg" alt="�����Ǽ�����" /></a>
			<a href="/m/ezen/campus/teacher_read.asp?idx=1"><img src="/m/images/main/m_teacher_layer01.jpg" alt="�������� ���� ������" /></a>
			<a href="/m/ezen/campus/teacher_read.asp?idx=4"><img src="/m/images/main/m_teacher_layer02.jpg" alt="�������� ������ ������" /></a>
			<!-- <a href="/m/ezen/campus/teacher_read.asp?idx=6"><img src="/m/images/main/m_teacher_layer03.jpg" alt="�ǳ���������� �����뼱����" /></a> -->
			<a href="/m/ezen/campus/teacher_read.asp?idx=2"><img src="/m/images/main/m_teacher_layer04.jpg" alt="��輳�� ������ ���̳� ������" /></a>
			<a href="/m/ezen/campus/teacher_read.asp?idx=5"><img src="/m/images/main/m_teacher_layer05.jpg" alt="���θ������� ������ ������" /></a>
			<a href="/m/ezen/campus/teacher_read.asp?idx=7"><img src="/m/images/main/m_teacher_layer06.jpg" alt="��輳�� ������ �ں�â ������" /></a>
			<a href="/m/ezen/campus/teacher_read.asp?idx=10"><img src="/m/images/main/m_teacher_layer07.jpg" alt="���α׷��� �뼼�� ������" /></a>
			<!--a href="/m/ezen/campus/teacher_read.asp?idx=6"><img src="/m/images/main/m_teacher_layer08.jpg" alt="�ǳ���������� �����뼱����" /></a-->
			<a href="/m/ezen/campus/teacher_read.asp?idx=4"><img src="/m/images/main/m_teacher_layer02.jpg" alt="�������� ������ ������" /></a>
			<a href="/m/ezen/campus/teacher_read.asp?idx=11"><img src="/m/images/main/m_teacher_layer10.jpg" alt="��輳�� ������ �ڻ� ������" /></a>
			<!-- <a href="/m/ezen/campus/teacher_read.asp?idx=5"><img src="/m/images/main/m_teacher_layer05.jpg" alt="���θ������� ������ ������" /></a> -->
			<!-- <a href="/m/ezen/campus/teacher_read.asp?idx=8"><img src="/m/images/main/m_teacher_layer11.jpg" alt="����ȸ�� ������ ������" /></a> -->
			<a href="/m/ezen/campus/teacher_read.asp?idx=9"><img src="/m/images/main/m_teacher_layer12.jpg" alt="��輳������� ������ ������" /></a>
		</div>
	</div>
</body>
</html>
