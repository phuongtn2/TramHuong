<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 26/04/2017
  Time: 5:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="col-md-3  hidden-sm hidden-xs">
    <div class="list-group" id="list-group-l">
        <ul class="nav navs sidebar menu" id='cssmenu'>
            <div class="mega-left-title">
                <strong>Danh mục blog</strong>
            </div>
            <li class="item first">
                <a href="/">
                    <span>Trang Chủ</span>
                </a>
            </li>
            <li class="item">
                <a href="/introduce">
                    <span>Giới thiệu</span>
                </a>
            </li>
            <li class="item has-sub  ">
                <a href="#">
                    <span class="lbl">Sản phẩm</span>
                    <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-4"
                          class="sign">
						<img src="/resources/img/arrow-right.png">
					</span>
                </a>
                <ul class="nav children collapse menu-bar t-fix" id="sub-item-4">
                    <c:set var="count" value="0" scope="page" />
                    <c:forEach items="${mapping_categories}" var="m">
                        <c:set var="count" value="${count + 1}" scope="page"/>
                        <c:if test="${count == 1}">
                            <c:if test="${m.subSize > 0}">
                                <li class='item has-sub  first'>
                                    <a href='/category/${m.categoryDto.id}' <%--style="z-index: 99999;"--%>>
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
                                                <li class="first">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS > 1 && countS < m.subSize}">
                                                <li class="">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                <li class="last">
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
                                <li class='item  first'>
                                    <a href="/collections/vong-tay-tram-huong-khong-chim-nuoc">
                                        <span>${m.categoryDto.name}</span>
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${count < mSize && count > 1}">
                            <c:if test="${m.subSize > 0}">
                                <li class='item has-sub'>
                                    <a href='/category/${m.categoryDto.id}' <%--style="z-index: 99999;"--%>>
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
                                                <li class="first">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS > 1 && countS < m.subSize}">
                                                <li class="">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                <li class="last">
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
                                <li class='item'>
                                    <a href="/category/${m.categoryDto.id}">
                                        <span>${m.categoryDto.name}</span>
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${count == mSize && mSize > 1}">
                            <c:if test="${m.subSize > 0}">
                                <li class='item has-sub  last'>
                                    <a href='/category/${m.categoryDto.id}' <%--style="z-index: 99999;"--%>>
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
                                                <li class="first">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS > 1 && countS < m.subSize}">
                                                <li class="">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                <li class="last">
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
                                <li class='item last'>
                                    <a href="/sub-category/${m.categoryDto.id}">
                                        <span>${m.categoryDto.name}</span>
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>
            <li class="item ">
                <a href="/product/sales">
                    <span class="lbl">Khuyến Mãi</span>
                    </span>
                </a>
            </li>
            <li class="item has-sub  ">
                <a href="#">
                    <span class="lbl">Bài Viết</span>
                    <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-3"
                          class="sign">
						    <img src="/resources/img/arrow-right.png">
					    </span>
                </a>
                <ul class="nav children collapse menu-bar t-fix" id="sub-item-3">
                    <c:set var="countS0" value="0" scope="page" />
                    <c:forEach items="${blogs0}" var="b0">
                        <c:set var="countS0" value="${countS0 + 1}" scope="page"/>
                        <c:if test="${blogs0.size() == 1}">
                            <li class="first">
                                <a href="/blog/${b0.id}">
                                        ${b0.name}
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${blogs0.size() > 1}">
                            <c:if test="${countS0 == 1}">
                                <li class="first">
                                    <a href="/blog/${b0.id}">
                                            ${b0.name}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${countS0 > 1 && countS0 < blogs0.size()}">
                                <li class="">
                                    <a href="/blog/${b0.id}">
                                            ${b0.name}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${countS0 == blogs0.size()}">
                                <li class="last">
                                    <a href="/blog/${b0.id}">
                                            ${b0.name}
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>
            <%--<li class="item has-sub  ">
                <a href="#">
                    <span class="lbl">Thế Giới Tâm Linh</span>
                    <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-6"
                          class="sign">
						<img src="/resources/img/arrow-down.png">
					</span>
                </a>
                <ul class="nav children collapse" id="sub-item-6">
                    <c:set var="countS1" value="0" scope="page" />
                    <c:forEach items="${blogs1}" var="b1">
                        <c:set var="countS1" value="${countS1 + 1}" scope="page"/>
                        <c:if test="${blogs1.size() == 1}">
                            <li class="first">
                                <a href="/blog/${b1.id}">
                                        ${b1.name}
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${blogs1.size() > 1}">
                            <c:if test="${countS1 == 1}">
                                <li class="first">
                                    <a href="/blog/${b1.id}">
                                            ${b1.name}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${countS1 > 1 && countS1 < blogs1.size()}">
                                <li class="">
                                    <a href="/blog/${b1.id}">
                                            ${b1.name}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${countS1 == blogs1.size()}">
                                <li class="last">
                                    <a href="/blog/${b1.id}">
                                            ${b1.name}
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>--%>
        </ul>
    </div>
    <div class="news-latest list-group">
            <span class="list-group-item active">
                Bài viết mới nhất
            </span>

        <c:forEach items="${postNews}" var="p">
            <div class="article">
                <div class="col-ld-3 col-md-3 col-sm-4 col-xs-4">
                    <a href="/blogs/post/${p.id}">
                        <img style="width: 50px; height: 40px;"
                             src="${p.img}"/>
                    </a>
                </div>
                <div class="post-content  col-lg-9 col-md-9 col-sm-8 col-xs-8 ">
                    <a href="/blogs/post/${p.id}">${p.title}</a><span class="date"> <i
                        class="time-date"></i>${p.dateDisplay}</span>
                </div>
            </div>
        </c:forEach>

    </div>
    <script>

        $(document).ready(function () {
            //$('ul li:has(ul)').addClass('hassub');
            $('#cssmenu ul ul li:odd').addClass('odd');
            $('#cssmenu ul ul li:even').addClass('even');
            $('#cssmenu > ul > li > a').click(function () {
                $('#cssmenu li').removeClass('active');
                $(this).closest('li').addClass('active');
                var checkElement = $(this).nextS();
                if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                    $(this).closest('li').removeClass('active');
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

            var url = window.location.href;
            var position = url.lastIndexOf("/") + 1;
            var idActive = url.substring(position,url.length);
            $('#category_'+ idActive).addClass( "current active" );

        });

        $("#list-group-l ul.navs li.active").parents('ul.children').addClass("in");
    </script>
</aside>
<%--<div class="col-md-3 clearfix">
    <!-- Begin sidebar blog -->
    <div class="sidebar">
        <!-- Begin: Danh mục tin tức -->
        <div class="news-menu list-group">
            <span class="list-group-item active">Danh mục blog</span>
            <ul class="nav sidebar" id="menu-blog">
                <li class=" first">
                    <a href="/">
                        <span>Trang Chủ</span>
                    </a>
                </li>
                <li class=" ">
                    <a href="/introduce">
                        <span>Giới thiệu</span>
                    </a>
                </li>
                <li class="item has-sub  ">
                    <a href="#">
                        <span class="lbl">Bài Viết Sản Phẩm</span>
                        <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-3"
                              class="sign">
						    <img src="/resources/img/arrow-down.png">
					    </span>
                    </a>
                    <ul class="nav children collapse" id="sub-item-3">
                        <c:set var="countS0" value="0" scope="page" />
                        <c:forEach items="${blogs0}" var="b0">
                            <c:set var="countS0" value="${countS0 + 1}" scope="page"/>
                            <c:if test="${blogs0.size() == 1}">
                                <li class="first">
                                    <a href="/blog/${b0.id}">
                                            ${b0.name}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${blogs0.size() > 1}">
                                <c:if test="${countS1 == 1}">
                                    <li class="first">
                                        <a href="/blog/${b0.id}">
                                                ${b0.name}
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${countS0 > 1 && countS0 < blogs0.size()}">
                                    <li class="">
                                        <a href="/blog/${b0.id}">
                                                ${b0.name}
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${countS0 == blogs0.size()}">
                                    <li class="last">
                                        <a href="/blog/${b0.id}">
                                                ${b0.name}
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
                <li class="item has-sub  ">
                    <a href="#">
                        <span class="lbl">Sản phẩm</span>
                        <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-4"
                              class="sign">
						<img src="/resources/img/arrow-down.png">
					</span>
                    </a>
                    <ul class="nav children collapse" id="sub-item-4">
                        <c:set var="count" value="0" scope="page" />
                        <c:forEach items="${mapping_categories}" var="m">
                            <c:set var="count" value="${count + 1}" scope="page"/>
                            <c:if test="${count == 1}">
                                <c:if test="${m.subSize > 0}">
                                    <li class='item has-sub  first'>
                                        <a href='/category/${m.categoryDto.id}'>
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
                                                    <li class="first">
                                                        <a href="/sub-category/${s.id}">
                                                            <span>${s.name}</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${countS > 1 && countS < m.subSize}">
                                                    <li class="">
                                                        <a href="/sub-category/${s.id}">
                                                            <span>${s.name}</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                    <li class="last">
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
                                    <li class='item  first'>
                                        <a href="/collections/vong-tay-tram-huong-khong-chim-nuoc">
                                            <span>${m.categoryDto.name}</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                            <c:if test="${count < mSize && count > 1}">
                                <c:if test="${m.subSize > 0}">
                                    <li class='item has-sub'>
                                        <a href='/category/${m.categoryDto.id}'>
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
                                                    <li class="first">
                                                        <a href="/sub-category/${s.id}">
                                                            <span>${s.name}</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${countS > 1 && countS < m.subSize}">
                                                    <li class="">
                                                        <a href="/sub-category/${s.id}">
                                                            <span>${s.name}</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                    <li class="last">
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
                                    <li class='item'>
                                        <a href="/category/${m.categoryDto.id}">
                                            <span>${m.categoryDto.name}</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                            <c:if test="${count == mSize && mSize > 1}">
                                <c:if test="${m.subSize > 0}">
                                    <li class='item has-sub  last'>
                                        <a href='/category/${m.categoryDto.id}'>
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
                                                    <li class="first">
                                                        <a href="/sub-category/${s.id}">
                                                            <span>${s.name}</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${countS > 1 && countS < m.subSize}">
                                                    <li class="">
                                                        <a href="/sub-category/${s.id}">
                                                            <span>${s.name}</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                    <li class="last">
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
                                    <li class='item last'>
                                        <a href="/sub-category/${m.categoryDto.id}">
                                            <span>${m.categoryDto.name}</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
                <li class="item ">
                    <a href="/product/sales">
                        <span class="lbl">Khuyến Mãi</span>
					</span>
                    </a>
                </li>
                <li class="item has-sub  ">
                    <a href="#">
                        <span class="lbl">Thế Giới Tâm Linh</span>
                        <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-6"
                              class="sign">
						<img src="/resources/img/arrow-down.png">
					</span>
                    </a>
                    <ul class="nav children collapse" id="sub-item-6">
                        <c:set var="countS1" value="0" scope="page" />
                        <c:forEach items="${blogs1}" var="b1">
                            <c:set var="countS1" value="${countS1 + 1}" scope="page"/>
                            <c:if test="${blogs1.size() == 1}">
                                <li class="first">
                                    <a href="/blog/${b1.id}">
                                            ${b1.name}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${blogs1.size() > 1}">
                                <c:if test="${countS1 == 1}">
                                    <li class="first">
                                        <a href="/blog/${b1.id}">
                                                ${b1.name}
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${countS1 > 1 && countS1 < blogs1.size()}">
                                    <li class="">
                                        <a href="/blog/${b1.id}">
                                                ${b1.name}
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${countS1 == blogs1.size()}">
                                    <li class="last">
                                        <a href="/blog/${b1.id}">
                                                ${b1.name}
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
                &lt;%&ndash;<li class="last">
                    <a href="/pages/nhan-xet-cua-khach-hang">
                        <span>NHẬN XÉT KH</span>
                    </a>
                </li>&ndash;%&gt;
            </ul>
            <script>
                $(document).ready(function () {
                    //$('ul li:has(ul)').addClass('hassub');
                    $('#menu-blog ul ul li:odd').addClass('odd');
                    $('#menu-blog ul ul li:even').addClass('even');
                    $('#menu-blog > ul > li > a').click(function () {
                        $('#menu-blog li').removeClass('active');
                        $(this).closest('li').addClass('active');
                        var checkElement = $(this).nextS();
                        if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                            $(this).closest('li').removeClass('active');
                            checkElement.slideUp('normal');
                        }
                        if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                            $('#menu-blog ul ul:visible').slideUp('normal');
                            checkElement.slideDown('normal');
                        }
                        if ($(this).closest('li').find('ul').children().length == 0) {
                            return true;
                        } else {
                            return false;
                        }
                    });

                    $('.drop-down-1').click(function (e) {
                        if ($(this).parents('li').hasClass('has-sub')) {
                            e.preventDefault();
                            if ($(this).hasClass('open-nav')) {
                                $(this).removeClass('open-nav');
                                $(this).parents('li').children('ul.lve2-blog').slideUp('normal').removeClass('in');
                            } else {
                                $(this).addClass('open-nav');
                                $(this).parents('li').children('ul.lve2-blog').slideDown('normal').addClass('in');
                            }
                        } else {

                        }
                    });

                });

                $(".news-menu  ul.navs li.active").parents('ul.children').addClass("in");
            </script>
        </div>
        <!-- End: Danh mục tin tức -->
        <!--Begin: Bài viết mới nhất-->
        <div class="news-latest list-group">
            <span class="list-group-item active">
                Bài viết mới nhất
            </span>

            <c:forEach items="${postNews}" var="p">
                    <div class="article">
                        <div class="col-ld-3 col-md-3 col-sm-4 col-xs-4">
                            <a href="/blogs/post/${p.id}">
                                <img style="width: 50px; height: 40px;"
                                                               src="${p.img}"/>
                            </a>
                        </div>
                        <div class="post-content  col-lg-9 col-md-9 col-sm-8 col-xs-8 ">
                            <a href="/blogs/post/${p.id}">${p.title}</a><span class="date"> <i
                                class="time-date"></i>${p.dateDisplay}</span>
                        </div>
                    </div>
            </c:forEach>

        </div>
        <!--End: Bài viết mới nhất-->
    </div>
</div>--%>
    <!-- End sidebar blog -->
