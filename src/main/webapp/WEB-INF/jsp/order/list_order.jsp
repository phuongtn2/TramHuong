<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="order.title" text="default text"/></h5>
				<div class="ibox-tools">
					<%--<a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-plus-square-o"><spring:message code="common.button.add"
																							 text="default text"/></i></a>--%>
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<table class="footable table table-stripped toggle-arrow-tiny" data-page-size="10" data-filter=#filter
					   style="font-size: 12px;">
					<thead>
					<tr>
						<th data-toggle="true"><spring:message code="order.code" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="customer.name" text="default text"/></th>
						<th data-hide="all"><spring:message code="customer.tel" text="default text"/></th>
						<th data-hide="all"><spring:message code="customer.email" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="customer.payment" text="default text"/></th>
						<th data-hide="all"><spring:message code="customer.address" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="common.status.title" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="order.price" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="order.date" text="default text"/></th>
						<th data-hide="all"><spring:message code="common.description" text="default text"/></th>
						<th data-hide="phone,tablet" class="text-center"><spring:message code="common.action"
						                                                                 text="default text"/></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${orders}" var="o">
						<tr class="gradeC">
							<td style="color: red;">${o.orderCode}</td>
							<td data-hide="phone,tablet">${o.name}</td>
							<td data-hide="phone,tablet">${o.tel}</td>
							<td data-hide="phone,tablet">${o.email}</td>
							<td data-hide="phone,tablet">
								<c:if test="${o.paymentType==0}"> <span class="label label-success"><spring:message
										code="customer.payment_1" text="default text"/></span> </c:if>
								<c:if test="${user.userStatus==1}"> <span class="label label-danger"><spring:message
										code="customer.payment_2" text="default text"/></span> </c:if>
							</td>
							<td data-hide="phone,tablet">${o.address} - ${o.wardName} - ${o.districtName} - ${o.provinceName}</td>
							<td data-hide="phone,tablet">
								<c:if test="${o.status==0}"> <span class="label label-primary"><spring:message
										code="order.new" text="default text"/></span> </c:if>
								<c:if test="${o.status==1}"> <span class="label label-success"><spring:message
										code="order.shipping" text="default text"/></span> </c:if>
								<c:if test="${o.status==2}"> <span class="label label-danger"><spring:message
										code="order.cancel" text="default text"/></span> </c:if>
								<c:if test="${o.status==3}"> <span class="label label-warning"><spring:message
										code="order.expried" text="default text"/></span> </c:if>
							</td>
							<td data-hide="phone,tablet">${o.totalPrice}đ</td>
							<td data-hide="phone,tablet"><fmt:formatDate pattern="MM/dd/yyyy"
							                                             value="${o.orderDate}"/></td>
							<td data-hide="phone,tablet">${o.description}</td>
							<td class="text-center">
								<div class="btn-group">
									<%--<a class="btn-success btn btn-xs"
									   href="/admin/order/edit/${o.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>--%>
									<%--<a type="button" data-toggle="modal" data-target="#deleteButton"
								   		class="btn-danger btn btn-xs"
								   		onclick="setUrl('/admin/order/delete/${o.id}')"><i class="fa fa-trash-o"><spring:message code="common.button.delete" text="default text"/></i></a>--%>
									<a class="btn-primary btn btn-xs" href="/admin/order/view/${o.id}"><i class="fa fa-eye"><spring:message
											code="common.button.view" text="default text"/></i></a>
								</div>
							</td>
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
</div>
