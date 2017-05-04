<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="about.title" text="default text"/></h5>

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
						<th>id</th>
						<th data-hide="phone,tablet"><spring:message code="payment.common" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="payment.account" text="default text"/></th>
						<th data-hide="phone,tablet" class="text-center"><spring:message code="common.action"
																						 text="default text"/></th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${payments}" var="p">
							<tr class="gradeC text-center">
								<td>${p.id}</td>
								<td data-hide="phone,tablet">
									${p.description}
								</td>
								<td data-hide="phone,tablet">
									${p.accountName}
								</td>
								<td data-hide="phone,tablet text-center">
									<div class="btn-group">
										<a class="btn-success btn btn-xs"
										   href="/admin/payment/edit/${p.id}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
										<a type="button" data-toggle="modal" data-target="#deleteButton"
										   class="btn-danger btn btn-xs"
										   onclick="setUrl('/admin/payment/delete/${p.id}')"><i class="fa fa-trash-o"><spring:message code="common.button.delete" text="default text"/></i></a>
										<%--<a class="btn-primary btn btn-xs" href="/admin/order/view/${o.id}"><i class="fa fa-eye"><spring:message
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
