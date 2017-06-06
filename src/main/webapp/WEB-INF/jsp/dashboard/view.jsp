<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<div class="row">
    <div class="col-lg-4">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-success pull-right">Tổng Đơn Hàng Mới Trong Ngày</span>
                <h5>Đơn Hàng</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">${orderThisDay}</h1>
                <div class="stat-percent font-bold text-success"><i class="fa fa-bolt"></i></div>
                <small>Total</small>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-success pull-right">Tổng Đơn Hàng Bị Hủy</span>
                <h5>Đơn Hàng</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">${orderCancel}</h1>
                <div class="stat-percent font-bold text-success"><i class="fa fa-bolt"></i></div>
                <small>Total</small>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-success pull-right">Tổng Doanh Thu</span>
                <h5>Doanh Thu</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">${paymentAll} đ</h1>
                <div class="stat-percent font-bold text-success"><i class="fa fa-bolt"></i></div>
                <small>Total</small>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-8">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-success pull-right">&nbsp;</span>
                <h5>Đơn Hàng Mới</h5>
            </div>
            <div class="ibox-content">
        <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="10" data-filter=#filter
               style="font-size: 12px;">
            <thead>
            <tr>
                <th data-toggle="true"><spring:message code="order.code" text="default text"/></th>
                <th><spring:message code="order.price" text="default text"/></th>
                <th><spring:message code="common.status.title" text="default text"/></th>
                <th data-hide="phone,tablet"><spring:message code="customer.name" text="default text"/></th>
                <th data-hide="all"><spring:message code="customer.tel" text="default text"/></th>
                <th data-hide="all"><spring:message code="customer.email" text="default text"/></th>
                <th data-hide="phone,tablet"><spring:message code="customer.payment" text="default text"/></th>
                <th data-hide="phone,tablet">Vận Chuyển</th>
                <th data-hide="all"><spring:message code="customer.address" text="default text"/></th>
                <th data-hide="phone,tablet"><spring:message code="order.date" text="default text"/></th>
                <th data-hide="all"><spring:message code="common.description" text="default text"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="o">
                <tr class="gradeC">
                    <td style="color: red;">${o.orderCode}</td>
                    <td>${o.totalPrice}đ</td>
                    <td>
                        <c:if test="${o.status==0}"> <span class="label label-primary"><spring:message
                                code="order.new" text="default text"/></span> </c:if>
                        <c:if test="${o.status==1}"> <span class="label label-success"><spring:message
                                code="order.shipping" text="default text"/></span> </c:if>
                        <c:if test="${o.status==2}"> <span class="label label-danger"><spring:message
                                code="order.cancel" text="default text"/></span> </c:if>
                        <c:if test="${o.status==3}"> <span class="label label-warning"><spring:message
                                code="order.expried" text="default text"/></span> </c:if>
                    </td>
                    <td data-hide="phone,tablet">${o.name}</td>
                    <td data-hide="phone,tablet">${o.tel}</td>
                    <td data-hide="phone,tablet">${o.email}</td>
                    <td data-hide="phone,tablet">
                        <c:forEach items="${payments}" var="pp">
                            <c:if test="${o.paymentType==pp.id}">
                                <span class="label label-success">${pp.name}</span>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td data-hide="phone,tablet">
                        <c:forEach items="${shippings}" var="ss">
                            <c:if test="${o.shippingType==ss.id}">
                                <label class="label-success">${ss.name}</label>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td data-hide="phone,tablet">${o.address} - ${o.wardName} - ${o.districtName} - ${o.provinceName}</td>
                    <td data-hide="phone,tablet">${o.dateDisplay}</td>
                    <td data-hide="phone,tablet">${o.description}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="13" class="footable-visible">Tổng: ${orders.size()} đơn hàng</td>
                <td colspan="13">
                    <ul class="pagination pull-right"></ul>
                </td>
            </tr>
            </tfoot>
        </table>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="ibox float-e-margins">
            <h4>
                Thống Kê Đơn Hàng Theo Danh Mục
            </h4>
            <div class="row text-center">
                <ul class="stat-list">
                    <c:forEach items="${chart}" var="c">
                    <li>
                        <h2 class="no-margins">${c.value}</h2>
                        <small>${c.label}</small>
                        <div class="stat-percent">${c.percent} % <i class="fa fa-level-up text-navy"></i></div>
                        <div class="progress progress-mini">
                            <div style="width: ${c.percent}%;" class="progress-bar"></div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>
</div>
