<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<nav id="mp-menu" class="mp-menu">
    <div class="mp-level">
        <ul class="lv1">
            <a href="/">Quay lại</a>
            <li><a href="/">Trang Chủ</a></li>
            <li><a href="/introduce">Giới thiệu</a></li>
            <li class="has-children icon icon-arrow-left">
                <a href="#">Sản phẩm</a>
                <div class="mp-level">
                    <h2>Sản phẩm</h2>
                    <a class="mp-back" href="#">Quay lại</a>
                    <ul class="cd-secondary-nav count-nav-11">
                        <c:forEach items="${mapping_categories}" var="m">
                            <c:if test="${m.subSize > 0}">
                            <li class="has-children icon icon-arrow-left">
                                <a href="/category/${m.categoryDto.id}">${m.categoryDto.name}</a>
                                <div class="mp-level">
                                    <h2>${m.categoryDto.name}</h2>
                                    <a class="mp-back" href="#">Quay lại</a>

                                        <ul>
                                            <c:forEach items="${m.suCategories}" var="s">
                                                <li>
                                                    <a href="/sub-category/${s.id}">${s.name}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>

                                </div>
                            </li>
                            </c:if>
                            <c:if test="${m.subSize == null || m.subSize <=0}">
                                <li>
                                    <a href="/category/${m.categoryDto.id}">${m.categoryDto.name}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </li>
            <li>
                <a href="/product/sales">Khuyến Mãi</a>
                <%--<div class="mp-level">
                    <h2>KHUYẾN MÃI</h2>
                    <a class="mp-back" href="#">Quay lại</a>
                    <ul class="cd-secondary-nav count-nav-1">
                        <li><a href="/blogs/tin-khuyen-mai">Nhang Trầm Có Tăm</a></li>
                    </ul>
                </div>--%>
            </li>
            <li class="has-children icon icon-arrow-left">
                <a href="#">Bài Viết Sản Phẩm</a>
                <div class="mp-level">
                    <h2>Bài Viết</h2>
                    <a class="mp-back" href="#">Quay lại</a>
                    <ul class="cd-secondary-nav count-nav-6">
                        <c:forEach items="${blogs0}" var="b0">
                            <li>
                                <a href="/blog/${b0.id}">${b0.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </li>
            <%--<li class="has-children icon icon-arrow-left">
                <a href="#">THẾ GIỚI TÂM LINH</a>
                <div class="mp-level">
                    <h2>THẾ GIỚI TÂM LINH</h2>
                    <a class="mp-back" href="#">Quay lại</a>
                    <ul class="cd-secondary-nav count-nav-3">
                        <c:forEach items="${blogs1}" var="b1">
                            <li>
                                <a href="/blog/${b1.id}">
                                        ${b1.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </li>--%>
            <%--<li><a href="/pages/nhan-xet-cua-khach-hang">NHẬN XÉT KH</a></li>--%>
        </ul>
    </div>
</nav>