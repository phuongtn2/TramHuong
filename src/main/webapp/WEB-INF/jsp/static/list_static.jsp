<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="static.name" text="default text"/></h5>
				<a href="/admin/category" class="btn btn-primary" style="margin-left: 20px; padding: 0px">
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
						<th data-toggle="true"><spring:message code="static.title" text="default text"/></th>
						<th data-hide="phone,tablet">Trang</th>
						<th data-hide="all"><spring:message code="static.content" text="default text"/></th>
						<th data-hide="phone,tablet" class=T"text-center"><spring:message code="common.action" text="default text"/></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${statics}" var="c">
						<tr class="gradeC">
							<td>${c.title}</td>
							<td data-hide="phone,tablet">
								<c:if test="${c.type==1}"> <span class="label label-success">Trang Cách Mua Hàng</span></c:if>
								<c:if test="${c.type==2}"> <span class="label label-info">Trang Cách Thanh Toán</span></c:if>
								<c:if test="${c.type==3}"> <span class="label label-warning-light">Trang Phương Thức Vận Chuyển</span></c:if>
							</td>
							<td data-hide="phone,tablet">
								${c.content}
							</td>
							<td class="text-center">
								<div class="btn-group">
									<a class="btn-success btn btn-xs"
									   href="/admin/static/edit/${c.type}"><i class="fa fa-edit"><spring:message code="common.button.update" text="default text"/></i></a>
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
