<%@page import="java.io.InputStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="database.CloudStorage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
    
<body>
	


<%@page import="database.UserDatabaseOperation"%>
<%@page import="database.ItemDatabaseOperations"%>
<%@page import="Reusability.models.Contact"%>
<%@page import="java.util.UUID"%>
<%@page import="Reusability.models.Item"%>

<%  
String DATA_DIRECTORY = "data";

String username=null;
String email=null;
String phone=null;
String p_name=null;
String p_description=null;
String p_location=null;
String p_price=null;
String p_type=null;
String description="nothing";
String type=null;

InputStream image=null;

System.out.print(String.valueOf(ServletFileUpload.isMultipartContent(request)));


DiskFileItemFactory factory = new DiskFileItemFactory();

//Configure a repository (to ensure a secure temp location is used)
ServletContext servletContext = this.getServletConfig().getServletContext();
File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
factory.setRepository(repository);

//Create a new file upload handler
ServletFileUpload upload = new ServletFileUpload(factory);

String uploadFolder = getServletContext().getRealPath("")
+ File.separator + DATA_DIRECTORY;
	

//Parse the request
List<FileItem> items = upload.parseRequest(request);

Iterator<FileItem> iter = items.iterator();

while (iter.hasNext()) {
    FileItem item = iter.next();

    if (item.isFormField()) {
        switch(item.getFieldName())
        {
        case "username":
        	username=item.getString();
        	break;
        case "email":
        	email=item.getString();
        	break;
        case "phone":
        	phone=item.getString();
        	break;
        case "pname":
        	p_name=item.getString();
        	break;
        case "loc":
        	p_location=item.getString();
        	break;
        case "price":
        	p_price=item.getString();
        	break;
        case "description":
        	description=item.getString();
        	break;
        case "sclt1":
        	type=item.getString();
        	break;
        }
    	
    } else {
    if ("description".equals(item.getFieldName())) {
             description = item.getString();
       }
    	else
      image=item.getInputStream();
        
    String fileName = new File(item.getName()).getName();
    String filePath = uploadFolder + File.separator + fileName;
    File uploadedFile = new File(filePath);
    System.out.println(filePath);
    // saves the file to upload directory
    item.write(uploadedFile);
    }
}


Contact  contact=new Contact("",
							  username,
							  "Last Name",
							  email,
							  "Location",
							  phone,
							  "Extra Detail");

UserDatabaseOperation userDatabaseOperation=new UserDatabaseOperation();

Contact newContact=userDatabaseOperation.insertUser(contact);

Item i=new Item("",
		p_name,
		description,
		type,
		 false,
		 "Issue",
		 p_location,
		 newContact.getId(),
		 Float.parseFloat(p_price),
		 "false"
		 );

ItemDatabaseOperations itemDatabaseOperations=new ItemDatabaseOperations(); 
Item newItem=itemDatabaseOperations.insertItem(i);


	


if(newItem!=null)
{%>
	
	<h1><%=image.available() %></h1>
	
<% 
	System.out.print(image.available());
	CloudStorage.uploadImageToServer(newItem.getId(), image);
	
 }
%>

	DataInserted

</body>
</html>


