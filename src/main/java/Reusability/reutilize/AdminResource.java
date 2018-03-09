package Reusability.reutilize;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import Reusability.models.Item;
import admindatabase.AdminItemDatabaseOperation;

@Path("admin")
public class AdminResource {
	
	@GET
    @Produces(MediaType.APPLICATION_JSON)
	public List<Item>getNonVerifiedItemsList(@QueryParam("pagesize") int pagesize,
											@QueryParam("offset")int offset,
											@QueryParam("type")String type)
	{
		
		if(pagesize==0&&offset==0)
			return AdminItemDatabaseOperation.getItems(10, 0, type);	
		return AdminItemDatabaseOperation.getItems(pagesize, offset, type);
	
	}
	
	
	@Path("/verify")
	@POST
	@Consumes(MediaType.TEXT_PLAIN)
	public void verifyItem(String id)
	{
		AdminItemDatabaseOperation.verifyItem(id);
	}
	
	@Path("/notverify")
	@POST
	@Consumes(MediaType.TEXT_PLAIN)
	public void notVerifyItem(String id_message)
	{
		AdminItemDatabaseOperation.notVerifyItem(id_message);
	}

	
	
}
