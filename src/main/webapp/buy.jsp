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
  <meta name="theme-color" content="#2c2c2c">
  <meta name="msapplication-navbutton-color" content="#2c2c2c">
  <meta name="apple-mobile-web-app-status-bar-style" content="#2c2c2c">
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
	input[type=number]::-webkit-inner-spin-button, 
	input[type=number]::-webkit-outer-spin-button { 
	-webkit-appearance: none;
    appearance: none;
    margin: 0;  
	}
	input[type=number] {
    -moz-appearance:textfield;
	}
.col-item
{
    border: 1px solid #E1E1E1;
    border-radius: 5px;
    background: #FFF;
}
.col-item .photo img
{
    margin: 0 auto;
    width: 100%;
}

.col-item .info
{
    padding-left: 10px;
    border-radius: 0 0 5px 5px;
    margin-top: 1px;
}

.col-item:hover .info {
    background-color: #F5F5DC;
}
.col-item .price
{
    float: left;
    margin-top: 5px;
}

.col-item .price h5
{
    line-height: 2px;
    margin: 0;
}

.price-text-color
{
    color: #219FD1;
}
.price h4{
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
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
 else if (phoneNum.charAt(0)!="9" && phoneNum.charAt(0)!="8" && phoneNum.charAt(0)!="7" && phoneNum.charAt(0)!="0")
           {
                alert("enter the correct number");
                return false
           }
		   else if(phoneNum < 0)					
		   {
		    alert("number cant be negative ");
                return false
		   }
else if(phoneNum.length > 9 && phoneNum.length < 11 ) {  
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
<body >
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="https://www.eutilize.com"><img src="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/website/images/1111.png" width="160px" height="43px" style="margin-top:-9px;"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
	  	<li><a href="sell.html">Sell A Product</a></li>
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
			 <a href="#modal" ><button class="btn btn-danger btn-lg" style=" margin-top:20px;margin-bottom:10px;" data-toggle="modal" data-backdrop="static" data-target="#modal">Notify Any Product</button></a>
		</div>
		<div data-WRID="WRID-152180887166265409" data-widgetType="Push Content"  data-class="affiliateAdsByFlipkart" height="600" width="120" class="col-md-1">
		</div>
		<script async src="//affiliate.flipkart.com/affiliate/widgets/FKAffiliateWidgets.js"></script>
<div data-WRID="WRID-152180886549857847" data-widgetType="Push Content"  data-class="affiliateAdsByFlipkart" height="250" width="300" class="col-md-offset-10">
</div>
<script async src="//affiliate.flipkart.com/affiliate/widgets/FKAffiliateWidgets.js"></script>
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
<div data-WRID="WRID-152180887166265409" data-widgetType="Push Content"  data-class="affiliateAdsByFlipkart" height="600" width="120" class="pull-right">
</div>
<script async src="//affiliate.flipkart.com/affiliate/widgets/FKAffiliateWidgets.js"></script>

		</div>
</form>
<section class="container-fluid" style="padding-bottom:100px;">
<aside class="col-md-3" style="margin-top:50px;">
					<div class="modal fade" id="modal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header text-center">
								<button class="close" data-dismiss="modal">&times;</button>
									<strong><h3>Fill your product details</h3></strong>
									<strong class=" pull-left">NOTE:</strong><br>
								<li class="caption" >
								Submit Your Product what you need we will notify you when product is available</li>
								<li>you can order any new or old products</li>
								</div>
								<div class="modal-body">
									<form name='myForm' id="f" action="notifyme.jsp"  onSubmit="return formValidation();" method="post">
									<p class="pull-right"style="color:black;"><span style="color:red;font-size:15px;">*</span> Feilds Are Mandatory</p>
										<div class="form-group">
											<label style="margin-top:20px;">Customer Name:<span style="color:red;font-size:15px;">*</span></label>
											<input type="text"  required="required" class="form-control" name="username" id="name" placeholder="Enter your name">
										</div>
										<div class="form-group">
											<label>Product Name:<span style="color:red;font-size:15px;">*</span></label>
											<input type="text"  required="required" class="form-control" name="pname" id="pname"placeholder="Enter your product name">
										</div>
										<div class="form-group">
										<label>Email-id:<span style="color:red;font-size:15px;">*</span></label>
										<input type="email"  required="required" class="form-control" name="email" id="email" placeholder="Enter your Email-id">
										</div>
										<div class="form-group">
										<label >Phone no:<span style="color:red;font-size:15px;">*</span><span data-target="#cap1" data-toggle="collapse" class="glyphicon glyphicon-exclamation-sign"></span></label>
										<div id="cap1" class="collapse"style="color:red;text-shadow:1px 1px 1px black;">For Contacting Purpose when product is available</div>
										<input  name="somename"
											oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
											type = "number"
											maxlength = "10"  min="0" required="required" class="form-control" id="phone" name="phone" pattern="[789][0-9]{9}"  placeholder="Enter your mobile number">
										</div>
										<div class="form-group">
											<label>Product Description:<span style="color:red;font-size:15px;">*</span></label> 
											<textarea class="form-control" name="description" rows="4" placeholder="Enter The Product Description...."></textarea>
										</div>
										<button class="btn btn-success"  style="width:100px;">Submit</button>
									</form>
								</div>
						</div>
					</div>
					</div>
  <table class="table table-bordered text-center" style="spacing:30px;">
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
<div data-WRID="WRID-152180887066438132" data-widgetType="Push Content"  data-class="affiliateAdsByFlipkart" height="90" width="728">
</div>
<script async src="//affiliate.flipkart.com/affiliate/widgets/FKAffiliateWidgets.js"></script>
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
<a href="buyer.jsp?id=<%=i.getId()%>" >
 <div class="col-sm-3" style="margin-top:50px;">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="<%=id %>" class="img-responsive" alt="product image" style="min-height:200px;max-height:200px;" />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-11">
                                            <h4><%= i.getName() %></h4>
                                            <h4 class="price-text-color">Price:&#8377; <%= i.getPrice() %></h4>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
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
		
	<%
				
				if(pageNo>=1)
				{
					
					%>
					
					<li class="active"><a href="buy.jsp?page=<%=pageNo%>" onclick="displayData(11,1,0,'A')" onmouseover="displayData(11,1,0,'A')" style="cursor: pointer;">previous</a></li>
						
					<% 
					
				}
			
			%>
			

			<%	
			int totalPages=(int)Math.ceil(ItemDatabaseOperations.getTotalItems(type)/12);
			for(int i=0;i<=totalPages;i++)
			{
			%>
			<li><a href="buy.jsp?page=<%=i+1%>"><%=i+1%></a></li>
			
			<%}
			
			if(pageNo<totalPages)
			{
				
				%>
				
				<li class="active"><a href="buy.jsp?page=<%=pageNo+2%>" onclick="displayData(11,1,0,'A')" onmouseover="displayData(11,1,0,'A')" style="cursor: pointer;">Next</a></li>
				
				<% 
			}
			
			%>
					
			
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
			<li style="color:gainsboro;"><h4 id="h">Address:<br>Chandigarh University<br> Gharuan , Punjab<h2></li>
			<li style="color:gainsboro;"><h4 id="h">Email-id:<br>support@eutilize.com<h4></li>
			<li style="color:gainsboro;"><h4 id="h">Mobile No:<br>+91 7837629907<h4></li>
			<li style="color:gainsboro;"><h4 id="h">Whatsapp No:<br>+91 7018820603<h4></li>
		</ul>
		</div>
</section>
</body>
</html>
