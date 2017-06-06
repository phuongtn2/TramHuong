<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="order.title" text="default text"/></h5>
				<div class="ibox-tools">
					<%--<a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
							code="common.button.back"
							text="default text"/></i></a>--%>
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
<form:form modelAttribute="order" method="post" action="/admin/order/save" class="form-horizontal new_order">
			<div class="ibox-content m-b-sm border-bottom">
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="order.code"	text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<input type="hidden" value="${order.id}" name="id"/>
						<label class="control-label" style="color: red;">${order.orderCode}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="customer.name" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${order.name}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="customer.tel" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${order.tel}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="customer.email" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${order.email}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="customer.address" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${order.address} - ${order.wardName} - ${order.districtName} - ${order.provinceName}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="customer.payment" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<c:forEach items="${payments}" var="p">
							<c:if test="${p.id == order.paymentType}">
								<label class="label-success">${p.name}</label>
							</c:if>
						</c:forEach>
						<%--<c:if test="${order.paymentType==0}"><label class="control-label"><spring:message code="customer.payment_1" text="default text"/></label></c:if>
						<c:if test="${order.paymentType==1}"><label class="control-label"><spring:message code="customer.payment_2" text="default text"/></label></c:if>--%>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label">Vận Chuyển</label>
					</div>
					<div class="col-sm-9">
						<c:forEach items="${shippings}" var="s">
							<c:if test="${s.id == order.shippingType}">
								<label class="label-success">${s.name}</label>
							</c:if>
						</c:forEach>
						<%--<c:if test="${order.paymentType==0}"><label class="control-label"><spring:message code="customer.payment_1" text="default text"/></label></c:if>
						<c:if test="${order.paymentType==1}"><label class="control-label"><spring:message code="customer.payment_2" text="default text"/></label></c:if>--%>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="order.price" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${order.totalPrice}đ</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="order.date" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label"><fmt:formatDate pattern="MM/dd/yyyy"
																	 value="${order.orderDate}"/></label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="common.status.title" text="default text"/></label>
					</div>
					<div class="col-sm-6">
						<select id="status" name="status" class="form-control m-b" required>
							<option
									<c:if test="${order.status==0}">selected</c:if> value="0">
								<spring:message code="order.new" text="default text"/></option>
							<option
									<c:if test="${order.status==1}">selected</c:if> value="1">
								<spring:message code="order.shipping" text="default text"/></option>
							<option
									<c:if test="${order.status==2}">selected</c:if> value="2">
								<spring:message code="order.cancel" text="default text"/></option>
							<option
									<c:if test="${order.status==3}">selected</c:if> value="3">
								<spring:message code="order.expried" text="default text"/></option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="common.description" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<p class="control-label">${order.description}</p>
					</div>
				</div>
				<div class="row">
					<div class="ibox-content">
						<table class="footable table table-stripped toggle-arrow-tiny"
							   data-page-size="10" data-filter=#filter style="font-size: 12px;">
							<thead>
							<tr>
								<th data-toggle="true"><spring:message code="product.code" text="default text"/></th>
								<th data-hide="phone,tablet"><spring:message code="product.name" text="default text"/></th>
								<th data-hide="all"><spring:message code="product.new" text="default text"/></th>
								<th data-hide="all"><spring:message code="product.sale" text="default text"/></th>
								<th data-hide="all"><spring:message code="product.effete" text="default text"/></th>
								<th data-hide="all"><spring:message code="category.name" text="default text"/></th>
								<th data-hide="all"><spring:message code="category.subName" text="default text"/></th>
								<th data-hide="all"><spring:message code="common.status.title" text="default text"/></th>
								<th data-hide="all"><spring:message code="common.description" text="default text"/></th>
								<th data-hide="phone,tablet"><spring:message code="product.created" text="default text"/></th>
								<th data-hide="phone,tablet"><spring:message code="product.img" text="default text"/></th>
								<th data-hide="phone,tablet"><spring:message code="product.price" text="default text"/></th>
								<th data-hide="phone,tablet"><spring:message code="product.salePrice" text="default text"/></th>
								<th data-hide="phone,tablet"><spring:message code="product.count" text="default text"/></th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${products}" var="p">
                                <tr class="gradeC">
                                    <td>${p.code}</td>
                                    <td data-hide="phone,tablet">${p.name}</td>
                                    <td data-hide="phone,tablet">
										<c:if test="${p.isNew==1}">
											<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																				 checked=""></label></div> </c:if>
										<c:if test="${p.isNew==0}">
											<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
                                    </td>
									<td data-hide="phone,tablet">
										<c:if test="${p.isSale==1}">
											<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																				 checked=""></label></div> </c:if>
										<c:if test="${p.isSale==0}">
											<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
									</td>
									<td data-hide="phone,tablet">
										<c:if test="${p.isEffete==1}">
											<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																				 checked=""></label></div> </c:if>
										<c:if test="${p.isEffete==0}">
											<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
									</td>
									<td data-hide="phone,tablet">
										<c:forEach items="${categories}" var="c">
											<c:if test="${p.categoryId==c.id}">${c.name}</c:if>
										</c:forEach>
									</td>
									<td data-hide="phone,tablet">
										<c:forEach items="${subCategories}" var="s">
											<c:if test="${p.subCategoryId==s.id}">${s.name}</c:if>
										</c:forEach>
									</td>
									<td data-hide="phone,tablet">
										<c:if test="${p.status==1}">
											<span class="label label-success"><spring:message
													code="common.active" text="default text"/></span> </c:if>
										<c:if test="${p.status==0}">
											<span class="label label-success"><spring:message
													code="common.deactive" text="default text"/></span> </c:if>
									</td>
                                    <td data-hide="phone,tablet">${p.description}</td>
                                    <td data-hide="phone,tablet"><fmt:formatDate pattern="MM/dd/yyyy"
                                                                                 value="${p.created}"/></td>
                                    <td data-hide="phone,tablet"><img src="${p.img}" style="width: 20px; height: 20px;"/></td>
									<td data-hide="phone,tablet">${p.priceDisplay}đ</td>
									<td data-hide="phone,tablet">${p.salePriceDisplay}đ</td>
									<td data-hide="phone,tablet">${p.count}</td>
                                </tr>
                            </c:forEach>
							</tbody>
							<tfoot>
							<tr>
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
		<div class="form-group" style="margin-top: 20px;">
			<div class="text-center">
				<button type="submit" class="btn btn-primary">
					<i class="fa fa-check"></i><spring:message code="common.button.save" text="default text"/>
				</button>
			</div>
		</div>
		</form:form>
	</div>
</div>





