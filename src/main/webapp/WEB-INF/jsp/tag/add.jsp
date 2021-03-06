<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="tag.title" text="default text"/></h5>
				<div class="ibox-tools">
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form:form modelAttribute="tag" method="post" id="userForm" class="form-horizontal new_order">
					<div class="form-group">
						<div class="col-lg-3">
						<label class="control-label"><spring:message code="tag.name" text="default text"/></label>
						</div>
						<div class="col-lg-6">
							<input type="hidden" id="id" name="id"
							   value="<c:if test="${tag.id!= null}">${tag.id}</c:if>"
							   class="form-control">
							<input type="text" id="tag" name="tag" placeholder="Tên sản phẩm bỏ dấu và space"
																		value="<c:if test="${tag.tag!= null}">${tag.tag}</c:if>"
																		class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-3">
							<label class="control-label"><spring:message code="common.status.title" text="default text"/></label>
						</div>
						<div class="col-lg-6">
							<select id="status" name="status" class="form-control m-b" required>
								<option
										<c:if test="${tag.status==1}">selected</c:if> value="1">
									<spring:message code="common.active" text="default text"/></option>
								<option
										<c:if test="${tag.status==0}">selected</c:if> value="0">
									<spring:message code="common.deactive" text="default text"/></option>
							</select>
						</div>
					</div>
					<div class="form-group" style="margin-top: 20px;">
						<div class="text-center">
							<input type="hidden" id="add" name="addTag">
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-check"></i><spring:message code="common.button.save" text="default text"/>
							</button>
							<button name="reset" class="btn btn-danger" type="reset">
								<i class="fa fa-refresh"></i><spring:message code="common.button.refresh" text="default text"/>
							</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
