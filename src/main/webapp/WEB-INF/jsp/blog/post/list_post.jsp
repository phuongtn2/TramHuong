<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="post.title" text="default text"/></h5>

				<div class="ibox-tools">
					<a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
							code="common.button.back"
							text="default text"/></i></a>
					<a href="/admin/post/add/${blogId}" class="btn btn-success btn btn-xs"><i class="fa fa-plus-square-o"><spring:message code="common.button.add" text="default text"/></i></a>
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<table class="footable emp-sales table table-stripped table-bordered table-hover dataTables-example"
				       data-page-size="8" data-filter=#filter style="font-size: 12px;">
					<thead>
					<tr>
						<th data-toggle="true"><spring:message code="post.name" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="blog.name" text="default text"/></th>
						<th data-hide="all"><spring:message code="post.sub" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="common.status.title" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="product.img" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="post.url" text="default text"/></th>
						<th data-hide="phone,tablet" class=T"text-center"><spring:message code="common.action" text="default text"/></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${posts}" var="p">
						<c:set var="count" value="0" scope="page" />
						<tr class="gradeC">
							<td>${p.title}</td>
							<td data-hide="phone,tablet">
								<c:forEach items="${blogs}" var="b">
									<c:if test="${p.blogId == b.id}">${b.name}</c:if>
								</c:forEach>
							</td>
							<td data-hide="phone,tablet">${p.subContent}</td>
							<td data-hide="phone,tablet">
								<c:if test="${p.status==1}"> <span class="label label-success"><spring:message code="common.active" text="default text"/></span></c:if>
								<c:if test="${p.status==0}"> <span class="label label-danger"><spring:message code="common.deactive" text="default text"/></span></c:if>
							</td>
							<td data-hide="phone,tablet">
								<img src="${p.img}" style="width: 20px; height: 20px">
							</td>
							<td data-hide="phone,tablet">
								<a href="${p.url}">${p.url}</a>
							</td>
							<td class="text-center">
								<div class="btn-group">
									<a class="btn-success btn btn-xs"
									   href="/admin/post/edit/${p.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
									<a href="/admin/post/view/${p.id}"
									   class="btn-danger btn btn-xs"><i class="fa fa-eye-slash"><spring:message code="common.button.view.post" text="default text"/></i></a>
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
