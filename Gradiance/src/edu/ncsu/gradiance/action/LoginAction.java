package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.ncsu.gradiance.util.DBConnection;

public class LoginAction {
	private DBConnection dbc = null;
	private Connection conn = null;

	/**
	 * @author yaolu
	 * @function user login verification
	 */
	public boolean verify(String uname, String upass) {		
		String sql = "select * from user where uname=? and upass=?";
		boolean success = false;
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, uname);
			stmt.setString(2, upass);
	
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) success = true;
		} catch(Exception e){
			e.printStackTrace();
		}
		return success;
	}

}
