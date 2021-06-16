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

<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Pollify: Dashboard</title>
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
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white">
			<div class="logo">
				<a href="" class="simple-text logo-normal"> Pollify </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item active  "><a class="nav-link"
						href="dashboard"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="channels">
							<i class="material-icons">insert_chart_outlined</i>
							<p>Channels</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="users">
							<i class="material-icons">person</i>
							<p>Users</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="javascript:;">Dashboard</a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end">
						<ul class="navbar-nav">
							
							<li class="nav-item dropdown"><a class="nav-link"
								href="javascript:;" id="navbarDropdownProfile"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="material-icons">account_circle</i>
									<p class="d-lg-none d-md-block">Account</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownProfile">
									<a class="dropdown-item" href="profile?username=${user.username}" style="display: block;">
									<strong style="font-size: medium;">${user.name}</strong><br>@${user.username}</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/logout">Log out</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content" style="padding-top: 0px; padding-bottom: 0px">
				<div class="container-fluid">
					<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header card-header-info card-header-icon">
									<div class="card-icon">
										<i class="material-icons">emoji_emotions</i>
									</div>
									<p class="card-category">My Posts</p>
									<h3 class="card-title">${postsCount}</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">local_offer</i> Across all channels
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header card-header-danger card-header-icon">
									<div class="card-icon">
										<i class="material-icons">privacy_tip</i>
									</div>
									<p class="card-category">Account type</p>
									<h3 class="card-title">
										Limited
									</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">warning</i>
										Status updates in 30 days from joining
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header card-header-warning card-header-icon">
									<div class="card-icon">
										<i class="material-icons">local_atm</i>
									</div>
									<p class="card-category">Balance</p>
									<h3 class="card-title">+100 <small>coins</small></h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">add_task</i> Add more to wallet
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-8 col-md-12">
							<div class="card">
								<div class="card-header card-header-tabs card-header-primary">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="nav-item"><a class="nav-link active"
													href="#c_owned" data-toggle="tab"> <i
														class="material-icons">manage_accounts</i>Channels Owned
														<div class="ripple-container"></div>
												</a></li>
												<li class="nav-item"><a class="nav-link"
													href="#c_subscribed" data-toggle="tab"> <i
														class="material-icons">article</i>Channels Subscribed
														<div class="ripple-container"></div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active" id="c_owned">
											<table class="table" style="text-align: center;">
												<thead>
													<tr>
														<th>Channel Name</th>
														<th>Subscribers</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${user.channelsOwned}" var="item">
													<tr>
														<td>
															<a href="/user/channel?name=${item.name}">																
																${item.name}
															</a>
														</td>
														<td>															
															${item.subscribers.size()}
														</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="tab-pane" id="c_subscribed">
											<table class="table" style="text-align: center;">
												<thead>
													<tr>
														<th>Channel Name</th>
														<th>Subscribers</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${user.channelsSubscribed}" var="item">
													<tr>
														<td>
															<a href="/user/channel?name=${item.name}">																
																${item.name}
															</a>
														</td>
														<td>															
															${item.subscribers.size()}
														</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-12">

							<div class="card card-chart">
								<div class="card-header card-header-success">
									<div class="ct-chart" id="dailySalesChart"></div>
								</div>
								<div class="card-body">
									<h4 class="card-title">Daily Responses</h4>
									<p class="card-category">
										<span class="text-success"><i
											class="fa fa-long-arrow-up"></i> 55% </span> increase in responses today
									</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> updated at 12:00 AM
									</div>
								</div>
							</div>

							<div class="card card-chart" style="display: none;">
								<div class="card-header card-header-danger">
									<div class="ct-chart" id="completedTasksChart"></div>
								</div>
								<div class="card-body">
									<h4 class="card-title">Completed Tasks</h4>
									<p class="card-category">Last Campaign Performance</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> campaign sent 2 days
										ago
									</div>
								</div>
							</div>

							<div class="card card-chart" style="display: none;">
								<div class="card-header card-header-warning">
									<div class="ct-chart" id="websiteViewsChart"></div>
								</div>
								<div class="card-body">
									<h4 class="card-title">Email Subscriptions</h4>
									<p class="card-category">Last Campaign Performance</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> campaign sent 2 days
										ago
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<footer class="footer">
					<div class="container-fluid">
						<nav class="float-left">
							<ul>
								<li><a href=""> ${user.name} </a></li>
							</ul>
						</nav>
						<div class="copyright float-right">
							&copy;
							<script>
								document.write(new Date().getFullYear())
							</script>
							, made with <i class="material-icons">favorite</i> by <a href="https://github.com/PiNaKa30/"
								target="_blank">PiNaKa30</a>
						</div>
					</div>
				</footer>
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
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			md.initDashboardPageCharts();
		});
	</script>
</body>

</html>