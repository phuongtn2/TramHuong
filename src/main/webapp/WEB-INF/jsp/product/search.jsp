<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
			<div class="ibox-content m-b-sm border-bottom">
				<form:form modelAttribute="searchProduct" method="post" action="/admin/products">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="name"><spring:message code="product.name"	text="default text"/></label>
								<input type="text" id="name" name="name" class="form-control"
									   value="<c:if test="${searchProduct.name != null}">${searchProduct.name}</c:if>"/>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="code"><spring:message code="product.code"	text="default text"/></label>
								<input type="text" id="code" name="code" class="form-control"
									   value="<c:if test="${searchProduct.code != null}">${searchProduct.code}</c:if>"/>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="created"><spring:message code="product.created"
																			 text="default text"/></label>
								<div class="input-group date">
									<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
									<input id="created" name="created" class="form-control"
										   value="<c:if test="${ searchProduct.created!= null}"><fmt:formatDate pattern="MM/dd/yyyy" value="${searchProduct.created}" /></c:if>"/>
								</div>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-sm-4">
							<label> <input type="checkbox" class="i-checks" name="isNew"
							> <spring:message code="product.new" text="default text"/> </label>
						</div>
						<div class="col-sm-4">
							<label> <input type="checkbox" class="i-checks" name="isSale"> <spring:message code="product.sale" text="default text"/> </label>
						</div>
						<div class="col-sm-4">
							<label> <input type="checkbox" class="i-checks" name="isEffete"> <spring:message code="product.effete" text="default text"/> </label>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label"><spring:message code="category.name"
								                                             text="default text"/></label>
								<select class="form-control m-b" id="categoryId" name="categoryId" onclick="selectSubCategory();">
									<option value="0" selected>&nbsp;</option>
									<c:forEach items="${categories}" var="c">
										<option
												<c:if test="${searchProduct.categoryId == c.id}">selected</c:if>
												value="${c.id}">${c.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label"><spring:message code="category.subName"
																			 text="default text"/></label>
								<select class="form-control m-b" id="subCategoryId" name="subCategoryId">
									<option value="0" selected>&nbsp;</option>
								</select>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label"><spring:message code="common.status.title"
								                                             text="default text"/></label>
								<select class="form-control m-b" name="status">
									<option <c:if test="${searchProduct.status == -1}">selected</c:if> value="-1">&nbsp;</option>
									<option <c:if test="${searchProduct.status == 1}">selected</c:if> value="1"><spring:message code="common.active" text="default text"/></option>
									<option <c:if test="${searchProduct.status == 0}">selected</c:if> value="0"><spring:message code="common.deactive" text="default text"/></option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<div class="text-center">
								<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i><spring:message
										code="common.button.search" text="default text"/></button>
								<a href="/admin/product" class="btn btn-primary"><i class="fa fa-plus"></i><spring:message
										code="common.button.add" text="default text"/></a>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<script>
    function selectSubCategory() {
        var e = document.getElementById("categoryId");
        var id = e.options[e.selectedIndex].value;
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/admin/subCategory/" + id,
            dataType: 'json',
            timeout: 100000,
            async: false,
            success: function (subCategories) {
                $('#subCategoryId')
                    .find('option')
                    .remove()
                    .end()
                    .append('<option value="0">&nbsp;</option>')
                    .val('0')
                ;
                $.each(subCategories, function(key, value) {
                    $('#subCategoryId')
                        .append($("<option></option>")
                            .attr("value",value.id)
                            .text(value.name));
                });
            }
        });
    }
</script>





