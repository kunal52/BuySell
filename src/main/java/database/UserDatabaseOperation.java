package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;


import Reusability.models.Contact;

public class UserDatabaseOperation {
	
	
	
	private String createGetItemQuery(String id)
	{
		StringBuilder stBuilder=new StringBuilder();
		stBuilder.append("SELECT `id`, `f_name`, `l_name`, `email`, `location`, `phone`, `other` FROM `Users` WHERE id = ?");
		return stBuilder.toString();	 
	}
	
	
	public Contact getUser(String id)
	{
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		Contact contact=null;
		try {
			java.sql.PreparedStatement preparedStatement=connection.prepareStatement(createGetItemQuery(id));
			preparedStatement.setString(1, id);
			ResultSet rs=preparedStatement.executeQuery();
			if(rs.next())
			{
				contact=new Contact(id, 
									rs.getString(2), 
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7));
			}
			
			preparedStatement.closeOnCompletion();
			connection.close();
			return contact;
				
		} catch (SQLException e) {
			e.printStackTrace();
			return contact;	
		}

	}
	
	
	public Contact getUserWithEmailId(String email)
	{
		String query="SELECT `id`, `f_name`, `l_name`, `email`, `location`, `phone`, `other` FROM `Users` WHERE email = ?";
		
		
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		
		Contact contact=null;
		try {
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			ResultSet rs=preparedStatement.executeQuery();
			if(rs.next())
			{
				contact=new Contact(rs.getString(1), 
									rs.getString(2), 
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7));
			}
			
			preparedStatement.closeOnCompletion();
			connection.close();
			
				
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		finally{
		    try {
		    	preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	return contact;
		    } catch (final SQLException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		}
		return contact;
		
	}
	
	
	public Contact insertUser(Contact contact) throws SQLException
	{
		Contact c=getUserWithEmailId(contact.getEmail().toLowerCase());
		if(c!=null)
		{
			return c;
		}
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		
		String id=UUID.randomUUID().toString();
		contact.setId(id);
		try {
			preparedStatement=connection.prepareStatement("INSERT INTO `Users`(`id`, `f_name`, `l_name`, `email`, `location`, `phone`, `other`) VALUES (?,?,?,?,?,?,?)");
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, contact.getF_name());
			preparedStatement.setString(3, contact.getL_name());
			preparedStatement.setString(4, contact.getEmail());
			preparedStatement.setString(5, contact.getLocation());
			preparedStatement.setString(6, contact.getPh());
			preparedStatement.setString(7, contact.getOther());
			preparedStatement.executeUpdate();
			preparedStatement.closeOnCompletion();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException();
		}
		finally{
		    try {
		    	preparedStatement.close();
		    	connection.close();
		    	jdbcConnection.disConnect();
		    	return contact;
		    } catch (final SQLException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		}
		
		return contact;
		
		
	}
	
}
