<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="product.title" text="default text"/></h5>
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
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.code"	text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label" style="color: red;">${product.code}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.name" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${product.name}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.tag" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${product.tag}</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.new" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<c:if test="${product.isNew==1}">
							<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																 checked=""></label></div> </c:if>
						<c:if test="${product.isNew==0}">
							<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.sale" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<c:if test="${product.isSale==1}">
							<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																 checked=""></label></div> </c:if>
						<c:if test="${product.isSale==0}">
							<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.effete" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<c:if test="${product.isEffete==1}">
							<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																 checked=""></label></div> </c:if>
						<c:if test="${product.isEffete==0}">
							<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.created" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label"><fmt:formatDate pattern="MM/dd/yyyy"
																	 value="${product.created}"/></label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="category.name" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">
							<c:forEach items="${categories}" var="c">
								<c:if test="${product.categoryId==c.id}">${c.name}</c:if>
							</c:forEach>
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="category.subName" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">
							<c:forEach items="${subCategories}" var="s">
								<c:if test="${product.subCategoryId==s.id}">${s.name}</c:if>
							</c:forEach>
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.price" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${product.priceDisplay}đ</label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.salePrice" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<label class="control-label">${product.salePriceDisplay}đ</label>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="common.status.title" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<c:if test="${product.status==0}"> <span class="label label-danger"><spring:message
								code="common.deactive" text="default text"/></span> </c:if>
						<c:if test="${product.status==1}"> <span class="label label-success"><spring:message
								code="common.active" text="default text"/></span> </c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="common.description" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<p class="control-label">${product.description}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.img" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<img src="${product.img}" style="width: 40px; height: 40px;">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.img1" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<c:if test="${product.img1 != null && product.img1 != ''}"><img src="${product.img1}" style="width: 40px; height: 40px;"></c:if>
						<c:if test="${product.img1 == null || product.img1 == ''}"><img src="/resources/img/products/no_img.png" style="width: 40px; height: 40px;"></c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label"><spring:message code="product.img2" text="default text"/></label>
					</div>
					<div class="col-sm-9">
						<c:if test="${product.img2 != null && product.img2 != ''}"><img src="${product.img2}" style="width: 40px; height: 40px;"></c:if>
						<c:if test="${product.img2 == null || product.img2 == ''}"><img src="/resources/img/products/no_img.png" style="width: 40px; height: 40px;"></c:if>
					</div>
				</div>
				<div class="row">
					<div class="form-group" style="margin-top: 20px;">
						<div class="text-center">
							<a class="btn-success btn btn-xs"
							   href="/admin/product/edit/${product.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





