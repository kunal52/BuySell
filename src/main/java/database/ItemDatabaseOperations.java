package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


import Reusability.models.Item;
import utils.Constants;

public class ItemDatabaseOperations {

	
	private String createInsertQuery()
	{
		
		StringBuilder stringBuilder=new StringBuilder();
		
	/*	stringBuilder.append("Insert Into ");
		stringBuilder.append(Constants.ITEM_TABLE_NAME+" ( ");
		stringBuilder.append(Constants.ITEM_ID+", ");
		stringBuilder.append(Constants.ITEM_NAME+", ");
		stringBuilder.append(Constants.ITEM_DESCRIPTION+", ");
		stringBuilder.append(Constants.ITEM_CONDITION+", ");
		stringBuilder.append(Constants.ITEM_LOCATION+", ");
		stringBuilder.append(Constants.CONTACT_ID+", ");
		stringBuilder.append(Constants.ITEM_ISSUE+", ");
		stringBuilder.append(Constants.ITEM_VERIFIED+" , ");
		stringBuilder.append(Constants.ITEM_PRICE+") VALUES (");*/
		
		
		stringBuilder.append("INSERT INTO `Items` (`id`, `name`, `description`,`type`, `isNew`, `issue`, `location`, `contact_id`, `price`, `isverified`) VALUES (");
		stringBuilder.append("?,?,?,?,?,?,?,?,?,?)");
		return stringBuilder.toString();
	}
	
	
	private String createGetItemQuery(String id)
	{
		StringBuilder stringBuilder=new StringBuilder();
		stringBuilder.append("select `id`, `name`, `description`,`type`,`isNew`, `issue`, `location`, `contact_id`, `price`, `isverified` from "+Constants.ITEM_TABLE_NAME);
		stringBuilder.append(" where id = ?");
		return stringBuilder.toString();
	}
	
	
	public Item insertItem(Item item) throws SQLException
	{
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
			
			String itemid=UUID.randomUUID().toString();
			item.setId(itemid);
			java.sql.PreparedStatement preparedStatement=connection.prepareStatement(createInsertQuery());
			preparedStatement.setString(1, itemid);
			preparedStatement.setString(2, item.getName());
			preparedStatement.setString(3, item.getDescription());
			preparedStatement.setString(4, item.getType());
			preparedStatement.setString(5, String.valueOf(item.isNew()));
			preparedStatement.setString(6, item.getIssue());
			preparedStatement.setString(7, item.getLocation());
			preparedStatement.setString(8, item.getContact_id());
			preparedStatement.setFloat(9,  item.getPrice());
			preparedStatement.setString(10, "false");
			preparedStatement.executeUpdate();
			
			try {
				preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("ERRROR");
		
		}

			
	finally{
	    try {
	    	preparedStatement.close();
	    	connection.close();
	    	jdbcConnection.disConnect();
	    	return item;
	    } catch (final SQLException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}
			
			return item;
		
			
	}
	

	public Item getItem(String id)
	{
		Item item = null;;
		String itemQuery=createGetItemQuery(id);
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		
		try {
			preparedStatement=connection.prepareStatement(itemQuery);
				preparedStatement.setString(1, id);
				ResultSet r=preparedStatement.executeQuery();
				
				if(r.next())
				{
					item=new Item(id,
							r.getString(2),
							r.getString(3),
							r.getString(4),
							r.getBoolean(5),
							r.getString(6),
							r.getString(7),
							r.getString(8),
							r.getFloat(9),
							r.getString(10));
					connection.close();
				}
				preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
		    try {
		    	preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	return item;
		    } catch (final SQLException e) {
		        
		        e.printStackTrace();
		    }
		}
		return item;
	}
	
	public List<Item>getItems(int pagesize,int offset,String type)
	{
		
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		pagesize--;
		int size=0;
		List<Item> items=new ArrayList<>();
		try {
		
		if(type==null||type.equals("all"))
			preparedStatement=connection.prepareStatement("select * from Items where isverified = true");
		else 
			{
			preparedStatement=connection.prepareStatement("select * from Items where type = ? and isverified = true");
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
	
	
	public List<Item> getItemsWithSearch(String search)
	{
		List<Item> items=new ArrayList<>();
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		
		try {
		
		preparedStatement=connection.prepareStatement("select * from Items where name like '%"+search+"%"+"'" +"and isverified = true");
		ResultSet rs=preparedStatement.executeQuery();
		
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
		}
		
		preparedStatement.close();
    	connection.close();
    	jdbcConnection.disConnect();
	}catch (Exception e) {
		// TODO: handle exception
	}
		finally {
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
	
	public List<String>getSuggestionStringList(String query)
	{
		JdbcConnection jdbcConnection=new JdbcConnection();
	java.sql.Connection connection=jdbcConnection.connect();
	java.sql.PreparedStatement preparedStatement = null;
		List<String>list=new ArrayList<>();
		try {
			
			preparedStatement=connection.prepareStatement("select name from Items where name like '"+query+"%"+"'" +"and isverified = true");
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString(1));
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
		    	return list;
		    } catch (final SQLException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		}
		return list;
	}
	
	public List<Item>getNewItems(int pagesize,int offset){
		
		
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement = null;
		
		pagesize--;
		int size=0;
		List<Item> items=new ArrayList<>();
		try {
		
		
		preparedStatement=connection.prepareStatement("select * from Items ORDER BY timestamp DESC");
		
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
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		}
		return items;
		
	}
	
	
	public static int getTotalItems()
	{
		int count=0;
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		
		try {
			preparedStatement=connection.prepareStatement("SELECT COUNT(1) FROM Items where isverified = true ");
			ResultSet set=preparedStatement.executeQuery();
			set.next();
			count= set.getInt(1);

			preparedStatement.close();
	    	connection.close();
	    	jdbcConnection.disConnect();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
		    try {
		    	preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	return count;
		    } catch (final SQLException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		}
		return count;
	}
	
	
	
}
