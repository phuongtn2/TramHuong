<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<aside class="col-md-3  hidden-sm hidden-xs">
    <!-- Sidebar menu-->
    <div class="list-group" id="list-group-l">
        <ul class="nav navs sidebar menu" id='cssmenu'>
            <div class="mega-left-title">
                <strong>Nhóm danh mục</strong>
            </div>
            <c:set var="count" value="0" scope="page" />
            <c:forEach items="${mapping_categories}" var="m">
                <c:set var="count" value="${count + 1}" scope="page"/>
                <c:if test="${count == 1}">
                    <c:if test="${m.subSize > 0}">
                        <li id="aside_category_${m.categoryDto.id}" class='item has-sub  first' <%--onclick="setLocal('category_${m.categoryDto.id}');"--%>>
                            <a href='#'>
                                <span class="lbl">${m.categoryDto.name}</span>
                                <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-${count}"
                                      class="sign">
                                    <img src="/resources/img/arrow-right.png">
                                </span>
                            </a>
                            <ul class="nav children collapse menu-bar t-fix" id="sub-item-${count}">
                                <c:set var="countS" value="0" scope="page" />
                                <c:forEach items="${m.suCategories}" var="s">
                                    <c:set var="countS" value="${countS + 1}" scope="page"/>
                                    <c:if test="${countS == 1}">
                                        <li class="first" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${countS > 1 && countS < m.subSize}">
                                        <li class="" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${countS == m.subSize && m.subSize > 1}">
                                        <li class="last" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${m.subSize <= 0}">
                        <li id="aside_category_${m.categoryDto.id}" class='item  first' onclick="setLocal('category_${m.categoryDto.id}');">
                            <a href="/category/${m.categoryDto.id}">
                                <span>${m.categoryDto.name}</span>
                            </a>
                        </li>
                    </c:if>
                </c:if>
                <c:if test="${count < mSize && count > 1}">
                    <c:if test="${m.subSize > 0}">
                        <li id="aside_category_${m.categoryDto.id}" class='item has-sub' <%--onclick="setLocal('category_${m.categoryDto.id}');"--%>>
                            <a href='#'>
                                <span class="lbl">${m.categoryDto.name}</span>
                                <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-${count}"
                                      class="sign">
                                <img src="/resources/img/arrow-right.png">
                            </span>
                            </a>
                            <ul class="nav children collapse menu-bar t-fix" id="sub-item-${count}">
                                <c:set var="countS" value="0" scope="page" />
                                <c:forEach items="${m.suCategories}" var="s">
                                    <c:set var="countS" value="${countS + 1}" scope="page"/>
                                    <c:if test="${countS == 1}">
                                        <li class="first" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${countS > 1 && countS < m.subSize}">
                                        <li class="" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${countS == m.subSize && m.subSize > 1}">
                                        <li class="last" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${m.subSize <= 0}">
                        <li id="aside_category_${m.categoryDto.id}" class='item' onclick="setLocal('category_${m.categoryDto.id}');">
                            <a href="/category/${m.categoryDto.id}">
                                <span>${m.categoryDto.name}</span>
                            </a>
                        </li>
                    </c:if>
                </c:if>
                <c:if test="${count == mSize && mSize > 1}">
                    <c:if test="${m.subSize > 0}">
                        <li id="aside_category_${m.categoryDto.id}" class='item has-sub  last' <%--onclick="setLocal('category_${m.categoryDto.id}');"--%>>
                            <a href='#'<%-- style="z-index: 99999;"--%>>
                                <span class="lbl">${m.categoryDto.name}</span>
                                <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-${count}"
                                      class="sign">
                                    <img src="/resources/img/arrow-right.png">
                                </span>
                            </a>
                            <ul class="nav children collapse menu-bar t-fix" id="sub-item-${count}">
                                <c:set var="countS" value="0" scope="page" />
                                <c:forEach items="${m.suCategories}" var="s">
                                    <c:set var="countS" value="${countS + 1}" scope="page"/>
                                    <c:if test="${countS == 1}">
                                        <li class="first" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${countS > 1 && countS < m.subSize}">
                                        <li class="" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${countS == m.subSize && m.subSize > 1}">
                                        <li class="last" id="aside_sub_category_${s.id}" onclick="setLocal('sub_category_${s.id}');">
                                            <a href="/sub-category/${s.id}">
                                                <span>${s.name}</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${m.subSize <= 0}">
                        <li id="aside_category_${m.categoryDto.id}" class='item last' onclick="setLocal('category_${m.categoryDto.id}');">
                            <a href="/category/${m.categoryDto.id}">
                                <span>${m.categoryDto.name}</span>
                            </a>
                        </li>
                    </c:if>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <script>

        $(document).ready(function () {
            //$('ul li:has(ul)').addClass('hassub');
            $('#cssmenu ul ul li:odd').addClass('odd');
            $('#cssmenu ul ul li:even').addClass('even');
            $('#cssmenu > ul > li > a').click(function () {
                /*$('#cssmenu li').removeClass('active');
                $(this).closest('li').addClass('active');*/
                var checkElement = $(this).nextS();
                if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                   /* $(this).closest('li').removeClass('active');*/
                    checkElement.slideUp('normal');
                }
                if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                    $('#cssmenu ul ul:visible').slideUp('normal');
                    checkElement.slideDown('normal');
                }
                if ($(this).closest('li').find('ul').children().length == 0) {
                    return true;
                } else {
                    return false;
                }
            });

            $('.drop-down').click(function (e) {
                if ($(this).parents('li').hasClass('has-sub')) {
                    e.preventDefault();
                    if ($(this).hasClass('open-nav')) {
                        $(this).removeClass('open-nav');
                        $(this).parents('li').children('ul.lve2').slideUp('normal').removeClass('in');
                    } else {
                        $(this).addClass('open-nav');
                        $(this).parents('li').children('ul.lve2').slideDown('normal').addClass('in');
                    }
                } else {

                }
            });
        });

        $("#list-group-l ul.navs li.active").parents('ul.children').addClass("in");
    </script>
    <!-- Sidebar menu-->
    <!-- Support-->
    <div class="sidebar-support list-group">
		<span href="#" class="list-group-item active">
			<img src="/resources/img/avatar-answ.png" class="img-responsive"/>
		</span>
        <h3> Hỗ trợ trực tuyến</h3>
        <div class="support">
            <div class="text-center">
                <span class="supp-name">Ms Minh Thu: 0972 211 191</span>
                <br>
                <p>
                    thu.thuanthanhtien@gmail.com
                </p>
            </div>
            <div class="text-center">
                <span class="supp-name">Mr Tuấn Anh: 0901 798 910</span>
                <br>
                <p>
                    vinhthuantien@outlook.com
                </p>
            </div>
            <div class="text-center">
                <span class="supp-name">T2 - T7 - 8:00 - 17:00	</span>
                <p>
                    Sẵn sàng hỗ trợ ngoài giờ qua Hotline
                </p>
            </div>
        </div>
    </div>
    <!-- Support-->
    <!-- Facebook -->
    <!-- Facebook-->
    <!-- Banner quảng cáo -->
    <%--<div class="list-group_l banner-left">
        <a href="/introduct">
            <img src="/resources/img/left_image_ad.jpg">
        </a>
    </div>
    <!-- Banner quảng cáo -->
    <div class="list-group_2 banner-left">
        <a href="/">
            <img src="/resources/img/left_image_ad_2.jpg">
        </a>
    </div>--%>
</aside>