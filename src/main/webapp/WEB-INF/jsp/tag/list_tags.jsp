<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="tag.title" text="default text"/></h5>
				<a href="/admin/tag" class="btn btn-primary" style="margin-left: 20px; padding: 0px">
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
						<th>Id</th>
						<th data-hide="phone,tablet"><spring:message code="tag.name" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="common.status.title" text="default text"/></th>
						<th data-hide="phone,tablet" class=T"text-center"><spring:message code="common.action" text="default text"/></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${tags}" var="a">
						<c:set var="count" value="0" scope="page" />
						<tr class="gradeC">
							<td>${a.id}</td>
							<td data-hide="phone,tablet">
								${a.tag}
							</td>
							<td data-hide="phone,tablet">
								<c:if test="${a.status==1}"> <span class="label label-success"><spring:message code="common.active" text="default text"/></span></c:if>
								<c:if test="${a.status==0}"> <span class="label label-danger"><spring:message code="common.deactive" text="default text"/></span></c:if>
							</td>
							<td class="text-center">
								<div class="btn-group">
									<a class="btn-success btn btn-xs"
									   href="/admin/tag/edit/${a.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
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
