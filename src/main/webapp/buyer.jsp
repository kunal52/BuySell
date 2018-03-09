<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="database.ItemDatabaseOperations"%>
<%@page import="Reusability.models.*"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&subset=cyrillic,latin,greek,vietnamese">
    <link rel="stylesheet" href="assets/web/assets/mobirise-icons-bold/mobirise-icons-bold.css">
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/mobirise/css/style.css">
	<link rel="stylesheet" href="assets/mobirise-slider/style.css">
	<link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/sweetalert.min.js"></script>
<style>
#t {
    border-color:black;
}
body{
	background-color:rgb(242, 240, 208);
}
.img-responsive,
.thumbnail > img,
.thumbnail a > img,
.carousel-inner > .item > img,
.carousel-inner > .item > a > img {
  display: block;
  max-width: 100%;
  height: auto;
}
input[type=number]::-webkit-inner-spin-button, 
	input[type=number]::-webkit-outer-spin-button { 
	-webkit-appearance: none; 
	margin: 0; 
	}
input[type=number] {
    -moz-appearance:textfield;
	}
</style>
<script>
function formValidation()  
{   
var phone = document.forms["myForm"]["phone"].value;
var phoneNum = phone.replace(/[^\d]/g, '');
if( phoneNum.length == "")
{
return true; 
}
 else if (phoneNum.charAt(0)!="9" && phoneNum.charAt(0)!="8" && phoneNum.charAt(0)!="7" && phoneNum.charAt(0)!="6" && phoneNum.charAt(0)!="0")
           {
                alert("enter the correct number");
                return false
           }
		   else if(phoneNum < 0)
		   {
		    alert("number cant be negative ");
                return false
		   }
else if(phoneNum.length > 9 && phoneNum.length < 12 ) {  
return true; 
} 
else
{
alert("enter the valid phone number");
return false;
}
}
</script>
</head>

<%

	String id=request.getParameter("id");
    ItemDatabaseOperations itemOperation=new ItemDatabaseOperations();
	Item item=itemOperation.getItem(id);
	String image_link="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/productImage/"+item.getId()+".jpg";

	 int pageSize=10;
	 int offset=0;
	   int pageNo=0;
	   String type="all";
		try
		{
	  		 pageNo=Integer.parseInt(request.getParameter("page"));
		}catch(Exception e){
			 pageNo=0;
		}
		offset=pageNo*pageSize;
	   	
		try
		{
			 type=request.getParameter("type");
		}catch(Exception e)
		{
			 type="all";
		}

   
   List<Item>list=itemOperation.getItems(10, 0, item.getType());
   Iterator<Item>iterable=list.iterator();
   while(iterable.hasNext())
   {
	   if(iterable.next().getId()==id)
		   {
		    iterable.remove();
		   break;
		   }
   }
   
%>


<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.html"><img src="images/1111.png" width="160px" height="43px" style="margin-top:-9px;"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="about.html">About</a></li>
        <li><a href="contactus.html">Contact us</a></li>
        <li><a href="support.html">Support</a></li>
      </ul>
    </div>
  </div>
