<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main-content">
    <!-- Sản phẩm trang chủ -->
    <div class="product-list clearfix">
        <div class="title-line">
            <h3>Sản phẩm nổi bật</h3>
        </div>
        <!--Product loop-->
        <div class="row content-product-list products-resize">
            <c:forEach items="${pHighlights}" var="pH">
                <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                    <div class="product-block product-resize">
                        <div class="product-img image-resize view view-third clearfix">
                            <c:if test="${pH.isEffete == 1}">
                                <div class="sold-out">Hết hàng</div>
                            </c:if>
                            <c:if test="${pH.isEffete == 0}">
                                <c:if test="${pH.isNew == 1}">
                                    <div class="sold-out">Sản phẩm mới</div>
                                </c:if>
                                <c:if test="${pH.isSale == 1}">
                                    <div class="sold-out">Sản khuyến mãi</div>
                                </c:if>
                            </c:if>
                            <a href="/product/${pH.id}">
                                <div class="mask">
                                    <img src="/resources/img/quick-look.png"
                                         data-handle="${pH.id}"/>
                                </div>
                                <img src="${pH.img}"/>
                            </a>
                        </div>
                        <div class="product-detail clearfix">
                            <!-- sử dụng pull-left -->
                            <p class="pro-price">${pH.priceDisplay}₫</p>
                            <p class="pro-price-del text-left"></p></h3>
                            <h3 class="pro-name"><a href="/product/${pH.id}">${pH.name}</a></h3>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-lg-12 pull-center">
                <a class="btn btn-readmore" href="/product/all" role="button">Xem
                    thêm </a>
            </div>
        </div>
    </div>
    <!--Product loop-->
    <div class="product-list clearfix ">
        <div class="title-line">
            <h3>Sản phẩm khuyến mãi</h3>
        </div>
        <div class="row content-product-list products-resize">
            <c:forEach items="${pSales}" var="pH">
                <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                    <div class="product-block product-resize">
                        <div class="product-img image-resize view view-third clearfix">
                            <c:if test="${pH.isEffete == 1}">
                                <div class="sold-out">Hết hàng</div>
                            </c:if>
                            <c:if test="${pH.isEffete == 0}">
                                <c:if test="${pH.isNew == 1}">
                                    <div class="sold-out">Sản phẩm mới</div>
                                </c:if>
                                <c:if test="${pH.isSale == 1}">
                                    <div class="sold-out">Sản khuyến mãi</div>
                                </c:if>
                            </c:if>
                            <a href="/product/${pH.id}">
                                <div class="mask">
                                    <img src="/resources/img/quick-look.png"
                                         data-handle="${pH.id}"/>
                                </div>
                                <img src="${pH.img}"/>
                            </a>
                        </div>
                        <div class="product-detail clearfix">
                            <!-- sử dụng pull-left -->
                            <p class="pro-price">${pH.priceDisplay}₫</p>
                            <p class="pro-price-del text-left"></p></h3>
                            <h3 class="pro-name"><a href="/product/${pH.id}">${pH.name}</a></h3>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-lg-12 pull-center">
                <a class="btn btn-readmore" href="/product/allSales" role="button">Xem
                    thêm </a>
            </div>
        </div>
    </div>

    <div class="product-list clearfix ">
        <div class="title-line">
            <h3>Sản phẩm mới</h3>
        </div>
        <div class="row content-product-list products-resize">
            <c:forEach items="${pNews}" var="pH">
                <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                    <div class="product-block product-resize">
                        <div class="product-img image-resize view view-third clearfix">
                            <c:if test="${pH.isEffete == 1}">
                                <div class="sold-out">Hết hàng</div>
                            </c:if>
                            <c:if test="${pH.isEffete == 0}">
                                <c:if test="${pH.isNew == 1}">
                                    <div class="sold-out">Sản phẩm mới</div>
                                </c:if>
                                <c:if test="${pH.isSale == 1}">
                                    <div class="sold-out">Sản khuyến mãi</div>
                                </c:if>
                            </c:if>
                            <a href="/product/${pH.id}">
                                <div class="mask">
                                    <img src="/resources/img/quick-look.png"
                                         data-handle="${pH.id}"/>
                                </div>
                                <img src="${pH.img}"/>
                            </a>
                        </div>
                        <div class="product-detail clearfix">
                            <!-- sử dụng pull-left -->
                            <p class="pro-price">${pH.priceDisplay}₫</p>
                            <p class="pro-price-del text-left"></p></h3>
                            <h3 class="pro-name"><a href="/product/${pH.id}">${pH.name}</a></h3>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-lg-12 pull-center">
            </div>
        </div>
    </div>
    <!-- End sản phẩm trang chủ -->
</div>