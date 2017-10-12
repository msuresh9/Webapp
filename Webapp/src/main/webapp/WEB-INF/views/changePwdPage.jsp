<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Admin DashBoard</title>
     
   
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
  
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   
    
    
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
           <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css"/>  
           <script type="text/javascript" src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.2.2/css/select.dataTables.min.css">
    
	<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
     
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/additional-methods.min.js"></script>
    <script>
    $(document).ready(function(){
    $("#myselect").change(function () {
        var end = this.value;
        
        
       if(end=="1")
       {
       $("#container").css("display", "block");
       $("#email").css("display", "none");
       }
       else{
       $("#email").css("display", "block");
       $("#container").css("display", "none");
       }
       
    });
    });
    
    </script>
   
    <script type="text/javascript" language="javascript">

        function DisableBackButton() {
            window.history.forward()
            }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function(evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function() { void (0) }
    </script>
    
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
    @media(min-width:768px) {
    body {
        margin-top: 50px;
    }
}

#wrapper {
    padding-left: 0;
}

#page-wrapper {
    width: 100%;
    padding: 0;
    background-color: #fff;
}

.huge {
    font-size: 50px;
    line-height: normal;
}

@media(min-width:768px) {
    #wrapper {
        padding-left: 225px;
    }

    #page-wrapper {
        padding: 10px;
    }
}

/* Top Navigation */

.top-nav {
    padding: 0 15px;
}

.top-nav>li {
    display: inline-block;
    float: left;
}

.top-nav>li>a {
    padding-top: 15px;
    padding-bottom: 15px;
    line-height: 20px;
    color: #999;
}

.top-nav>li>a:hover,
.top-nav>li>a:focus,
.top-nav>.open>a,
.top-nav>.open>a:hover,
.top-nav>.open>a:focus {
    color: #fff;
    background-color: #000;
}

.top-nav>.open>.dropdown-menu {
    float: left;
    position: absolute;
    margin-top: 0;
    border: 1px solid rgba(0,0,0,.15);
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    background-color: #fff;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.top-nav>.open>.dropdown-menu>li>a {
    white-space: normal;
}

ul.message-dropdown {
    padding: 0;
    max-height: 250px;
    overflow-x: hidden;
    overflow-y: auto;
}

li.message-preview {
    width: 275px;
    border-bottom: 1px solid rgba(0,0,0,.15);
}

li.message-preview>a {
    padding-top: 15px;
    padding-bottom: 15px;
}

li.message-footer {
    margin: 5px 0;
}

ul.alert-dropdown {
    width: 200px;
}

/* Side Navigation */

@media(min-width:768px) {
    .side-nav {
        position: fixed;
        top: 51px;
        left: 225px;
        width: 225px;
        margin-left: -225px;
        border: none;
        border-radius: 0;
        overflow-y: auto;
        background-color: #222;
        bottom: 0;
        overflow-x: hidden;
        padding-bottom: 40px;
    }

    .side-nav>li>a {
        width: 225px;
    }

    .side-nav li a:hover,
    .side-nav li a:focus {
        outline: none;
        background-color: #000 !important;
    }
}

.side-nav>li>ul {
    padding: 0;
}

.side-nav>li>ul>li>a {
    display: block;
    padding: 10px 15px 10px 38px;
    text-decoration: none;
    color: #999;
}

.side-nav>li>ul>li>a:hover {
    color: #fff;
}


    
  
    body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}
          </style>
   
   
   
    </head>
    <body>
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
                 <span><ul class="nav navbar-nav navbar">
				<a href="/GstWebApplication/login/logout" class="btn btn-warning btn-sm" onclick="logout();" style="margin-top: 10px">Logout</a>
			             </ul>
                    </span>
                
                </div>
                 <div class="collapse navbar-collapse navbar-ex1-collapse">
                 <ul class="nav navbar-nav side-nav">
                   <li>
                     <a href="/GstWebApplication/admin/getDetails"><span class="glyphicon glyphicon-"></span>Overview</a>
                   </li>
				   <li>
                     <a href="${pageContext.servletContext.contextPath}/demo">Demo</a>
                   </li>
				   <li class="active">
                     <a href="${pageContext.servletContext.contextPath}/changePassword">Change Password</a>
                   </li>
                
                    <li >
                    
                    <a href="/GstWebApplication/admin/createAgent">Create Agent</a>
						
                    </li>
                  
                   <li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <a href="/GstWebApplication/admin/createOperator">Create Operator</a>
                        </sec:authorize>
                     </li>
                  
                     <li>
                        <a href="/GstWebApplication/admin/showAgents">Agent List</a>
                     </li>
                     
                      
                           <li>
                           <sec:authorize access="hasRole('ROLE_ADMIN')">
                               <a href="/GstWebApplication/admin/getAllOpearator">Operator List</a>
                               </sec:authorize>	
                           </li>
                    
                       
                       
                     <li>
                        <a href="/GstWebApplication/admin/createIssues">Create Issues</a>
                     </li>
                     <li>
                        <a href="/GstWebApplication/admin/showIssues">Show Issues</a>
                     </li>
                    <li>
                        <a href="/GstWebApplication/admin/taskInBackGround">Seller Registration</a>
                     </li>
                     <li>
                        <a href="/GstWebApplication/admin/showallTasksinBackground">Show Seller List</a>
                     </li>
        
                       </ul>
    
                  </div>
      </nav>
             <br>
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
  <h2>Change Password</h2>
  <form action="" name="forgotpassword">

    <label>Enter Current Password</label>
                <input type="text" id="currentpwd" class="form-control" placeholder="Enter Current Password" required autofocus>
				  <label>Enter New Password</label>
                <input type="text" id="newpwd" class="form-control" placeholder="Enter New Password" required >
                  <button type="button" onclick="changePassword();">Submit</button>
  </form>

		  
 <!-- /card-container -->
    </div> 
	</div>
	<script>
	function changePassword(){
		var currentpwd = $('#currentpwd').val();
		var newpwd = $('#newpwd').val();
		alert(currentpwd);
		alert(newpwd);
		$.ajax({
            type: "POST",
            url: "${pageContext.servletContext.contextPath}/updatePassword",
            //data:"oldPassword="+currentpwd + "&newPassword="+newpwd,
          data:"oldPassword="+currentpwd + "&newPassword="+newpwd,
            dataType :"json",
            complete: function(result) {
				console.log(result);
		
	}
		});
	}
	
</script>

    </body>
</html>