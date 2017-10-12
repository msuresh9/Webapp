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
 
  <link href="<c:url value='/resources/css/jquery-ui.css' />" rel="stylesheet">
  <link href="<c:url value='/resources/css/jquery-ui.min.css' />" rel="stylesheet">
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
    <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Controls</h3>
                            </div>
                            <div class="panel-body">
							<div class="col-sm-4">
					<div class="from-group">
                            <label>Select Info</label>
                            <select id='myselect'>
                            <option value="0">Select One</option>
                            <option value="1">Date Range</option>
                            <option value="2">Email Search</option>
                            </select>
                            </div>
					</div>
                                <div id="container" class="container" style="display:none">
                                    <div class='col-md-3'>
                                         <div class="form-group">
                                             <label>From:</label>
                                         <div class='input-group date' >
                                           
												<input type='date' id="from" class="form-control" />
                                              <span class="input-group-addon">
                                                  <span class="glyphicon glyphicon-calendar"></span>
                                               </span>
                                          </div>
                                        </div>
                                        </div>
                            <div class='col-md-3'>
                                <div class="form-group">
                                    <label>To:</label>
                                    <div class='input-group date' >
                
                                        <input type='date' id='to' class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                                </div>
                                            </div>
                                        </div>
									
								
                                      <div class="form-group">
									  
                                       <button type="button" id="submit" class="btn btn-xs btn-success" style="display:none">Go!</button>
										</div>   
                                    </div>
									<div>
                                    
                                    
                                    
                                  <div class='col-md-4'>
                                      <div class="form-group">
									  
                                        <div id="email"  style="display:none">
                                <label>Agent Email</label>
             					<select id="agentemail" required>
             					</select>
									 </div>
										</div>   
                                    </div>
									
									 <div class='col-md-4'>
                                      <div class="form-group">
									  
                                       <button type="button" id="submit1" class="btn btn-xs btn-success" style="display:none">Go!</button>
										</div>   
                                    </div>
                       </div>
                             </div>
                   </div>
                         </div>
                            
              
	  
	  
	 
                       <div class="row" style="overflow-x:auto;">
				        <div id="table" class="col-lg-12">
                        <h2>Table Overview</h2>
                        <div id="usertable"   style="display:none" >
                            <table id="example" width="100%" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                <thead style="background:#ff6707;color:#fff">
                                    <tr>
										<th class="table_heading">Issue Name</th>
                                        <th class="table_heading">Issue Status</th>
                                        <th class="table_heading">Registered Date</th>
										<th class="table_heading">Issue Message</th>
										<th class="table_heading">Assigned From</th>
                                        <th class="table_heading">Assigned To</th>
                                        <th class="table_heading">Agent Email</th>
                                        <th class="table_heading">Latitude</th>
                                        <th class="table_heading">Longitude</th>
										<th>View Message</th>
                                    </tr>
                                </thead>
                            </table>
                            </div>
                            </div>
                        </div>
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
  
    <script type="text/JavaScript" src="<c:url value='/resources/js/ jquery-ui.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/js/sb-admin.min.js' />"></script>
	 <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.js' />"></script>
    <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.js' />"></script>
    <script src="<c:url value='/resources/js/sb-admin-datatables.min.js' />"></script>
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
              $("#submit").click(function(){
          $("#usertable").css("display", "block");
            var table;
        $.ajax({
            type: "POST",
            url: "${pageContext.servletContext.contextPath}/admin/allIssueStatus",
            data:"startDate="+document.getElementById('from').value + "&endDate=" + document.getElementById('to').value,
            dataType :"json",
            complete: function(result) {
             
              console.log(result.responseJSON);
                $('#example').dataTable({
					 retrieve: true,
                data : result.responseJSON,
               columns:[
								{ "data": "issueName" },
								{"data":"issueStatus"},
								{ "data": "created_at" },
								{ "data": "issueMessage" },
								{ "data": "assignFrom" },
								{"data":"assignTO"},
                                { "data": "agentEmail"},
                                {"data":"latitude"},
                                {"data":"longitude"},
								{"data": "issueId", "width": "50px", "render": function (data) {
									return '<input id="btn-view" type="submit" value="View" onclick="openMe('+data+')" style="float: right"/>';  }
                                },
     ],       
            })  
            },
           
            error: function () {
             alert('Error');
            }
             
        });
        });
        $("#submit1").click(function(){
            	  var e = document.getElementById('agentemail');
                  var selectedemail = e.options[e.selectedIndex].text;
                  alert(selectedemail);
           
          $("#usertable").css("display", "block");
            var table;
        $.ajax({
            type: "POST",
            url: "${pageContext.servletContext.contextPath}/admin/allIssueStatusByEmail",
            data:"agentEmail="+ selectedemail,
            dataType :"json",
            complete: function(result) {
              console.log(result.responseJSON);
                $('#example').dataTable({
					retrieve: true,
					
                   data : result.responseJSON,
            columns:[
								{"data":"issueName"},
								{"data":"issueStatus"},
								{"data":"created_at" },
								{"data":"issueMessage" },
								{"data":"assignFrom" },
								{"data":"assignTO"},
                                {"data":"agentEmail"},
                                {"data":"latitude"},
                                {"data":"longitude"},
								{"data": "issueId", "width": "50px", "render": function (data) {
									return '<input id="btn-view" type="submit" value="View" onclick="openMe('+data+')" style="float: right"/>';  }
                                },
            ],  
            })
            },
           
            error: function () {
             alert('Error');
            }
             
        });
        });
        
     
    </script>

 <div id="dialog1" title="Issue Message" style="display:none">
