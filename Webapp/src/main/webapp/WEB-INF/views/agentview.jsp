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
  <link href="<c:url value='/resources/css/lightslider.css' />" rel="stylesheet">
  <style>
  <style>
     ul{
   list-style: none outside none;
      padding-left: 0;
            margin: 0;
  }
        .demo .item{
            margin-bottom: 60px;
        }
  
  .demo{
   width: 800px;
  }
    </style>
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
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/agent/getDetails">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Demo">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/agent/demo">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Demo</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Report Issue">
          <a class="nav-link"  href="${pageContext.servletContext.contextPath}/agent/reportIssue">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">Report Issue Page</span>
          </a>
          
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Task in Backlog">
          <a class="nav-link"  href="${pageContext.servletContext.contextPath}/agent/taskinBacklog">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Task In Backlog</span>
          </a>
          
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Visit Update">
          <a class="nav-link"  href="${pageContext.servletContext.contextPath}/agent/visitupdate">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Visit Update/ Status</span>
          </a>
         
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Invite Agent">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/agent/inviteAgent">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Invite Another Agent</span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My Payment ">
          <a class="nav-link" href="${pageContext.servletContext.contextPath}/agent/payment">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">My Payments & Registration</span>
          </a>
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
            
            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/agent/">
            Profile
            </a>
			<a class="dropdown-item" href="${pageContext.servletContext.contextPath}/agent/changePwd">
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
	<div class="card card-register mx-auto mt-5">
      <div class="card-header"><h2 align="center">Edit Details</h2></div>
      <div class="card-body">
        <div class="container">
            <form id="registration" name="registration" >
           
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
            <div class="form-row">
              
              <div class="col-md-6">
                <label for="mobile">Mobileno</label>
                <input class="form-control" type="text" name="mobile" id="mobile"   pattern="[789][0-9]{9}" placeholder="Enter Mobile Number">
              </div>
			  <div class="col-md-6">
               <label for="dob">Date of Birth</label>
                <input class="form-control" type="date" name="dob" id="dob" placeholder="Enter Date of Birth">
              </div>
            </div>
          </div>
		 
			  <div class="form-group">
            <div class="form-row">
             
              <div class="col-md-6">
               <label for="addr1">Addressline1</label>
	  <input class="form-control" type="text"  name="addr1" id="addr1"  placeholder="Enter Address" required/>
              </div>
			   <div class="col-md-6">
                <label for="addr2">Addressline2</label>
				<input class="form-control" type="text"  name="addr2" id="addr2"  placeholder="Enter City" required/>
              </div>
            </div>
          </div>
		   <div class="form-group">
            <div class="form-row">
              
              <div class="col-md-6">
                <label for="state">State</label>
                        <select id="state" class="form-control"  name="state" onchange="select_district(this.value)" >
                  	   </select>
              </div>
			  <div class="col-md-6">
			   <label for="District">District</label>
                        <select id="district" class="form-control"  name="district"  autofocus="" required>
                        </select>
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
		  <select class="form-control" id = "nbSelect"  required>
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
               
		<input id="latitude" type="hidden" class="form-control"   name="latitude" placeholder="" disabled="true"  />
              </div>
            </div>
          </div>
		  <div class="form-group">
            <div class="form-row">
              
               
				<input id="longitude" type="hidden" class="form-control"   name="longitude" placeholder="" disabled="true" />
             
             
            </div>
          </div>
		  
		  
   
        
		   <button type="button" id="reg"   onclick="update();">Edit</button>
		    <button type="button" id="reg1"   onclick="edit();">Edit</button>
		   <button type="button" id="image"  onclick="updateCall();">View Images</button>
        </form>
        </div>
      </div> 
      </div>
	 

	  
	
	  
	  <div class="modal fade bs-example-modal-lg" id="imageshow" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="item active">
     <img id ="preview" class="img-responsive" src="" >
      <div class="carousel-caption">
        Voter Card Image
      </div>
    </div>
    <div class="item">
      <img id="preview2" class="img-responsive" src="" >
      <div class="carousel-caption">
        Personal Image
      </div>
    </div>
     <div class="item">
      <img id="preview3" class="img-responsive" src="" >
      <div class="carousel-caption">
        Pan Card Image
      </div>
    </div>
	<div class="item">
      <img id="preview4" class="img-responsive" src="" >
      <div class="carousel-caption">
        Aadhar Card Image
      </div>
    </div>
	<div class="item">
      <img id="preview5" class="img-responsive" src="" >
      <div class="carousel-caption">
         Degree Certificate Image
      </div>
    </div>
	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
  </div>
  </div>
  </div>
  </div>
  </div> 
  <div>
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
    <!-- Bootstrap core JavaScript-->
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/popper/popper.min.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js' />"></script>
    <!-- Core plugin JavaScript-->
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' />"></script>
    <!-- Page level plugin JavaScript-->
    <script type="text/javascript" src="<c:url value='/resources/js/lightslider.js' />"></script>
   
    <script type="text/JavaScript" src="<c:url value='/resources/js/sb-admin.min.js' />"></script>
    <!-- Custom scripts for this page-->
   
