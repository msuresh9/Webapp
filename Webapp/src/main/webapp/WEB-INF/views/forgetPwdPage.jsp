<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.min.js"></script>
<style>
* {
  margin: 0;
  padding: 0;
}

body {
  font-family: "Open Sans";
  font-size: 14px;
}

.container {
  width: 500px;
  margin: 25px auto;
}

form {
  padding: 20px;
  background: #2c3e50;
  color: #fff;
  -moz-border-radius: 4px;
  -webkit-border-radius: 4px;
  border-radius: 4px;
}
form label,
form input,
form button {
  border: 0;
  margin-bottom: 3px;
  display: block;
  width: 100%;
}
form input {
  height: 25px;
  line-height: 25px;
  background: #fff;
  color: #000;
  padding: 0 6px;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
form button {
  height: 30px;
  line-height: 30px;
  background: #e67e22;
  color: #fff;
  margin-top: 10px;
  cursor: pointer;
}
form .error {
  color: #ff0000;
}
</style>
    </head>
    <body>
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            
              <div class="navbar-header">
                 <button type ="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                     <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="#">Logo</a>	
				
            </div>
                
    </nav>
     &nbsp &nbsp &nbsp&nbsp&nbsp
     &nbsp &nbsp &nbsp&nbsp&nbsp
     &nbsp &nbsp &nbsp&nbsp&nbsp
     &nbsp &nbsp &nbsp&nbsp&nbsp
     &nbsp &nbsp &nbsp&nbsp&nbsp
     &nbsp &nbsp &nbsp&nbsp&nbsp
     &nbsp &nbsp &nbsp&nbsp&nbsp
     &nbsp &nbsp &nbsp&nbsp&nbsp
     &nbsp &nbsp &nbsp&nbsp&nbsp
<div class="container">
  <h2>Forgot Password</h2>
  <form id="getotp" action="" name="forgotpassword">
    <label>Enter Registered Mail Address</label>
    <input type="text" id="inputEmail" class="form-control" placeholder="Enter Registred mail address" required autofocus>
    <button id="submit" onclick="getotp()" type="button">Submit</button>
  </form>
   
  <form id="checkotp" name="forgotpassword" style="display:none">
    <label>Enter Forgot OTP</label>
    <input type="text" id="otp" class="form-control" placeholder="Enter forgot OTP" required autofocus>
	<label>Enter New Password</label>
    <input type="password" id="password" class="form-control" placeholder="Enter Password" required>
    <button id="submit" onclick="checkotp()" type="button">Submit</button>
  </form>
    </div> 
    
    </body>
	
	<script>
	var email;
			function getotp(){
		
		 email = $('#inputEmail').val();
        $.ajax({
            type: "GET",
            url: "${pageContext.servletContext.contextPath}/otpSendEmail",
            data:"email="+email,
            dataType :"json",
            complete: function(result) {
				if("success"==result.responseText){
				alert("Forgot Password OTP sent to your Email!");
				$("#getotp").css("display", "none");
			  $("#checkotp").css("display", "block");
			}else if("fail"==result.responseText){
				alert("Please Enter Registered Email !");
			}
			
        }
             
			  
		
});
		}
		function checkotp(){
			var otp = $('#otp').val();
			var password = $('#password').val();
			console.log(otp);
			console.log(email);
			 $.ajax({
            type: "POST",
            url: "${pageContext.servletContext.contextPath}/checkopt",
            data:"email="+email + "&password="+password + "&otp="+otp,
            dataType :"json",
            complete: function(result) {
				console.log(result);
				if("success"==result.responseJSON.status){
				alert(" Password Updated Successfully!");
				window.location = "${pageContext.servletContext.contextPath}/login/loginPage";
			}else if("fail"==result.responseJSON){
				alert("Please Enter Registered Email !");
			}
			
        }
             
			  
		
});
			
		}
		
	
	
	
	</script>
</html>