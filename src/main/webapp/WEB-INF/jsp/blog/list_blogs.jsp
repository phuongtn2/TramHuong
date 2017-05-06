<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="account.title" text="default text"/></h5>

				<div class="ibox-tools">
					<a href="/admin/blogs" class="btn btn-success btn btn-xs"><i class="fa fa-plus-square-o"><spring:message code="common.button.add" text="default text"/></i></a>
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<input type="text" class="form-control input-sm m-b-xs" id="filter"
				       placeholder="Tiềm Kiếm...">

				<table class="footable emp-sales table table-stripped table-bordered table-hover dataTables-example"
				       data-page-size="8" data-filter=#filter style="font-size: 12px;">
					<thead>
					<tr>
						<th><spring:message code="blog.name" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="blog.type" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="common.status.title" text="default text"/></th>
						<th data-hide="phone,tablet" class=T"text-center"><spring:message code="common.action" text="default text"/></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${blogs}" var="b">
						<c:set var="count" value="0" scope="page" />
						<tr class="gradeC">
							<td>${b.name}</td>
							<td data-hide="phone,tablet">
								<c:if test="${b.status==1}"> <span class="label label-success"><spring:message code="common.active" text="default text"/></span></c:if>
								<c:if test="${b.status==0}"> <span class="label label-danger"><spring:message code="common.deactive" text="default text"/></span></c:if>
							</td>
							<td data-hide="phone,tablet">
								<c:if test="${b.type==1}"> <span class="label label-success"><spring:message code="blog.type.other" text="default text"/></span></c:if>
								<c:if test="${b.type==0}"> <span class="label label-danger"><spring:message code="blog.type.product" text="default text"/></span></c:if>
							</td>
							<td class="text-center">
								<div class="btn-group">
									<a class="btn-success btn btn-xs"
									   href="/admin/blog/edit/${b.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
									<%--<c:if test="${count == 0}">
									<a type="button" data-toggle="modal" data-target="#deleteButton"
									   class="btn-danger btn btn-xs"
									   onclick="setUrl('/admin/categories/delete/${c.id}')"><i class="fa fa-trash-o"><spring:message code="common.button.delete" text="default text"/></i></a>
									</c:if>--%>
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
