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
                    <a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
                            code="common.button.back"
                            text="default text"/></i></a>
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <form:form accept-charset="UTF-8" action="/admin/product/save" method="post" modelAttribute="product" id="userForm" class="form-horizontal new_order" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.code"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${product.id != null}">
                            <input type="hidden" class="form-control" name="id"
                                   value="${product.id}"/>
                            </c:if>
                            <c:if test="${product.id ==null}">
                                <input type="hidden" class="form-control" name="id"
                                       value=""/>
                            </c:if>
                            <input type="text" class="form-control" name="code"
                                   value="<c:if test="${product.code != null}">${product.code}</c:if> " required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.name"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="name"
                                   value="<c:if test="${product.name != null}">${product.name}</c:if>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.tag"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="tag"
                                   value="<c:if test="${product.tag != null}">${product.tag}</c:if> "/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.new"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6 text-left ">
                            <div class="i-checks"><label>
                                <input type="checkbox" name="sNew"
                                       <c:if test="${product.isNew==1}">checked=""</c:if> /></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.sale"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6 text-left ">
                            <div class="i-checks"><label>
                                <input type="checkbox" name="sSale"
                                       <c:if test="${product.isSale==1}">checked=""</c:if> /></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.effete"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6 text-left ">
                            <div class="i-checks"><label>
                                <input type="checkbox" name="sEffete"
                                       <c:if test="${product.isEffete==1}">checked=""</c:if> /></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.created"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="text" class="form-control" name="created" id="created"
                                       value="<c:if test="${product.created != null}"><fmt:formatDate pattern="MM/dd/yyyy"
																	 value="${product.created}"/></c:if> "/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="category.name"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <select id="categoryId" name="categoryId" class="form-control m-b"
                                    onclick="selectSubCategory();" required>
                                <c:forEach items="${categories}" var="c">
                                    <option
                                            <c:if test="${c.id==product.categoryId}">selected</c:if>
                                            value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="category.subName"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <select class="form-control m-b" id="subCategoryId" name="subCategoryId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.price"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="price"
                                   value="<c:if test="${product.price != null}">${product.price}</c:if> " required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.salePrice"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="salePrice"
                                   value="<c:if test="${product.salePrice != null}">${product.salePrice}</c:if> "/>
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
                                        <c:if test="${product.status==1}">selected</c:if> value="1">
                                    <spring:message code="common.active" text="default text"/></option>
                                <option
                                        <c:if test="${product.status==0}">selected</c:if> value="0">
                                    <spring:message code="common.deactive" text="default text"/></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="common.description"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <%--<c:if test="${product.id!= null}">--%>
                                    <textarea id="product_description" style="display: none;"
                                              name="description" required>${product.description}</textarea>
                            <%--</c:if>--%>
                            <%--<c:if test="${product.id== null}">
                                    <textarea id="product_description" style="display: none;"
                                              name="description"></textarea>
                            </c:if>--%>
                        </div>
                    </div>
                   <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.img"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${product.img != null}"><img src="${product.img}"
                                                                     style="width: 40px; height: 40px;"></c:if>
                            <input type="file" class="form-control" name="file" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.img1"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${product.img1 != null}"><img src="${product.img1}"
                                                                      style="width: 40px; height: 40px;"></c:if>
                            <input type="file" class="form-control" name="file1"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.img2"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${product.img2 != null}"><img src="${product.img2}"
                                                                      style="width: 40px; height: 40px;"></c:if>
                            <input type="file" class="form-control" name="file2"/>
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 20px;">
                        <div class="text-center">
                            <%--<input type="hidden" id="add" name="addProduct">--%>
                            <c:if test="${product.id != null}">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-edit"></i><spring:message code="common.button.update"
                                                                              text="default text"/>
                                </button>
                            </c:if>
                            <c:if test="${product.id == null}">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-check"></i><spring:message code="common.button.add"
                                                                               text="default text"/>
                                </button>
                                <button name="reset" class="btn btn-danger" type="reset">
                                    <i class="fa fa-refresh"></i><spring:message code="common.button.refresh"
                                                                                 text="default text"/>
                                </button>
                            </c:if>
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
                ;
                $.each(subCategories, function (key, value) {
                    $('#subCategoryId')
                        .append($("<option></option>")
                            .attr("value", value.id)
                            .text(value.name));
                });
            }
        });
    }
</script>





