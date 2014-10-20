package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.ncsu.gradiance.util.DBConnection;

public class RegisterAction {
	private DBConnection dbc = null;
	private Connection conn = null;

	/**
	 * @author yaolu
	 * @function register user
	 */
	public boolean register(String uid, String uname, String upass, String authority) {		
		String sql = "insert into user(uid,uname,upass) values(?,?,?)"
				+ "where uid not in (select u.uid from user u) and"
				+ "      uid in (select s.sid from student s)";
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
