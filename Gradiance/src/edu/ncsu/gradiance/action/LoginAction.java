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
	public int verify(String uid, String upass) {		
		String sql = "select authority from user where uid=? and upass=?";
		int authority = -1;
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			stmt.setString(2, upass);
	
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) authority = rs.getInt("authority");
		} catch(Exception e){
			e.printStackTrace();
		}
		return authority;
	}

}
