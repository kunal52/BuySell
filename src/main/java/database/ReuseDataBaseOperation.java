package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import Reusability.models.ReuseModel;

public class ReuseDataBaseOperation {

	
	public static int insertNewRequest(ReuseModel reuseModel)
	{
		int resultInt=0;
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		
		try {
			preparedStatement=connection.prepareStatement(createInsertNewRequestQuery());
			preparedStatement.setString(1, UUID.randomUUID().toString());
			preparedStatement.setString(2, reuseModel.getProduct_name());
			preparedStatement.setString(3, reuseModel.getProduct_description());
			preparedStatement.setString(4, null);
			preparedStatement.setString(5, reuseModel.getCustomer_name());
			preparedStatement.setString(6, reuseModel.getCustomer_email());
			preparedStatement.setString(7, reuseModel.getCustomer_phone());
			preparedStatement.setString(8, reuseModel.getIsSolve());
			preparedStatement.setString(9, reuseModel.getProduct_adress());
			resultInt=preparedStatement.executeUpdate();
			
			preparedStatement.closeOnCompletion();
			connection.close();
			jdbcConnection.disConnect();
			return resultInt;
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			try
			{
				preparedStatement.closeOnCompletion();
				connection.close();
				jdbcConnection.disConnect();
				return resultInt;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return resultInt;
		
		
	}
	
	
	public static List<ReuseModel> getPendingList()
	{
		List<ReuseModel> list=new ArrayList<>();
		
		JdbcConnection jdbcConnection=new JdbcConnection();
		java.sql.Connection connection=jdbcConnection.connect();
		java.sql.PreparedStatement preparedStatement=null;
		
		try {
			preparedStatement=connection.prepareStatement("select * from renewitems");
			ResultSet set=preparedStatement.executeQuery();
			while(set.next())
			{
				list.add(new ReuseModel(set.getString(1),
										set.getString(2),
										set.getString(3),
										set.getString(4),
										set.getString(5),
										set.getString(6),
										set.getString(7),
										set.getString(8),
										set.getString(9)));
			}
			
			preparedStatement.closeOnCompletion();
			connection.close();
			jdbcConnection.disConnect();
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			try
			{
				preparedStatement.closeOnCompletion();
				connection.close();
				jdbcConnection.disConnect();
				return list;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
	
	private static String createInsertNewRequestQuery()
	{
		String s="INSERT INTO `renewitems`(`id`, `product_name`, `product_description`, `customer_id`, `customer_name`, `customer_email`, `customer_phone`, `product_address`,`is_solve`) VALUES (?,?,?,?,?,?,?,?,?)";
		return s;
	}
	
	
}
