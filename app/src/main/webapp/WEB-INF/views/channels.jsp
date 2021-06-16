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
<title>Pollify: Channels</title>
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
					<li class="nav-item "><a class="nav-link"
						href="dashboard"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link" href="channels">
							<i class="material-icons">insert_chart_outlined</i>
							<p>Channels</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="users">
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
						<a class="navbar-brand" href="javascript:;">Explore Channels</a>
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
					<c:if test="${channels.size() == 0 && search != ''}">
					<div class="alert alert-danger" role="alert">
					  <strong>No search results found !</strong> Please refine your search criteria and try again ...
					</div>
					</c:if>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-tabs card-header-primary">
								<div class="row">
									<div class="col-sm-4">
									<ul class="nav nav-tabs" >
										<li class="nav-item"><a class="nav-link" data-toggle="modal" 
										data-target="#channelsModal" style="cursor: pointer"> <i
												class="material-icons">add_circle</i>Create Channel
												<div class="ripple-container"></div>
										</a></li>
									</ul>
									</div>
									<div class="col-sm-8">
									<ul class="nav nav-tabs" style="justify-content: flex-end;">
										<li>
											<input type="text" value="${search }" id="searchInput"
											style="background: transparent; color: white; margin-top: 10px; border: 0px;
											border-bottom: 1px solid white">
										</li>
										<li class="nav-item"><a onclick="searchChannel()" class="nav-link" style="cursor: pointer"> <i
												class="material-icons">search</i>Search Channel
												<div class="ripple-container"></div>
										</a></li>
										</ul>
									</div>
								</div>
								</div>
								<div class="card-body">
									<div class="tab-content">
											<table class="table" id="channelsList" style="text-align: center;">
												<thead>
												    <tr>
												      <th style="font-weight: bold;">Channel Name</th>
												      <th style="font-weight: bold;">Owner</th>
												      <th style="font-weight: bold;">Actions</th>
												    </tr>
												</thead>
												<tbody>
													<c:forEach items="${channels}" var="item">
													<tr>
														<td style="width: 60%"><a href="/user/channel?name=${item.name}">${item.name}</a></td>
														<td style="width: 30%"><a href="/user/profile?username=${item.owner}">${item.owner}</a></td>
														<td class="td-actions">
															<a href="/user/channel?name=${item.name}" type="button" rel="tooltip" title="View Posts"
																class="btn btn-primary btn-link btn-sm">
																<i class="material-icons">navigate_next</i>
															</a>
															<a href="/user/${item.subscribed ? 'unsubscribe' : 'subscribe' }?channel=${item.name}" type="button" rel="tooltip" title="${item.subscribed ? 'Unsubscribe' : 'Subscribe' }"
																class="btn btn-primary btn-link btn-sm">
																<i class="material-icons">${item.subscribed ? 'favorite' : 'favorite_border'}</i>
															</a>
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
	
	<!-- Modal -->
	<div class="modal fade" id="channelsModal" tabindex="-1" aria-labelledby="channelsModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header bg-success text-white">
	        <h2 class="modal-title" id="channelsModalLabel">Create Channel</h2>
	      </div>
	      <div class="modal-body">
	      	Creating a channel enables you to create polls dedicated to a specific topic<br><br>
	      	<label>Channel Name <span class="text-danger">*</span></label><br>
	        <input id="createTopicInput"><br>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn bg-success text-white" onclick="createChannel()">Create</button>
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
		
		function createChannel(){
			let channelName = document.getElementById("createTopicInput").value.trim();
			if(channelName == ""){
				return;
			}
			channelName = channelName.replace(/ /g, '_');
			let a = document.createElement("a");
			a.href = "/user/createChannel?name=" + channelName;
			a.click();
		}
		
		function searchChannel(){
			let channelName = document.getElementById("searchInput").value.trim();
			let a = document.createElement("a");
			a.href = "/user/channels?search=" + channelName;
			a.click();
		}
	</script>
</body>

</html>