<div class="container1"
	style="padding-top: 60px; border: 0px; margin-left: 15px; margin-right: 15px">

	<div class="container">
		<div class="row">
			<div>
                
				<table id="taskmessage" class="table table-bordered table-hover">
					<thead style="background:#ff6707;color:#fff">
						<tr>
							<th class="table_heading">Issuemessage Id </th>
							<th class="table_heading"> Issue Id</th>
						    <th class="table_heading">Issue Message</th>
							<th class="table_heading">Issue Status</th>
							<th class="table_heading">Agent Email</th>
							<th class="table_heading">Created Date</th>
							<th>Edit</th>
							
							
						</tr>
					</thead>
					
				</table>
			</div>
		</div>
	</div>
</div>

</div>
<div id="dialog" title="Update Seller Task" style="display:none">
<div class="container1"
	style="padding-top: 60px; border: 0px; margin-left: 15px; margin-right: 15px">
<form id="taskupdate">
	<div class="container">
		<div class="row">
			<div>
			<table>
			 <tr>
         <td colspan="2" style="padding-left: 15px;">
            <label for="issueid">Task Id </label>
            <input class="form-control" type="number" id="updatetaskid_dialog" disabled>
         </td>
      </tr>
      <tr>
         <td colspan="2" style="padding-left: 15px;">
             <label for="issuestatus">Edit Seller Status</label>
            <select class="form-control" id="sellerstatus" required>
            <option>initiated</option>
            <option>onprogress</option>
            <option>success</option>
            <option>fail</option>
            </select>
         </td>
      </tr>
      <tr>
         <td colspan="2" style="padding-left: 15px;">
          <label>Agent Email</label>
             <select id="updatedemail" class="form-control" required>
             </select>
          </td>
         <td>&nbsp;</td>
      </tr>
      
      <tr>
         <td colspan="2" style="padding-left: 15px;">
          <label>Seller deal</label>
             <input id="sellerdeal" class="form-control" type=text placeholder="Enter Seller Deal" required>
          </td>
		  <tr>
		  <td colspan="2" style="padding-left: 15px;">
		  <label for="issuemessage">Seller Message</label>
		<textarea  id="sellermessage" name="sellermessage" class="form-control" placeholder="Enter Seller Message..." required></textarea>
		</td>
         <td>&nbsp;</td>
      </tr>
       <tr>
        <td>&nbsp;</td>
            <td>&nbsp;</td>
       </tr>
      <tr>
         <td colspan="2" style="text-align: center;">
            <input id="btnSubmit" type="button" value="Update" onclick="checkAjaxCallUpdate();"/>
         </td>
      </tr>
   </table>

                
				
			</div>
		</div>
	</div>
	</form>
</div>

