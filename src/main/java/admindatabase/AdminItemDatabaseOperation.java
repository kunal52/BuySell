package admindatabase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Reusability.models.Item;
import database.ItemDatabaseOperations;
import database.JdbcConnection;
import database.UserDatabaseOperation;
import mailapi.SendEmail;

public class AdminItemDatabaseOperation {

	
	
	public static List<Item>getItems(int pagesize,int offset,String type)
	{
		
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		pagesize--;
		int size=0;
		List<Item> items=new ArrayList<>();
		try {
		
		if(type==null||type.equals("all"))
			preparedStatement=connection.prepareStatement("select * from Items where isverified = 'false'");
		else 
			{
			preparedStatement=connection.prepareStatement("select * from Items where type = ? and isverified = 'false'");
			preparedStatement.setString(1, type);
			}
		
		ResultSet rs=preparedStatement.executeQuery();
		rs.relative(offset);
		
		while(rs.next())
		{
			items.add(new Item(rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getBoolean(5),
							rs.getString(6),
							rs.getString(7),
							rs.getString(8),
							rs.getFloat(9),
							rs.getString(10)));
			if(size==pagesize)
			{
				return items;
			}
			size++;
		}
		preparedStatement.close();
    	connection.close();
    	jdbcConnection.disConnect();
		}catch (Exception e) {
			
		}	
		finally{
		    try {
		    	preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	return items;
		    } catch (final SQLException e) {
		        
		        e.printStackTrace();
		    }
		}
		return items;
		
		
	}
	
	
	public static void verifyItem(String id)
	{
		
		
		String query="UPDATE Items SET isverified = true WHERE id = ?";
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
			
		try {
		
		preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, id);
		preparedStatement.executeUpdate();
		preparedStatement.closeOnCompletion();
		
		Item i=new ItemDatabaseOperations().getItem(id);
		
		SendEmail.verifyEmail(new UserDatabaseOperation().getUser(i.getContact_id()).getEmail(), i.getName(), id);
		
    	connection.close();
    	jdbcConnection.disConnect();
		}catch (Exception e) {
			
		}	
		finally{
		    try {
		    	preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	
		    } catch (final SQLException e) {
		        
		    }
		}
		
	}
	
	public static void notVerifyItem(String id_message)
	{
		
		String[]strings=id_message.split("\n");
		String id=strings[0];
		String message=strings[1];
		
		
		System.out.println(id);
		System.out.println(message);
		
		String query="UPDATE Items SET isverified = false WHERE id = ?";
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
			
		try {
		
		
		preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, id);
		
		preparedStatement.executeUpdate();
		
		preparedStatement.closeOnCompletion();
		
		Item i=new ItemDatabaseOperations().getItem(id);
		
		SendEmail.notVerifyEmail(new UserDatabaseOperation().getUser(i.getContact_id()).getEmail(), i.getName(), id, message);
		
    	connection.close();
    	jdbcConnection.disConnect();
		}catch (Exception e) {
			
		}	
		finally{
		    try {
		    	preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	
		    } catch (final SQLException e) {
		        
		    }
		}
		
	}
	
	
	public static void removeItem(String id)
	{
		
		String query="UPDATE Items SET isverified = deleted WHERE id = ?";
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
			
		try {
		
		
		preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, id);
		
		preparedStatement.executeUpdate();
		
		preparedStatement.closeOnCompletion();
		
		
		
		
    	connection.close();
    	jdbcConnection.disConnect();
		}catch (Exception e) {
			
		}	
		finally{
		    try {
		    	preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	
		    } catch (final SQLException e) {
		        
		    }
		}
		
	}
	
	
	
}
