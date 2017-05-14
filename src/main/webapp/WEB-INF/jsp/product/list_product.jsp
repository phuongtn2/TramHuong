<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="product.title" text="default text"/></h5>
				<div class="ibox-tools">
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<table class="footable table table-stripped toggle-arrow-tiny"
					   data-page-size="10" data-filter=#filter style="font-size: 12px;">
					<thead>
					<tr>
						<th data-toggle="true"><spring:message code="product.code" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="product.name" text="default text"/></th>
						<th data-hide="all"><spring:message code="product.new" text="default text"/></th>
						<th data-hide="all"><spring:message code="product.sale" text="default text"/></th>
						<th data-hide="all"><spring:message code="product.effete" text="default text"/></th>
						<th data-hide="all"><spring:message code="category.name" text="default text"/></th>
						<th data-hide="all"><spring:message code="category.subName" text="default text"/></th>
						<th data-hide="all"><spring:message code="common.status.title" text="default text"/></th>
						<th data-hide="all"><spring:message code="common.description" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="product.created" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="product.img" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="product.price" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="product.salePrice" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="product.count" text="default text"/></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${products}" var="p">
						<tr class="gradeC">
							<td>${p.code}</td>
							<td data-hide="phone,tablet">${p.name}</td>
							<td data-hide="phone,tablet">
								<c:if test="${p.isNew==1}">
									<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																		 checked=""></label></div> </c:if>
								<c:if test="${p.isNew==0}">
									<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
							</td>
							<td data-hide="phone,tablet">
								<c:if test="${p.isSale==1}">
									<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																		 checked=""></label></div> </c:if>
								<c:if test="${p.isSale==0}">
									<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
							</td>
							<td data-hide="phone,tablet">
								<c:if test="${p.isEffete==1}">
									<div class="i-checks"><label> <input type="checkbox" value="" disabled=""
																		 checked=""></label></div> </c:if>
								<c:if test="${p.isEffete==0}">
									<div class="i-checks"><label> <input type="checkbox" value="" disabled=""></label></div> </c:if>
							</td>
							<td data-hide="phone,tablet">
								<c:forEach items="${categories}" var="c">
									<c:if test="${p.categoryId==c.id}">${c.name}</c:if>
								</c:forEach>
							</td>
							<td data-hide="phone,tablet">
								<c:forEach items="${subCategories}" var="s">
									<c:if test="${p.subCategoryId==s.id}">${s.name}</c:if>
								</c:forEach>
							</td>
							<td data-hide="phone,tablet">
								<c:if test="${p.status==1}">
											<span class="label label-success"><spring:message
													code="common.active" text="default text"/></span> </c:if>
								<c:if test="${p.status==0}">
											<span class="label label-success"><spring:message
													code="common.deactive" text="default text"/></span> </c:if>
							</td>
							<td data-hide="phone,tablet">${p.description}</td>
							<td data-hide="phone,tablet"><fmt:formatDate pattern="MM/dd/yyyy"
																		 value="${p.created}"/></td>
							<td data-hide="phone,tablet"><img src="${p.img}" style="width: 20px; height: 20px;"/></td>
							<td data-hide="phone,tablet">${p.priceDisplay}đ</td>
							<td data-hide="phone,tablet">${p.salePriceDisplay}đ</td>
							<td data-hide="phone,tablet">
								<div class="btn-group">
									<a class="btn-success btn btn-xs"
									   href="/admin/product/edit/${p.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
									<%--<a type="button" data-toggle="modal" data-target="#deleteButton"
									   class="btn-danger btn btn-xs"
									   onclick="setUrl('/admin/product/delete/${p.id}')"><i class="fa fa-trash-o"><spring:message code="common.button.delete" text="default text"/></i></a>--%>
									<a class="btn-primary btn btn-xs" href="/admin/product/view/${p.id}"><i class="fa fa-eye"><spring:message
											code="common.button.view" text="default text"/></i></a>
								</div>
							</td>
						</tr>
					</c:forEach>
					</tbody>
					<tfoot>
					<tr>
						<td colspan="13">
							<ul class="pagination pull-right"></ul>
						</td>
					</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>
