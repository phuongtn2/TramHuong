<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="middle-box text-center loginscreen animated fadeInDown">
	<div>
		<div>
			<h1 class="logo-name">Admin</h1>
		</div>
		<h3>Trầm Hương Admin</h3>
		<form:form modelAttribute="user" method="post" id="userForm" action= "/admin/change-password" >
			<label><spring:message code="changePassword.pass" text="default text"/></label>
			<div class="form-group">
				<input name="password" type="password" class="form-control" id="password"
				       onkeyup="checkValidPassword();"
				       placeholder="<spring:message code="changePassword.pass" text="default text" />" required="true">
			</div>
			<label><spring:message code="changePassword.retypePass" text="default text"/></label>
			<div class="form-group">
				<input name="verifyPassword" type="password" class="form-control" id="verifyPassword"
				       onkeyup="checkValidPassword();"
				       placeholder="<spring:message code="changePassword.retypePass" text="default text" />"
				       required="">
				<a id="warningMessage"></a>
			</div>
			<button type="button" class="btn btn-primary" data-toggle="modal"
			        data-target="#changePassButton"><spring:message code="changePassword.changePassButton"
			                                                        text="default text"/></button>
		</form:form>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="changePassButton" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-center"><spring:message code="changePassButton.confirmLabel"
				                                                    text="default text"/></h4>
			</div>
			<div class="modal-body text-center">
				<p><spring:message code="changePassButton.confirmMessage" text="default text"/></p>
				<p><spring:message code="changePassButton.changeButtonMessage" text="default text"/></p>
				<p><spring:message code="changePassButton.cancelButtonMessage" text="default text"/></p>
			</div>
			<div id="popupWarning" class="modal-body text-center"></div>
			<div class="modal-header text-center">
				<button onclick="changePasswordCheck()" name="addModel" class="btn btn-primary" type="submit">
					<spring:message code="changePassButton.countinuteButton"
					                text="default text"/></button>
				<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message
						code="changePassButton.cancelButton" text="default text"/></button>
			</div>
		</div>

	</div>
</div>

<script>
	function changePasswordCheck() {
		var password = $("#password").val();
		var verifyPassword = $("#verifyPassword").val();
		if (password == verifyPassword && password != '') {
			document.getElementById("userForm").submit();
//			window.location.assign("/saveNewPassword")
		} else    $('#popupWarning').html('<h3 style="color: red"><spring:message code="changePassButton.warningMessageRetype" text="default text"/></h3>');

	};
	function checkValidPassword() {
		var html = "";
		var password = $("#password").val();
		var verifyPassword = $("#verifyPassword").val();
		$('#popupWarning').html('');
		if (password == verifyPassword && password != '') html = '<a style="color: blueviolet"><spring:message code="changePassButton.warningMessageMatch" text="default text"/></a>';
		else html = '<a style="color: red"><spring:message code="changePassButton.warningMessageNotMatch" text="default text"/></a>';
		$('#warningMessage').html(html)
	}

</script>