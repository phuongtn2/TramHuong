<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="mail.title" text="default text"/></h5>

				<div class="ibox-tools">
					<a href="/admin/mail" class="btn btn-success btn btn-xs"><i class="fa fa-plus-square-o"><spring:message code="common.button.add" text="default text"/></i></a>
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
						<th><spring:message code="mail.code" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="mail.header" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="mail.footer" text="default text"/></th>
						<th data-hide="phone,tablet" class=T"text-center"><spring:message code="common.action" text="default text"/></th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${mails}" var="m">
							<tr class="gradeC">
								<td>${m.code}</td>
								<td data-hide="phone,tablet">
									${m.header}
								</td>
								<td data-hide="phone,tablet">
									${m.footer}
								</td>
								<td>
									<div class="btn-group">
										<a class="btn-success btn btn-xs"
										   href="/admin/mail/edit/${m.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
										<%--<a class="btn-primary btn btn-xs" href="/admin/product/view/${p.id}"><i class="fa fa-eye"><spring:message
												code="common.button.view" text="default text"/></i></a>--%>
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
