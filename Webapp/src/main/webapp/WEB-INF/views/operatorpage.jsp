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
    <div class="row" style="overflow-x:auto;">
				        <div id="table" class="col-lg-12">
                        <h2>Table Overview</h2>
                        <div id="usertable"  class="table-responsive1" >
                            <table id="example" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                <thead style="background:#ff6707;color:#fff">
                                    <tr>
                                        
                                     
                                        <th class="table_heading">FirstName</th>
                                        <th class="table_heading">LastName</th>
                                        <th class="table_heading">Email</th>
                                        <th class="table_heading">Username</th>
                                        <th class="table_heading">ContactNo</th>
                                        <th class="table_heading">DateofBirth</th>
                                        <th class="table_heading">Qualification</th>
                                        <th class="table_heading">Gender</th>
                                        <th class="table_heading">AdressLine1</th>
                                        <th class="table_heading">City</th>
                                        <th class="table_heading">District</th>
                                        <th class="table_heading">State</th>
                                        <th class="table_heading">Country</th>
                                        <th class="table_heading">Pincode</th>
                                        <th class="table_heading">Bank Name</th>
                                        <th class="table_heading">Account Number</th>
                                        <th class="table_heading">IFSC Code</th>
                                        <th class="table_heading">Pancard Number</th>
                                        <th class="table_heading">Aadharcard Number</th>
                                        <th class="table_heading">Voterid Number</th>
                                        <th class="table_heading">Latitude</th>
                                        <th class="table_heading">Longitude</th>
                                        <th class="table_heading">Images View</th>
                                        <th>Edit</th>
                                    </tr>
                                </thead> 
                            </table>
                            </div>
    </div>
            </div>
   
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
	 <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.js' />"></script>
    <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.js' />"></script>
    <!-- Custom scripts for all pages-->
    
    <!-- Custom scripts for this page-->
    <script src="<c:url value='/resources/js/sb-admin-datatables.min.js' />"></script>
	<script>
    function logout() {
		
		$.ajax({
			type : "GET",
			url : "/j_spring_security_logout",
		});
	}

    </script>
      
              
 <script>
        
      $(document).ready(function() {
        var table;
        $.ajax({
            type: "GET",
            url: "${pageContext.servletContext.contextPath}/admin/showOpearator",
           
            complete: function(data) {
                
                console.log(data.responseJSON)
               
                
              table=   $('#example').dataTable({
              
                   data : data.responseJSON,
                
            
            columns:[
                               
                               
                                { "data": "firstName" },
                                { "data": "lastName"},
                                { "data": "email" },
                                { "data": "userName" },
                                { "data": "contactNo" },
                                {"data":"dob"},
                                { "data": "qualification" },
                                { "data": "gender" },
                                { "data": "addrLine1" },
                                { "data": "addrLine2" },
                                {"data":"district"},
                                {"data":"state"},
                                {"data":"country"},
                                {"data":"pincode"},
                                {"data":"bankName"},
                                {"data":"bankAccNo"},
                                {"data":"ifsccode"},
                                {"data":"pannumber"},
                                {"data":"aadharCardNo"},
                                {"data":"voterIdNo"},
                                {"data":"latitude"},
                                {"data":"longitude"},
                                {"data":"userid","render": function ( data ) {
                                            return '<input id="btn-showimages" type="submit"  value="View Images" onclick="checkimages('+data+')" style="float: right" />';
                                },
                                
                                },
                               
                                
                                {
                                    "data": "userid", "width": "50px", "render": function (data) {
                                    return '<input id="btn-show" type="submit" value="Edit" onclick="checkAjaxCall('+data+')" style="float: right" />';
                                },
                                }],
            })
                  
                
            },
              
          
            error: function () {
             alert('Error');
            }
             
        });
         
        });
       
      
    </script>
   
    
    <div id="overlay" class="web_dialog_overlay"></div>
    
<div id="dialog" class="web_dialog">
   <table  id= "updatetable" style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
      <tr>
         <td class="web_dialog_title">Agent Documents</td>
         <td class="web_dialog_title align_right">
            <a href="#" id="btnClose">Close</a>
         </td>
      </tr>
      <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
      </tr>
       <tr>
         <td colspan="2" style="padding-left: 15px;">
           <div class="slideshow-container">

