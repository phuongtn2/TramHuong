<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="payment.title" text="default text"/></h5>
				<div class="ibox-tools">
					<a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
							code="common.button.back"
							text="default text"/></i></a>
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form:form modelAttribute="payment" method="post" id="userForm" class="new_order">
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
							<label class="control-label"><spring:message code="payment.common" text="default text"/></label>
							<input type="hidden" id="id" name="id"
							       value="<c:if test="${payment.id!= null}">${payment.id}</c:if>"
							       class="form-control">
							<input type="text" id="description" name="description"
							       value="<c:if test="${payment.description!= null}">${payment.description}</c:if>"
							       class="form-control" required>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="payment.account" text="default text"/></label>
							<input type="text" id="accountName" name="accountName"
								   value="<c:if test="${payment.accountName!= null}">${payment.accountName}</c:if>"
								   class="form-control" required>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="text-center">
							<input type="hidden" id="add" name="addPayment">
							<c:if test="${payment.id != null}">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addButton">
									<i class="fa fa-edit"></i><spring:message code="common.button.update" text="default text"/>
								</button>
							</c:if>
							<c:if test="${payment.id == null}">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addButton">
									<i class="fa fa-check"></i><spring:message code="common.button.add" text="default text"/>
								</button>
							</c:if>
							<button name="reset" class="btn btn-danger" type="reset">
								<i class="fa fa-refresh"></i><spring:message code="common.button.refresh" text="default text"/>
							</button>
						</div>
					</div>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</div>
