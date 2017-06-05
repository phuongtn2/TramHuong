<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 24/04/2017
  Time: 8:49 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<span class="fbtracker-checkout"></span>

<div class="container clearfix">
    <div class="col-md-12">
        <a href="/cart">
            <h1>
        <span style="background: url(/resources/img/back-checkout.png) no-repeat center left;
    background-color: #808000;
    border: none;
    padding: 0 20px;
    color: #fff;
    font-size: 16px;
    border-radius: 3px;
    float: left;
    height: 45px;
    line-height: 45px;
    position: relative;
    cursor: pointer;
    margin: 7px;">Quay về giỏ hàng</span> Trầm Hương Tuấn Anh</h1></a>
    </div>
    <form:form accept-charset="UTF-8" id="purchase-form" action="/saveOrder" modelAttribute="orderInfo" class="new_order">
    <div class="col-md-12">
        <div class="col-lg-4">
            <h2>Thông tin giao hàng</h2>
            <div class="line"></div>
            <div class="form-info">
                <div class="form-group">
                </div>
                <div class="form-group">
                    <input placeholder="Họ và tên" class="formcontrol" id="billing_address_full_name"
                           name="name" size="30" type="text" required/>
                    <p>Họ và tên</p>
                </div>
                <div class="form-group">
                    <input placeholder="Số điện thoại" maxlength="11" id="billing_address_phone" class="formcontrol"
                           name="tel" size="30" title="Nhập số điện thoại" pattern="^\d{8,11}"
                           type="tel" value="" required/>
                    <p>Số điện thoại</p>
                </div>
                <div class="form-group">
                    <input placeholder="Email" id="order_email" name="email" class="formcontrol"
                           size="30" type="email" value="" required/>
                    <p>Email</p>
                </div>
                <div class="form-group">
                    <input placeholder="Địa chỉ" id="billing_address_address1" class="formcontrol"
                           name="address" size="30" type="text" value="" required/>
                    <p>Địa chỉ</p>
                </div>
                <div class="form-group ctrl-city">
                    <div class='custom-dropdown'>
                        <select id="billing_address_province" class="formcontrol"
                                required onchange="setProvinceName()">
                            <option value="null" disabled selected hidden>Vui lòng chọn tỉnh/thành phố.</option>
                            <c:forEach items="${provinces}" var="p">
                                <option value="${p.id}">${p.name}</option>
                            </c:forEach>
                        </select>
                        <input type="hidden" name="provinceName" id="provinceName"/>
                    </div>
                </div>
                <div class="form-group ctrl-district" id="shipping_district_container">
                    <%--<div class='custom-dropdown'>--%>
                        <%--<select id="shipping_district" name="districtId" class="formcontrol" required
                                onChange="getWards();">
                            <option value="null" disabled selected hidden>Vui lòng chọn quận/huyện.</option>
                        </select>--%>
                        <input type="text" name="districtName" id="districtName" class="formcontrol" required placeholder="Quận/Huyện"/>
                    <%--</div>--%>
                </div>
                <div class="form-group ctrl-district" id="shipping_ward_container">
                    <%--<div class='custom-dropdown'>--%>
                        <%--<select id="shipping_ward" name="wardId" class="formcontrol" required onchange="getWardName();">
                            <option value="null" disabled selected hidden>Vui lòng chọn xã/phường.</option>
                        </select>
                        <input type="hidden" name="wardName" id="wardName"/>--%>
                            <input type="text" name="wardName" id="wardName" class="formcontrol" required placeholder="Phường/Xã"/>
                    <%--</div>--%>
                </div>
                <div class="form-group">
                    <textarea id="billing_note" placeholder="Ghi chú đơn hàng" name="description" rows="3"
                              class="formcontrol ordernote">${carts.description}</textarea>
                    <p>Ghi chú đơn hàng</p>
                </div>
                <%--<div class="error summary">
                    (<span class="color-red ">*</span>)Vui lòng nhập đủ thông tin
                </div>--%>
            </div>
        <%--<div class="listerror">

        </div>--%>
    </div>
        <div class="col-lg-4">
            <h3>Vận chuyển & Thanh toán</h3>
            <button type="button" class="btn-checkout" id="term-shipping-payment" style="font-size: 14px;">Qui Định Vận Chuyển/Thanh Toán</button>
            <%--<div>
                <button type="button" class="btn-checkout" id="chosePayment" style="font-size: 14px;">Chọn Phương Thức Thanh Toán</button>
                <label id="payment-modal"></label>
                <input id="paymentType" name="paymentType" type="hidden" value="0"/>
                <button type="button" class="btn-checkout" id="choseShipping" style="font-size: 14px;">Chọn Phương Thức Vận Chuyển</button>
                <label id="shipping-modal"></label>
                <input id="shippingType" name="shippingType" type="hidden" value="0"/>
            </div>--%>

                <h2 class="section-title">Phương thức vận chuyển</h2>
            <div class="shiping-ajax-s">
                <c:set var="count1" value="0" scope="page" />
                <c:forEach items="${shippings}" var="s">
                    <c:set var="count1" value="${count1 + 1}" scope="page"/>
                    <label class="lb-method-s">
                        <input name="shippingType" class="input-method-s" type="radio" <c:if test="${count1 == 1}">checked="checked" </c:if>value="${s.id}"/>
                        <span class="label-radio">${s.name}</span>
                        <input id="shippingType-cost_${s.id}" type="hidden" value="${s.costDisplay}"/>
                        <input id="shippingType-cost_main_${s.id}" type="hidden" value="${s.shippingCost}"/>

                    </label>
                    <span class="desc-s">${s.info}</span>
                </c:forEach>
            </div>
                <h2 class="section-title">Phương thức Thanh Toán</h2>
            <div class="shiping-ajax-p">
                <c:set var="count" value="0" scope="page" />
                <c:forEach items="${payments}" var="p">
                    <c:set var="count" value="${count + 1}" scope="page"/>
                    <label class="lb-method-p">
                        <input name="paymentType" class="input-method-p" type="radio" <c:if test="${count == 1}">checked="checked" </c:if>value="${p.id}"/>
                        <span class="label-radio">${p.name}</span>
                    </label>
                    <span class="desc-p">${p.info}</span>
                </c:forEach>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="box-cart">
                <h2>Mã Đơn hàng: </h2>
                <span style="color: red">${carts.orderCode}</span>
                <div class="cart-items">
                    <div class="list_item cart-item">
                        <h2>Đơn hàng</h2>
                        (<span>${items}</span> sản phẩm)
                    </div>
                    <c:forEach items="${products}" var="p">
                        <div class="list_item cart-item">
                            <c:forEach items="${carts.cartDtoList}" var="c">
                                <c:if test="${c.productId == p.id}">
                                    <span>${c.count} x</span>
                                </c:if>
                            </c:forEach>
                            <span> ${p.name}</span>
                            <span class="price">${p.priceDisplay}₫</span>
                            <p class="variant-title">${p.code}</p>
                        </div>
                    </c:forEach>
                </div>
                <div class="shiping-price">
                    Phí vận chuyển <label id="shippingCost">${shipping}₫</label>
                </div>
                <div class="total-price">
                    Tạm tính <label id="totalPriceTemp"> ${carts.totalPrice}₫</label>
                </div>
                                <div class="total-checkout">
                    Tổng cộng <span id="totalPriceMain"> ${carts.totalPrice}₫</span>
                </div>
            </div>
            <button type="submit" class="btn-checkout" name="saveOrder">Đặt hàng</button>
        </div>
    </div>
    </form:form>
