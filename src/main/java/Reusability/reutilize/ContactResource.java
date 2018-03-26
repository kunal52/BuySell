package Reusability.reutilize;

import java.sql.SQLException;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.UriInfo;

import Reusability.models.Contact;
import database.UserDatabaseOperation;

@Path("contacts")
public class ContactResource {
	
	@GET
	@Path("/{contactid}")
	@Produces(MediaType.APPLICATION_JSON)
	public Contact getContact(@PathParam("contactid")String id)
	{
		UserDatabaseOperation user=new UserDatabaseOperation();
		return user.getUser(id);
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Contact insertContact(@Context UriInfo uriinfo ,Contact c)
	{
		UserDatabaseOperation user=new UserDatabaseOperation();
	
			try {
				return user.insertUser(c);
			} catch (SQLException e) {
				return new Contact();
			}

	}
	
}
