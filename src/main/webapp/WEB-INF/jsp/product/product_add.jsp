<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><spring:message code="product.title" text="default text"/></h5>
                <div class="ibox-tools">
                    <%--<a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
                            code="common.button.back"
                            text="default text"/></i></a>--%>
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <form:form accept-charset="UTF-8" action="/admin/product/save" method="post" modelAttribute="product" id="productForm" class="form-horizontal new_order" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="category.name"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <select id="categoryId" name="categoryId" class="form-control m-b"
                                    onclick="selectSubCategory();" required >
                                <option value="0"> --Chọn Danh Mục-- </option>
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
                                <c:if test="${product.id != null}">
                                    <c:forEach items="${sub}" var="s">
                                        <option
                                                <c:if test="${s.id==product.subCategoryId}">selected</c:if>
                                                value="${s.id}">${s.name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
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
                            <label class="control-label"><spring:message code="product.high"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6 text-left ">
                            <div class="i-checks"><label>
                                <input type="checkbox" name="sHigh"
                                       <c:if test="${product.isHigh==1}">checked=""</c:if> /></label>
                            </div>
                        </div>
                    </div>
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
                            <input type="text" maxlength="16" class="form-control" name="code"
                                   value="<c:if test="${product.code != null}">${product.code}</c:if>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.name"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" maxlength="256" class="form-control" name="name"
                                   value="<c:if test="${product.name != null}">${product.name}</c:if>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.tag"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <%--<input type="text" class="form-control" name="tag"
                                   value="<c:if test="${product.tag != null}">${product.tag}</c:if>"/>--%>
                            <select name="tagList" class="form-control select2" multiple="multiple" data-placeholder="Chọn Tag">
                                <c:forEach items="${tags}" var="t">
                                    <option <c:forEach items="${tagsP}" var="p"> <c:if test="${t.tag == p}"> selected="selected" </c:if> </c:forEach>>${t.tag}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <c:if test="${product.id != null}">
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
																	 value="${product.created}"/></c:if>"/>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.price"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" maxlength="9" class="form-control" name="price" id="price"
                                   value="<c:if test="${product.price != null && product.price != ''}">${product.price}</c:if>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.sale"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6 text-left ">
                            <div class="i-checks">
                                <label>
                                    <input type="checkbox" name="sSale" <c:if test="${product.isSale==1}">checked=""</c:if> />
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.salePrice"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${product.isSale==1}">
                                <input type="text" maxlength="9" class="form-control" name="salePrice" id="salePrice" placeholder="Giá khuyến mãi <= 70% Và >= 50% Giá Bán"
                                   value="<c:if test="${product.salePrice != null && product.salePrice != ''}">${product.salePrice}</c:if>"/>
                            </c:if>
                            <c:if test="${product.isSale==null || product.isSale==0}">
                                <input type="text" maxlength="9" class="form-control" name="salePrice" id="salePrice" placeholder="Giá khuyến mãi <= 70% Và >= 50% Giá Bán"
                                       value="<c:if test="${product.salePrice != null && product.salePrice != ''}">${product.salePrice}</c:if>" disabled="disabled"/>
                            </c:if>
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
                    <c:if test="${product.id != null}">
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
                    </c:if>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="common.description"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-9">
                            <%--<c:if test="${product.id!= null}">--%>
                            <%--<div id="product_description_div" class="ui-widget-content" style="height: 50%;width: 100%;">
                                    <textarea rows="10" style="width: 100%; height: 100%"
                                              name="description" required>${product.description}</textarea>
                            </div>--%>
                                <%--<div class="ibox float-e-margins">--%>
                                    <input type="hidden" required="required" name="description" id="description"/>
                                    <div class="ibox-content no-padding">
                                        <c:if test="${product.id!= null}">
                                            <div class="summernote">
                                                    ${product.content}
                                            </div>
                                        </c:if>
                                        <c:if test="${product.id== null}">
                                            <div class="summernote">
                                            </div>
                                        </c:if>
                                    </div>
                                <%--</div>--%>
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
                            <input type="file" class="form-control" name="file" <c:if test="${product.img == null}">required</c:if>/>
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
                            <%--<c:if test="${product.id != null}">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-edit"></i><spring:message code="common.button.update"
                                                                              text="default text"/>
                                </button>
                            </c:if>
                            <c:if test="${product.id == null}">--%>
                                <button type="button" class="btn btn-primary" onclick="checkSalePrice();">
                                    <i class="fa fa-check"></i><spring:message code="common.button.save"
                                                                               text="default text"/>
                                </button>
                                <button name="reset" class="btn btn-danger" type="reset">
                                    <i class="fa fa-refresh"></i><spring:message code="common.button.refresh"
                                                                                 text="default text"/>
                                </button>
                            <%--</c:if>--%>
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
    function checkSalePrice() {
        var aHTML = $('.summernote').code();
        $('#description').val(aHTML);
        if($('#salePrice').prop('disabled') == false){
            var price = $('#price').val();
            if(price != null && price != ''){
                //var salePriceCheckMax = (price*70)/100;
                var salePriceCheckMin = price/2;
                var salePrice = $('#salePrice').val();
                if(salePrice >= price){
                    alert('Giá khuyến mãi <= giá bán');
                    return false;
                }else if(salePrice < salePriceCheckMin) {
                    alert('Giá khuyến mãi >= 50% giá bán');
                    return false;
                }
                else{
                    $('#productForm').submit();
                }
            }
        }else{
            $('#productForm').submit();
        }
    }
</script>





