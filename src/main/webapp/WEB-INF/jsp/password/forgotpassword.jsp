<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="passwordBox animated fadeInDown">
	<div class="row">
		<div class="col-md-12">
			<div class="ibox-content">

				<h2 class="font-bold">Quên Mật Khẩu</h2>
				<p>
					Nhập Email của Bạn và password sẽ gửi qua địa chỉ mail.
				</p>

				<div class="row">

					<div class="col-lg-12">
						<form:form class="m-t" role="form" action="/admin/forgot-password" method="post" modelAttribute="user">
							<div class="form-group">
								<input type="email" class="form-control" placeholder="<spring:message code="customer.email" text="default text"/>" required="" name="mail">
							</div>

							<button type="submit" class="btn btn-primary block full-width m-b">Gửi Mail
							</button>

						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
