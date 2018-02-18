<!DOCTYPE html>
<%@page import="Reusability.models.Item"%>
<%@page import="java.util.List"%>
<%@page import="database.ItemDatabaseOperations"%>
<html>
<head>
<title>
Buyer</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<style>
body{
background: #02111D;
background: -webkit-linear-gradient(to right, #02111D, #037BB5, #02111D); 
background: linear-gradient(to right, #02111D, #037BB5, #02111D);

}
</style>
<script>				
 $(document).ready(function() {

    var aTags = ["Music System","Heater","Fan","Iron","Gyser","Induction","Rice Maker","Toaster","Kettle","Mixer","Grinder","Microwave Oven","Mobile Phones","Watches","Laptops","Tablets","Desktops","Books","Ear Phones","Power Bank","Mouse","Pendrives","Selfiesticks","Smartwatches","Torch"];
    $( "#txt_items" ).autocomplete({
    source: function(req, responseFn) {
        var re = $.ui.autocomplete.escapeRegex(req.term);
        var matcher = new RegExp( "^" + re, "i" );
        var a = $.grep( aTags, function(item,index){
            return matcher.test(item);
        });
        responseFn( a );
    }
});
});		
</script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.html"><img src="images/111.png" width="140px" height="33px" style="margin-top:-7px;"></a>
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
<form name="autopopulate" method="post">
<div class="col-md-8 col-md-offset-2">
<div class="input-group"style="margin-top:150px;">
			<input type="text" class="form-control input-lg" name="txt_items" id="txt_items" placeholder="Search Your Product">
			<div class="input-group-btn">
			<button class="btn btn-primary btn-lg" ><i class="glyphicon glyphicon-search" ></i></button>
			</div> 
		</div>
		</div>
		</form>
		<section class="container-fluid" style="padding-bottom:100px;">
<aside class="col-md-3 text-center" style="margin-top:50px;">
  <table class="table table-bordered" style="spacing:30px;">
      <tr class="info">
        <th class="text-center"><b>ALL PRODUCTS</b></th>
      </tr>
    <tbody>
      <tr>
		<td><a href="#cla" data-toggle="collapse"><strong>Home Appliances</strong></a>
		<div id="cla" class="collapse">
		<a href="">Music System</a><br>
		<a href="">Heater</a><br>
		<a href="">Fan</a><br>
		<a href="">Iron</a><br>
		<a href="">Gyser</a><br>
		<a href="">Others</a></div>
		</td>
      </tr>
      <tr>
        <td><a href="#cla1" data-toggle="collapse"><strong>Kitchen Appliances</strong></a>
		<div id="cla1" class="collapse">
		<a href="">Induction</a><br>
		<a href="">Rice Maker</a><br>
		<a href="">Toaster</a><br>
		<a href="">Kettle</a><br>
		<a href="">Mixer</a><br>
		<a href="">Grinder</a><br>
		<a href="">Microwave Oven</a><br>
		<a href="">Others</a></div>
		</td>
      </tr>
	  <tr>
         <td><a href="#cla3" data-toggle="collapse"><strong>Smart Phones</strong></a>
		<div id="cla3" class="collapse">
		<a href="">Android</a><br>
		<a href="">IOS</a><br>
		<a href="">Windows</a><br>
		<a href="">Featured Phones</a><br></div>
		</td>
      </tr><tr>
         <td><a href="#cla4" data-toggle="collapse"><strong>Laptops,Tablets & Desktops</strong></a>
		<div id="cla4" class="collapse">
		<a href="">Laptops</a><br>
		<a href="">Desktops</a><br>
		<a href="">Tablets</a><br>
		</td>
      </tr>
	  <tr>
        <td><a href="#cla5" data-toggle="collapse"><strong>Electronic Accessories</strong></a>
		<div id="cla5" class="collapse">
		<a href="">Ear Phones</a><br>
		<a href="">Mouse</a><br>
		<a href="">Power Bank</a><br>
		<a href="">Pendrives</a><br>
		<a href="">Selfie Stick</a><br>
		<a href="">Smart Watches</a><br>
		<a href="">Torch</a><br>
		<a href="">Others</a></div>
		</td>
      </tr>
	  <tr>
        <td><a href=""><strong>Watches</strong></a></td>
      </tr>
	   <tr>
        <td><a href=""><strong>Books</strong></a></td>
      </tr>
	  <tr>
        <td><a href=""><strong>Others</strong></a></td>
      </tr>
    </tbody>
  </table>
</aside>


<% ItemDatabaseOperations items=new ItemDatabaseOperations();
	
	//Calculate Offset and Page Size
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
   
   
   
 
   
   List<Item>list=items.getItems(pageSize, offset, type);
   for(Item i:list)
   {
	   String id="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/productImage/3fe15ac6-0e89-4d01-ac35-50a1dbcd66ab.jpg";
	   
%>
<a href="#modal1" data-toggle="modal"><div class="col-md-3" style="margin-top:50px;">
		<div class="thumbnail">
		
				<img src="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/productImage/<%= i.getId() %>.jpg" style="height:150px;">
			<div class="caption">
				<h4 class="pull-right" ><%= i.getName() %></h4>
				<h4 style="color:blue;"><%= i.getPrice() %></h4>
			</div>
		</div>
</div></a>


<%} %>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="modal1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" data-dismiss="modal">&times;</button>
							<h3 class="text-center">Product Description</h3>
						</div>
						<div class="modal-body">
						
						<img src="images/1.jpg" width="300px" height="200px" class="img-block center-block">
						<div class="caption col-md-offset-3">
							<h4>Product Name:</h4>
						    <h4 >Price:</h4>	
						</div>
						<h4 class="page-header text-center">Description</h4>
						<p class="text-center"></p>
						<h4 class="page-header text-center">Location</h4>
						<p class="text-center"></p>
						<h4 class="page-header text-center">Contact Seller</h4>
						<p class="text-center"></p>
						</div>
			         </div>
			    </div>
			</div>	
			</section>
	<section class="container-fluid" style= "background:black;opacity:0.9;">
		<div class="col-md-4 " style="margin-top:20px;color:gainsboro;padding:2px;line-height:30px;height:500px;">
	<div class="page-header text-center">
		<h3>About</h3>
		</div>
<p style="color:gainsboro;" class="col-md-offset-1">Eutilize is India's online based secure company founded with the idea that unlock new value
for customer and take the customer satisfaction to a whole new place .<br> A new idea of belief with renewing the product rather than repairing which 
give our customer a whole new experience of service.</p>
		</div>
		<div class=" col-md-3 col-sm-offset-1 " style="margin-top:20px;color:gainsboro;padding:2px;line-height:40px;">
			<div class="page-header text-center">
		<h3>Quick Links</h3>
		</div>
		<ul class="col-sm-offset-1" style="color:gray;">
			<li><h4><a href="about.html" style="color:gainsboro;">About Us</a><h4></li>
			<li><h4><a href="contactus.html" style="color:gainsboro;">Contact Us</a><h4></li>
			<li><h4><a href="support.html" style="color:gainsboro;">Customer Feedback</a><h4></li>
		</ul>
		</div>
		
			<div class="col-md-3 col-md-offset-1" style="margin-top:20px;color:gainsboro;padding:2px;line-height:40px;">
		<div class="page-header text-center">
		<h3>Details</h3>
		</div>
		<ul  style="color:gray;">
			<li style="color:gainsboro;"><h4 id="h">Register Address:<br>LC Block-A Room No.714 Chandigarh University<br> Gharuan , Punjab<h2></li>
			<li style="color:gainsboro;"><h4 id="h">Email-id:<br>xyz@gmail.com<h4></li>
			<li style="color:gainsboro;"><h4 id="h">Mobile No:<br>9876543210<h4></li>
			<li style="color:gainsboro;"><h4 id="h">Whatsapp No:<br>9876543210<h4></li>
		</ul>
		</div>
		
	</section>
</body>
</html>