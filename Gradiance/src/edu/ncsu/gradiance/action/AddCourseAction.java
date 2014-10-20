package edu.ncsu.gradiance.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.ncsu.gradiance.util.DBConnection;

public class AddCourseAction {
	private DBConnection dbc = null;
	private Connection conn = null;

	/**
	 * @author yaolu
	 * @function add course by token
	 */
	public boolean addCourse(String token, String sid) {		
		String sql = "select cid from course where token=?";
		boolean success = false;
		
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, token);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				sql = "insert into stusecour(sid,cid) values (?,?)";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, sid);
				stmt.setString(2, rs.getString("cid"));
				if(stmt.executeUpdate()>0) success = true;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return success;
	}
}
