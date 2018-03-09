<%@page import="database.ItemDatabaseOperations"%>
<%@page import="Reusability.models.ItemBuyer"%>
<%@page import="database.BuyerDataBaseOperation"%>
<%@page import="Reusability.models.Buyer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	
	
	<%
		
		String product_id=request.getParameter("id");
		String name=request.getParameter("username");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		
		Buyer b=new Buyer();
		b.setName(name);
		b.setEmail(email);
		b.setPhone_no(phone);
		b.setAddress("Addresss");
		ItemDatabaseOperations itemDatabaseOperations=new ItemDatabaseOperations();
		BuyerDataBaseOperation.addBuyItemTransaction(new ItemBuyer(b,itemDatabaseOperations.getItem(product_id)));
	%>
	
	
	<h1>Order Recieved</h1>
	
	
</body>
</html>