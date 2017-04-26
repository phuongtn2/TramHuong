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
    <!-- Begin empty cart -->
    <div class="row">
        <div id="layout-page" class="col-md-12">
			<span class="header-page clearfix">
				<h1>Giỏ hàng</h1> </span>
            <form:form modelAttribute="cartListDto" id="cartformpage">
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
                    <c:set var="count" value="0" scope="page" />
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
                                <c:forEach items="${carts.cartDtoList}" var="c">
                                    <c:if test="${c.productId == p.id}">
                                        <input type="hidden" name="cartDtoList[${count}].productId" value="${p.id}">
                                        <input type="number" size="4" name="cartDtoList[${count}].count" min="1" id="updates_1006603133" value="${c.count}" onfocus="this.select();" class="tc item-quantity">
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td class="price">${p.priceDisplay}₫</td>
                            <td class="remove">
                                <a href="/cart/change/${p.id}" class="cart">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr class="summary">
                        <td class="image">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="text-center"><b>Phí vận chuyển:</b></td>
                        <td class="price">
                            <span class="total">
                                <strong>${shipping}₫</strong>
                            </span>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
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
                <div class="col-md-6 inner-left inner-right">
                    <div class="checkout-buttons clearfix">
                        <label for="description">Ghi chú </label>
                        <textarea id="description" name="description" rows="8" cols="50">${carts.description}</textarea>
                    </div>
                </div>
                <c:if test="${products != null  && products.size() > 0}">
                    <div class="col-md-6 cart-buttons inner-right inner-left">
                        <div class="buttons clearfix">
                            <button type="submit" id="checkout" class="button-default" name="checkout" value="">Thanh toán</button>
                            <button type="submit" id="update-cart" class="button-default" name="update" value="">Cập nhật</button>
                        </div>
                    </div>
                </c:if>
                <c:if test="${products == null  || products.size() <= 0}">
                    <div class="col-md-6 cart-buttons inner-right inner-left">
                        <div class="buttons clearfix">
                            <button type="submit" id="checkout" class="button-default" name="checkout" value="" disabled>Thanh toán</button>
                            <button type="submit" id="update-cart" class="button-default" name="update" value="" disabled>Cập nhật</button>
                        </div>
                    </div>
                </c:if>
                <div class="col-md-12">
                    <a href="/">
                        <i class="fa fa-reply"></i> Tiếp tục mua hàng</a>
                </div>
            </form:form>
        </div>
    </div>
    <!-- End cart -->
</div>