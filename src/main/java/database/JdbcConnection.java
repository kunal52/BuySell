package database;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Driver;

public class JdbcConnection {
	java.sql.Connection  connection;
	
	
	public java.sql.Connection connect()
	{
		try {
			
			Class.forName("com.mysql.jdbc.Driver");  
			connection=DriverManager.getConnection(DatabaseCredentials.url, DatabaseCredentials.username, DatabaseCredentials.password);
			System.out.println("Connected");
			return connection;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public boolean isClosed()
	{
		if(connection!=null)
		{
			try {
				if(connection.isClosed())
					return true;
				else return false;
			} catch (SQLException e) {
				e.printStackTrace();
				return true;
			}
		}
		return true;
	}
	
	
	public void disConnect()
	{
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
