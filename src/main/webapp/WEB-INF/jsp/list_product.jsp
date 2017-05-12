<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 27/04/2017
  Time: 8:58 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="col-md-12 product-list">
    <div class="row content-product-list">
        <ul id="pagging_product">
            <c:set var="count" value="0" scope="page" />
            <c:forEach items="${productList}" var="pH">
                <c:set var="count" value="${count + 1}" scope="page"/>
                <c:if test="${count == 1}">
                    <li>
                </c:if>
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
                            <c:if test="${pH.isSale == 0}">
                                <p class="pro-price">Giá bán: ${pH.priceDisplay}₫</p>
                            </c:if>
                            <c:if test="${pH.isSale == 1}">
                                <p class="pro-price">Giá bán: <strike>${pH.priceDisplay}₫</strike></p>
                                <p class="pro-price">Giá khuyến mãi: ${pH.salePriceDisplay}₫</p>
                            </c:if>
                            <p class="pro-price-del text-left"></p></h3>
                            <h3 class="pro-name"><a href="/product/${pH.id}">${pH.name}</a></h3>
                        </div>
                    </div>
                </div>
                <c:if test="${count == 12}">
                    </li>
                    <c:set var="count" value="0" scope="page"/>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
