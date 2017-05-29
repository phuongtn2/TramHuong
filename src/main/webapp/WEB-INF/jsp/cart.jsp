<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 24/04/2017
  Time: 8:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div id="cart">
    <div id="layout-page">
        <form:form modelAttribute="carts" id="cartformpage">
            <input type="hidden" id="productNumber_main" value="${productNumber}"/>
            <!-- Begin empty cart -->
            <div class="row">
                <div class="col-md-12">
			<span class="header-page clearfix">
				<h1>Giỏ hàng</h1> </span>
                </div>

                <table>
                    <thead>
                    <tr>
                        <th class="image">&nbsp;</th>
                        <th class="item">Tên sản phẩm</th>
                        <th class="qty">Số lượng</th>
                        <th class="price">Giá tiền</th>
                        <th class="remove">&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="count" value="0" scope="page"/>
                    <c:forEach items="${products}" var="p">
                        <c:set var="count" value="${count + 1}" scope="page"/>
                        <tr>
                            <td class="image">
                                <div class="product_image">
                                    <a href="/product/${p.id}">
                                        <img src="${p.img}">
                                    </a>
                                </div>
                            </td>
                            <td class="item">
                                <a href="/product/${p.id}">
                                    <strong>${p.name}</strong>
                                </a>
                            </td>
                            <td class="qty">
                                    <%--<input type="hidden" id="productNumber_main" value="${productNumber}"/>--%>
                                <c:set var="count" value="0" scope="page"/>
                                <c:forEach items="${carts.cartDtoList}" var="c">
                                    <c:if test="${c.productId == p.id}">
                                        <input type="hidden" name="cartDtoList[${count}].productId" value="${p.id}">
                                        <input type="hidden" id="productNumberOld_${count}" value="${c.count}">
                                        <input type="number" size="4" name="cartDtoList[${count}].count" min="1"
                                               id="productNumber_${count}" value="${c.count}" onfocus="this.select();"
                                               class="tc item-quantity">
                                        <input type="hidden" id="productName-Error_${count}" value="${p.name}"/>
                                    </c:if>
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                </c:forEach>
                            </td>
                            <td class="price">
                                <c:if test="${p.isSale == 1 && p.salePrice > 0}">${p.salePriceDisplay}₫</c:if>
                                <c:if test="${p.isSale == 0}">${p.priceDisplay}₫</c:if>
                            </td>
                            <td class="remove">
                                <a href="/cart/change/${p.id}" class="cart">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <%--<tr class="summary">
                        <td class="image">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="text-center"><b>Phí vận chuyển:</b></td>
                        <td class="price">
                            <span class="total">
                                <strong>${shipping}₫</strong>
                            </span>
                        </td>&ndash;%&gt;
                        <td>&nbsp;</td>
                    </tr>--%>
                    <tr class="summary">
                        <td class="image">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="text-center"><b>Tổng cộng:</b></td>
                        <td class="price">
								<span class="total">
									<strong>${carts.totalPrice}₫</strong>
								</span>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    </tbody>
                </table>
                <%--<div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Hình Ảnh</label>

                        </div>
                        <!-- /.form-group -->
                        <c:forEach items="${products}" var="p">
                        <div class="form-group">
                            <div class="product_image">
                                <a href="/product/${p.id}">
                                    <img src="${p.img}">
                                </a>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- /.form-group -->
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Tên Sản Phẩm</label>

                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">

                        </div>
                        <!-- /.form-group -->
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Số Lượng</label>

                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">

                        </div>
                        <!-- /.form-group -->
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Giá</label>

                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">

                        </div>
                        <!-- /.form-group -->
                    </div>
                    <div class="col-md-1">
                        <div class="form-group">
                            <label>Xóa</label>

                        </div>
                        <!-- /.form-group -->
                        <div class="form-group">

                        </div>
                        <!-- /.form-group -->
                    </div>
            </div>--%>
                <div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="description">Ghi chú </label>
                        </div>
                        <div class="form-group">
                            <textarea id="description" name="description" rows="2"
                                      style="width: 100%;">${carts.description}</textarea>
                        </div>
                    </div>
                </div>
                <div>

                    <div class="col-md-4  inner-right inner-left">
                        <a href="/" style="background: #808000;border: none;
    padding: 0 20px;
    color: #fff;
    font-size: 16px;
    border-radius: 3px;
    float: right;
    height: 45px;
    line-height: 45px;
    position: relative;
    cursor: pointer;
    margin: 7px;">
                            <i class="fa fa-reply"></i> Tiếp tục mua hàng</a>
                    </div>
                    <c:if test="${products != null  && products.size() > 0}">
                        <div class="col-md-8 inner-right inner-left">
                            <input id="operator-cart" type="hidden" name=""/>
                            <div>
                                <button type="button" id="checkout" class="button-default"  value=""
                                        onclick="checkValidCart('checkout');">Thanh toán
                                </button>
                                <button type="button" id="update-cart" class="button-default" value=""
                                        onclick="checkValidCart('update');">Cập nhật
                                </button>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${products == null  || products.size() <= 0}">
                        <div class="col-md-8 inner-right inner-left">
                            <div>
                                <button type="button" class="button-default" name="checkout" value="" disabled>Thanh
                                    toán
                                </button>
                                <button type="button" class="button-default" name="update" value="" disabled>Cập nhật
                                </button>
                            </div>
                        </div>
                    </c:if>

                </div>

            </div>
            <!-- End cart -->
        </form:form>
    </div>
</div>