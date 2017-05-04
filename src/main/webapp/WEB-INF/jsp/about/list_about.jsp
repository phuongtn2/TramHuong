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
						<th data-toggle="true">Id</th>
						<th data-hide="all"><spring:message code="common.description" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="customer.address" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="customer.tel" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="about.hotline" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="customer.email" text="default text"/></th>
						<th data-hide="phone,tablet"><spring:message code="about.face" text="default text"/></th>
					</tr>
					</thead>
					<tbody>
						<tr class="gradeC">
							<td>${about.id}</td>
							<td data-hide="phone,tablet">
								${about.description}
							</td>
							<td data-hide="phone,tablet">
								${about.address}
							</td>
							<td data-hide="phone,tablet">
								${about.tel}
							</td>
							<td data-hide="phone,tablet">
								${about.hotLine}
							</td>
							<td data-hide="phone,tablet">
								${about.email}
							</td>
							<td data-hide="phone,tablet">
								${about.facebookLink}
							</td>
						</tr>
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
