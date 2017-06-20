<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row contents">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <!-- Begin slider -->
        <div class="slider-default col-md-12 col-sm-12 col-xs-12">
            <div class="flexslider-container">
                <div class="flexslider">
                    <ul class="slides">
                        <c:forEach items="${banners}" var="b">
                            <li>
                                <a href="/">
                                    <img src="${b.img}" style="width: 100%; height: 372px;"/>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="flex-controls"></div>
                </div>
            </div>
        </div>
        <!-- End slider -->
    </div>

    <%--<div class="top-banner col-lg-3 col-md-3 col-sm-12 col-xs-12">
        <div class="banner1">
            <div class="image">
                <a href="">
                    <img class="img-responsive" alt=""
                         src="/resources/img/banner/img_left_1.jpg"></a>
            </div>
        </div>
        <div class="banner2">
            <div class="image">
                <a href="">
                    <img class="img-responsive" alt=""
                         src="/resources/img/banner/img_left_2.jpg"></a>
            </div>
        </div>
    </div>--%>
</div>