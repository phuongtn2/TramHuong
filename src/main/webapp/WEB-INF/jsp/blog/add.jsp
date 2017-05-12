<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="blog.title" text="default text"/></h5>
				<div class="ibox-tools">
					<%--<a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
							code="common.button.back"
							text="default text"/></i></a>--%>
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form:form modelAttribute="blog" method="post" id="userForm" class="new_order">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="blog.name" text="default text"/></label>
							<input type="hidden" id="id" name="id"
							       value="<c:if test="${blog.id!= null}">${blog.id}</c:if>"
							       class="form-control">
							<input type="text" id="name" name="name"
							       value="<c:if test="${blog.name != null}">${blog.name}</c:if>"
							       class="form-control" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<div class="form-group">
								<label class="control-label"><spring:message code="common.status.title" text="default text"/></label>
								<select id="status" name="status" class="form-control m-b" required>
									<option
											<c:if test="${blog.status==1}">selected</c:if> value="1">
										<spring:message code="common.active" text="default text"/></option>
									<option
											<c:if test="${blog.status==0}">selected</c:if> value="0">
										<spring:message code="common.deactive" text="default text"/></option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="blog.type" text="default text"/></label>
							<select id="type" name="type" class="form-control m-b" required>
								<option
										<c:if test="${blog.type == 0}">selected</c:if> value="1">
									<spring:message code="blog.type.product" text="default text"/></option>
								<option
										<c:if test="${blog.type == 1}">selected</c:if> value="0">
									<spring:message code="blog.type.other" text="default text"/></option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="text-center">
							<input type="hidden" id="add" name="addBlog">
							<c:if test="${blog.id != null}">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-edit"></i><spring:message code="common.button.update" text="default text"/>
								</button>
							</c:if>
							<c:if test="${blog.id == null}">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-check"></i><spring:message code="common.button.add" text="default text"/>
								</button>
								<button name="reset" class="btn btn-danger" type="reset">
									<i class="fa fa-refresh"></i><spring:message code="common.button.refresh" text="default text"/>
								</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</div>
