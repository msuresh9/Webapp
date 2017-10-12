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
      <div class="card-header"><h2 align="center">Seller Registration</h2></div>
      <div class="card-body">
   
 <form id="taskregistration" name="taskregistration">

    <label for="taskname">Task Name</label>
    <input class="form-control" type="text" name="taskname" id="taskname" placeholder="" required>
	<br>
      <label for="agentemail">Agent Email</label>
    <input class="form-control" type="email" name="agentemail" id="agentemail" placeholder="johndoe@gmail.com">
<br>       
	   <label for="shopname">Shop Name</label>
    <input class="form-control" type="text" name="shopname" id="shopname" placeholder="" required>
<br>       
	   <label for="sellername">Seller Name</label>
    <input class="form-control" type="text" name="sellername" id="sellername" placeholder="" required>
     <br>  
      <label for="sellermobile">Seller Mobileno</label>
    <input class="form-control" type="text" name="sellermobile" id="sellermobile"   pattern="[789][0-9]{9}" placeholder="9874563214">
        <br>
		<label for="sellerdeal">Seller Deal</label>
    <input class="form-control" type="text" name="sellerdeal" id="sellerdeal" placeholder="" required>
	<br>
    <label for="isassignedfrom">Assigned From</label>
    <input class="form-control" type="text" name="isassignedfrom" id="isassignedfrom" placeholder="" required>
	<br>
    <label for="isassignedto">Assigned To</label>
    <input class="form-control" type="text" name="isassignedto" id="isassignedto" placeholder="" required>
	<br>
	<label for="totaldoc">Total Doc</label>
      <input class="form-control" type="text" name="totaldoc" id="totaldoc" placeholder="" required>
	   <br>
	   <label for="issuemessage">Seller Message</label>
   <textarea rows="4" cols="50" id="sellermessage" name="sellermessage" class="form-control" placeholder="Enter Seller Message..." required></textarea>
      <br>
	  <label for="totaldoc">Seller Status</label>
       <select class="form-control" id="sellerstatus">
    <option>initiated</option>
    <option>onprogress</option>
    <option>success</option>
    <option>fail</option>
  </select>
    <br>
        <label for="autocomplete"> Map</label>
		<input id="searchInput" class="input-controls" type="text" placeholder="Enter a location">
 <div class="map" id="map" style="width: 100%; height: 500px;"></div>	
                        
         <label for="latitude">Latitude</label>               
        <input id="latitude" type="text" class="form-control"   name="latitude" placeholder="" disabled="true"  />
		<label for="longitude">Longitude</label>
		<input id="longitude" type="text" class="form-control"   name="longitude" placeholder="" disabled="true" />
	<br>
    <button type="button" id="reg" onclick="checkAjaxCall();">Register</button>
  </form>

   
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
    <script type="text/JavaScript" src="<c:url value='/resources/js/jquery.validate.js' />"></script>
  <script type="text/JavaScript" src="<c:url value='/resources/js/jquery.validate.min.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/js/sb-admin.min.js' />"></script>
    <!-- Custom scripts for this page-->
	 <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC454PpW7f0IfejPz6g43vkD5Op3L5nZwY&sensor=false&libraries=places"></script>
	<script>
    function logout() {
		
		$.ajax({
			type : "GET",
			url : "/j_spring_security_logout",
		});
	}

    </script>
  <script>
    
   
     function checkAjaxCall(){
    
    var taskname = $('#taskname').val(); 
    var agentemail = $('#agentemail').val();
     var shopname = $('#shopname').val();
         var sellername = $('#sellername').val();
		var	sellermobile = $('#sellermobile').val();
		var	sellerdeal = $('#sellerdeal').val();
		var	assignTo = $('#isassignedfrom').val();
         var assignFrom = $('#isassignedto').val();
		 var sellermessage =$('#sellermessage').val();
           var e = document.getElementById("sellerstatus");
        var sellerstatus = e.options[e.selectedIndex].text;
         var totaldoc=$('#totaldoc').val();
         var latitude =$('#latitude').val();
         var longitude = $('#longitude').val();
        
          
    var json = {"taskname" : taskname,"assignTO" : assignTo,"assignFrom": assignFrom,"agentemail" : agentemail,"shopname" : shopname,"sellername":sellername,"sellermobile":sellermobile,"sellerdeal":sellerdeal,"totaldoc":totaldoc,"latitude":latitude,"longitude":longitude ,"sellerStatus":sellerstatus,"taskmessage":sellermessage}; 
         console.log(json);
          
    $.ajax({
        url: "${pageContext.servletContext.contextPath}/admin/createtaskInBackGround",
        type: 'POST',
        dataType: "json",
        data: {taskInBackGround:JSON.stringify(json)},
        complete:function(response){
			console.log(response);
			
			if("success"==response.responseText){
				alert("Created Task succesfully!")
			}else if("fail"==response.responseText){
				alert("Task  creation failed !");
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
 
        
    <script>
/* script */
function initialize() {
   var latlng = new google.maps.LatLng(28.5355161,77.39102649999995);
    var map = new google.maps.Map(document.getElementById('map'), {
      center: latlng,
      zoom: 13
    });
    var marker = new google.maps.Marker({
      map: map,
      position: latlng,
      draggable: true,
      anchorPoint: new google.maps.Point(0, -29)
   });
    var input = document.getElementById('searchInput');
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
    var geocoder = new google.maps.Geocoder();
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo('bounds', map);
    var infowindow = new google.maps.InfoWindow();   
    autocomplete.addListener('place_changed', function() {
        infowindow.close();
        marker.setVisible(false);
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            window.alert("Autocomplete's returned place contains no geometry");
            return;
        }
  
        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
        }
       
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);          
    
        bindDataToForm(place.geometry.location.lat(),place.geometry.location.lng());
        infowindow.setContent(place.formatted_address);
        infowindow.open(map, marker);
       
    });
    // this function will work on marker move event into map 
    google.maps.event.addListener(marker, 'dragend', function() {
        geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[0]) {        
              bindDataToForm(marker.getPosition().lat(),marker.getPosition().lng());
              infowindow.setContent(results[0].formatted_address);
              infowindow.open(map, marker);
          }
        }
        });
    });
}
function bindDataToForm(lat,lng){
  
   document.getElementById('latitude').value = lat;
   document.getElementById('longitude').value = lng;
}
google.maps.event.addDomListener(window, 'load', initialize);
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
        
</script>
    
<style type="text/css">
    .input-controls {
      margin-top: 10px;
      border: 1px solid transparent;
      border-radius: 2px 0 0 2px;
      box-sizing: border-box;
      -moz-box-sizing: border-box;
      height: 32px;
      outline: none;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
    }
    #searchInput {
      background-color: #fff;
      font-family: Roboto;
      font-size: 15px;
      font-weight: 300;
      margin-left: 12px;
      padding: 0 11px 0 13px;
      text-overflow: ellipsis;
      width: 50%;
    }
    #searchInput:focus {
      border-color: #4d90fe;
    }

.web_dialog_overlay
{
   position: fixed;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   height: 200%;
   width: 200%;
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
   height: 500px;
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

</style>
   
</body>

</html>