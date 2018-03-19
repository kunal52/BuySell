<!DOCTYPE html>
<%@page import="Reusability.models.Item"%>
<%@page import="java.util.List"%>
<%@page import="database.ItemDatabaseOperations"%>
<html>
<head>
<title>
Buyer
</title>
<meta name="description" content="Buying Things = Buying Memories.">
  <meta name="keywords" content="eutilize,reuse,renew,sell,buy,product,reutilize,reutilise,order,new,buyer,items">
  <meta name="author" content="K Nithin Kumar">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Eutilize.com">
  <link rel="shortcut icon" href="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/website/images/cart.png"  type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/w3.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="js/q.css" />
<script src="js/j.js"></script>
<script src="js/d.js"></script>
<style>
	.parallax {
		background-image: url("https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/website/images/mix.jpg");
		max-height: 300px; 
		background-attachment: fixed;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
	}
	body{
		background-color:#E6E6FA;
	}	
.img-thumbnail h4 {
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}
</style>
</head>
<body >
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.html"><img src="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/website/images/1111.png" width="160px" height="43px" style="margin-top:-9px;"></a>
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
<div class="parallax">
<section  class="container-fluid" style=" padding:10px;">
	<header style="margin-top:120px;margin-bottom:70px; ">
		<div class="text-center">
			<b><h1 style="color:white;font-family:Arial Black, Gadget, sans-serif ;text-shadow:0px 5px 5px black;">Buying Things = Buying Memories</h1></b>
			 <a href="#modal" ><button class="btn btn-danger btn-lg" style="margin-left:10px; margin-top:20px;margin-bottom:10px;" data-toggle="modal" data-backdrop="static" data-target="#modal">Order Any Home Product</button></a>
		</div>
	</header>
</section>
</div>

<form name="autocomplete" method="post">
		<div class="col-md-8 col-md-offset-2">
			<div class="input-group"style="margin-top:50px;">
				<input type="text" class="form-control input-lg" name="txt_items" id="txt_items" placeholder="Search Your Product">
				<div class="input-group-btn">
					<button class="btn btn-primary btn-lg" ><i class="glyphicon glyphicon-search" ></i></button>
				</div> 
			</div>
		</div>
</form>


<section class="container-fluid" style="padding-bottom:100px;">
<aside class="col-md-3 text-center" style="margin-top:50px;">
					<div class="modal fade" id="modal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button class="close" data-dismiss="modal">&times;</button>
									<h3>Order us</h3>
								</div>
								<div class="modal-body">
								<strong><h4><b>You can also order Grossary and Stationery Products from our website by simply using our mobile number</b></h4></strong>
									<strong><h4>NOTE:</h4></strong>
									<li class="text-center">Items less than &#8377;10 ROOM DELIVERY costs &#8377;1</li>
									<li class="text-center">Items greater than &#8377;10 less than &#8377;20 ROOM DELIVERY costs &#8377;2</li>
									<li class="text-center">Items greater than &#8377;20 and less than &#8377;50 ROOM DELIVERY costs &#8377;3</li>
									<li class="text-center">Items greater than &#8377;50 ROOM DELIVERY costs &#8377;5</li>
								</div>
								<div class="caption"><h4><strong>Mobile Number - 7783860428</strong></h4></div>
								<li>You can also whatsapp us</li>
								<li>Paytm Available</li>
							</div>
						</div>
					</div>
  <table class="table table-bordered" style="spacing:30px;">
     <tr class="info">
        <th class="text-center"><b><a href="buy.jsp">ALL PRODUCTS</a></b></th>
      </tr>
    <tbody>
      <tr>
        <td><a href="buy.jsp?type=appliances" type="Appliances"><strong>Appliances</strong></a>
		</td>
      </tr>
	  <tr>
         <td><a href="buy.jsp?type=phones" type="Phones & Tablets"><strong>Smart Phones and Tablets</strong></a>
		</td>
      </tr>
	  <tr>
         <td><a href="buy.jsp?type=laptops" type="Laptops & Desktops"><strong>Laptops & Desktops</strong></a>
		</td>
      </tr>
	  <tr>
        <td><a href="buy.jsp?type=accessories" type="Electronics Accessories"><strong>Electronic Accessories</strong></a>
		</td>
      </tr>
	  <tr>
        <td><a href="buy.jsp?type=watches" type="Watches"><strong>Watches</strong></a></td>
      </tr>
	   <tr>
        <td><a href="buy.jsp?type=books" type="Books"><strong>Books</strong></a></td>
      </tr>
	  <tr>
        <td><a href="buy.jsp?type=others" type="Others"><strong>Others</strong></a></td>
      </tr>
    </tbody>
  </table>
