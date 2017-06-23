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
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content m-b-sm border-bottom">
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="post.name"	text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label" style="color: red;">${post.title}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="post.sub" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<p class="control-label">${post.subContent}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="post.content" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<p class="control-label">${post.content}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label">Tag</label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${post.tag}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label">Bài Viết Nổi Bật</label>
					</div>
					<div class="col-sm-9">
						<c:if test="${post.isHigh==1}">
							<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																 checked=""></label></div> </c:if>
						<c:if test="${post.isHigh==0}">
							<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="common.status.title" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<c:if test="${post.status==0}"> <span class="label label-danger"><spring:message
								code="common.deactive" text="default text"/></span> </c:if>
						<c:if test="${post.status==1}"> <span class="label label-success"><spring:message
								code="common.active" text="default text"/></span> </c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.img" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<img src="${post.img}" style="width: 50px; height: 50px">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="post.url" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<a href="${post.url}">${post.url}</a>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label">Nguồn Bài Viết</label>
					</div>
					<div class="col-sm-9">
						${post.source}
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.created" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label"><fmt:formatDate pattern="MM/dd/yyyy"
																	 value="${post.created}"/></label>
					</div>
				</div>

				<div class="row">
					<div class="form-group" style="margin-top: 20px;">
						<div class="text-center">
							<a class="btn-success btn btn-xs"
							   href="/admin/post/edit/${post.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





