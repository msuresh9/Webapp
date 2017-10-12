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
 
  <style>
  
  form .error {
  color: #ff0000;
}
</style>
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
   <div class="card card-register mx-auto mt-5">
      <div class="card-header"><h1 align="center">Registration</h1></div>
      <div class="card-body">
        <form id="registration" name="registration" action="/register" >
           
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="firstname">First Name</label>
                <input class="form-control" type="text" name="firstname" id="firstname" placeholder="Enter First Name">
              </div>
              <div class="col-md-6">
               <label for="lastname">Last Name</label>
                <input class="form-control" type="text" name="lastname" id="lastname" placeholder="Enter Last Name">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input class="form-control" type="email" name="email" id="email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" placeholder="Enter Email">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="password">Password</label>
                <input class="form-control" type="password" name="password" id="password" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;">
              </div>
              <div class="col-md-6">
                <label for="password">Confirm Password</label>
                <input class="form-control" type="password" name="password" id="confirmpassword" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;">
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="username">Username</label>
                <input class="form-control" type="text" name="username" id="username" placeholder="Enter Username">
              </div>
              <div class="col-md-6">
                <label for="mobile">Mobileno</label>
                <input class="form-control" type="text" name="mobile" id="mobile"   pattern="[789][0-9]{9}" placeholder="Enter Mobile Number">
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
               <label for="dob">Date of Birth</label>
                <input class="form-control" type="date" name="dob" id="dob" placeholder="Enter Date of Birth">
              </div>
              <div class="col-md-6">
                <label for="exampleQualification">Qualification</label>
                 <select id="qual" name="qual" class="form-control" required>
                                    <option value="">Select</option>
                                    <option value="bca" >B.C.A</option>
								     <option value="bcom">B.Com.</option>
                                    <option value="bsc" >B.Sc</option>
								     <option value="ba">B.A</option>
                                    <option value="btech" >B.Tech/B.E</option>
								     <option value="msc">M.Sc.</option>
                                    <option value="mba" >M.B.A</option>
								     <option value="diploma">Diploma</option>
                                   </select>
              </div>
			  </div>
			  </div>
			  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleGender">Gender</label>
                 <select id="gender" name="gender" class="form-control" required>
                                    <option value="">Select</option>
                                    <option value="male" >Male</option>
								     <option value="female">Female</option>
                                    </select>
              </div>
              <div class="col-md-6">
               <label for="addr1">Addressline1</label>
	  <input class="form-control" type="text"  name="addr1" id="addr1"  placeholder="Enter Address" required/>
              </div>
            </div>
          </div>
		   <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="addr2">Addressline2</label>
				<input class="form-control" type="text"  name="addr2" id="addr2"  placeholder="Enter City" required/>
              </div>
              <div class="col-md-6">
                <label for="state">State</label>
                        <select id="state" class="form-control"  name="state" onchange="select_district(this.value)" autofocus="" required>
                  	   </select>
              </div>
            </div>
          </div>
		   <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="District">District</label>
                        <select id="district" class="form-control"  name="district"  autofocus="" required>
                        </select>
              </div>
              <div class="col-md-6">
                 <label for="country">Country</label>
					<input class="form-control" type="text" name="country" id="country" value="India" placeholder="" disabled="true"/>  
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="autocomplete">Pincode</label>
		<input class="form-control" id="autocomplete" type="text" name="autocomplete" onblur="GetLocation()" placeholder="Enter Pin Code" /> 
              </div>
              <div class="col-md-6">
                <label for="banks">Bank Name</label>
		  <select class="form-control" id = "nbSelect" data-size="5" required>
						                      <option value = "-1">Select</option>
						                      <option value="HDFC" >HDFC Bank</option>
								
						                      <option value="SBI"  >State Bank of India</option>
								
						                      <option value="ICICI" >ICICI Bank</option>
								
                                                <option value="AXIS"  >Axis Bank</option>
                                                <option values="andhra" >Andhra Bank</option>

                                                <option value="PNB"  >Punjab National Bank</option>

                                                <option value="NKMB"  >Kotak Bank</option>

                                                <option value="BBK" >Bank of Bahrain and Kuwait</option>

                                                <option value="BOB"  >Bank of Baroda</option>

                                                <option value="BOI"  >Bank of India</option>

                                                <option value="BOM"  >Bank of Maharashtra</option>

                                                <option value="ALH" >Allahabad Bank</option>

                                                <option value="CANARA" >Canara Bank</option>

                                                <option value="CSB"  >Catholic Syrian Bank</option>

                                                <option value="CBI"  >Central Bank of India</option>

                                                <option value="CITIUB"  >City Union Bank</option>

                                                <option value="CORP"  >Corporation Bank</option>

                                                <option value="COSMOS" >Cosmos Bank</option>

                                                <option value="DEUTS"  >Deutsche Bank</option>

                                                <option value="DENA"  >Dena Bank</option>

                                                <option value="GPPB"  >Gopinath Patil Parsik Janata Sahakari Bank Ltd.</option>

                                                <option value="IDBI" >IDBI Bank</option>

                                                <option value="INDB"  >Indian Bank</option>

                                                <option value="IOB"  >Indian Overseas Bank</option>

                                                <option value="INDS"  >IndusInd Bank</option>

                                                <option value="JKB"  >Jammu and Kashmir Bank</option>

                                                <option value="KTKB"  >Karnataka Bank</option>

                                                <option value="KVB"  >Karur Vysya Bank</option>

                                                <option value="LVB" >Lakhsmi Vilas Bank</option>

                                                <option value="PSB"  >Punjab & Sind Bank</option>

                                                <option value="SVB"  >Shamrao Vithal Bank</option>

                                                <option value="STB"  >Saraswat Co-operative Bank Ltd</option>

                                                <option value="SIB" >South Indian Bank</option>

                                                <option value="SCB" >Standard Chartered Bank</option>

                                                <option value="SYNBK"  >Syndicate Bank</option>

                                                <option value="TNMB"  >Tamilnad Mercantile Bank</option>

                                                <option value="UNI"  >Union Bank of India</option>

                                                <option value="UBI" >United Bank of India</option>

                                                <option value="VJYA"  >Vijaya Bank</option>

                                                <option value="YES"  >Yes Bank</option>

                                                <option value="UCO" >UCO Bank</option>
								
						</select>
              </div>
            </div>
          </div>
			  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
               <label for="bankacc">Bank Account Number</label>
		<input id="bankacc" type="text" class="form-control"   name="bankacc" placeholder="Enter Bank Account Number"  required/>
              </div>
              <div class="col-md-6">
                <label for="ifsc">IFSC Code</label>
		<input id="ifsccode" type="text" class="form-control"   name="ifsccode" placeholder="Enter IFSC Code"  required/>
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
               <label for="aadhar">Aadhar Number</label>
				<input id="aadharnumber" type="text" class="form-control"   name="aadharnumber" placeholder="Enter Aadhar Number"  required/>
              </div>
              <div class="col-md-6">
                <label for="pannum">Pan Card Number</label>
		<input id="pannum" type="text" class="form-control"   name="pannum" placeholder="Enter Pan Card Number"  required/>
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="voter">Voter Id</label>
				<input id="voterid" type="text" class="form-control"   name="voterid" placeholder="Enter Votercard Number" required />
              </div>
              <div class="col-md-6">
                <label for="latitude">Latitude</label>
		<input id="latitude" type="text" class="form-control"   name="latitude" placeholder="" disabled="true"  />
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="longitude">Longitude</label>
		<input id="longitude" type="text" class="form-control"   name="longitude" placeholder="" disabled="true" />
              </div>
              <div class="col-md-6">
                <label for="recentimage">Upload  Image</label>
				<input id="recentimage" type="file" class="form-control" name="recentimage" required/>
				<input id="response" type="hidden" class="form-control"  required />
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
              <label for="aadharimage">Upload  Aadhar Card Image</label>
        <input id="aadharimage" type="file" class="form-control" name="aadharimage" required/>
        <input id="response1" type="hidden" class="form-control"  required />
              </div>
              <div class="col-md-6">
                <label for="panimage">Upload Agent Pan Card Image</label>
        <input id="panimage" type="file" class="form-control" name="panimage" required/>
        <input id="response2" type="hidden" class="form-control"  required />
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="voterimage">Upload Agent Voter Card Image</label>
        <input id="voterimage" type="file" class="form-control" name="voterimage" required/>
        <input id="response3" type="hidden" class="form-control"  required />
              </div>
              <div class="col-md-6">
               <label for="certificateimage">Upload Degree Certificate</label>
        <input id="certificateimage" type="file" class="form-control" name="certificateimage" required/>
        <input id="response4" type="hidden" class="form-control"  required />
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="agentemail">Agent Email</label>
        <input id="agentemail" type="email" class="form-control" name="agentemail" required/>
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">Referral Code</label>
                <input class="form-control" id="examplereferralcode" type="text" aria-describedby="nameHelp" placeholder="Enter Referral Code" disabled>
              </div>
            </div>
          </div>
   
        
		   <button type="button" id="reg" onclick="checkAjaxCall();">Register</button>
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
	<script type="text/JavaScript" src="<c:url value='/resources/js/jquery.validate.js' />"></script>
  <script type="text/JavaScript" src="<c:url value='/resources/js/jquery.validate.min.js' />"></script>
  <script type="text/JavaScript" src="<c:url value='/resources/js/validation.js' />"></script>
  <script type="text/JavaScript" src="<c:url value='/resources/js/states.js' />"></script>
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
     
          function GetLocation() {
            var geocoder = new google.maps.Geocoder();
            var address = document.getElementById('autocomplete').value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    document.getElementById('latitude').value = latitude;
                    document.getElementById('longitude').value = longitude;
                 
                }
                
            });
        };
    
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC454PpW7f0IfejPz6g43vkD5Op3L5nZwY&libraries=places"
        async defer></script>
    <script>
    $(document).ready(function(){
   $("#recentimage").change(function(){
     var filesSelected = document.getElementById("recentimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
   
	$("#response").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
 
   $("#aadharimage").change(function(){
     var filesSelected = document.getElementById("aadharimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
   
	$("#response1").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
    $("#panimage").change(function(){
     var filesSelected = document.getElementById("panimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
    
	$("#response2").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
   $("#voterimage").change(function(){
     var filesSelected = document.getElementById("voterimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
   
	$("#response3").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
   $("#certificateimage").change(function(){
     var filesSelected = document.getElementById("certificateimage").files;
     if(filesSelected.length > 0){
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent){
    var base64value = fileLoadedEvent.target.result;
	base64 = base64value.split(',')[1];
 
	$("#response4").val(base64);
    };
     fileReader.readAsDataURL(fileToLoad);
    }
    });
    
    });
         
      function checkAjaxCall(){
 
    var firstname = $('#firstname').val(); 
    var lastname = $('#lastname').val();
     var email = $('#email').val();
         var username = $('#username').val();
		var	password = $('#password').val();
		var	mobile = $('#mobile').val();
		var	dob = $('#dob').val();
          var e = document.getElementById("qual");
        var qual = e.options[e.selectedIndex].text;
          var e1 = document.getElementById("gender");
          var gender = e1.options[e1.selectedIndex].text;
          var addr1 = $('#addr1').val();
          var city = $('#addr2').val();
          var e3 = document.getElementById("state");
          var state = e3.options[e3.selectedIndex].text;
          var e4 = document.getElementById("district");
          var district =  e4.options[e4.selectedIndex].text;
          var country = $('#country').val();
          var pincode = $('#autocomplete').val();
          var e5 = document.getElementById("nbSelect");
          var bank = e5.options[e5.selectedIndex].text;
          var accountno = $('#bankacc').val();
           var ifsccode = $('#ifsccode').val();
           var aadharnumber = $('#aadharnumber').val();
           var pannum = $('#pannum').val();
           var voterid = $('#voterid').val();
          
           var latitude = $('#latitude').val();
           var longitude = $('#longitude').val();
           var recentimage = $('#response').val();
           var aadharimage = $('#response1').val();
           var panimage = $('#response2').val();
           var voterimage = $('#response3').val();
           var certificateimage = $('#response4').val();
          var agentemail =$('#agentemail').val();
          
          
          
          
    var json = {
         "firstName" : firstname,
        "lastName":lastname,
        "email":email,
        "userName":username,
        "password":password ,
        "contactNo":mobile,
        "dOB":dob,
        "qualification":qual,
        "gender":gender,
        "addrLine1":addr1,
        "addrLine2":city,
        "district":district,
        "state":state,
        "country":country,
        "pincode":pincode,
        "bankName":bank,
        "bankAccNo":accountno,
        "iFSCCODE":ifsccode,
        "aadharCardNo":aadharnumber,
        "aadharImg":aadharimage,
        "voterIdNo":voterid,
        "voterIdImg":voterimage,
        "degreeCertificateImg":certificateimage,
        "personimage":recentimage,
        "pannumber":pannum,
        "panimage":panimage,
        "latitude":latitude,
        "longitude":longitude,
        "agentEmail":agentemail
        
        
    }
          console.log(json);
          
    $.ajax({
        url: "${pageContext.servletContext.contextPath}/Registration",
        type: 'POST',
        dataType: "json",
        data: {registrationCommand:JSON.stringify(json),isAgent:true},
        complete:function(response){
			console.log(response);
			if("success"==response.responseText){
				alert("Created Agent Registration succesfully!")
			}else if("fail"==response.responseText){
				alert("Registration failed !");
			}
			
        }
    });
	
    return false;
}
      function logout() {
  		alert('logout');
  		$.ajax({
  			type : "GET",
  			url : "/j_spring_security_logout",
  		});
  	}
      
    
    </script>
   <!-- <script>
         $('#email').on('focusout', function() {
    
            var inputElem = $("#email").val();
        data = { "emails" : inputElem },
        

    $.ajax(
    {
        type: "POST",
        url: "http://localhost:3030/GstWebApplication/Registration",
        dataType: "json",
        data: data,
        success: function(data)
        {
            if (data !== 'true')
            {
              return 'This email address is already registered.';
            }
            else
            {
               return true;
            }
        },
        error: function()
        {
            alert('Error');
            return false;
        }
    });


         });
        
         


    </script> -->
   

        
   
</body>

</html>