</div>

<div id="Loading">
    <div id="Loading_1" class="Loading"></div>
    <div id="Loading_2" class="Loading"></div>
    <div id="Loading_3" class="Loading"></div>
    <div id="Loading_4" class="Loading"></div>
    <div id="Loading_5" class="Loading"></div>
    <div id="Loading_6" class="Loading"></div>
    <div id="Loading_7" class="Loading"></div>
    <div id="Loading_8" class="Loading"></div>
</div>
<script>
    function setProvinceName() {
        $("#provinceName").val($("#billing_address_province option:selected").text());
    }
   /* function getDistricts() {
        var e = document.getElementById("billing_address_province");
        var id = e.options[e.selectedIndex].value;
        $("#provinceName").val($("#billing_address_province option:selected").text());
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/location_districts/" + id,
            dataType: 'json',
            timeout: 100000,
            async: false,
            success: function (districts) {

                $.each(districts, function(key, value) {
                    $('#shipping_district')
                        .append($("<option></option>")
                            .attr("value",value.id)
                            .text(value.name));
                });
            }
        });
    }
    function getWards() {
        var e = document.getElementById("shipping_district");
        var id = e.options[e.selectedIndex].value;
        $("#districtName").val($("#shipping_district option:selected").text());
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/location_wards/" + id,
            dataType: 'json',
            timeout: 100000,
            async: false,
            success: function (districts) {

                $.each(districts, function(key, value) {
                    $('#shipping_ward')
                        .append($("<option></option>")
                            .attr("value",value.id)
                            .text(value.name));
                });
            }
        });
    }
    function getWardName() {
        $("#wardName").val($("#shipping_ward option:selected").text());
    }*/

</script>
