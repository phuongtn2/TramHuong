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
                                <li id="nav_blog_category_${m.categoryDto.id}" class='item has-sub  first' onclick="setLocal('category_${m.categoryDto.id}');">
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
                                                <li id="nav_blog_sub_category_${s.id}" class="first" onclick="setLocal('sub_category_${s.id}');">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS > 1 && countS < m.subSize}">
                                                <li id="nav_blog_sub_category_${s.id}" class="" onclick="setLocal('sub_category_${s.id}');">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                <li id="nav_blog_sub_category_${s.id}" class="last" onclick="setLocal('sub_category_${s.id}');">
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
                                <li id="nav_blog_category_${m.categoryDto.id}" class='item  first' onclick="setLocal('category_${m.categoryDto.id}');">
                                    <a href="/category/${m.categoryDto.id}">
                                        <span>${m.categoryDto.name}</span>
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${count < mSize && count > 1}">
                            <c:if test="${m.subSize > 0}">
                                <li id="nav_blog_category_${m.categoryDto.id}" class='item has-sub' onclick="setLocal('category_${m.categoryDto.id}');">
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
                                                <li id="nav_blog_sub_category_${s.id}" class="first" onclick="setLocal('sub_category_${s.id}');">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS > 1 && countS < m.subSize}">
                                                <li id="nav_blog_sub_category_${s.id}" class="" onclick="setLocal('sub_category_${s.id}');">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                <li id="nav_blog_sub_category_${s.id}" class="last" onclick="setLocal('sub_category_${s.id}');">
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
                                <li id="nav_blog_category_${m.categoryDto.id}" class='item' onclick="setLocal('category_${m.categoryDto.id}');">
                                    <a href="/category/${m.categoryDto.id}">
                                        <span>${m.categoryDto.name}</span>
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                        <c:if test="${count == mSize && mSize > 1}">
                            <c:if test="${m.subSize > 0}">
                                <li id="nav_blog_category_${m.categoryDto.id}" class='item has-sub  last' onclick="setLocal('category_${m.categoryDto.id}');">
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
                                                <li id="nav_blog_sub_category_${s.id}" class="first" onclick="setLocal('sub_category_${s.id}');">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS > 1 && countS < m.subSize}">
                                                <li id="nav_blog_sub_category_${s.id}" class="" onclick="setLocal('sub_category_${s.id}');">
                                                    <a href="/sub-category/${s.id}">
                                                        <span>${s.name}</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${countS == m.subSize && m.subSize > 1}">
                                                <li id="nav_blog_sub_category_${s.id}" class="last" onclick="setLocal('sub_category_${s.id}');">
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
                                <li id="nav_blog_category_${m.categoryDto.id}" class='item last' onclick="setLocal('category_${m.categoryDto.id}');">
                                    <a href="/category/${m.categoryDto.id}">
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
                </a>
            </li>
            <li class="item last" id="nav_blog_post">
                <a href="/posts">
                    <span class="lbl">Bài Viết</span>
                   <%-- <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-3"
                          class="sign">
						    <img src="/resources/img/arrow-right.png">
					    </span>--%>
                </a>
                <%--<ul class="nav children collapse menu-bar t-fix" id="sub-item-3">
                    <c:set var="countS0" value="0" scope="page" />
                    <c:forEach items="${blogs0}" var="b0">
                        <c:set var="countS0" value="${countS0 + 1}" scope="page"/>
                        <c:if test="${blogs0.size() == 1}">
                            <li id="nav_blog_${b0.id}" class="first" onclick="setLocal('blog_${b0.id}');">
                                <a href="/blog/${b0.id}">
                                        ${b0.name}
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${blogs0.size() > 1}">
                            <c:if test="${countS0 == 1}">
                                <li id="nav_blog_${b0.id}" class="first" onclick="setLocal('blog_${b0.id}');">
                                    <a href="/blog/${b0.id}">
                                            ${b0.name}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${countS0 > 1 && countS0 < blogs0.size()}">
                                <li id="nav_blog_${b0.id}" class="" onclick="setLocal('blog_${b0.id}');">
                                    <a href="/blog/${b0.id}">
                                            ${b0.name}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${countS0 == blogs0.size()}">
                                <li id="nav_blog_${b0.id}" class="last" onclick="setLocal('blog_${b0.id}');">
                                    <a href="/blog/${b0.id}">
                                            ${b0.name}
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>--%>
            </li>
        </ul>
    </div>
    <div class="news-latest list-group">
            <span class="list-group-item active">
                Bài viết nổi bật
            </span>

        <c:forEach items="${postNews}" var="p">
            <div class="article">
                <div class="col-ld-3 col-md-3 col-sm-4 col-xs-4">
                    <a href="/post/${p.id}">
                        <img style="width: 50px; height: 40px;"
                             src="${p.img}"/>
                    </a>
                </div>
                <div class="post-content  col-lg-9 col-md-9 col-sm-8 col-xs-8 ">
                    <a href="/post/${p.id}">${p.title}</a>
                    <%--<span class="date"><i class="time-date"></i>${p.dateDisplay}</span>--%>
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

        });

        $("#list-group-l ul.navs li.active").parents('ul.children').addClass("in");
    </script>
</aside>
    <!-- End sidebar blog -->
