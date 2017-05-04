<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="about.title" text="default text"/></h5>
				<div class="ibox-tools">
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form:form modelAttribute="about" method="post" id="userForm" class="new_order">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="common.description" text="default text"/></label>
							<input type="hidden" id="id" name="id"
							       value="<c:if test="${about.id!= null}">${about.id}</c:if>"
							       class="form-control">
							<input type="text" id="description" name="description"
							       value="<c:if test="${about.description!= null}">${about.description}</c:if>"
							       class="form-control" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="customer.address" text="default text"/></label>
							<input type="text" id="address" name="address"
								   value="<c:if test="${about.address!= null}">${about.address}</c:if>"
								   class="form-control" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="customer.tel" text="default text"/></label>
							<input type="text" id="tel" name="tel"
								   value="<c:if test="${about.tel!= null}">${about.tel}</c:if>"
								   class="form-control" required>
						</div>
					</div>
				</div>
				<div class="row">

					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="about.hotline" text="default text"/></label>
							<input type="text" id="hotLine" name="hotLine"
								   value="<c:if test="${about.hotLine!= null}">${about.hotLine}</c:if>"
								   class="form-control" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="customer.email" text="default text"/></label>
							<input type="text" id="email" name="email"
								   value="<c:if test="${about.email!= null}">${about.email}</c:if>"
								   class="form-control" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="about.face" text="default text"/></label>
							<input type="text" id="facebookLink" name="facebookLink"
								   value="<c:if test="${about.facebookLink!= null}">${about.facebookLink}</c:if>"
								   class="form-control" required>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="form-group">
						<div class="text-center">
							<input type="hidden" id="add" name="updateAbout">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addButton">
								<i class="fa fa-edit"></i><spring:message code="common.button.update" text="default text"/>
							</button>
							<%--<button name="reset" class="btn btn-danger" type="reset">
								<i class="fa fa-refresh"></i><spring:message code="common.button.refresh" text="default text"/>
							</button>--%>
						</div>
					</div>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</div>
