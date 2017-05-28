<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="category.title" text="default text"/></h5>
				<a href="/admin/s_category" class="btn btn-primary" style="margin-left: 20px; padding: 0px">
					<i class="fa fa-plus"></i><spring:message code="common.button.add" text="default text"/>
				</a>
				<div class="ibox-tools">
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
						<th><spring:message code="category.name" text="default text"/></th>
						<th data-hide="phone,tablet">Danh Mục Cha</th>
						<th data-hide="phone,tablet"><spring:message code="common.status.title" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="post.position" text="default text"/></th>
						<th data-hide="phone,tablet" class=T"text-center">Thao Tác</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${s_categories}" var="s">
						<tr class="gradeC">
							<td>${s.name}</td>
							<td data-hide="phone,tablet">
								<c:forEach items="${categories}" var="c">
									<c:if test="${s.parent==c.id}">${c.name}</c:if>
								</c:forEach>
							</td>
							<td data-hide="phone,tablet">
								<c:if test="${s.status==1}"> <span class="label label-success">
									<spring:message code="common.active" text="default text"/></span></c:if>
								<c:if test="${s.status==0}"><span class="label label-danger">
									<spring:message code="common.deactive" text="default text"/>
									</span></c:if>
							</td>
							<td data-hide="phone,tablet">
								${s.position}
							</td>
							<td class="text-center">
								<div class="btn-group">
									<a class="btn-success btn btn-xs"
									   href="/admin/s_categories/edit/${s.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
									<%--<a type="button" data-toggle="modal" data-target="#deleteButton"
									   class="btn-danger btn btn-xs"
									   onclick="setUrl('/admin/s_categories/delete/${s.id}')"><i class="fa fa-trash-o"><spring:message code="common.button.delete" text="default text"/></i></a>--%>
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
