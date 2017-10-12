<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Agent Dashboard</title>
  
  <!-- Bootstrap core CSS-->
  <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="<c:url value='/resources/vendor/font-awesome/css/font-awesome.min.css' />" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.css' />" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="<c:url value='/resources/css/sb-admin.css' />" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html">Hulk Logic</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/admin/getDetails">
		   
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Demo">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/demo">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Demo</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Agent">
         <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa fa-user"></i>
            <span class="nav-link-text">Agent</span>
          </a>
		   <ul class="sidenav-second-level collapse" id="collapseComponents">
            <li>
              <a href="${pageContext.servletContext.contextPath}/admin/createAgent">Registration</a>
            </li>
            <li>
			 
              <a href="${pageContext.servletContext.contextPath}/admin/showAgents">List</a>
            </li>
          </ul>
          
        </li>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
                    <c:set var="admin" scope="session"/>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Operator">
		 <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents1" data-parent="#exampleAccordion">
          
            <i class="fa fa-fw fa fa-user"></i>
            <span class="nav-link-text">Operator</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseComponents1">
            <li>
              <a href="${pageContext.servletContext.contextPath}/admin/createOperator">Registration</a>
            </li>
            <li>
			 
              <a href="${pageContext.servletContext.contextPath}/admin/getAllOpearator">List</a>
            </li>
          </ul>
        </li>
		 </sec:authorize>
        
		
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Issues">
           <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents2" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Issues</span>
          </a>
		  <ul class="sidenav-second-level collapse" id="collapseComponents2">
            <li>
              <a href="${pageContext.servletContext.contextPath}/admin/createIssues">Report</a>
            </li>
            <li>
			 
              <a href="${pageContext.servletContext.contextPath}/admin/showIssues">List</a>
            </li>
          </ul>
		  
        </li>
		
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Seller">
         <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents3" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa fa-user"></i>
            <span class="nav-link-text">Seller</span>
          </a>
		  <ul class="sidenav-second-level collapse" id="collapseComponents3">
            <li>
              <a href="${pageContext.servletContext.contextPath}/admin/taskInBackGround">Registration</a>
            </li>
            <li>
			 
              <a href="${pageContext.servletContext.contextPath}/admin/showallTasksinBackground">List</a>
            </li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
	  
      <ul class="navbar-nav ml-auto"> 
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-user"></i>
          </a>	
		  <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            
            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/agent/currentAgent">
            Profile
            </a>
			<a class="dropdown-item" href="${pageContext.servletContext.contextPath}/changePassword">
              Change Password
            </a>
		</li>		  
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
     <h2 align="center">Demo Video</h2>
  <form  align="center"  >
 <iframe width="420" height="315" src="https://www.youtube.com/embed/a5SMyfbWYyE" frameborder="0" allowfullscreen></iframe>

    
  </form>
   
        </div>
        
      </div>
   
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Hulk Logic 2017</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">Close</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
			<a href="${pageContext.servletContext.contextPath}/login/logout" class="btn btn-primary" onclick="logout();">Logout</a>
          </div>
        </div>
      </div>
    </div>
	</div>
	</div>
    
    <!-- Bootstrap core JavaScript-->
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/popper/popper.min.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js' />"></script>
    <!-- Core plugin JavaScript-->
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' />"></script>
    <!-- Page level plugin JavaScript-->
   
    <script type="text/JavaScript" src="<c:url value='/resources/js/sb-admin.min.js' />"></script>
    <!-- Custom scripts for this page-->
	<script>
    function logout() {
		
		$.ajax({
			type : "GET",
			url : "/j_spring_security_logout",
		});
	}

    </script>
    <script>
    
    
    </script>
   
</body>

</html>