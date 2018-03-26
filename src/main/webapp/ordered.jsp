<%@page import="mailapi.SendEmail"%>
<%@page import="database.ItemDatabaseOperations"%>
<%@page import="Reusability.models.ItemBuyer"%>
<%@page import="database.BuyerDataBaseOperation"%>
<%@page import="Reusability.models.Buyer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>Order</title>
<!-- Global site tag (gtag.js) - Google Analytics -->
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	
	
	<%
		
		String product_id=request.getParameter("id");
		String name=request.getParameter("username");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		
		Buyer b=new Buyer();
		b.setName(name);
		b.setEmail(email);
		b.setPhone_no(phone);
		b.setAddress(address);
		ItemDatabaseOperations itemDatabaseOperations=new ItemDatabaseOperations();
		String tid=BuyerDataBaseOperation.addBuyItemTransaction(new ItemBuyer(b,itemDatabaseOperations.getItem(product_id)));
	%>
	
	
	
	
	<link href="success/suc.css" rel="stylesheet" id="bootstrap-css">
	<script src="success/succ.js"></script>
	<script src="success/succe.js"></script>
	<div class="container"style="margin-top:100px;">
	<div class="row text-center">
        <div class="col-sm-6 col-sm-offset-3">
        <br><br> <h2 style="color:#0fad00">Success</h2>
     <img src="http://www.animatedimages.org/data/media/1574/animated-success-image-0010.gif" border="0" alt="animated-success-image-0010" />
        <h3>Your Order is placed successfully</h3>
        <a href="buy.jsp" class="btn btn-success"> Go Back </a>
    <br><br>
        </div>
	</div>
</div>
	
	
</body>
</html>
