<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="static.name" text="default text"/></h5>
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
				<form:form modelAttribute="staticDto" method="post" class="form-horizontal new_order">
					<div class="form-group">
						<div class="col-lg-2">
							<label class="control-label"><spring:message code="static.title" text="default text"/></label>
						</div>
						<div class="col-lg-6">
							<input type="hidden" id="id" name="id"
							       value="<c:if test="${staticDto.id!= null}">${staticDto.id}</c:if>"
							       class="form-control">
							<input type="text" id="title" name="title"
							       value="<c:if test="${staticDto.title!= null}">${staticDto.title}</c:if>"
							       class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-2">
							<label class="control-label"><spring:message code="static.content"
																		 text="default text"/></label>
						</div>
						<div class="col-lg-10">
							<div class="ibox float-e-margins">
								<input type="hidden" required="required" name="content" id="content"/>
								<div class="ibox-content no-padding">
									<c:if test="${staticDto.id!= null}">
										<div class="summernote">
												${staticDto.content}
										</div>
									</c:if>
									<c:if test="${staticDto.id== null}">
										<div class="summernote">
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group" style="margin-top: 20px;">
						<div class="text-center">
							<input type="hidden" id="add" name="addStatic">
								<button type="submit" class="btn btn-primary" onclick="setValueContent();">
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
