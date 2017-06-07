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
        <a href="/">
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
    margin: 7px;">Quay Về Trang Chủ</span> Nhang Hoạt Tính</h1></a>
    </div>
    <div class="col-md-12">
        <table class="table table-striped table-bordered table-hover dataTables-example" >
            <thead style="display: none">
            <tr>
                <th>&nbsp;</th>
                <th>&nbsp;</th>
                <%--<th>Platform(s)</th>
                <th>Engine version</th>
                <th>CSS grade</th>--%>
            </tr>
            </thead>
            <tbody>
                <tr class="gradeX">
                    <td class="center">Thông Tin Giao Hàng</td>
                    <td class="center">Họ Và Tên: ${orderInfo.name}</td>
                </tr>
                <tr class="gradeX">
                    <td>&nbsp;</td>
                    <td class="center">Số Điện Thoại: ${orderInfo.tel}</td>
                </tr>
                <tr class="gradeX">
                    <td>&nbsp;</td>
                    <td class="center">Email: ${orderInfo.email}</td>
                </tr>
                <tr class="gradeX">
                    <td>&nbsp;</td>
                    <td class="center">Địa Chỉ: ${orderInfo.address}</td>
                </tr>
                <tr class="gradeX">
                    <td>&nbsp;</td>
                    <td class="center">Tỉnh/Thành Phố: ${orderInfo.provinceName}</td>
                </tr>
                <tr class="gradeX">
                    <td>&nbsp;</td>
                    <td class="center">Quận/Huyện: ${orderInfo.districtName}</td>
                </tr>
                <tr class="gradeX">
                    <td>&nbsp;</td>
                    <td class="center">Phường/Xã: ${orderInfo.wardName}</td>
                </tr>
                <tr class="gradeX">
                    <td>&nbsp;</td>
                    <td class="center">Ghi Chú: ${orderInfo.description}</td>
                </tr>
                <tr class="gradeX">
                    <td>&nbsp;</td>
                    <td class="center">Ngày Tạo: ${orderInfo.dateDisplay}</td>
                </tr>
                <tr class="gradeX">
                    <td class="center">Phương Thức Vận Chuyển</td>
                    <td class="center">${shipping.name}</td>
                </tr>
                <tr class="gradeX">
                    <td class="center">Phương Thức Thanh Toán</td>
                    <td class="center">${payment.name}</td>
                </tr>
                <tr class="gradeX">
                    <td class="center">Mã Đơn Hàng</td>
                    <td class="center" style="color: red">${orderInfo.orderCode}</td>
                </tr>
                <c:set var="count" value="0" scope="page" />
                    <c:forEach items="${productSessions}" var="p">
                        <c:set var="count" value="${count + 1}" scope="page"/>
                        <c:forEach items="${cartListDto.cartDtoList}" var="c">
                            <c:if test="${c.productId == p.id}">
                                <c:if test="${count == 1}">
                                    <tr class="gradeX">
                                        <td class="center">Thông Tin Sản Phẩm</td>
                                        <td class="center">${c.count} x ${p.name} = ${p.priceDisplay}đ </td>
                                    </tr>
                                </c:if>
                                <c:if test="${count > 1}">
                                <tr class="gradeX">
                                    <td class="center">&nbsp;</td>
                                    <td class="center">${c.count} x ${p.name} = ${p.priceDisplay}đ </td>
                                </tr>
                                </c:if>
                            </c:if>
                    </c:forEach>
                </c:forEach>
                <tr class="gradeX">
                    <td class="center">Phí Vận Chuyển</td>
                    <td class="center" style="color: red">${shipping.costDisplay}đ</td>
                </tr>
                <tr class="gradeX">
                    <td class="center">Tổng Cộng</td>
                    <td class="center" style="color: red">${cartListDto.totalPrice}đ</td>
                </tr>
            </tfoot>
        </table>
    </div>
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
