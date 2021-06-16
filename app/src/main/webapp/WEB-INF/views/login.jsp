<!--
=========================================================
Material Dashboard - v2.1.2
=========================================================

Product Page: https://www.creative-tim.com/product/material-dashboard
Copyright 2020 Creative Tim (https://www.creative-tim.com)
Coded by Creative Tim

=========================================================
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Pollify: Login</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="../assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />

</head>

<body class="">
	<div class="wrapper" style="overflow-x: hidden; background-image: url('../assets/img/register.svg')">
		<div class="row">
			<div class="col-md-8">
				<div class="main-panel" style="width: 100%;">
					<div class="content" style="margin-top: 0px;">
						<div class="container-fluid">
							<div class="row">
								<div class="col">
									<div class="card" style="border: 5px solid">
										<div class="card-body" style="text-align: center; padding-bottom: 0px">
											<h1>Pollify</h1></div>
										<div class="card-body">
											<p style="font-size: large;">Do you want to find next Anime to watch? 
											Or, Choose a favorite TV show? Perhaps get some movie recommendations?
											<strong>Get started with Pollify now ...</strong></p>
											<p style="font-size: large;">Features:</p>
											<div class="row">
												<div class="col-md-6">
													<i class="material-icons">done</i> 
													<span style="font-size: large;">&nbsp;Create dedicated channels</span>
												</div>
												<div class="col-md-6">
													<i class="material-icons">done</i> 
													<span style="font-size: large;">&nbsp;Search & subscribe channels</span>
												</div>
												<div class="col-md-6">
													<i class="material-icons">done</i> 
													<span style="font-size: large;">&nbsp;Create polls</span>
												</div>
												<div class="col-md-6">
													<i class="material-icons">done</i> 
													<span style="font-size: large;">&nbsp;View poll results</span>
												</div>
												<div class="col-md-6">
													<i class="material-icons">done</i> 
													<span style="font-size: large;">&nbsp;Search user profiles</span>
												</div>
												<div class="col-md-6">
													<i class="material-icons">done</i> 
													<span style="font-size: large;">&nbsp;Get dashboard updates</span>
												</div>
											</div><br>
											<div class="row">
												<div class="col-11">
													<p style="font-size: large;">Don't have an account? 
													<a href="/register">Create one now ...</a></p>
												</div>
												<div class="col-1" style="cursor: pointer;" onclick="toggleMessage()">
													<i class="material-icons">keyboard_arrow_down</i> 
												</div>
											</div>
											<p id="testingMessage" style="display: none;">Some accounts have already been created for testing 
											purpose of this app. You can find more details on the Login page.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="main-panel" style="width: 100%;">
					<div class="content" style="margin-top: 0px;">
						<div class="container-fluid">
							<div class="row">
								<div class="col">
									<div class="card" style="border: 5px solid">
										<div class="card-body" style="text-align: center; padding-bottom: 0px">
											<h2>Login</h2></div>
										<div class="card-body">
											<c:if test="${param.error != null}">
												<div class="alert alert-danger" role="alert">
												  Invalid Credentials !
												</div>
											</c:if>
											<c:if test="${success != null}">
												<div class="alert alert-success" role="alert">
												  ${success}
												</div>
											</c:if>
											<form action="login" method="POST">
									        <label>Username <span class="text-danger">*</span></label><br>
									        <input name="username" required="true" style="width: 100%;"/><br>
											<br>
									        <label>Password <span class="text-danger">*</span></label><br>
									        <input name="password" type="password" required="true" style="width: 100%;"/><br>
											<br>
									        <input type="submit" class="btn btn-block text-white" value="Login" style="background: #9370db" />
									    </form>  
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	

	<!--   Core JS Files   -->
	<script src="../assets/js/core/jquery.min.js"></script>
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap-material-design.min.js"></script>
	<!-- Plugin for the momentJs  -->
	<script src="../assets/js/plugins/moment.min.js"></script>
	<!--  Plugin for Sweet Alert -->
	<script src="../assets/js/plugins/sweetalert2.js"></script>
	<!-- Forms Validations Plugin -->
	<script src="../assets/js/plugins/jquery.validate.min.js"></script>
	<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
	<script src="../assets/js/plugins/jquery.dataTables.min.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="../assets/js/plugins/nouislider.min.js"></script>
	<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
	<!-- Library for adding dinamically elements -->
	<script src="../assets/js/plugins/arrive.min.js"></script>
	<!-- Chartist JS -->
	<script src="../assets/js/plugins/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="../assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>

	<script>
		function toggleMessage(){
			$("#testingMessage").toggle();
		}
	</script>
</body>

</html>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
    </head>
<body>
    <h1>Login</h1>
    <form action="login" method="POST">

        <p>*Username</p>
        <input name="username"/>

        <p>*Password</p>
        <input name="password"/>

        <br><br>
        <input type="submit" value="Login" />

    </form>    
</body>
</html> --%>