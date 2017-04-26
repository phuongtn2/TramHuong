<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="middle-box text-center loginscreen animated fadeInDown">
	<div>
		<div>
			<h1 class="logo-name">Admin</h1>
		</div>
		<h3>Trầm Hương Admin</h3>

		<form:form class="m-t" role="form" action="/admin/login" name="submitForm" method="post">
			<div class="form-group">
				<input name="userName" type="text" class="form-control"
				       placeholder="Tên đăng nhập" required="">
			</div>
			<div class="form-group">
				<input name="password" type="password" class="form-control"
				       placeholder="Mật khẩu" required="">
			</div>
			<button type="submit" class="btn btn-primary block full-width m-b">
				Đăng nhập
			</button>
			<div style="color: red">${error}</div>
			<a href="/forgotpassword">
				<small>Quên mật khẩu</small>
			</a>
		</form:form>
	</div>
</div>
