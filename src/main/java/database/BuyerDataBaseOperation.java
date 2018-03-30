package database;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import Reusability.models.Contact;
import Reusability.models.ItemBuyer;
import mailapi.SendEmail;

public class BuyerDataBaseOperation {
	
	private static String getAddItemQuery()
	{
		String string="INSERT INTO `BuyItems`(`id`, `product_id`, `seller_id`, `buyer_id`,`buyer_address`, `is_sold`, `sold_by_this`) VALUES (?,?,?,?,?,?,?)";
		return string;
	}
	
	
	
	
	public static String addBuyItemTransaction(ItemBuyer i)
	{
		String tid=UUID.randomUUID().toString();
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		PreparedStatement prepareStatement = null;
		
		Contact buyer=null;
		UserDatabaseOperation userDatabaseOperation=new UserDatabaseOperation();
		try {
			buyer=userDatabaseOperation.insertUser(new Contact("id",
											i.getBuyer().getName(),
											"Last Name",
											i.getBuyer().getEmail(),
											i.getBuyer().getAddress(),
											i.getBuyer().getPhone_no(),
											"Other"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		try {
			prepareStatement = connection.prepareStatement(getAddItemQuery());
			
			prepareStatement.setString(1, tid);
			prepareStatement.setString(2, i.getItem().getId());
			prepareStatement.setString(3, i.getItem().getContact_id());
			prepareStatement.setString(4, buyer.getId());
			prepareStatement.setString(5, i.getBuyer().getAddress());
			prepareStatement.setString(6, "false");
			prepareStatement.setString(7, "false");
			
			
			prepareStatement.executeUpdate();
			
			prepareStatement.closeOnCompletion();
			
			SendEmail.sendEmailOrderSuccessFully(i, tid);

			
			connection.close();
			jdbcConnection.disConnect();
			
			
			
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
		    try {
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	return tid;
		    } catch (final SQLException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		}
		
		return tid;
		
		
	}

}
