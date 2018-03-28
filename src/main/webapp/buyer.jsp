<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="database.ItemDatabaseOperations"%>
<%@page import="Reusability.models.*"%>
<html>
<head>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115532154-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115532154-1');
</script>


<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-1343309596406849",
    enable_page_level_ads: true
  });
</script>
<title>
Product
</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=0">
<link rel="shortcut icon" href="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/website/images/cart.png"  type="image/x-icon">
  <meta name="theme-color" content="#2c2c2c">
  <meta name="msapplication-navbutton-color" content="#2c2c2c">
  <meta name="apple-mobile-web-app-status-bar-style" content="#2c2c2c">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/sweetalert.min.js"></script>
<style>
.img-thumbnail h4 {
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}
.infolink:before
{
    content: '!';
    display: inline-block;
    font-family: sans-serif;
    font-weight: bold;
    text-align: center;
    width: 2.5ex;
    height: 2.5ex;
    font-size: 1.4ex;
    line-height: 1.8ex;
    border-radius: 1.6ex;
    margin-right: 4px;
    padding: 2px;
    color: white;
    background: black;
    text-decoration: none;
}
body{
	background-color:rgb(242, 240, 208);
}

input[type=number]::-webkit-inner-spin-button, 
	input[type=number]::-webkit-outer-spin-button { 
	-webkit-appearance: none; 
	margin: 0; 
	}
input[type=number] {
    -moz-appearance:textfield;
	}
@media only screen and (max-width: 768px) {
    .btn{
        display: block;
        margin-left: 25%;

    }
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
.price {
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
		 <a class="navbar-brand" href="https://www.eutilize.com"><img src="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/website/images/1111.png" width="160px" height="43px" style="margin-top:-9px;"></a>
		</div>
		    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
	  <li class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown">Product<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a  href="sell.html">Sell A Product</a>	</li>
					<li><a  href="buy.jsp">Buy A Product</a></li>
					<li><a  href="renew.html" onclick="sweetAlert('Sorry', 'Service will be opened soon', 'error');" class="" data-toggle="modal" href='#modale-id'>Renew Product</a></li>
					<li><a  href="recycle.html" onclick="sweetAlert('Sorry', 'Service will be opened soon', 'error');" class="" data-toggle="modal" href='#modale-id'>Recycle Product</a></li>
				</ul>
			</li>
	  <li><a href="about.html">About</a></li>
        <li><a href="contactus.html">Contact us</a></li>
        <li><a href="support.html">Support</a></li>
      </ul>
    </div>
  </div>
</nav>
	</div>
</nav>

<div data-WRID="WRID-152180887166265409" data-widgetType="Push Content"  data-class="affiliateAdsByFlipkart" height="600" width="120"></div>
<script async src="//affiliate.flipkart.com/affiliate/widgets/FKAffiliateWidgets.js"></script>
<div data-WRID="WRID-152180886549857847" data-widgetType="Push Content"  data-class="affiliateAdsByFlipkart" height="250" width="300" class="pull-right"></div>
<script async src="//affiliate.flipkart.com/affiliate/widgets/FKAffiliateWidgets.js"></script>
<ol class="container-fluid page-header" >
		   <h2 class="text-center" style="text-shadow:0px 2px 2px black;"> PRODUCT </h2>
		</ol>
		<section>
        <div class="row product">
            <center><div class="col-md-5"><img class="img-responsive" src="<%=image_link%>" style="max-height:350px;min-height:350px;"></div></center>
            <div class="col-md-7">
                <h2><%=item.getName()%></h2>
                <p><%=item.getDescription() %> </p>
                <h3>&#8377;<%=item.getPrice() %></h3>
                <button class="btn btn-primary btn-lg" style=" margin-bottom:10px;" data-toggle="modal" data-target="#modal">Buy this Product</button>
            </div>
			<div class="modal fade" id="modal" data-backdrop="static">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
								<button class="close" data-dismiss="modal">&times;</button>
									<h3 class="text-center">Order this Product</h3>
								</div>
								<div class="modal-body">
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
										<label >Phone no:<span style="color:red;font-size:15px;">*</span><span data-target="#cap1" data-toggle="collapse" class="infolink"></span></label>
										<div id="cap1" class="collapse"style="color:red;text-shadow:1px 1px 1px black;">For Contacting Purpose when product is arrived</div>
										<input  name="somename"
												oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
												type = "number"
												maxlength = "10"  min="0" required="required" class="form-control " id="phone" name="phone" pattern="[789][0-9]{9}"  placeholder="Enter your mobile number">
									</div>
									<div class="form-group">
									<label>Address:<span style="color:red;font-size:15px;">*</span></label>
                                <textarea class="form-control" name="address" required="required"  rows="5" placeholder="Enter your address" ></textarea>
                            </div>
								<button class="btn btn-success">Submit Your Order</button>
							</form>
								</div>
							</div>
						</div>
					</div>
        </div>

<section class="container-fluid">
<div data-WRID="WRID-152180887066438132" data-widgetType="Push Content"  data-class="affiliateAdsByFlipkart" height="90" width="728"></div>
<script async src="//affiliate.flipkart.com/affiliate/widgets/FKAffiliateWidgets.js"></script>
<div class="page-header"><h2 class="text-center"style="text-shadow:0px 2px 2px black;margin-top:50px;">You may also like</h2></div>
	<div class="container col-md-9" >
<%for(Item i:list)
			   {
				   String image_source="https://storage.googleapis.com/fir-cloud-7e07e.appspot.com/productImage/"+i.getId()+".jpg"; %>
			
<a href="buyer.jsp?id=<%=i.getId()%>" >
 <div class="col-sm-3" style="margin-top:50px;margin-bottom:20px;">
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
			<li><h4><a href="about.html" style="color:gainsboro;">About</a><h4></li>
			<li><h4><a href="contactus.html" style="color:gainsboro;">Contact Us</a><h4></li>
			<li><h4><a href="support.html" style="color:gainsboro;">Support</a><h4></li>
		</ul>
		</div>
		<div class="col-md-3 col-md-offset-1" style="margin-top:20px;padding:2px;line-height:50px;">
			<div class="page-header text-center">
				<h3 style="color:gainsboro;">Details</h3>
			</div>
			<ul>
				<li><h4 style="color:gainsboro;">Address:<br>Chandigarh University<br> Gharuan , Punjab<h2></li>
				<li><h4 style="color:gainsboro;">Email-id:<br>support@eutilize.com<h4></li>
				<li><h4 style="color:gainsboro;">Mobile No:<br> +91 7837629907<h4></li>
				<li><h4 style="color:gainsboro;">Whatsapp No:<br>+91 7018820603<h4></li>
			
			</ul>
		</div>
</section>
</body>
</html>