</nav>
<section>
    <div class="container-fluid">
		<ol class="breadcrumb" style="margin-top:100px;">
		   <h3 class="text-center"> PRODUCT </h3>
		</ol>
        <div class="row product" >
            <div class="col-md-5 col-md-offset-0" ><img class="img-responsive" style=" max-height: 400px;" src="<%=image_link%>"></div>
				<div class="col-md-7">
					<h2><%=item.getName()%></h2>
					<h3><strong>Price:</strong>&#8377;<%=item.getPrice() %>  </h3>
					<div class="page-header" id="t">
						<h4><strong style="font-size:22px;"><%=item.getDescription() %></strong></h4>
					</div>
						<p> </p>
				    <button class="btn btn-danger lg" data-target="#cap" data-toggle="collapse">Order The Product</button>
					<div id="cap" class="collapse">
						<div>
							<form name='myForm' onSubmit="return formValidation();" method="post" action="ordered.jsp?id=<%= item.getId() %>">
								<p class="pull-right"><span style="color:red;font-size:15px;">*</span> Feilds Are Mandatory</p>
									<div class="form-group">
										<label style="margin-top:20px;">Buyer Name:<span style="color:red;font-size:15px;">*</span></label>
										<input type="text"  required="required" class="form-control" name="username" id="name" placeholder="Enter your name">
									</div>
									<div class="form-group">
										<label>Email-id:<span style="color:red;font-size:15px;">*</span></label>
										<input type="email"  required="required" class="form-control" name="email" id="email" placeholder="Enter your Email-id">
									</div>
									<div class="form-group">
										<label >Phone no:<span style="color:red;font-size:15px;">*</span><span data-target="#cap1" data-toggle="collapse" class=" glyphicon glyphicon-exclamation-sign"></span></label>
										<div id="cap1" class="collapse"style="color:red;text-shadow:1px 1px 1px black;">For Contacting Purpose when product is arrived</div>
										<input type="number"  min="0" required="required" class="form-control " id="phone" name="phone" pattern="[789][0-9]{9}"  placeholder="Enter your mobile number">
									</div>
									
									
									
								<button class="btn btn-success"   >Submit Your Order</button>
							</form>
						</div>
					</div>
				</div>
        </div>  
	</div>
</section>
<section class="container-fluid">
<div class="page-header"><h2 class="text-center"><strong>Related Products</strong></h2></div>
	<div class="container col-md-9" >

<%for(Item i:list)
			   {
				   String image_source="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/productImage/"+i.getId()+".jpg"; %>
			


		<a href="buyer.jsp?id=<%=i.getId()%>">
			 <div class="col-md-3" style="margin-top:50px;">
					<div class="thumbnail">
						<img src="<%=image_source %>" class="img-responsive" style="height:200px;min-width:200px;">
						<div class="caption">
							<h4 class="pull-right"  >&#8377; <%= i.getPrice()%></h4>
							<h4 style="color:blue;"><%= i.getName()%></h4>
						</div>
					</div>
			</div>
		</a>
<%} %>
	</div>	
</section>
<section class="container-fluid" style= "background:black;opacity:0.9;">
		<div class="col-md-4 " style="margin-top:20px;color:gainsboro;padding:2px;line-height:30px;height:500px;">
			<div class="page-header text-center">
				<h3 style="color:gainsboro;">About</h3>
			</div>
			<p style="color:gainsboro;" class="col-md-offset-1">Eutilize is India's online based secure website founded with the idea that unlock new value
			for customer and take the customer satisfaction to a whole new place .<br> A new idea of belief with renewing the product rather than repairing which 
			give our customer a whole new experience of service.<br>We also provide services which fulfill the daily need and demand of the customer.</p>
		</div>
		<div class=" col-md-3 col-sm-offset-1 " style="margin-top:20px;color:gainsboro;padding:2px;line-height:40px;">
			<div class="page-header text-center">
				<h3 style="color:gainsboro;">Quick Links</h3>
			</div>
		<ul class="col-sm-offset-1" style="color:gray;">
			<li><h4><a href="about.html" style="color:gainsboro;">About Us</a><h4></li>
			<li><h4><a href="contactus.html" style="color:gainsboro;">Contact Us</a><h4></li>
			<li><h4><a href="support.html" style="color:gainsboro;">Customer Feedback</a><h4></li>
		</ul>
		</div>
		<div class="col-md-3 col-md-offset-1" style="margin-top:20px;color:gainsboro;padding:2px;line-height:40px;">
			<div class="page-header text-center">
				<h3 style="color:gainsboro;">Details</h3>
			</div>
			<ul  style="color:gray;">
				<li style="color:gainsboro;"><h4 id="h">Register Address:<br>LC Block-A Room No.714 Chandigarh University<br> Gharuan , Punjab<h2></li>
				<li style="color:gainsboro;"><h4 id="h">Email-id:<br>xyz@gmail.com<h4></li>
				<li style="color:gainsboro;"><h4 id="h">Mobile No:<br>9876543210<h4></li>
				<li style="color:gainsboro;"><h4 id="h">Whatsapp No:<br>9876543210<h4></li>
			</ul>
		</div>
</section>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>