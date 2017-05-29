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
<a href="/"><h1>
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
    margin: 7px;">Quay về Trang Chủ</span> Trầm Hương Tuấn Anh</h1></a>
<div class="container clearfix">
    <form:form accept-charset="UTF-8" id="purchase-form" action="/saveOrder" modelAttribute="orderInfo" class="new_order">
        <div class="col-4 step1">
            <h2>Thông tin giao hàng</h2>
            <div class="line"></div>
            <div class="form-info">
                <div class="form-group">
                </div>
                <div class="form-group">
                    <input placeholder="Họ và tên" class="formcontrol" id="billing_address_full_name"
                           name="name" size="30" type="text" required/>
                    <label>Họ và tên: </label>
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
                    <%--<input name="billing_address[zip]" type="hidden" value="70000"/>
                    <input name="billing_address[country_id]" type="hidden" value="241"/>
                    <input name="billing_address[address2]" type="hidden" value=""/>
                    <input name="is_show_shipping_address" type="hidden" value="true"/>
                    <input type="checkbox" style="display:none" name="billing_address[billing_is_shipping]" value="true"
                           checked="checked" id="shipping-toggle" tabindex="12"/>--%>
                <div class="form-group ctrl-city">
                    <div class='custom-dropdown'>
                        <select id="billing_address_province" name="provinceId" class="formcontrol"
                                required onChange="getDistricts();">
                            <option value="null" disabled selected hidden>Vui lòng chọn tỉnh/thành phố.</option>
                            <c:forEach items="${provinces}" var="p">
                                <option value="${p.id}">${p.name}</option>
                            </c:forEach>
                        </select>
                        <input type="hidden" name="provinceName" id="provinceName"/>
                    </div>
                </div>
                <div class="form-group ctrl-district" id="shipping_district_container">
                    <div class='custom-dropdown'>
                        <select id="shipping_district" name="districtId" class="formcontrol" required onChange="getWards();">
                            <option value="null" disabled selected hidden>Vui lòng chọn quận/huyện.</option>
                        </select>
                        <input type="hidden" name="districtName" id="districtName"/>
                    </div>
                </div>
                <div class="form-group ctrl-district" id="shipping_ward_container">
                    <div class='custom-dropdown'>
                        <select id="shipping_ward" name="wardId" class="formcontrol" required onchange="getWardName();">
                            <option value="null" disabled selected hidden>Vui lòng chọn xã/phường.</option>
                        </select>
                        <input type="hidden" name="wardName" id="wardName"/>
                    </div>
                </div>
                <div class="form-group">
                    <textarea id="billing_note" placeholder="Ghi chú đơn hàng" name="description" rows="3"
                              class="formcontrol ordernote">${carts.description}</textarea>
                    <p>Ghi chú đơn hàng</p>
                </div>
                <div class="error summary">
                    (<span class="color-red ">*</span>)Vui lòng nhập đủ thông tin
                </div>
            </div>
            <div class="listerror">

            </div>
        </div>

        <%--<input type="hidden" id="ab_number_fn" name="ab_number_fn" value="1008995108"/>--%>
        <%--<input type="hidden" id="token" name="token" value=""/>--%>
        <%--<input type="hidden" id="morecoupon" name="morecoupon" value="false"/>
        <input type="hidden" id="order_id" value="1008995108"/>--%>

        <div class="col-4">
            <!-- Vận chuyển & Thanh Toán -->
                <%--<div class="ctrl-shipping">
                    <h3 class="h-shipping ">Vận chuyển</h3>
                    <div class="form-group ">
                        <div class='custom-dropdown'><select class="drop_shipping" name="shipping_rate"></select></div>
                    </div>
                </div>--%>
            <h3>Thanh toán</h3>
            <div class="shiping-ajax">
                <label class="lb-method">
                    <input class="input-method" type="radio" checked="checked" name="paymentType" value="0"/>
                    <span class="label-radio"> Thanh toán khi giao hàng (COD)</span>
                </label>
                <span class="desc">Cám ơn bạn đã tin tưởng vào sản phẩm của chúng tôi. Đơn đặt hàng này đã được gửi về mail để bạn tham khảo.
                    Chúng tôi sẽ giao hàng trong thời gian sớm nhất. Bạn vui lòng thanh toán cho nhân viên giao hàng trực tiếp. </span>
                <label class="lb-method">
                    <input class="input-method" type="radio" name="paymentType" value="1"/>
                    <span class="label-radio"> Chuyển khoản qua ngân hàng</span>
                </label>
                <span class="desc">Cảm ơn quí khách đã tin tưởng sản phẩm của chúng tôi.
                        Quí khách chuyển khoản số tiền vào TK của chúng tôi.
                        Khi chuyển khoản, vui lòng điền vào dòng ghi chú : số đơn hàng.
                        <c:forEach items="${billings}" var="b">
                            ${b.description}
                            ${b.accountName}
                        </c:forEach>
                </span>
            </div>
        </div>
        <%--<div class="box-btn-checkout-first">
            <button type="submit" class="btn-checkout btn-checkout-first">Đặt hàng</button>
        </div>--%>
        <div class="col-4">
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
                    Phí vận chuyển <label>${shipping}₫</label>
                </div>
                <div class="total-price">
                    Tạm tính <label> ${carts.totalPrice}₫</label>
                </div>
                    <%--<a class="btn-coupon btn-arrow" href="javascript:void(0);"><span></span>Sử dụng mã giảm giá </a>
                    <div class="coupon"><a class="remove-coupon">Xóa</a> <span></span> <label></label></div>
                    <div class="use-coupon">
                        <div class="form-group">
                            <input type="hidden" id="discount-apply" name="discount-apply"/>
                            <input name="discount.code" class="couponcode" placeholder="Nhập mã giảm giá"/>
                            <a class="btn-submit-coupon">Sử dụng</a>
                            <a class="continue-coupon ">Tiếp tục sử dụng</a>
                            <a class="cancel-coupon">Hủy</a>
                        </div>
                    </div>--%>
                <div class="total-checkout">
                    Tổng cộng <span> ${carts.totalPrice}₫</span>
                </div>
            </div>
            <button type="submit" class="btn-checkout" name="saveOrder">Đặt hàng</button>
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