<div class="mySlides">
  <div class="numbertext">1 / 5</div>
  <img id='preview' src="" style="display: none">
  <div class="text" style="color:#0000FF">Voter Image</div>
</div>

<div class="mySlides">
  <div class="numbertext">2 / 5</div>
  <img id='preview2' src="" style="display: none">
  <div class="text" style="color:#0000FF">Personal Image</div>
</div>

<div class="mySlides">
  <div class="numbertext">3 / 5</div>
  <img id='preview3' src="" style="display: none">
  <div class="text" style="color:#0000FF">Pancard Image</div>
</div>
<div class="mySlides">
  <div class="numbertext">4 / 5</div>
  <img id='preview4' src="" style="display: none">
  <div class="text" style="color:#0000FF">Aadharcard Image</div>
</div>
<div class="mySlides">
  <div class="numbertext">5 / 5</div>
  <img id='preview5' src="" style="display: none">
  <div class="text" style="color:#0000FF">Certificate Image</div>
</div>


 <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>

</div>
<br>


         </td>
      </tr>
   </table>
</div>
                 
<script>
        
        var personimage;
        var panimage; 
        var aadharimage;
        var voterimage;
        var certificateimage;
        function checkimages(agentid){
             $.ajax({
            type: "POST",
            dataType:"JSON",
            data: "userid="+agentid,
            url: "${pageContext.servletContext.contextPath}/showImages",
           
            complete: function(data) {
                
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
                $('#preview').show();
                document.getElementById('preview2').setAttribute('src', personimage);
                $('#preview2').show();
                document.getElementById('preview3').setAttribute('src',panimage );
                $('#preview3').show();
                document.getElementById('preview4').setAttribute('src',aadharimage );
                $('#preview4').show();
                document.getElementById('preview5').setAttribute('src',certificateimage );
                $('#preview5').show();
                
                
                
            }
                    });
                    {
                    ShowDialog(false);
                    }
             return false;
        }
        
             $("#btnClose").click(function(e){
            	 HideDialog();
             })
             var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
             

        </script>
        <script>
         function checkAjaxCall(issueId){
            
             window.location.href = "UpdateAgent.html";
                      {
                        ShowDialog(false);
                          $('#issueid').val(issueId);
                       
                    }
                         return false;
                   }
             $("#btnClose").click(function (e)
                        {
                        HideDialog();
        
                });

    

  

   function ShowDialog(modal)
   {
      $("#overlay").show();
      $("#dialog").fadeIn(300);

      if (modal)
      {
         $("#overlay").unbind("click");
      }
      else
      {
         $("#overlay").click(function (e)
         {
            HideDialog();
         });
      }
   }

   function HideDialog()
   {
      $("#overlay").hide();
      $("#dialog").fadeOut(300);
   } 
    function logout() {
  		alert('logout');
  		$.ajax({
  			type : "GET",
  			url : "/j_spring_security_logout",
  		});
  	}
        </script>      
    

          
                     

<style type="text/css">

.web_dialog_overlay
{
   position: fixed;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   height: 100%;
   width: 100%;
   margin: 0;
   padding: 0;
   background: #000000;
   opacity: .15;
   filter: alpha(opacity=15);
   -moz-opacity: .15;
   z-index: 101;
   display: none;
}
.web_dialog
{
   display: none;
   position: fixed;
   width: 500px;
   height: 300px;
   top: 50%;
   left: 50%;
   margin-left: -190px;
   margin-top: -100px;
   background-color: #ffffff;
   border: 2px solid #336699;
   padding: 0px;
   z-index: 102;
   font-family: Verdana;
   font-size: 10pt;
}
.web_dialog_title
{
   border-bottom: solid 2px #336699;
   background-color: #336699;
   padding: 4px;
   color: White;
   font-weight:bold;
}
.web_dialog_title a
{
   color: White;
   text-decoration: none;
}
.align_right
{
   text-align: right;
}
img {
    display:block;
    
    width: 600px;
    height: 180px;
    max-width: 400px; max-height: 300px;
}


</style>

   
</body>

</html>