</aside>
<div class="container col-md-9" >


<% ItemDatabaseOperations items=new ItemDatabaseOperations();
int pageSize=12;
int offset=0;
int pageNo=0;
String type="all";
List<Item>list;

	try
	{
  		 pageNo=Integer.parseInt(request.getParameter("page"))-1;
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
	if(request.getParameter("txt_items")!=null)
	{
		
		list=items.getItemsWithSearch(request.getParameter("txt_items"));
			
	}
	else
	{
	
   list=items.getItems(pageSize, offset, type);
	}
	
	
	if(list.size()==0)
	{
		%>
		
		
		<H4 class="text-center" style="margin-top:100px;">No Items Found</H4>
		
		<% 
	}
	
	else
	
   for(Item i:list)
   {
	   String id="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/productImage/"+i.getId()+".jpg";

%>

<a href="buyer.jsp?id=<%=i.getId()%>">
        <div class="col-md-3" style="margin-top:50px;">
            <div class="img-thumbnail">
                <img src="<%=id %>" class="img-responsive"  style="min-height:180px;max-height:180px;min-width:200px;max-width:200px;">
				<div class="caption">
					<h4 style="color:blue;"><%= i.getName() %></h4>
					<h4 >Price:&#8377; <%= i.getPrice() %></h4>
				</div>
            </div>
        </div>
</a>
<%} %>

</div>
</section>		
<section  class="container-fluid">								
	<div class="text-center">											
		<ul class="pagination">
			<li class="active"><a href="buy.jsp?page=<%=pageNo-1%>">previous</a></li>

			<%	
			System.out.print(Math.ceil(ItemDatabaseOperations.getTotalItems()/12));
			for(int i=0;i<=Math.ceil(ItemDatabaseOperations.getTotalItems()/12);i++)
			{
			%>
			<li><a href="buy.jsp?page=<%=i+1%>"><%=i+1%></a></li>
				<%} %>
			<li class="active"><a href="buy.jsp?page=<%=pageNo+1%>">Next</a></li>
		</ul>
	</div>
</section>
<section class="container-fluid" style= "background:black;opacity:0.9;">
		<div class="col-md-4 " style="margin-top:20px;color:gainsboro;padding:2px;line-height:30px;height:500px;">
			<div class="page-header text-center">
				<h3>About</h3>
			</div>
		<p style="color:gainsboro;" class="col-md-offset-1">Eutilize is India's online based secure website founded with the idea that unlock new value
		for customer and take the customer satisfaction to a whole new place .<br> A new idea of belief with renewing the product rather than repairing which 
		give our customer a whole new experience of service.<br>We also provide services which fulfill the daily need and demand of the customer.</p>
		</div>
		<div class=" col-md-3 col-sm-offset-1 " style="margin-top:20px;color:gainsboro;padding:2px;line-height:40px;">
			<div class="page-header text-center">
				<h3>Quick Links</h3>
			</div>
			<ul class="col-sm-offset-1" style="color:gray;">
				<li><h4><a href="about.html" style="color:gainsboro;">About</a><h4></li>
				<li><h4><a href="contactus.html" style="color:gainsboro;">Contact Us</a><h4></li>
				<li><h4><a href="support.html" style="color:gainsboro;">Support</a><h4></li>
			</ul>
		</div>
		<div class="col-md-3 col-md-offset-1" style="margin-top:20px;color:gainsboro;padding:2px;line-height:50px;">
		<div class="page-header text-center">
		<h3>Details</h3>
		</div>
		<ul  style="color:gray;">
			<li style="color:gainsboro;"><h4 id="h">Register Address:<br>LC Block-A Room No.714 Chandigarh University<br> Gharuan , Punjab<h2></li>
			<li style="color:gainsboro;"><h4 id="h">Email-id:<br>contact@eutilize.com<h4></li>
			<li style="color:gainsboro;"><h4 id="h">Mobile No:<br>7837629907<h4></li>
			<li style="color:gainsboro;"><h4 id="h">Whatsapp No:<br>7018820603<h4></li>
		</ul>
		</div>
</section>
</body>
</html>
