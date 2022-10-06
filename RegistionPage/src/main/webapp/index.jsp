<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp page</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body style="background:url(imge/pexels-oliver-sjöström-1433052.jpg);background-size:cover;background-attachment:fixed;">
<div class="container">
<div class="row">
<div class="col m6 offset-m3">
<div class="card">
<div class="card-content">
<h3>Register here!!</h3>
<h5 id="msg"></h5>
<div class="form center-align">
<form action="Register" method="post" id="myForm" enctype="multipart/form-data">
<input type="text" name="username" placeholder="enter your name">
<input type="text" name="user_email" placeholder="enter your email">
<input type="password" name="user_password" placeholder="enter your password">
<div class="file-field input-field">
      <div class="btn blue">
        <span>File</span>
        <input type="file" name="image">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
<button type="submit" class="btn red">submit</button>
</form>
</div>
<div class="loader center-align" style=margin-top:10px;>
<div class="preloader-wrapper active">
    <div class="spinner-layer spinner-red-only">
      <div class="circle-clipper left">
        <div class="circle"></div>
      </div><div class="gap-patch">
        <div class="circle"></div>
      </div><div class="circle-clipper right">
        <div class="circle"></div>
      </div>
    </div>
  </div>
<h5> please wait..</h5>

</div>

</div>

</div>

</div>

</div>

</div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	
console.log("ready function....")
$("#myForm").on('submit',function(event)
	event.preventDefault();
	let f1= new FormData(this);
var f=$(this).serialize();
console.log(f);
$(".loader").show();
$(".form").hide();
$.ajax({
	url: "Register"
	data: f,
	type: 'POST'
	success:function (data,textStatus,jqXHR){
		
		console.log(data);
		console.log("success............");
		 $(".loader").hide();
		$(".form").show(); 
		if(data.trim()=== 'done'){
			$("#msg").html("succesfully register");
			$("#msg").addClass("green-text");
		}else{
			if(data.trim()=== 'done'){
				$("#msg").html("something is wrong");
				$("#msg").addClass("red-text");
		}
		
	},
	error: function (jqXHR,textStatus,errorThrown){
		console.log(data);
		console.log("error............"); 
		 $(".loader").hide();
		$(".form").show(); 
		$("#msg").html("something is wrong ");
			$("#msg").addClass("red-text");
	
	
})
processData:false,
contentType:false
		
		
})

		
}) 

</script>
</body>
</html>