<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Admin DashBoard</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link href="css/style.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.min.js"></script>
     <script type="text/JavaScript" src='js/states.js'></script>
    <script type="text/JavaScript" src='validation.js'></script>
    
    <sricpt src="text/Javascript" src='images.js'></sricpt>
    <script type="text/javascript" language="javascript">

        function DisableBackButton() {
            window.history.forward()
            }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function(evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function() { void (0) }
    </script>
    
    
  
     
   
    </head>
    <body background="images/backimage.jpg">
        <div id = "wrapper">
           
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            
              <div class="navbar-header">
                 <button type ="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                     <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="Admin.html"></a>	
				
            </div>
                 <div class="nav navbar-right top-nav" >
                  <button class="btn btn-info btn-lg" type="submit">
                       <span class="glyphicon glyphicon-log-out"></span>Logout</button>
                
                </div>
                 <div class="collapse navbar-collapse navbar-ex1-collapse">
                 <ul class="nav navbar-nav side-nav">
                   <li >
                     <a href="Admin.html"><span class="glyphicon glyphicon-"></span>Overview</a>
                   </li>
                 <li class="active">
                    <a href="CreateAgent.html">Create Agent</a>
						
                    </li>
                   <li>
                        <a href="CreateOperator.html">Create Operator</a>
                     </li>
                   
                     <li>
                        <a href="ShowAgents.html">Agent List</a>
                     </li>
                     <li>
                        <a href="ShowOperartor.html">Agent List</a>
                     </li>
                     <li>
                        <a href="CreateIssues.html">Create Issues</a>
                     </li>
                     <li>
                        <a href="ShowIssues.html">Show Issues</a>
                     </li>
                      <li>
                        <a href="Taskinbackground.html">Task in Background</a>
                     </li>
                     <li>
                        <a href="ShowallTasksinBackground.html">Show Task in Background</a>
                     </li>
                     
        
                       </ul>
    
                  </div>
      </nav>
             <br>
			
<div class="container">
  <h2 align="center">Agent Updation</h2>
  <form action="" id="registration" name="registration">
      <label for="IssueId">Agent Id</label>
        <input class="form-control" type="text" name="agentid" id="agentid">
    <label for="firstname">First Name</label>
    <input class="form-control" type="text" name="firstname" id="firstname" placeholder="John">

    <label for="lastname">Last Name</label>
    <input class="form-control" type="text" name="lastname" id="lastname" placeholder="Doe">

    <label for="email">Email</label>
    <input class="form-control" type="email" name="email" id="email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" placeholder="john@doe.com">
	<label for="username">Username</label>
    <input class="form-control" type="text" name="username" id="username" placeholder="johndoe">

    <label for="password">Password</label>
    <input class="form-control" type="password" name="password" id="password" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;">
	
	
      <label for="mobile">Mobileno</label>
    <input class="form-control" type="text" name="mobile" id="mobile"   pattern="[789][0-9]{9}" placeholder="9874563214">
<label for="dob">Date of Birth</label>
    <input class="form-control" type="date" name="dob" id="dob" placeholder="">
	<label for="qual">Qualification</label>
   <select id="qual" name="qual" class="form-control">
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
	<label for="gender">Gender</label>
    <select id="gender" name="gender" class="form-control">
                                    <option value="">Select</option>
                                    <option value="male" >Male</option>
								     <option value="female">Female</option>
                                    </select>
	 
	  <label for="addr1">Addressline1</label>
	  <input class="form-control" type="text"  name="addr1" id="addr1"  placeholder="Enter Address" required/>
	   <label for="addr2">Addressline2</label>
	  <input class="form-control" type="text"  name="addr2" id="addr2"  placeholder="Enter City" required/>
	  
	  <label for="state">State</label>
                        <select id="state" class="form-control"  name="state" onchange="select_district(this.value)" autofocus="" required>
                            
                            
                        </select>
      <label for="District">District</label>
                        <select id="district" class="form-control"  name="district"  autofocus="" required>
                            
                            
                        </select>
	  <label for="country">Country</label>
       <input class="form-control" type="text" name="country" id="country" value="India" placeholder="" disabled="true"/>  
		<label for="autocomplete">Pincode</label>
		<input class="form-control" id="autocomplete" type="text" name="autocomplete" onblur="GetLocation()" placeholder="Enter Pin Code" /> 
      
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
        <label for="bankacc">Bank Account Number</label>
		<input id="bankacc" type="text" class="form-control"   name="bankacc" placeholder="Enter Bank Account Number"  required/>
		<label for="ifsc">IFSC Code</label>
		<input id="ifsccode" type="text" class="form-control"   name="ifsccode" placeholder="Enter IFSC Code"  required/>
		<label for="aadhar">Aadhar Number</label>
		<input id="aadharnumber" type="text" class="form-control"   name="aadharnumber" placeholder="Enter Aadhar Number"  required/>
         <label for="pannum">Pan Card Number</label>
		<input id="pannum" type="text" class="form-control"   name="pannum" placeholder="Enter Pan Card Number"  required/>
		<label for="voter">Voter Id</label>
		<input id="voterid" type="text" class="form-control"   name="voterid" placeholder="Enter Votercard Number" required />
		
		<label for="latitude">Latitude</label>
		<input id="latitude" type="text" class="form-control"   name="latitude" placeholder="" disabled="true"  />
		<label for="longitude">Longitude</label>
		<input id="longitude" type="text" class="form-control"   name="longitude" placeholder="" disabled="true" />
        <label for="recentimage">Upload  Image</label>
        <input id="recentimage" type="file" class="form-control" name="recentimage" required/>
        <input id="response" type="hidden" class="form-control"  required />
        <label for="aadharimage">Upload  Aadhar Card Image</label>
        <input id="aadharimage" type="file" class="form-control" name="aadharimage" required/>
        <input id="response1" type="hidden" class="form-control"  required />
        <label for="panimage">Upload Agent Pan Card Image</label>
        <input id="panimage" type="file" class="form-control" name="panimage" required/>
        <input id="response2" type="hidden" class="form-control"  required />
        <label for="voterimage">Upload Agent Voter Card Image</label>
        <input id="voterimage" type="file" class="form-control" name="voterimage" required/>
        <input id="response3" type="hidden" class="form-control"  required />
        <label for="certificateimage">Upload Degree Certificate</label>
        <input id="certificateimage" type="file" class="form-control" name="certificateimage" required/>
        <input id="response4" type="hidden" class="form-control"  required />
        <label for="agentemail">Agent Email</label>
        <input id="agentemail" type="email" class="form-control" name="agentemail" required/>
      
   <button type="submit" id="reg" onclick="checkAjaxCall();">Register</button>
  </form>

</div>
        </div>
    </body>
    
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
        url: "http://localhost:3030/GstWebApplication/Registration",
        type: 'POST',
        dataType: "json",
        data: {registrationStr:JSON.stringify(json),isAgent: true},
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
      
    
    </script>
    
   
     
        
</html>