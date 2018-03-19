   package Reusability.reutilize;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import Reusability.models.Item;
import Reusability.models.SuccessModel;
import database.ItemDatabaseOperations;

@Path("items")
public class ItemResource {
	
	@GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Item> getItems(@QueryParam("pagesize") int pagesize,
    						   @QueryParam("offset")int offset,
    						   @QueryParam("type")String type) {
		
		ItemDatabaseOperations item=new ItemDatabaseOperations();
		
    	if(pagesize==0&&offset==0)
    		return item.getItems(10,0,type); 	
    	return item.getItems(pagesize,offset,type);
    	
    }
	
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{itemId}")
    public Item getIt(@PathParam("itemId") String id) {
    	ItemDatabaseOperations item=new ItemDatabaseOperations();
    	Item i=item.getItem(id);
        return i;
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/search")
    public List<Item>getSearchItemList(@QueryParam("q") String search)
    {
    	ItemDatabaseOperations itemDatabaseOperations=new ItemDatabaseOperations();
    	return itemDatabaseOperations.getItemsWithSearch(search);
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/suggestion")
    public List<String>getSearchSuggestionList(@QueryParam("q")String query)
    {
    	ItemDatabaseOperations itemDatabaseOperations=new ItemDatabaseOperations();
    	return itemDatabaseOperations.getSuggestionStringList(query);
    }
    
    

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Item addItem(Item i)
    {
    	ItemDatabaseOperations item=new ItemDatabaseOperations();
    	try
    	{
    		
     	return item.insertItem(i);
    	}catch (Exception e) {
    		return new Item();
		}
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/new")
    public List<Item>getNewItems(@QueryParam("pagesize") int pagesize,
			   @QueryParam("offset")int offset)
    {
    	ItemDatabaseOperations itemDatabaseOperations=new ItemDatabaseOperations();
    	return itemDatabaseOperations.getNewItems(pagesize,offset);
    }
    
    
}
