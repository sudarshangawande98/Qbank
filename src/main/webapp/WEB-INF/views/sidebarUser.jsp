<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
	<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
		<div class="app-brand demo">
			<a href="/indexUser"><img src="../assets/img/avatars/b.png" style="width: 146px; height: 79px;" /></a> </a> <a
				href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
				<i class="bx bx-chevron-left bx-sm align-middle"></i>
			</a>
		</div><br>
		<div class="menu-inner-shadow"></div>

		<ul class="menu-inner py-1" style="background: lavender;"</ul>

		<!-- Dashboard -->
		<li class="menu-item active"><a href="/indexUser" class="menu-link">
			<i class="menu-icon tf-icons bx bx-home-circle" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Analytics">
				<b>Dashboard</b>
			</div></a>
		</li>

		<li class="menu-header small text-uppercase"><span class="menu-header-text"><b>&nbsp;&nbsp;Components</b></span></li>

		<li class="menu-item"><a href="TopicTable" class="menu-link">
			<i class="menu-icon tf-icons bx bxs-spreadsheet" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>Topic</b>
			</div></a>
		</li>

		<li class="menu-item"><a href="questionTable" class="menu-link">
			<i class="menu-icon tf-icons bx bx-task" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>Questions</b>
			</div></a>
		</li>

		<li class="menu-item"><a href="/generate_question1" class="menu-link"> <i class="menu-icon tf-icons bx bxs-pencil"
			style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>Test</b>
			</div></a>
		</li>

		<li class="menu-item"><a href="/testmetadata" class="menu-link">
			<i class="menu-icon tf-icons bx bxs-notepad" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>Test Papers</b>
			</div></a>
		</li>
		
		<!-- <li class="menu-item"><a href="aboutUs" class="menu-link">
			<i class="menu-icon tf-icons bx bxs-message-dots" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>About Us</b>
			</div></a>
		</li> -->

		<li class="menu-item"><a href="/logout" class="menu-link"> <i class="menu-icon tf-icons bx bx-log-out-circle"
			style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>LogOut</b>
			</div></a>
		</li>
		</ul>
	</aside>

	<script type="text/javascript">
		$(document).ready(function() {
			$('li').click(function() {
				$('li.menu-item.active').removeClass("active");
				$(this).addClass("active");
			});
		})
	</script>
</body>
</html>