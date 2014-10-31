package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;

import edu.ncsu.gradiance.util.DBConnection;

public class RegisterAction {
	private DBConnection dbc = null;
	private Connection conn = null;

	/**
	 * @author yaolu
	 * @function register user
	 */
	public boolean register(String uid, String name, String upass, int authority) {		
		String sql = "";
		if(authority==0) sql = sql + "select * from faculty f where f.fid=?";
		else if(authority==1) sql = sql + "select * from ta t where t.sid=?";
		else sql = sql + "select * from student s where s.sid=?";
			
		boolean success = false;
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			if(stmt.executeQuery().next()) {
				sql = "insert into user(uid,name,upass,authority) values (?,?,?,?)";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, uid);
				stmt.setString(2, name);
				stmt.setString(3, upass);
				stmt.setInt(4, authority);
				if(stmt.executeUpdate()>0) success = true;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return success;
	}
}
