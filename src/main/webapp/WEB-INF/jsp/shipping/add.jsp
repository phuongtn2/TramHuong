<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5><spring:message code="shipping.title" text="default text"/></h5>
				<div class="ibox-tools">
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form:form modelAttribute="shipping" method="post" class="form-horizontal new_order">
					<div class="form-group">
						<div class="col-lg-3">
							<label class="control-label">Tên</label>
						</div>
						<div class="col-lg-6">
							<input type="hidden" id="id" name="id"
								   value="<c:if test="${shipping.id!= null}">${shipping.id}</c:if>"
								   class="form-control">
							<input type="text" id="name" name="name"
								   value="<c:if test="${shipping.name!= null}">${shipping.name}</c:if>"
								   class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-3">
							<label class="control-label"><spring:message code="common.status.title"
																		 text="default text"/></label>
						</div>
						<div class="col-lg-6">
							<select id="status" name="status" class="form-control m-b" required>
								<option
										<c:if test="${shipping.status==1}">selected</c:if> value="1">
									<spring:message code="common.active" text="default text"/></option>
								<option
										<c:if test="${shipping.status==0}">selected</c:if> value="0">
									<spring:message code="common.deactive" text="default text"/></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-2">
							<label class="control-label"><spring:message code="static.content"
																		 text="default text"/></label>
						</div>
						<div class="col-lg-10">
							<div class="ibox float-e-margins">
								<input type="hidden" required="required" name="info" id="content"/>
								<div class="ibox-content no-padding">
									<c:if test="${shipping.id!= null}">
										<div class="summernote">
												${shipping.info}
										</div>
									</c:if>
									<c:if test="${shipping.id== null}">
										<div class="summernote">
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-3">
							<label class="control-label">Phí Vận Chuyển</label>
						</div>
						<div class="col-lg-6">
							<input type="text" id="shippingCost" name="shippingCost"
								   value="<c:if test="${shipping.shippingCost!= null}">${shipping.shippingCost}</c:if>"
								   class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-3">
							<label class="control-label"><spring:message code="post.position"
																		 text="default text"/></label>
						</div>
						<div class="col-lg-6">
							<select id="position" name="position" class="form-control m-b">
								<option <c:if test="${shipping.position==1}">selected</c:if> value="1">1</option>
								<option <c:if test="${shipping.position==2}">selected</c:if> value="2">2</option>
								<option <c:if test="${shipping.position==3}">selected</c:if> value="3">3</option>
								<option <c:if test="${shipping.position==4}">selected</c:if> value="4">4</option>
								<option <c:if test="${shipping.position==5}">selected</c:if> value="5">5</option>
								<option <c:if test="${shipping.position==6}">selected</c:if> value="6">6</option>
								<option <c:if test="${shipping.position==7}">selected</c:if> value="7">7</option>
								<option <c:if test="${shipping.position==8}">selected</c:if> value="8">8</option>
								<option <c:if test="${shipping.position==9}">selected</c:if> value="9">9</option>
							</select>
						</div>
					</div>
					<div class="form-group" style="margin-top: 20px;">
						<div class="text-center">
							<input type="hidden" id="add" name="addShipping">
							<button type="submit" class="btn btn-primary" onclick="setValueContent();">
								<i class="fa fa-check"></i><spring:message code="common.button.save" text="default text"/>
							</button>
							<button name="reset" class="btn btn-danger" type="reset">
								<i class="fa fa-refresh"></i><spring:message code="common.button.refresh" text="default text"/>
							</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
