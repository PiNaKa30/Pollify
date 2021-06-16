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
<title>Pollify: ${channel.name}</title>
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
					<li class="nav-item "><a class="nav-link"
						href="users"> <i class="material-icons">person</i>
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
						<a class="navbar-brand" href="javascript:;">Channel Details</a>
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
				<div style="width: 100%; height: 300px; position: relative; border-radius: 16px;" class="bg-success">
					<div style="position: absolute; bottom: 0; left: 0; padding: 16px; color: white">
						<h1>${channel.name}</h1>
					</div>
					<div style="position: absolute; top: 0; width: 100%; padding: 16px; display: flex; flex-direction: row-reverse;" 
						class="text-success">
						<a class="nav-link bg-white text-success" href="/user/${subscribed ? 'unsubscribe' : 'subscribe' }?channel=${channel.name}" 
							style="cursor: pointer; margin: 8px"> 
							<i class="material-icons">${subscribed ? 'favorite' : 'favorite_border'}</i> 
							${subscribed ? 'Unsubscribe' : 'Subscribe'}
							<div class="ripple-container"></div>
						</a>
						<a class="nav-link bg-white" data-toggle="modal" data-target="#postsModal" 
							style="cursor: pointer; margin: 8px;"> 
							<i class="material-icons">add</i> New Post
							<div class="ripple-container"></div>
						</a>
					</div>
					
				</div><hr />
				<c:choose>
					<c:when test="${subscribed && channel.posts.size() == 0}">
						<div class="alert alert-danger" role="alert">
						  Wow, such empty! Create <strong>New Post</strong> to get started ...
						</div>
					</c:when>
  					<c:when test="${subscribed}">
					<c:forEach items="${channel.posts}" var="item">
					<div class="row" id="${item.id}">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-tabs card-header-primary" style="font-weight: bold; height: 70px;">
								<div class="row">
									<div class="col-sm-10" style="font-size: large; padding-top: 8px;">
										&nbsp; ${item.question}
									</div>
									<div class="col-sm-2">
										<button type="button" style="color: black;" class="btn bg-white btn-sm" 
										${choices[item.id] != null || item.author.username == currentUser ? 'hidden' : ''}
										onclick="chooseOption('${item.id}')" id="${item.id}-button">Submit</button>
									</div>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content">
									<div class="row" style="padding: 10px;">
										<div class="form-check col-md-6">
										  <input type="radio" name="${item.id}" id="${item.id}-1" value="1" 
										  ${choices[item.id] != null || item.author.username == currentUser ? 'disabled' : ''} 
										  ${choices[item.id] == 1 ? 'checked' : ''}
										  ${item.author.username == currentUser ? 'hidden' : ''}>
										  <label class="form-check-label" for="${item.id}-1">
										    <strong>A) </strong>${item.option1 }
										  </label>
										  <div class="progress" style="margin-left: 40px; margin-top: 10px;" id="${item.id}-progress-1"
										  ${choices[item.id] != null || item.author.username == currentUser ? '' : 'hidden'}>
											  <div class="progress-bar bg-success" role="progressbar" 
											  style="width: ${item.count1 * 100 / (item.count1 + item.count2 + item.count3 + item.count4)}%">
											  ${item.count1 == 0 ? '' : item.count1}</div>
										  </div>
										</div>
										<div class="form-check col-md-6">
										  <input type="radio" name="${item.id}" id="${item.id}-2" value="2" 
										  ${choices[item.id] != null || item.author.username == currentUser ? 'disabled' : ''} 
										  ${choices[item.id] == 2 ? 'checked' : ''}
										  ${item.author.username == currentUser ? 'hidden' : ''}>
										  <label class="form-check-label" for="${item.id}-2">
										    <strong>B) </strong>${item.option2 }
										  </label>
										  <div class="progress" style="margin-left: 40px; margin-top: 10px;" id="${item.id}-progress-2"
										  ${choices[item.id] != null || item.author.username == currentUser ? '' : 'hidden'}>
											  <div class="progress-bar bg-success" role="progressbar"  
											  style="width: ${item.count2 * 100 / (item.count1 + item.count2 + item.count3 + item.count4)}%">
											  ${item.count2 == 0 ? '' : item.count2}</div>
										  </div>
										</div>
										<div class="form-check col-md-6">
										  <input type="radio" name="${item.id}" id="${item.id}-3" value="3" 
										  ${choices[item.id] != null || item.author.username == currentUser ? 'disabled' : ''} 
										  ${choices[item.id] == 3 ? 'checked' : ''}
										  ${item.author.username == currentUser ? 'hidden' : ''}>
										  <label class="form-check-label" for="${item.id}-3">
										    <strong>C) </strong>${item.option3 }
										  </label>
										  <div class="progress" style="margin-left: 40px; margin-top: 10px;"  id="${item.id}-progress-3"
										  ${choices[item.id] != null || item.author.username == currentUser ? '' : 'hidden'}>
											  <div class="progress-bar bg-success" role="progressbar"  
											  style="width: ${item.count3 * 100 / (item.count1 + item.count2 + item.count3 + item.count4)}%">
											  ${item.count3 == 0 ? '' : item.count3}</div>
										  </div>
										</div>
										<div class="form-check col-md-6">
										  <input type="radio" name="${item.id}" id="${item.id}-4" value="4" 
										  ${choices[item.id] != null || item.author.username == currentUser ? 'disabled' : ''} 
										  ${choices[item.id] == 4 ? 'checked' : ''}
										  ${item.author.username == currentUser ? 'hidden' : ''}>
										  <label class="form-check-label" for="${item.id}-4">
										    <strong>D) </strong>${item.option4 }
										  </label>
										  <div class="progress" style="margin-left: 40px; margin-top: 10px;" id="${item.id}-progress-4"
										  ${choices[item.id] != null || item.author.username == currentUser ? '' : 'hidden'}>
											  <div class="progress-bar bg-success" role="progressbar"  
											  style="width: ${item.count4 * 100 / (item.count1 + item.count2 + item.count3 + item.count4)}%">
											  ${item.count4 == 0 ? '' : item.count4}</div>
										  </div>
										</div>
										</div>
										<hr />
										<div class="row">
											<div class="col-sm-6" >Posted By: <br>
											<a href="/user/profile?username=${item.author.username}">${item.author.username }</a>
											</div>
											<div class="col-sm-6" style="text-align: right;">Posted On: <br>${item.dateTime }</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="alert alert-danger" role="alert">
						  You are not subscribed to this channel! <strong>Subscribe</strong> to view all posts ...
						</div>
					</c:otherwise>
					</c:choose>
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
	<div class="modal fade" id="postsModal" tabindex="-1" aria-labelledby="postsModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header bg-success text-white">
	        <h2 class="modal-title" id="postsModalLabel">Create Poll</h2>
	      </div>
	      <div class="modal-body" style="padding-bottom: 0px;">
	        <form:form action="post?channelName=${channel.name}" method="POST" modelAttribute="post">
	        	<div class="row">
	        		<div class="col">
	        			<label>Question <span class="text-danger">*</span></label><br>
				        <form:input path="question" style="width: 100%;"/>
				        <form:errors path="question"/>
	        		</div>
	        	</div>
		        <div class="row">
		        	<div class="col-md-6">
		        		<label>Option 1 <span class="text-danger">*</span></label><br>
				        <form:input path="option1"/>
				        <form:errors path="option1"/>
		        	</div>
		        	<div class="col-md-6">
		        		<label>Option 2 <span class="text-danger">*</span></label><br>
				        <form:input path="option2"/>
				        <form:errors path="option2"/>
		        	</div>
		        </div>
				<div class="row">
		        	<div class="col-md-6">
		        		<label>Option 3 <span class="text-danger">*</span></label><br>
				        <form:input path="option3"/>
				        <form:errors path="option3"/>
		        	</div>
		        	<div class="col-md-6">
		        		<label>Option 4 <span class="text-danger">*</span></label><br>
				        <form:input path="option4"/>
				        <form:errors path="option4"/>
		        	</div>
		        </div>
		        <hr />
				<div class="row">
					<div class="col-md-2"></div>
	        		<div class="col-md-8">
	        			<input type="submit" class="btn btn-success btn-block text-white" 
	        			 value="Post" />
	        		</div>
	        		<div class="col-md-2"></div>
	        	</div>		        
		    </form:form> 
	      </div>
	      <!-- <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div> -->
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
		function chooseOption(postId){
			if ($('input[name=' + postId + ']:checked').length > 0) {
			    let choiceRequest = {
		    		postId,
		    		choice: $('input[name=' + postId + ']:checked')[0].value
			    };
			    $.ajax({
		            url: '/user/choose',
		            type: 'post',
		            dataType: 'json',
		            contentType: 'application/json',
		            data: JSON.stringify(choiceRequest),
		            success: function (data) {
		                console.log(data);
		                if(data.success){
		                	for(let i=1; i<5; i++){
		                		$("#" + postId + "-progress-" + i).removeAttr("hidden");
		                		$("#" + postId + "-" + i).attr("disabled", true);
		                	}
		                	$("#" + postId + "-button").hide();
		                	Swal.fire(
	                  		  'Success',
	                  		  data.data.message,
	                  		  'success'
	                  		);
		                } else {
		                	Swal.fire(
	                  		  'Failure',
	                  		  data.data.message,
	                  		  'error'
	                  		);
		                }
		            }
		        });
			}
		}
	
	</script>
</body>

</html>
