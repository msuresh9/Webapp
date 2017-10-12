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
	<style>
	#controls {
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-around;
		height: 20%;
		width: 100%;
	}
	#record { height: 15vh; }
	#record.recording { 
		background: red;
		background: -webkit-radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
		background: -moz-radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
		background: radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
	}
	#save, #save img { height: 10vh; }
	#save { opacity: 0.25;}
	#save[download] { opacity: 1;}
	#viz {
		height: 80%;
		width: 100%;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		align-items: center;
	}
	@media (orientation: landscape) {
		body { flex-direction: row;}
		#controls { flex-direction: column; height: 100%; width: 10%;}
		#viz { height: 100%; width: 90%;}
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
            
            <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/agent/currentAgent">
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
      <div class="card-header"><h2 align="center">Report Issue</h2></div>
      <div class="card-body">
	<form>
	<div class="form-group">
	<label for="issuename">Client Name</label>
            <input class="form-control" id="clientname" type="text" aria-describedby="emailHelp" placeholder="Enter Client Name">
            <label for="issuename">Issue Name</label>
            <input class="form-control" id="issuename" type="text" aria-describedby="emailHelp" placeholder="Enter Issue Name">
       <input id="lat" type="hidden" >
	   <input id="lng" type="hidden" >
		  <label for="issuemessage">Issue Message</label>
   <textarea rows="4" cols="50" id="issuemessage" name="issuemessage" class="form-control" placeholder="Enter Issue Message..." required></textarea>
	   
      

	<div class="container">
		<div class="row">
			<div>
		<canvas id="analyser" ></canvas>
		<canvas id="wavedisplay"></canvas>
	
		<img id="record" src="${pageContext.servletContext.contextPath}/resources/images/mic128.png" onclick="toggleRecording(this);">
		<a id="save" href="#"><img src="${pageContext.servletContext.contextPath}/resources/images/save.svg" style="display:none"></a>
	
          </div>
		 
		</div>
		 </div>
		 
		
		<input type="button" onclick="checkAjaxCall();" value="Submit">
		
		<div style="display:none;">
		 <label for="autocomplete">Click Map</label>
		 <input id="searchInput" class="input-controls" type="text" placeholder="Enter a location">
			<div class="map" id="map" style="width: 100%; height: 500px;"></div>
			</div>
              
           </div>
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
    
	<!-- Bootstrap core JavaScript-->
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/popper/popper.min.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js' />"></script>
    <!-- Core plugin JavaScript-->
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' />"></script>
    <!-- Page level plugin JavaScript-->
   
    <script type="text/JavaScript" src="<c:url value='/resources/js/sb-admin.min.js' />"></script>
    <!-- Bootstrap core JavaScript-->
  
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/jquery/jquery-ui.js' />"></script>
    <script type="text/JavaScript" src="<c:url value='/resources/vendor/jquery/jquery-ui.min.js' />"></script>
    <!-- Page level plugin JavaScript-->
    
    <!-- Custom scripts for all pages-->
    <script type="text/JavaScript" src="<c:url value='/resources/js/sb-admin.min.js' />"></script>
    <!-- Custom scripts for this page-->
    <script type="text/JavaScript" src="<c:url value='/resources/js/autodisplay.js' />"></script>
	
	<script type="text/JavaScript" src="<c:url value='/resources/js/main.js' />"></script>
	<script>
    function logout() {
		
		$.ajax({
			type : "GET",
			url : "/j_spring_security_logout",
		});
	}

	 
 
</script>
<script>
var bloblink;
(function(window){

  var WORKER_PATH = '${pageContext.servletContext.contextPath}/resources/js/recorderWorker.js';

  var Recorder = function(source, cfg){
    var config = cfg || {};
    var bufferLen = config.bufferLen || 4096;
    this.context = source.context;
    if(!this.context.createScriptProcessor){
       this.node = this.context.createJavaScriptNode(bufferLen, 2, 2);
    } else {
       this.node = this.context.createScriptProcessor(bufferLen, 2, 2);
    }
   
    var worker = new Worker(config.workerPath || WORKER_PATH);
    worker.postMessage({
      command: 'init',
      config: {
        sampleRate: this.context.sampleRate
      }
    });
    var recording = false,
      currCallback;

    this.node.onaudioprocess = function(e){
      if (!recording) return;
      worker.postMessage({
        command: 'record',
        buffer: [
          e.inputBuffer.getChannelData(0),
          e.inputBuffer.getChannelData(1)
        ]
      });
    }

    this.configure = function(cfg){
      for (var prop in cfg){
        if (cfg.hasOwnProperty(prop)){
          config[prop] = cfg[prop];
        }
      }
    }

    this.record = function(){
      recording = true;
    }

    this.stop = function(){
      recording = false;
    }

    this.clear = function(){
      worker.postMessage({ command: 'clear' });
    }

    this.getBuffers = function(cb) {
      currCallback = cb || config.callback;
      worker.postMessage({ command: 'getBuffers' })
    }

    this.exportWAV = function(cb, type){
      currCallback = cb || config.callback;
      type = type || config.type || 'audio/wav';
      if (!currCallback) throw new Error('Callback not set');
      worker.postMessage({
        command: 'exportWAV',
        type: type
      });
    }

    this.exportMonoWAV = function(cb, type){
      currCallback = cb || config.callback;
      type = type || config.type || 'audio/wav';
      if (!currCallback) throw new Error('Callback not set');
      worker.postMessage({
        command: 'exportMonoWAV',
        type: type
      });
    }

    worker.onmessage = function(e){
      var blob = e.data;
      currCallback(blob);
    }

    source.connect(this.node);
    this.node.connect(this.context.destination);   // if the script node is not connected to an output the "onaudioprocess" event is not triggered in chrome.
  };

  Recorder.setupDownload = function(blob, filename){
    var url = (window.URL || window.webkitURL).createObjectURL(blob);
    bloblink = URL.createObjectURL(blob);
    var link = document.getElementById("save");
    link.href = url;
    link.download = filename || 'output.wav';
	
  
  }

  window.Recorder = Recorder;

})(window);

function checkAjaxCall(){
	  $("#audiofile").change(function(){
   var filesSelected = document.getElementById("audiofile").files;
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
	
  var client = $('#clientname').val();
  var issuename = $('#issuename').val(); 
 var	issueMessage = $('#issuemessage').val();
		var	latitude = $('#lat').val();
		var	longitude = $('#lng').val();
        var voicetype =  "audio/ogg" ; 
        var voicepath = bloblink; 
  var json = {"clinet":client,"issueName" : issuename,"issueMessage" : issueMessage,"latitude":latitude,"longitude":longitude,"voiceType":voicetype,"voiceImgPathe":voicepath };
     
      if(voicepath == null){
    	  alert("Please record a audio message!");
      }  
      else{
    	  $.ajax({
      
      url: "${pageContext.servletContext.contextPath}/agent/reportIssue",
      type: 'POST',
      dataType: "json",
      data: {reportIssueInfo:JSON.stringify(json)},
      complete:function(response){
			console.log(response);
			
			if("success"==response.responseText){
				alert("Created Issue succesfully!")
			}else if("fail"==response.responseText){
				alert("Issue creation failed !");
			}
			
      }
  });
	
  return false;
}
}
</script>
  
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNyLsAhFt4hIZKeNJYC244jPPayM0GhrY&callback=initialize">
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
</style>
    <script>
/* script */
       var lat = $("#lat").val(); 
    var lng = $("#lng").val();
        var latlng;
 
    function initialize() {
        // set the map to the div with id = map and set the mapOptions as defualt
        map = new google.maps.Map(document.getElementById('map'));
         
        
   
        // get current location with HTML5 geolocation API.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
				console.log(pos);
                document.getElementById('lat').value  =  position.coords.latitude ;
               document.getElementById('lng').value  =  position.coords.longitude;
                  latlng = {lat:position.coords.latitude, lng:position.coords.longitude};
               
                

              
               

            }, function() {
                // if user block the geolocatoon API and denied detect his location
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());

        }
    }
	
  document.getElementById('lat').value = lat;
   document.getElementById('lng').value = lng;


</script>
</body>

</html>
