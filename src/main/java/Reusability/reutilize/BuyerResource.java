package Reusability.reutilize;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import Reusability.models.ItemBuyer;
import database.BuyerDataBaseOperation;

@Path("buy")
public class BuyerResource {

	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String addBuyItem(ItemBuyer i) {
		return BuyerDataBaseOperation.addBuyItemTransaction(i);
	}
	
}
