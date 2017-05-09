<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="post.title" text="default text"/></h5>
				<div class="ibox-tools">
					<a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
							code="common.button.back"
							text="default text"/></i></a>
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content m-b-sm border-bottom">
				<form:form modelAttribute="post" method="post" action="/admin/posts">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label"><spring:message code="blog.name"
																			 text="default text"/></label>
								<select class="form-control m-b" id="blogId" name="blogId">
									<option value="0" selected>&nbsp;</option>
									<c:forEach items="${blogs}" var="b">
										<option
												<c:if test="${post.blogId == b.id}">selected</c:if>
												value="${b.id}">${b.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label"><spring:message code="common.status.title"
																			 text="default text"/></label>
								<select class="form-control m-b" name="status">
									<option <c:if test="${post.status == -1}">selected</c:if> value="-1">&nbsp;</option>
									<option <c:if test="${post.status == 1}">selected</c:if> value="1"><spring:message code="common.active" text="default text"/></option>
									<option <c:if test="${post.status == 0}">selected</c:if> value="0"><spring:message code="common.deactive" text="default text"/></option>
								</select>
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





