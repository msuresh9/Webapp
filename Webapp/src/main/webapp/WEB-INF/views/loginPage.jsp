<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
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
form select{
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
<script>
$(function() {
 
  $("form[name='registration']").validate({
    // Specify validation rules
    rules: {
    
      email: {
        required: true,
        // Specify that email should be validated
        // by the built-in "email" rule
        email: true
      },
      password: {
        required: true,
        minlength: 5
      }
    },
    // Specify validation error messages
    messages: {
     
      password: {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
      email: "Please enter a valid email address"
    },
   
    submitHandler: function(form) {
      form.submit();
    }
  });
});
</script>


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
  <h2>Please Login</h2>
  <form name="registration" action="../j_spring_security_check" method='POST'>
   <span colspan="2" style="color:red;">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} </span>

    <label for="username">Email</label>
    <input type="email" name="j_username" id="email" placeholder="john@doe.com">
    <label for="password">Password</label>
    <input type="password" name="j_password" id="password" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;">
    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
    
    <button type="submit">Login</button>
      <a href="/GstWebApplication/login/forgetpwd" class="forgot-password">
                Forgot the password?
            </a> 
  </form>
     
			  

</div>
</body>
<html>