<script type="text/JavaScript" src="<c:url value='/resources/js/jquery.validate.js' />"></script>
  <script type="text/JavaScript" src="<c:url value='/resources/js/jquery.validate.min.js' />"></script>
  <script type="text/JavaScript" src="<c:url value='/resources/js/validation.js' />"></script>
  <script type="text/JavaScript" src="<c:url value='/resources/js/states.js' />"></script>

    
    
   
	<script>
	
	var userid;
	$( document ).ready(function() {
		$('input[type="submit"], date, select').prop("disabled", true);
		   $.ajax({
		        url: "${pageContext.servletContext.contextPath}/agent/currentUser",
		        type: 'POST',
		        dataType: "json",
		     	 success:function(response){
		     		$('input[type="text"], date, select').prop("disabled", true);
		 		 console.log(response);  
				 userid = response.userid;
		 		$('#firstname').val(response.FirstName);
		 		$('#lastname').val(response.LastName);
		 		$('#mobile').val(response.ContactNo);
		 		$('#dob').val(formatDate(response.DOB));
				$('#addr1').val(response.AddrLine1);
		 		$('#addr2').val(response.AddrLine2);
		 		$('#state').val(response.State);
		 		$('#district').val(response.District);
		 		alert(response.District);
		 		$('#country').val(response.Country);
		 		$('#autocomplete').val(response.Pincode);
		 		$('#nbSelect').val(response.BankName);
		 		$('#bankacc').val(response.BankAccNo);
		 		$('#ifsccode').val(response.IFSCCODE);
		 		$('#aadharnumber').val(response.aadharCardNo);
		 		$('#pannum').val(response.pannumber);
		 		$('#voterid').val(response.voterIdNo);
		 		$('#latitude').val(response.latitude);
		 		$('#longitude').val(response.longitude);
		 		
		 		
		    },
		    error:function(){
		     alert("Server Problem! Please try after some time!");
		     
		    }
		 
		        })
		});
    function logout() {
		
		$.ajax({
			type : "GET",
			url : "/j_spring_security_logout",
		});
	}
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }
	var personimage;
        var panimage; 
        var aadharimage;
        var voterimage;
        var certificateimage;
	function updateCall(){
		
		$.ajax({
		        url: "${pageContext.servletContext.contextPath}/showImages",
		        type: 'POST',
		        dataType: "json",
				data : "userid="+userid,
		     	 complete:function(data){
					 console.log(data);
					 voterimage = "data:image/jpeg;base64,";
                voterimage += data.responseJSON.votercardimg;
                personimage ="data:image/jpeg;base64,";
                personimage += data.responseJSON.recentphotoimg;
                panimage ="data:image/jpeg;base64,";
                panimage +=  data.responseJSON.pancardimg;
                aadharimage ="data:image/jpeg;base64,";
                aadharimage += data.responseJSON.aadharimg;
                certificateimage = "data:image/jpeg;base64,";
                certificateimage += data.responseJSON.qualificationimg;
				
				 document.getElementById('preview').setAttribute('src', voterimage);
               
                document.getElementById('preview2').setAttribute('src', personimage);
                
                document.getElementById('preview3').setAttribute('src',panimage );
               
                document.getElementById('preview4').setAttribute('src',aadharimage );
                
                document.getElementById('preview5').setAttribute('src',certificateimage );
                
               $('#imageshow').modal('show');
                
                
				 }
		});
	
	
	}
	function update(){
		$('input[type="text"], date, select').prop("disabled", false);
		$('input[type="button"], date, select').prop("disabled", true);
		$('input[type="submit"], date, select').prop("disabled", false);
	}
		
		function edit(){
		 var firstname = $('#firstname').val(); 
   		 var lastname = $('#lastname').val();
         var mobile = $('#mobile').val();
		 var dob = $('#dob').val();
		 var dob1 = dob.toString();
         var addr1 = $('#addr1').val();
          var city = $('#addr2').val();
          var e3 = document.getElementById("state");
          var state = e3.options[e3.selectedIndex].text;
          var e4 = document.getElementById("district");
          var district = e4.options[e4.selectedIndex].text;
          alert(district);
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
          
		 var json = {
         "FirstName" : firstname,
        "LastName":lastname,
       "ContactNo":mobile,
        "dob":dob1,
       "AddrLine1":addr1,
        "AddrLine2":city,
        "District":district,
        "State":state,
        "Pincode":pincode,
        "BankName":bank,
        "BankAccNo":accountno,
        "IFSCCODE":ifsccode,
        "aadharCardNo":aadharnumber,
       "voterIdNo":voterid,
       "pannumber":pannum,
       "latitude":latitude,
        "longitude":longitude,
      
    }
		$.ajax({
		        url: "${pageContext.servletContext.contextPath}/updateUserInfo",
		        type: 'POST',
		        dataType: "json",
				data : {registerBo:JSON.stringify(json)},
		     	 complete:function(data){
					if("success" == data.responseText){
						alert("Profile Updated Successfully");
					}
					else if("fail"== data.responseText){
						alert("Profile updated failed. Please Check after sometime!");
					}
		
	}
		})
	}
	
    </script>
  
 
</body>

</html>
