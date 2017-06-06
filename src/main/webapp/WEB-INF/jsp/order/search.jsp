<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
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
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content m-b-sm border-bottom">
				<form:form modelAttribute="searchOrder" action="/admin/orders" method="post">
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="code"><spring:message code="order.code"	text="default text"/></label>
								<input type="text" id="code" name="orderCode" class="form-control"
									   value="<c:if test="${searchOrder.orderCode != null}">${searchOrder.orderCode}</c:if>"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="name"><spring:message code="customer.name"	text="default text"/></label>
								<input type="text" id="name" name="name" class="form-control"
									   value="<c:if test="${searchOrder != null && searchOrder.name != null}">${searchOrder.name}</c:if>"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="tel"><spring:message code="customer.tel"	text="default text"/></label>
								<input type="text" id="tel" name="tel" class="form-control"
									   value="<c:if test="${searchOrder.tel != null}">${searchOrder.tel}</c:if>"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label class="control-label" for="email"><spring:message code="customer.email"	text="default text"/></label>
								<input type="text" id="email" name="email" class="form-control"
									   value="<c:if test="${searchOrder.email != null}">${searchOrder.email}</c:if>"/>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-sm-3">
							<label for="paymentType"><spring:message code="customer.payment"
																		 text="default text"/></label>
							<select id="paymentType" class="form-control m-b" name="paymentType">
								<option <c:if test="${searchOrder == null}">selected</c:if> value="-1"><spring:message code="common.all" text="default text"/></option>
								<c:forEach items="${payments}" var="pp">
									<option <c:if test="${searchOrder.paymentType == pp.id}">selected</c:if> value="${pp.id}">${pp.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-3">
							<label for="shippingType">Vận Chuyển</label>
							<select id="shippingType" class="form-control m-b" name="shippingType">
								<option <c:if test="${searchOrder == null}">selected</c:if> value="-1"><spring:message code="common.all" text="default text"/></option>
								<c:forEach items="${shippings}" var="ss">
									<option <c:if test="${searchOrder.shippingType == ss.id}">selected</c:if> value="${ss.id}">${ss.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-3">
							<div>
								<label class="control-label" for="status"><spring:message code="common.status.title"
																			 text="default text"/></label>
								<select id="status" class="form-control m-b" name="status">
									<option <c:if test="${searchOrder == null}">selected</c:if> selected="selected" value="-1"><spring:message code="common.all" text="default text"/></option>
									<option <c:if test="${searchOrder != null && searchOrder.status == 0}">selected</c:if> value="0"> <spring:message
											code="order.new" text="default text"/> </option>
									<option <c:if test="${searchOrder != null && searchOrder.status == 1}">selected</c:if> value="1"><spring:message
											code="order.shipping" text="default text"/> </option>
									<option <c:if test="${searchOrder != null && searchOrder.status == 2}">selected</c:if> value="2"><spring:message
											code="order.cancel" text="default text"/> </option>
									<option <c:if test="${searchOrder != null && searchOrder.status == 3}">selected</c:if> value="3"><spring:message
											code="order.expried" text="default text"/></option>
								</select>
							</div>
						</div>
						<div class="col-sm-3">
							<div>
								<label class="control-label" for="orderDate"><spring:message code="product.created"
																			 text="default text"/></label>
								<div class="input-group date">
									<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
									<input id="orderDate" name="orderDate" type="text" class="form-control"
										   value="<c:if test="${searchOrder.orderDate!= null}"><fmt:formatDate pattern="MM/dd/yyyy" value="${searchOrder.orderDate}" /></c:if>"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<div class="text-center">
								<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i><spring:message
										code="common.button.search" text="default text"/></button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>





