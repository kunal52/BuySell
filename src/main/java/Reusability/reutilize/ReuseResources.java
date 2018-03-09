package Reusability.reutilize;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import Reusability.models.ReuseModel;
import database.ReuseDataBaseOperation;

@Path("renew")
public class ReuseResources {
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertNewRequest(ReuseModel reuseModel)
	{
		int itemNo=ReuseDataBaseOperation.insertNewRequest(reuseModel);
		if(itemNo==0)
			return "Failed To Get Your Request";
		else
			return "Request Recieved We Will Contact You Later";
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<ReuseModel> getPendingList(){
		return ReuseDataBaseOperation.getPendingList();
	}
	

}