</div>
                
       <script>
         function checkAjaxCallUpdate(){
    
    var taskid = $('#updatetaskid_dialog').val(); 
   var e = document.getElementById('updatedemail');
     var selectedemail = e.options[e.selectedIndex].text;
     var t = document.getElementById("sellerstatus");
     var selectedText = t.options[t.selectedIndex].text;
	 var sellermessage = $("#sellermessage").val();
     var sellerdeal = $('#sellerdeal').val();
        
          
    var json = {"taskid" : taskid,"sellerstatus":selectedText,"agentemailid": selectedemail,"sellerdeal":sellerdeal,"taskmessage":sellermessage}; 
                console.log(json);
          
    $.ajax({
		type: 'POST',
        url: "${pageContext.servletContext.contextPath}/TaskInBackGroundUpdate",
        dataType: "json",
        data: {updationForTaskInBackGround:JSON.stringify(json)},
        complete:function(response){
			console.log(response);
			
			if("success"==response.responseText){
				alert("Updated Task succesfully!")
			}else if("fail"==response.responseText){
				alert("Task updated failed !");
			}
			
        }
    });
	
    return false;
}
	
         function checkAjaxCall(taskid){
			   $('#updatetaskid_dialog').val(taskid);
			 $( "#dialog" ).dialog({
			modal: true,
		    draggable: true,
		    resizable: true,
		    position: ['right', 'center'],
		    show: 'blind',
		    hide: 'blind',
		    width: 300,
           });
$.ajax({
       type:"GET",
      	dataType :"json",
       url:"${pageContext.servletContext.contextPath}/allEmails",
       complete: function (result) {
    	   console.log(result);
    	   data = result;
    	   var values=[];
    	   
    	   for(var i=0; i< data.responseJSON.length; i++){
    		   
    		 var links = $('<option>'+data.responseJSON[i]+'</option>');
              $("#updatedemail").append(links);
			 
           }
       }
        });		   
		 }
				
	function openMe(taskid) {
		$( "#dialog1" ).dialog({
			modal: true,
		    draggable: true,
		    resizable: true,
		    position: ['right', 'center'],
		    show: 'blind',
		    hide: 'blind',
		    width: 1000
            /* autoOpen: false,   */
         }); 
		 alert(taskid);
		$.ajax({
			type : "POST",
			dataType :"json",
			data:"taskId="+taskid,
			url : "${pageContext.servletContext.contextPath}/showHistoryMessage",
			
			complete: function (data) {
    	   console.log(data);
		    $('#taskmessage').dataTable({
				 retrieve: true,
				paging: false,
              
                   data : data.responseJSON,
            columns:[
                                { "data": "taskmessageid" },
                                { "data": "taskid"},
								{"data":"taskmessage"},
                                { "data": "sellerstatus" },
                                { "data": "sellerdeal" },
                                { "data": "agentemailid" },
								{"data":"created_at"},
   		
                                {
                                    "data": "taskid", "width": "50px", "render": function (data) {
                                    return '<input id="btn-show" type="submit" value="Edit" onclick="checkAjaxCall('+data+')" style="float: right" />';
                                }
                                },
             ],
          })
      },
           
            error: function () {
             alert('Error');
            }
             
        });
        }
		
	
   
	 $(document).ready(function () {
        $.ajax({
       type:"GET",
      	dataType :"json",
       url:"${pageContext.servletContext.contextPath}/allEmails",
       complete: function (result) {
    	   console.log(result);
    	   data = result;
    	   var values=[];
    	   
    	   for(var i=0; i< data.responseJSON.length; i++){
    		   
    		 var links = $('<option>'+data.responseJSON[i]+'</option>');
              $("#agentemail").append(links);
			 
           }
       }
        });
 });
       
 $(document).ready(function(){
    $("#myselect").change(function () {
        var end = this.value;
        
        
       if(end=="1")
       {
       $("#container").css("display", "block");
       $("#email").css("display", "none");
	   $("#submit").css("display", "block");
	   $("#submit1").css("display", "none");
       }
       else{
       $("#email").css("display", "block");
       $("#container").css("display", "none");
	   $("#submit1").css("display", "block");
	   $("#submit").css("display", "none");
       }
       
    });
    });
    
    </script>
     <script>
	$( function() {
        
		$( "#from" ).datepicker({
	        dateFormat: 'yy-mm-dd'
		});
      
        $( "#to" ).datepicker({
			dateFormat: 'yy-mm-dd'
		});
	} );
	</script>		
   
</body>

</html>