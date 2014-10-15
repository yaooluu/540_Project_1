package edu.ncsu.gradiance.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class test {

	public static void main(String []args) throws SQLException {
	
			String sql = "select count(*) from course";
			DBConnection dbc = new DBConnection();
			Connection conn = dbc.getConnection();
			ResultSet rs = null;
			PreparedStatement stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery(sql);


			while (rs.next()) {
			    String s = rs.getString(1);;
			    System.out.println(s);
			}
			
			stmt.close();
			conn.close();
		}
		

}
