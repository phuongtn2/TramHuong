<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="category.title" text="default text"/></h5>
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
				<form:form modelAttribute="category" method="post" id="userForm">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label"><spring:message code="category.name" text="default text"/></label>
							<input type="hidden" name="id"
							       value="<c:if test="${category.id!= null}">${category.id}</c:if>"
							       class="form-control">
							<input type="text" id="name" name="name"
							       value="<c:if test="${category.name!= null}">${category.name}</c:if>"
							       class="form-control" required>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-group">
							<label class="control-label"><spring:message code="common.status.title" text="default text"/></label>
							<select id="status" name="status" class="form-control m-b">
								<option
										<c:if test="${category.status==1}">selected</c:if> value="1">
									<spring:message code="common.active" text="default text"/></option>
								<option
										<c:if test="${category.status==0}">selected</c:if> value="0">
									<spring:message code="common.deactive" text="default text"/></option>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label">Danh Mục Cha</label>
							<select id="id" name="id" class="form-control m-b">
								<c:forEach items="${categories}" var="c">
									<option
											<c:if test="${c.id==category.parent}">selected</c:if>
											value="${c.id}">${c.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="text-center">
							<input type="hidden" id="add" name="add">
							<c:if test="${category.id != null}">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addButton">
									<i class="fa fa-edit"></i><spring:message code="common.button.update" text="default text"/>
								</button>
							</c:if>
							<c:if test="${category.id == null}">
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
