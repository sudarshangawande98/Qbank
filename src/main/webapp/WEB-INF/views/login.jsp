<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="light-style customizer-hide" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">

<script type="text/javascript">
	function show_alert() {
		alert("Login successfully!");
	}
</script>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<title>Login</title>
<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="../assets/img/favicon/cdacLogo.jpg " style="width:200px;height:200px" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="../assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->
<link rel="stylesheet" href="assets/vendor/css/pages/page-auth.css" />

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>
<script src="../assets/js/config.js"></script>
</head>

<body class="body">
	<!-- Content -->

	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			
			<div class="card">
				<div class="card-body">
					<!-- Logo -->
					<h1 style="text-align: center;">
						<img src="../assets/img/avatars/b.png" alt="image" style="height: 75px" />
					</h1>
					<p style="position: absolute !important; margin-top: -40px;">
						<c:set var="message" scope="page" value="${message}" />
						<c:if test="${not empty message}">
							<div class="alert" role="alert" style="position: absolute !important; color: green; margin-top: -58px; margin-left: -50px;">
								<b> ${message}</b>
							</div>
						</c:if>
						<c:set var="wrongmessage" scope="page" value="${wrongmessage}" />
						<c:if test="${not empty wrongmessage}">
							<div class="alert" role="alert"
								style="position: absolute !important; color: red; margin-top: -32px; margin-left: -105px;">
								<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${wrongmessage}</b>
							</div>
						</c:if>
					</p>
					
					<!-- /Logo -->
					<form id="formAuthentication" class="mb-3" action="/loginUser" method="POST">
						<h1 style="text-align: center;">Login</h1>
						<div class="row">
							<div class="mb-3">
								<label class="form-label" for="role">Role </label> 
								<select name="role" class="select2 form-select" required>
									<option value=""> Select Role </option>
									<option>Faculty</option>
 									<option>Institute</option>
								</select>
							</div>
						</div>		
						<div class="mb-3">
							<label for="email" class="form-label"> Username</label> <input type="text" class="form-control" id="email" name="userName"
								placeholder="Enter your email or username" autofocus required="required" />
						</div>
						<div class="mb-3 form-password-toggle">
							<div class="d-flex justify-content-between">
								<label class="form-label" for="password">Password</label>
							</div>
							<div class="input-group input-group-merge">
								<input type="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
									title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
									class="form-control" name="password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
									aria-describedby="password" required="required" /> <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
							</div>
						</div>
						<a href="/ForgetPassword"> <small>Forgot Password?</small></a>
						<div class="mb-3">
							<button class="btn btn-primary d-grid w-100" type="submit">Sign in</button>
						</div>
					</form>
					
					<p class="text-center">
						<span>New on our platform?</span> <a href="/register"> <span>Create an account</span> </a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Core JS -->
	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="../assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Main JS -->
	<script src="../assets/js/main.js"></script>
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>